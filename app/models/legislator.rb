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

		total = Legislator.where(title: "Sen", in_office: 1).count
		gender = Legislator.where(gender: "M", title: "Sen", in_office: 1).count
		different = total - gender
		per = 100 - (different.to_f / total.to_f * 100)
		puts "Male Senators: #{gender} (#{per.round}%)"

		total = Legislator.where(title: "Rep", in_office: 1).count
		gender = Legislator.where(gender: "M", title: "Rep", in_office: 1).count
		different = total - gender
		per = 100 - (different.to_f / total.to_f * 100)
		puts "Male Representatives: #{gender} (#{per.round}%)"		
	end	

	def self.print_state
		array = []
		states = Legislator.distinct.pluck(:state) #or .uniq
		states.each_with_index do |x, y| 
			array << [x,Legislator.where(title: "Sen").where("state = ?",x.to_s).where(in_office: 1).count, Legislator.where(title: "Rep").where("state = ?",x.to_s).where(in_office: 1).count]
		end
		array.sort_by!{|k|-(k[1]+k[2])}

		array.each do |x|
		puts "#{x[0]}: #{x[1]} Senators, #{x[2]} Representatives"
		end
	end

	def self.print_summary
		puts "Sentators: #{Legislator.where(title: "Sen").count}" 
		puts "Representatives: #{Legislator.where(title: "Rep").count}" 
	end

	def self.office_summary
		puts "Sentators: #{Legislator.where(title: "Sen", in_office: 1).count}" 
		puts "Representatives: #{Legislator.where(title: "Rep", in_office: 1).count}" 
	end

	def delete
		Legislator.destroy_all(in_office: 0)
	end
end

