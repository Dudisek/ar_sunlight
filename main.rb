require_relative 'app/models/legislator.rb'
# require 'db/config'

# leg = Legislator.find_by(title: "Sen")


# p leg

# puts Legislator.find_by_title("Rep")
p Legislator.select("Rep")