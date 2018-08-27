# frozen_string_literal: true

class AfterSignupController < ApplicationController
  include Wicked::Wizard

  steps :add_bucket, :add_document

  def show
    @user = current_user
    render_wizard
  end
end
