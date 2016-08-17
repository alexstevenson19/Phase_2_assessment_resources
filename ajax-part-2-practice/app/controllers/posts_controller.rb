get "/posts" do
  @posts = Post.order("created_at DESC")
  erb :'posts/index'
end

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

get "/posts/new" do
  @post = Post.new
  erb :'posts/new'
end

get "/posts/:id" do
  @post = Post.find(params[:id])
  erb :'posts/show'
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
