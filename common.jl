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

baseURL = "https://$accountSID:$authToken@api.twilio.com/2010-04-01"
endpoint = "/Accounts/$accountSID/Messages.json"
contentType = "application/x-www-form-urlencoded"

# Create user object.
me = TwilioUser(accountSID, authToken, twilNum)

# Function
function sendMessage(body::String, me::TwilioUser, number::String)
  accountSID = me.accountSID
  authToken = me.authToken
  twilNum = me.twilNum

  # Create request.
  params = Dict("To" => number, "From" => twilNum, "Body" => body, "Content-Type" => contentType)
  resp = post("$baseURL$endpoint"; data = params)
  return JSON.parse(readstring(resp))
end
