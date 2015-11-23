require_relative '../../db/config'
require 'date'
class Legislator < ActiveRecord::Base
	def self.find_by_title(hi)
		Legislator.where(title: hi)
	end

	def self.print_senators_rep1
		puts "SENATORS: "
		senators = Legislator.select(:firstname, :lastname, :party).where(title: "Sen", state: "CA")
		senators.each do |a| puts "#{a.firstname} #{a.lastname} (#{a.party})" end
		puts "REPRESENTATIVES: "
		rep = Legislator.select(:firstname, :lastname, :party).where(title: "Rep", state: "CA")
		rep.each do |a| puts "#{a.firstname} #{a.lastname} (#{a.party})" end
	end
	def self.print_gender_per
		p total = Legislator.count(title: "Sen")
		p gender = Legislator.where(gender: "M").count(title: "Sen")	
		p different = total - gender
		per = different.to_f / total.to_f * 100
		p per.round
		puts "MALE"
	end
end

