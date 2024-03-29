class Api::V1::CommentsController < ApplicationController
  before_action :authenticate_user, only: %i[create destroy]

  def index
    event = Event.find(params[:event_id])
    comments = event.comments.includes(user: :user_profile)

    comments_json = comments.as_json(
      include: {
        user: {
          only: %i[id name],
          include: {
            user_profile: {
              only: [:avatar]
            }
          }
        }
      }
    )

    render json: comments_json
  end

  def create
    comment = Comment.new(comment_params.merge(user: current_user, event_id: params[:event_id]))

    if comment.save
      render json: comment, status: :created
    else
      render json: { errors: comment.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    comment = current_user.comments.find_by(id: params[:id])
    # コメントが見つからない、または他のユーザーのコメントの場合
    unless comment
      return render json: { error: "削除権限がありません。" }, status: :forbidden
    end

    if comment.destroy
      head :no_content
    else
      render json: { error: "コメントの削除に失敗しました" }, status: :unprocessable_entity
    end
  end

  private

    def comment_params
      params.require(:comment).permit(:comment)
    end
end
