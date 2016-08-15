get '/' do
	@categories = Category.all
  erb :index
end

get "/not_authorized" do
  erb :"/users/not_authorized"
end