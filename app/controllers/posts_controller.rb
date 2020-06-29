class PostsController < ApplicationController

	def new
	 	@post = Post.new
    end

    def create
     	@post = Post.new(post_params)
	    @post.user_id = current_user.id
        #binding.pry
	    if @post.save
            tags = Vision.get_image_data(@post.image)
            tags.each do |tag|
            @post.tags.create(name: tag)
        end
	       redirect_to posts_path
	    else
          render :new
        end
    end

    def index
     	@posts = Post.page(params[:page]).reverse_order
    end

    def show
     	@post = Post.find(params[:id])
   	    @post_comment = PostComment.new
        if params[:tag_name]
         @post_tasks = Post.tagged_with("#{params[:tag_name]}")
        end
    end

    def edit
        @post = Post.find(params[:id])
    end

    def update
        @post = Post.find(params[:id])
     if @post.update(post_params)
        redirect_to post_path
     else
        render "edit"
     end
    end

    def destroy
	    @post = Post.find(params[:id])
	    @post.destroy
	    redirect_to posts_path
	end

     private
    def post_params
        params.require(:post).permit(:title, :image, :caption, :tag_list, :user_id, :address, :latitude, :longitude)
    end


end
