

require_relative 'app/models/legislator.rb'
# require 'db/config'

# leg = Legislator.find_by(title: "Sen")


# p leg

# puts Legislator.find_by_title("Rep")
# p Legislator.select(:firstname, :lastname, :party).where(title: "Sen")

Legislator.print_senators_rep1	
Legislator.print_gender_per
Legislator.print_state

Legislator.print_summary
Legislator.office_summary
Legislator.delete
# Legislator.find_by(in_office: 1)
