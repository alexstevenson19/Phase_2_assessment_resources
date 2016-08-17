get '/' do
  p "going home"
  erb :index
end

get "/not_authorized" do
  erb :"not_authorized"
end
