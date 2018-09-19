# frozen_string_literal: true

class AfterSignupController < ApplicationController
  include Wicked::Wizard

  steps :add_bucket, :add_document

  def show
    @user = current_user
    @buckets = current_user.buckets
    render_wizard
  end

  def update
    @user = current_user
    @bucket = @user.bucket.new
  end
  
  def create
    @bucket = current_user.buckets.create
    redirect_to bucket_path
  end

end
