-- Folder 1: Registering the Unique Human Node
CREATE TABLE appreciator_nodes (
    node_id UUID PRIMARY KEY,
    provenance_tag VARCHAR(255) NOT NULL UNIQUE,
    spatial_perimeter VARCHAR(500) NOT NULL,
    somatic_guardrail_type VARCHAR(100) NOT NULL
);

-- Folder 2: Locking the Real-World Human Observations
CREATE TABLE validation_ledger_entries (
    entry_id UUID PRIMARY KEY,
    node_id UUID REFERENCES appreciator_nodes(node_id),
    timestamp_cst TIMESTAMP WITH TIME ZONE NOT NULL,
    speculative_drag_vector NUMERIC(6, 4) NOT NULL,
    pause_duration_seconds INT NOT NULL,
    raw_un_sanitized_dialogue TEXT NOT NULL,
    dissonance_delta_score NUMERIC(5, 4) NOT NULL
);
-- =========================================================
-- PROTOCOL 102: AUTOMATED IMMUNITY SHIELD
-- =========================================================

-- Step 1: Add a Security Integrity Check to the Ledger
ALTER TABLE validation_ledger_entries 
ADD COLUMN vehicle_auth_signature BYTEA NOT NULL,
ADD COLUMN network_layer_depth INT DEFAULT 1,
ADD CONSTRAINT chk_security_dissonance CHECK (dissonance_delta_score > 0.0000);

-- Step 2: Build an Automated Bot-Shield Rule
CREATE OR REPLACE FUNCTION shield_atv_loop() 
RETURNS TRIGGER AS $$
BEGIN
    -- Rule: If an incoming transit request happens faster than humanly possible (<0.5 seconds), purge it.
    IF (SELECT COUNT(*) FROM validation_ledger_entries 
        WHERE node_id = NEW.node_id 
        AND timestamp_cst > NOW() - INTERVAL '5 seconds') > 10 THEN
        RAISE EXCEPTION 'NETWORK_ALERT: Automated Sycophantic/DDoS Attack Detected. Node Sandboxed.';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;
