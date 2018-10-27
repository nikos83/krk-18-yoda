# frozen_string_literal: true

class DocumentService
  def self.build(user, params)
    new(user, params).build
  end

  def initialize(user, params)
    @user = user
    @params = params
  end

  def build
    @user.documents.new(params_with_bucket)
  end

  private

  def params_with_bucket
    @params.merge(bucket: bucket)
  end

  def bucket
    Bucket.find_by(id: @params[:bucket_id]) ||
      Bucket.create(name: @params[:new_bucket_name], user: @user)
  end
end
