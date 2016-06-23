# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

job1 = Job.create(title: "Guide Dogs annual report", description: "blah blah blah",
  job_number: "GD001")
job2 = Job.create(title: "Guide Dogs brochure", description: "blah blah blah",
  job_number: "GD002")
job3 = Job.create(title: "Minda donation letter", description: "blah blah blah",
  job_number: "MI007")

spec1 = job1.specifications.create!(title: "Print in full colour", description:
  "blah blah blah", press_check_required: true, job_due: Time.now)

quote1 = spec1.quotes.create!(printer_name: "Finsbury", line_item_1: "Printer option 1",
  cost_1_cents: 1000, line_item_2: "Printer option 2", cost_2_cents: 10000, cost_3_cents: 1234)

quote2 = spec1.quotes.create!(printer_name: "Graphic Print Group", line_item_1: "Printer option 1",
  cost_1_cents: 500, line_item_2: "Printer option 2", cost_2_cents: 8000, cost_3_cents: 5678)
