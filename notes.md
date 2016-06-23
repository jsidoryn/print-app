## Questions / help

Get navicat setup
Borrow the rails testing book
Ask advice on next thing for testing

Money: cents not displaying
Pickadate: field showing as grey/disabled

Quotes total method: how to sum with range?

## To do

Quote: edit a quote

Fit 4 cards in properly + add break points

## Questions for Raz

What text editor do you use? Thoughts about RubyMine?

Approach to disconnecting from psql when dropping table -> config/initializers/postgresql_database_tasks.rb
https://www.krautcomputing.com/blog/2014/01/10/how-to-drop-your-postgres-database-with-rails-4/

Approach to total? Should be separate joint table with line items i'm assuming but for now?

enum state formatting in model

jobs_path vs jobs_url when redirecting?

## Migrations

rails g resource Job name job_number description:text state

rails g resource Specification title description:text quote_due job_due \
proof_required:boolean press_check_required:boolean notes:text job:references

rails g resource Quote line_item_1 cost_1 line_item_2 cost_2 line_item_3 cost_3 \
line_item_4 cost_4 line_item_5 cost_5 notes:text specification:references

rails g migration AddPrinterNameToQuote printer_name:string

## Notes

Good explanation of using money gem here: http://ecommerceonrails.com/page2/
