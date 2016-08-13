# GB assessment relevant controllers =====================================

post "/posts" do
  if request.xhr?
    p "XHR=========================================="
    # p params[:post]
    new_post = Post.create(params[:post])
    # p new_post
    # we need to send this to get its layout, to then append, perpend, insert... into the static page
    erb :'/posts/_post', layout: false, locals: {post: new_post}
  else
    @post = Post.new(params[:post])
    if @post.save
      redirect "posts/#{@post.id}"
    end
  end
end


put "/posts/:id/like" do
  @post = Post.find(params[:id])
  @post.increment!(:likes_count)
  if request.xhr?
    p "XHR============================================="
    # just need to send back the number
    @post.likes_count.to_s
  else
    redirect "/posts/#{@post.id}"
  end
end


# Hacker News relevant controllers ========================================
post '/posts/:id/vote' do
  if request.xhr?
    p params[:id]
    p "AJAX REQUEST _______________________________________"
    post = Post.find(params[:id])
    post.votes.create(value: 1)
    content_type :json
    { postId: post.id , points: post.votes.count }.to_json
    # post.votes.count.to_s
  else
    post = Post.find(params[:id])
    post.votes.create(value: 1)
    redirect "/posts"
  end
end

delete '/posts/:id' do
  # write logic for deleting posts here.
  if request.xhr?
    p "AJAX for Delete -------------------------------------------"
    postToDelete = params[:id]
    post = Post.find(params[:id])
    post.destroy
    postToDelete
  end
end

post '/posts' do
  if request.xhr?
    p "AJAX new post params ========================================="
    p params[:title].length
    if params[:title].length < 1
      status 422
    else
      new_post = Post.create( title: params[:title],
        username: Faker::Internet.user_name,
        comment_count: rand(1000) )
      status 200
      erb :_post_partial, layout: false, locals: { post: new_post }
      # content_type :json
      # { title: new_post.title, username: new_post.username, comment_count: new_post.comment_count }.to_json
      # else
      # Post.create( title: params[:title],
      #              username: Faker::Internet.user_name,
      # #              comment_count: rand(1000) )
      # redirect '/posts'
    end
  end
end





# Lucky Ajax controller================================================
post '/rolls' do
  @die = Die.new(params[:sides].to_i)
  if request.xhr?
    # @roll_num = @die.roll.to_s
    # @roll_num
    # erb :_roll_response
    @die.roll.to_s
  else
    erb :index
  end
end
