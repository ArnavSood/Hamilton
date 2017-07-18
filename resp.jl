include("common.jl")
hamURL = "https://lottery.broadwaydirect.com/show/hamilton/"

body = "Don't forget to check the Hamilton Lottery at $hamURL"
sendMessage(body, me)
