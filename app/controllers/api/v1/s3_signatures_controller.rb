class Api::V1::S3SignaturesController < ApplicationController
  require "aws-sdk-s3"

  def create
    filename = params[:filename]
    content_type = params[:contentType]

    signed_url, public_url = generate_presigned_url(filename, content_type)

    render json: { signedUrl: signed_url, publicUrl: public_url }
  end

  private

    def generate_presigned_url(filename, content_type)
      presigner = initialize_presigner
      signed_url = presigner.presigned_url(
        :put_object,
        bucket: "minnanoevent.com",
        key: "avatarimage/#{filename}",
        content_type:,
        expires_in: 300
      )
      public_url = "https://s3.ap-northeast-1.amazonaws.com/minnanoevent.com/avatarimage/#{filename}"
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
