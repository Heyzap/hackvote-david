class Project < ActiveRecord::Base
	belongs_to :hack_day
  	validates :hack_day_id, :value,  presence: true
  	default_scope -> { order('id ASC') }
end
