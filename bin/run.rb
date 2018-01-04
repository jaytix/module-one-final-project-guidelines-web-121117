require_relative '../config/environment'

# Get rid of SQL debug messages.
ActiveRecord::Base.logger.level = 1

new_cli = CommandLineInterface.new
new_cli.run
