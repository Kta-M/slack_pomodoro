require 'json'
require 'uri'
require 'net/http'

def lambda_handler(event:, context:)
  uri = URI.parse(ENV['SLACK_WEBHOOK_URL'])
  payload = {
    text: "<!here> #{event["message"]}"
  }.to_json

  Net::HTTP.post_form(uri, { payload: payload })
end
