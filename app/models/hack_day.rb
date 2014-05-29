class HackDay < ActiveRecord::Base
	has_many :projects, dependent: :destroy
	validates :title, presence: true
	default_scope -> { order('created_at DESC') }
end
