class Event < ApplicationRecord
	has_many :attendees #複數
	belongs_to :category, :optional => true
	has_one :location #單數
	validates_presence_of :name
end
