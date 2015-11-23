require_relative '../config'

class CreateLegislators < ActiveRecord::Migration
	def change
		create_table :legislators do |t|
			t.string :title
			t.string :firstname
			t.string :lastname
			t.string :party
			t.string :state
			t.string :distric
			t.string :gender
			t.string :phone
			t.string :fax
			t.string :website
			t.string :webform
			t.string :congress_office
			t.string :twitter_id
			t.date :birthday
			t.timestamps null: false
		end
	end
end