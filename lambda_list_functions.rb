#!/usr/bin/ruby

require 'aws-sdk-core'
require 'configparser'


class Lambda

  def configure 
    cp = ConfigParser.new('config/aws.cfg')
    @region = cp['config']['region']
    @accessKeyId = cp['config']['access_key_id']
    @secretAccessKey = cp['config']['secret_access_key']
  end

  def authenticate
    myregion = @region
    myaccessKeyId = @accessKeyId
    mysecretAccessKey = @secretAccessKey
    @mylambda = Aws::Lambda::Client.new(
      region: 'us-west-2',
      access_key_id: 'AKIAJP2YIATIX4CZDEAQ',
      secret_access_key: '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'
    )
  end

  def listfunctions
    myfunctions = @mylambda.list_functions
    puts myfunctions[1]
  end

end


#Create a new object
object = Lambda. new

#Get configuration information
object.configure

#Authenticate
#object.authenticate('us-west-2','AKIAJP2YIATIX4CZDEAQ','MbKnVoLvon8sAV77Q50+fgcj823UzltRt3rPx8xi')
object.authenticate

#List Functions
object.listfunctions

