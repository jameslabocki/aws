# aws
 
Some simple commands to list and execute lambda functions using ruby and the aws-sdk.

You will need to install the appropriate gems including:
 
* sudo gem install aws-sdk-core
* sudo gem install aws-sdk-resources
* sudo gem install configparser

Then copy config/aws.cfg.example to config/aws.cfg and populate with your:

* access_key_id
* secret_access_key
* region you'd like to use
* the lambda function you'd like to execute (for execution commands)

Afterwards executing `./lambda_list_functions.rb` will provide a list of functions and `./lambda_execute_function.rb` will execute whatever function is set in config/aws.cfg using input from "./inputfile".
