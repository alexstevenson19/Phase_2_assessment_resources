get "/categories" do 
	@categories = Category.all
	erb :"/categories/index"
end

get "/categories/new" do 
	erb :"/categories/new"
end


get '/categories/:id' do
	@category = Category.find(params[:id])
	if @category
		erb :"/categories/show"
	else
		redirect "/"
	end
end

# post '/categories' do
# 	@category = Category.new(
# 		name: params[:name],
# 		)
# 	if @category.save
# 		redirect "/categories/#{@category.id}"
# 	else
# 		@errors = @category.errors.full_messages
# 		erb :"/categories/new"
# 	end
# end
