class PublishersController < ApplicationController
  before_action :set_publisher, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @publishers = Publisher.all
    respond_to do |format|
      format.html
      format.json
    end
  end

  def show
    respond_to do |format|
      format.html
      format.json
    end
  end

  def new
    @publisher = Publisher.new
    respond_with(@publisher)
  end

  def edit
  end

  def create
    @publisher = Publisher.new(publisher_params)
    @publisher.save
    respond_to do |format|
      format.html
      format.json
    end
  end

  def update
    @publisher.update(publisher_params)
    respond_to do |format|
      format.html
      format.json
    end
  end

  def destroy
    @publisher.destroy
    respond_to do |format|
      format.html
      format.json
    end
  end

  private
  def set_publisher
    @publisher = Publisher.find(params[:id])
  end

  def publisher_params
    params.require(:publisher).permit(:name, :address, :city, :state, :zip, :phone, :url)
  end
end
