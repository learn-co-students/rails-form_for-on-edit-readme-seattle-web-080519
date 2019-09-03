class PostsController < ApplicationController
	def index
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
	end

	def new
		@post = Post.new
	end

	def create
	  @post = Post.new
	  @post.title = params[:title]
	  @post.description = params[:description]
	  @post.save
	  redirect_to post_path(@post)
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
	  @post = Post.find(params[:id])
	#@post.update(title: params[:title], description: params[:description])
	#Because 'form_for' is bound directly with the Post model, we need to pass the model name into this Active Record update method. So above, becomes:
	  @post.update(params.require(:post).permit(:title, :description))
	  #bc title and description attributes are now nested within the post hash. We need to add the require method. But Rails wants us to be conscious of which attributes we allow to be updated in our database, so we must also permit the title and description in the nested hash. Using strong parameters like this allows ActiveRecord to use mass assignment smoothly
	  redirect_to post_path(@post)
	end
end