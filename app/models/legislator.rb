require_relative '../../db/config'
require 'date'
class Legislator < ActiveRecord::Base
	def self.find_by_title(hi)
		Legislator.where(title: hi)
	end
end

