class Project < ActiveRecord::Base
	belongs_to :hack_day
  	validates :hack_day_id, :description,  presence: true
  	default_scope -> { order('id ASC') }
end
