include("common.jl")
hamURL = "https://lottery.broadwaydirect.com/show/hamilton/"

body = "Sign up for the Hamilton Lottery at $hamURL"
sendMessage(body, me)
