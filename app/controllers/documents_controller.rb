# frozen_string_literal: true

class DocumentsController < ApplicationController
  before_action :set_document, only: [:show, :edit, :update, :destroy]

  # GET /Documents
  # GET /Documents.json
  def index
    @documents = Document.all
  end

  # GET /Documents/1
  # GET /Documents/1.json
  def show; end

  # GET /Documents/new
  def new
    @document = Document.new
  end

  # GET /Documents/1/edit
  def edit; end

  # Document /Documents
  # Document /Documents.json
  def create
    @document = Document.new(document_params)
    @document.bucket = Bucket.first
    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /Documents/1
  # PATCH/PUT /Documents/1.json
  def update
    respond_to do |format|
      if @document.update(document_params)
        format.html { redirect_to @document, notice: 'Document was successfully updated.' }
        format.json { render :show, status: :ok, location: @document }
      else
        format.html { render :edit }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /Documents/1
  # DELETE /Documents/1.json
  def destroy
    @document.destroy
    respond_to do |format|
      format.html { redirect_to Documents_url, notice: 'Document was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_document
    @document = Document.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def document_params
    params.require(:document).permit(:name, :title, :content, :file)
  end
end
