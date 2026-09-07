cat << 'EOF' > infrastructure/vector_theta_engine.py
def run_sanity_audit(human_text):
    # Rule: Reject corporate AI copy-paste habits
    prohibited_phrases = ["delighted to help", "as an ai", "important to remember"]
    
    clean_text = human_text.lower()
    for phrase in prohibited_phrases:
        if phrase in clean_text:
            return False  # Gate Closed: Corporate slop detected
    return True  # Gate Open: Authentic human thought verified

def calculate_human_dissonance(expected_path, actual_human_choice):
    # Measure the unexpected gap that keeps the AI sane
    gap = abs(expected_path - actual_human_choice)
    return round(gap, 4)
EOF
