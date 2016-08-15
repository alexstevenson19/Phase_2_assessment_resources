get "/auctions" do 
	@auctions = Auctions.all
	erb :"/auctions/index"
end

get "/auctions/new" do 
	erb :"/auctions/new"
end


get '/auctions/:id' do

	@auction = Auction.find_by(id: params[:id])
	if @auction
		# p @auction
		erb :"/auctions/show"
	else
		redirect "/"
	end
end

post '/auctions' do
	p params
	@auction = Auction.new(params[:auction]
		# item: params[:item],
		# description: params[:description],
		# auctioner_id: current_user.id
		)
	if @auction.save

		redirect "/auctions/#{@auction.id}"
	else
		@errors = @auction.errors.full_messages
		erb :"/auctions/new"
	end
end

# post '/auctions/:id/comments' do
# 	@comment = Comment.create(
# 		content: params[:comment],
# 		entry_id: params[:id], 
# 		author_id: current_user.id)
# 	redirect "/auctions/#{params[:id]}"
# end