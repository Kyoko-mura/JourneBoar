class PostCommentsController < ApplicationController
	def create
    post = Post.find(params[:post_id])
    @comment = current_user.post_comments.new(post_comment_params)
    @comment.post_id = post.id
    #binding.pry
    @comment.score = Language.get_data(post_comment_params[:comment])
    @comment.save
    redirect_to post_path(post)
	end
    def destroy
    post = Post.find(params[:post_id])
    #@comment = current_user.post_comments.find_by(post_comment_params)
    @comment = current_user.post_comments.find(params[:comment_id])
    @comment.destroy
    redirect_to post_path(params[:post_id])
	end

	private
	def post_comment_params
	    params.require(:post_comment).permit(:comment, :user_id, :post_id)
	end
end
