
get "/login/new" do
  erb :"/sessions/login"
end

post "/login" do
  @user = User.find_by(username: params[:username])
  p "========================================="
  p params
  if @user && @user.authenticate(params[:password])
    session[:user_id] = @user.id
    redirect "/users/#{@user.id}"
  else
    @errors = "Invalid input, please re-type"
    erb :"/sessions/login"
  end
end

get "/logout" do
  session[:user_id] = nil
  redirect "/"
end
