require "sinatra"
require "sinatra/reloader"
require "http"
require "json"

get("/") do
  req = HTTP.get("https://api.exchangerate.host/symbols")
  res = JSON.parse(req).fetch("symbols")

  @currencies = res.keys
  erb(:home)
end

get("/:currency_one"){
  @currency = params.fetch("currency_one")
  req = HTTP.get("https://api.exchangerate.host/symbols")
  res = JSON.parse(req).fetch("symbols")

  @currencies = res.keys
  erb(:second_selection)
}

get("/:currency_one/:currency_two"){
  @currency_one = params.fetch("currency_one")
  @currency_two = params.fetch("currency_two")

  req = HTTP.get("https://api.exchangerate.host/convert?from=USD&to=INR")
  @res = JSON.parse(req).fetch("result")

  erb(:output)
}
