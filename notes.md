## Questions / help

Get navicat setup
Borrow the rails testing book
Ask advice on next thing for testing


## To do

Quote: edit a quote

Fit 4 cards in properly + add break points

## Questions for Raz


## Raz notes


Alternate way to run the loop. Use select to reduce the dataset before calling each

<% (1..3).select{ |n| @quote.send("line_item_#{n}").present?}.each do |n| %>
  <tr>
    <td><%= @quote.send("line_item_#{n}") %></td>
    <td><%= humanized_money_with_symbol @quote.send("cost_#{n}") %></td>
  </tr>
<% end %>

## Migrations

rails g resource Job name job_number description:text state

rails g resource Specification title description:text quote_due job_due \
proof_required:boolean press_check_required:boolean notes:text job:references

rails g resource Quote line_item_1 cost_1 line_item_2 cost_2 line_item_3 cost_3 \
line_item_4 cost_4 line_item_5 cost_5 notes:text specification:references

rails g migration AddPrinterNameToQuote printer_name:string

## Notes

Good explanation of using money gem here: http://ecommerceonrails.com/page2/
