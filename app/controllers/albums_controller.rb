class AlbumsController < ApplicationController
  before_action :set_album, only: [:show, :edit, :update, :destroy]
  before_action :get_publishers, only: [:new, :create, :edit, :update]

  respond_to :html

  def index
    @albums = Album.all.includes(:publisher)
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
    @album = Album.new
    respond_with(@publisher)
  end

  def edit
  end

  def create
    @album = Album.new(album_params)
    @album.save
    respond_to do |format|
      format.html
      format.json
    end
  end

  def update
    if @album.update(album_params)
      respond_to do |format|
        format.html
        format.json
      end
    else
      error = @album.errors.full_messages.to_sentence
      flash.now[:alert] = error
      render :edit
      respond_to do |format|
        format.html
        format.json{error}
      end
    end
  end

  def destroy
    @album.destroy
    respond_to do |format|
      format.html
      format.json
    end
  end

  private
  def set_album
    @album = Album.find(params[:id])
  end

  def album_params
    params.require(:album).permit(:name, :cover_art, :publisher_id, :released_on, :is_sale)
  end

  def get_publishers
    @publishers = Publisher.all
  end
end
