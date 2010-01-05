class FastAddress
  include HTTParty
  require 'cgi'
  
  format :xml
  base_uri 'services.postcodeanywhere.co.uk'
  default_params :output => 'xml'
  
  attr_internal :language, :content_type, :account_code, :license_key, :machine_id, :options, :results
  
  def initialize( params = {} )
    self.language     = params[:language]     || 'enLanguageEnglish'
    self.content_type = params[:content_type] || 'enContentStandardAddress'
    self.account_code = params[:account_code] || ''
    self.license_key  = params[:license_key]  || ''
    self.machine_id   = params[:machine_id]   || ''
    self.options      = params[:options]      || ''
  end
  
  def lookup( postcode, building )
    postcode.gsub!(' ','')
    pca_path =  "/uk/lookup.asmx/FastAddress"
    pca_path += "?Postcode=#{postcode}"
    pca_path += "&Building=#{building}"
    pca_path += "&Language=#{self.language}"
    pca_path += "&ContentType=#{self.content_type}"
    pca_path += "&AccountCode=#{self.account_code}"
    pca_path += "&LicenseKey=#{self.license_key}"
    pca_path += "&MachineId=#{self.machine_id}"
    pca_path += "&Options=#{self.options}"
    self.results = FastAddress.get( pca_path )
    self.results['AddressResults']['Results']
  end
  
  def error
    self.results['AddressResults']['ErrorMessage']
  end
  
    
end