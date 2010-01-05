module Rawnet #:nodoc:

  def self.included(base)
    base.extend AddPostcodeMethod
  end 

  module AddPostcodeMethod
    
    def postcode_anywhere(options = {})
      puts "OPTIONS [#{options.to_yaml}]"
      defaults = { :api => :fast_address }
      options = defaults.reverse_merge( options )
      puts "OPTIONS [#{options.to_yaml}]"
      puts "API [#{options[:api]}]"
      case options[:api]
      when :fast_address
        puts "FAST_ADDRESS"
        class_eval <<-END
          include Rawnet::FastAddressInstanceMethods
          
          attr_accessible :fast_address

        END
      else
        puts "OTHER"
      end
    end
    
  end
  
  module FastAddressClassMethods

  end
  
  module FastAddressInstanceMethods

		# extend the class methods
    def self.included(aClass)
      aClass.extend FastAddressClassMethods
    end
  end
  
end
