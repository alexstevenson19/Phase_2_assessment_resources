
get "/users" do
  # erb :"users/index" 
end

get "/users/new" do
	erb :"/users/new"
end

post "/users" do
	# unless passwords_match?
	# 	redirect "/users/new"
	# end	
	# @user = User.create!(
	# 	username:params[:username],
	# 	email: params[:email],
	# 	password: params[:password]
	# 	)
	@user = User.create!(params[:user])
	if @user.id 
		session[:user_id] = @user.id
		redirect "/users/#{@user.id}"
	else
		@errors = @user.errors.full_messages
		erb :"/users/new"
	end
end

get "/users/:id" do
	@user= User.find(params[:id])
	# @user_entries = Entry.where(user_id: current_user.id)
	redirect "users/not_authorized" if current_user != @user
	erb :"/users/show"
end	

get "/users/:id/edit" do 
	@user = User.find(params[:id])
  redirect "users/not_authorized" if current_user != @user
  erb :"users/edit"
end

# get '/users/:id/entries' do
#   # p "entries params============================================="
#   # p params
# 	redirect "users/not_authorized" if current_user != @user
#   @user = User.find_by(id: params[:id])
#   @user_entries = Entry.where(user_id: @user.id).most_recent
#   erb :'users/index'
# end

put "/users/:id" do
  @user = User.find(params[:id])
  redirect "users/not_authorized" if current_user != @user
  @user.update_attributes(params[:user])
  redirect "users/#{@user.id}"
end

delete "/users/:id" do
  @user = User.find(params[:id])
  redirect "users/not_authorized" if current_user != @user
  @user.destroy
  redirect "/logout"	
end
