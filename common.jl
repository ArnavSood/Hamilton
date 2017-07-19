# Deps.
using Requests
using JSON
include("apikey.jl")

# Primitives.
type TwilioUser
  accountSID::String
  authToken::String
  toNum::String
  twilNum::String
  baseURL::String
  endpoint::String
  contentType::String
end

me = TwilioUser("AC4777bd99b1493009cf9f6be876f6ac62", "$authtoken", "+16099778034", "+14159805412", "https://AC4777bd99b1493009cf9f6be876f6ac62:$authtoken@api.twilio.com/2010-04-01", "/Accounts/AC4777bd99b1493009cf9f6be876f6ac62/Messages.json", contentType = "application/x-www-form-urlencoded")

# Function.
function sendMessage(body, me::TwilioUser)
  # Unpack params.
  accountSID = me.accountSID
  authToken = me.authToken
  toNum = me.toNum
  twilNum = me.twilNum
  baseURL = me.baseURL
  endpoint = me.endpoint
  contentType = me.contentType

  # Create request.
  params = Dict("To" => toNum, "From" => twilNum, "Body" => body, "Content-Type" => contentType)
  resp = post("$baseURL$endpoint"; data = params)
  return JSON.parse(readstring(resp))
end
