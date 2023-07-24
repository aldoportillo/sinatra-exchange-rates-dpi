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
