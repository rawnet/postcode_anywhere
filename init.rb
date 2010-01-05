require 'httparty'
require 'postcode_anywhere'

ActiveRecord::Base.send(:include, Rawnet)

RAILS_DEFAULT_LOGGER.debug "** [postcode_anywhere] loaded"