# frozen_string_literal: true

class BucketsController < ApplicationController
  before_action :set_bucket, only: [:show, :update, :destroy]

  def index
    @buckets = current_user.buckets
  end

  def new
    @bucket = Bucket.new
  end

  def show; end

  def create
    @bucket = current_user.buckets.new(bucket_params)
    if @bucket.save
      redirect_to buckets_path, notice: 'CREATED!'
    else
      render :new
    end
  end

  def update
    if @bucket.update(bucket_params)
      redirect_to buckets_path, notice: 'Updated!'
    else
      render :edit
    end
  end

  def destroy
    if @bucket.destroy
      redirect_to root_path, notice: 'Destroyed!'
    else
      render :index
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
