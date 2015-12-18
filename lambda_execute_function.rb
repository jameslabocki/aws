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
    myasync = @mylambda.invoke_async(
     function_name: "myFunctionName"
     invoke_args: source_file, # file/IO object, or string data, required
    )
    puts myasync.status
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

