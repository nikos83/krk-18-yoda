# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # def create
  #   super do |resource|
  #     create_overall_bucket(resource.id)
  #   end
  # end

  def after_sign_up_path_for(resource)
    create_overall_bucket(resource.id)
    "/after_signup/add_bucket"
  end

  def after_inactive_sign_up_path_for(resource)
    "/after_signup/add_bucket"
  end

  private

  def create_overall_bucket(resource_id)
    Bucket.create(name: 'General', user_id: resource_id)
  end
  
end
