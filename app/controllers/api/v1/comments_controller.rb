class Api::V1::CommentsController < ApplicationController
  # TODO 開発時xhr_request?を無効化。最後は有効化させる。
  skip_before_action :xhr_request?, only: [:index]
  def index
    event = Event.find(params[:event_id])
    comments = event.comments.includes(user: :user_profile)

    # コメントに関連するユーザーの名前とアバター、そしてuser_idを含めたJSONデータを生成
    comments_json = comments.as_json(
      include: {
        user: {
          only: [:id, :name], # user_idとしてユーザーのidを含める
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
end
