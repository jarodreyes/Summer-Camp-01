require "sinatra"
require "twilio-ruby"

# Generic webhook to send sms from 'TWILIO'
get '/sms-hook' do
  @client = Twilio::REST::Client.new ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']
  # Grab the User's phone number from the request parameters.
  @user = params[:to]
  # Message to send to the user
  @body = "Download the burner app at in the <a href='itms-apps://itunes.apple.com/us/app/Burner/id505800761?mt=8'> app store </a> today."
  message = @client.messages.create(
    :from => ENV['TWILIO_NUMBER'],
    :to => @user,
    :body => @body,
  )
  puts message.to
  # Return status code 200
  halt 200
end