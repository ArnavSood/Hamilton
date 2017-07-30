# Deps.
using Requests
using JSON
include("apikey.jl")

# Primitives.
type TwilioUser
  accountSID::String
  authToken::String
  twilNum::String
end

# Create user object.
me = TwilioUser(accountSID, authToken, twilNum)

# Format request params.
baseURL = "https://$accountSID:$authToken@api.twilio.com/2010-04-01"
endpoint = "/Accounts/$accountSID/Messages.json"
contentType = "application/x-www-form-urlencoded"

# Function
function sendMessage(body::String, sender::TwilioUser, target::String)
  twilNum = sender.twilNum

  # Create request.
  params = Dict("To" => target, "From" => twilNum, "Body" => body, "Content-Type" => contentType)
  resp = post("$baseURL$endpoint"; data = params)
  return JSON.parse(readstring(resp))
end
