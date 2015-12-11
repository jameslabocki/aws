#!/usr/bin/ruby

require 'aws-sdk-core'

lambda = Aws::Lambda::Client.new(
  region: 'us-west-2',
  access_key_id: 'AKIAISX3CVPZYUSDM3TQ',
  secret_access_key: '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'
)

#print lambda.operation_names

myfunctions = lambda.list_functions

print myfunctions[1]
