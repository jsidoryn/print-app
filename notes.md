## To do

Jobs: create edit

## Migrations

rails g resource Job name job_number description:text state

rails g resource Specification title description:text quote_due job_due \
proof_required:boolean press_check_required:boolean notes:text job:references

rails g resource Quote line_item_1 cost_1 line_item_2 cost_2 line_item_3 cost_3 \
line_item_4 cost_4 line_item_5 cost_5 notes:text specification:references

rails g migration AddPrinterNameToQuote printer_name:string
