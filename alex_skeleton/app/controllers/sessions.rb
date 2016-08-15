
before do
	@errors = []
end


get "/login/new" do 
	erb :"/sessions/login"
end

post "/login" do
	@user = User.find_by(email: params[:email])

	if @user && @user.authenticate(params[:password])
		session[:user_id] = @user.id
		redirect "/users/#{@user.id}"
	else
		@errors 
		erb :"/sessions/login"
	end
end

get "/logout" do
	session[:user_id] = nil
	redirect "/" 
end

# get "/login" do 
# end

# get "/login/:id/edit" do 
# end

# get "/login/:id" do
	
# end	

# post "/login/:id" do 
# end

