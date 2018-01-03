require_relative '../config/environment'

# Get rid of SQL debug messages.
ActiveRecord::Base.logger.level = 1
