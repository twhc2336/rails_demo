class User < ApplicationRecord
	before_save :encrypted

	def encrypted
		# if self.password = self.password_confirmation
		if self.id.blank?
			self.password = "abc" + self.password
		end
	end
end
