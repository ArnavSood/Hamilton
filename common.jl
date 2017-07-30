# Deps.
using Requests
using JSON
include("authdata.jl")

# Create user object.
type TwilioUser
  accountSID::String
  authToken::String
  twilNum::String
end

me = TwilioUser(accountSID, apikey, twilNum)

# Function
function sendMessage(body::String, sender::TwilioUser, target::String)
  twilNum = sender.twilNum
  account = sender.accountSID
  auth = sender.authToken

  # Format address.
  address = "https://$(account):$(auth)@api.twilio.com/2010-04-01" * "/Accounts/$(account)/Messages.json"
  contentType = "application/x-www-form-urlencoded"

  # Create request.
  params = Dict("To" => target, "From" => twilNum, "Body" => body, "Content-Type" => contentType)
  resp = post(address; data = params)
  return JSON.parse(readstring(resp))
end
