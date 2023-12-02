class Api::V1::CommentsController < ApplicationController
  # TODO: 開発時xhr_request?を無効化。最後は有効化させる。
  skip_before_action :xhr_request?, only: %i[create index]
  before_action :authenticate_user, only: [:create]

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

  private

    def comment_params
      params.require(:comment).permit(:comment)
    end
end
