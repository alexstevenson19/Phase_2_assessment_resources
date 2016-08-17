get '/' do
  erb :index
end

get "/not_authorized" do
  erb :"not_authorized"
end