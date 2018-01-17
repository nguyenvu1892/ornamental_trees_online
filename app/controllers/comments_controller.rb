class CommentsController < ApplicationController
  before_action :find_product
  before_action :correct_user, only: :destroy
  def create
    @comment = @product.comments.build comment_params
    @comment.user_id = current_user.id
      if @comment.save
        render json: {
          status: :success,
          content: render_to_string(partial: "comments/comment", locals:{comment: @comment})
        }
      end
  end

  def destroy
    @comment = @product.comments.find_by id: params[:id]
    if @comment.destroy
        render json: {
          status: :success
        }
    end
  end
  private

  def find_product
    @product = Product.find_by id: params[:product_id]
  end

  def comment_params
    params.require(:comments).permit(:content, :user_id, :product_id)
  end

  def correct_user
    @comment = current_user.comments.find_by id: params[:id]
    redirect_to root_url if @comment.nil?
  end

end
