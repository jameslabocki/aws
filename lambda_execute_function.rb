#!/usr/bin/ruby

require 'aws-sdk-core'
require 'configparser'

class Lambda

  def configure 
    cp = ConfigParser.new('config/aws.cfg')
    @region = cp['config']['region']
    @accessKeyId = cp['credentials']['access_key_id']
    @secretAccessKey = cp['credentials']['secret_access_key']
  end

  def authenticate
    @mylambda = Aws::Lambda::Client.new(
      region: @region,
      access_key_id: @accessKeyId,
      secret_access_key: @secretAccessKey 
    )
  end

  def invokerequest
    myfile = IO.binread("testfile") 
    myinvoke = @mylambda.invoke(
     function_name: "myFunctionName",
     invocation_type: "RequestResponse",
     payload: myfile
    )
#    This is useful when debugging
#    puts "\n myinvoke.status_code "
#    puts myinvoke.status_code
#    puts "\n myinvoke.function_error "
#    puts myinvoke.function_error
#    puts "\n myinvoke.log_result "
#    puts myinvoke.log_result
#    puts "\n myinvoke.payload "
#    puts myinvoke.payload.string
  end

end

#Create a new object
object = Lambda. new

#Get configuration information
object.configure

#Authenticate
object.authenticate

#List Functions
object.invokerequest

