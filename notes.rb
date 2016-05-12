rails g resource Job name job_number description:text state

rails g resource Specification title description:text quote_due job_due \
proof_required:boolean press_check_required:boolean notes:text job:references
