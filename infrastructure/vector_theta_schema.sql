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
