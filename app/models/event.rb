class Event < ApplicationRecord
	has_many :attendees #複數
	has_one :location #單數
	validates_presence_of :name
end
