class Api::V1::S3SignaturesController < ApplicationController
  require "aws-sdk-s3"

  before_action :authenticate_user

  def create
    filename = params[:filename]
    content_type = params[:contentType]
    image_type = params[:imageType]

    signed_url, public_url = generate_presigned_url(filename, content_type, image_type)

    render json: { signedUrl: signed_url, publicUrl: public_url }
  end

  private

    def generate_presigned_url(filename, content_type, image_type)
      s3_path = if image_type == "event"
                  "eventimage/#{filename}"
                else
                  "avatarimage/#{filename}"
                end

      presigner = initialize_presigner
      signed_url = presigner.presigned_url(
        :put_object,
        bucket: "minnanoevent.com",
        key: s3_path,
        content_type:,
        expires_in: 300
      )
      public_url = "https://s3.ap-northeast-1.amazonaws.com/minnanoevent.com/#{s3_path}"
      [signed_url, public_url]
    end

    def initialize_presigner
      Aws::S3::Presigner.new(
        client: Aws::S3::Client.new(
          region: "ap-northeast-1",
          credentials: Aws::Credentials.new(
            Rails.application.credentials.aws[:access_key_id],
            Rails.application.credentials.aws[:secret_access_key]
          )
        )
      )
    end
end
