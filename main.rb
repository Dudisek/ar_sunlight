require 'yaml'

require_relative 'app/models/legislator.rb'
# require 'db/config'

# leg = Legislator.find_by(title: "Sen")


# p leg

# puts Legislator.find_by_title("Rep")
# p Legislator.select(:firstname, :lastname, :party).where(title: "Sen")

# Legislator.print_senators_rep1

Legislator.print_gender_per
 # .to_yaml