# frozen_string_literal: true

class AfterSignupController < ApplicationController
  before_action :set_bucket, only: [:show, :update, :destroy]
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
    render_wizard
  end
  
  def create
    @user = current_user
    @bucket = current_user.buckets.new(bucket_params)
    if @bucket.save
      render_wizard @bucket, notice: 'CREATED!'
    else
      render :new
    end
    
  end
  private

  def set_bucket
    @bucket = current_user.buckets.find(params[:id])
  end
  
  def bucket_params
    params.require(:bucket).permit(:name, :user_id)
  end

end
