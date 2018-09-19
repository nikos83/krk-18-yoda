class Documents::BuildController < ApplicationController
    include Wicked::Wizard
  
    steps :add_name, :add_bucket, :add_file
  
    def show
      @document = Document.find(params[:document_id])
      render_wizard
    end
  
  
    def update
      @document = Document.find(params[:document_id])
      @document.update_attributes(params[:document])
      render_wizard @add_file
    end
  
  
    def create
      @document = Document.create
      redirect_to wizard_path(steps.first, :document_id => @document.id)
    end
  end