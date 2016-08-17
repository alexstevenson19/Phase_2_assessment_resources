get "/auctions" do
  @auctions = Auction.where("starts_at < ?", Time.now)
  # && "ends_at > ?"
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
  logger.info params
  @auction = Auction.new(params[:auction]
    # name: params[:name],
    # description: params[:description],
    # auctioner_id: current_user.id
    )
  if @auction.save
    redirect "/users/#{@auction.auctioner_id}"
    # redirect "/auctions/#{@auction.id}"
  else
    @errors = @auction.errors.full_messages
    erb :"/auctions/new"
  end
end

get "/auctions/:id/edit" do
  @auction = Auction.find(params[:id])
  # p "Auctioner id ============================"
  # p @auction.auctioner_id
  # p current_user.id
  redirect "/not_authorized" if current_user.id != @auction.auctioner_id
  erb :"auctions/edit"
end

post "/auctions/:id/bids" do
  logger.info params
  @auction = Auction.find(params[:id])
  @bid = Bid.new(params[:bid])
  p "Bid==================================================="
  p params
  redirect "/not_authorized" if current_user.id != @bid.bidder_id
  if @bid.save
    p @bid
    redirect "/auctions/#{@auction.id}"
  else
    @errors = @auction.errors.full_messages
    redirect "/auctions/#{@auction.id}"
  end
end

put "/auctions/:id" do
  @auction = Auction.find(params[:id])
  redirect "/not_authorized" if current_user.id != @auction.auctioner_id
  @auction.update_attributes(params[:auction])
  redirect "/users/#{@auction.auctioner_id}"
end

delete "/auctions/:id" do
  p params
  @auction = Auction.find(params[:id])
  @user = @auction.auctioner
  redirect "/not_authorized" if current_user != @user
  @auction.destroy
  redirect "/users/#{@user.id}"
end

