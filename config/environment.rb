# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

#控制javascript引擎 產生.js檔 不產生.coffee欓
Rails.application.configure do 
	config.generators do |g|
		g.javascript_engine :js
	end
end