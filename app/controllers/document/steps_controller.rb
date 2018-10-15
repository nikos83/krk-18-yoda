# frozen_string_literal: true

class Document::StepsController < ApplicationController
  include Wicked::Wizard
  steps add_file, add_data

  def show
  end
  
  def update
  end

end
