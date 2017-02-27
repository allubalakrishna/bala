class SongsController < ApplicationController
  before_action :set_song, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @songs = Song.all.includes(:artist).includes(:album)
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
    @song = Song.new
    respond_with(@song)
  end

  def edit
  end

  def create
    @song = Song.new(song_params)
    @song.save
    respond_to do |format|
      format.html
      format.json
    end
  end

  def update
    @song.update(song_params)
    respond_to do |format|
      format.html
      format.json
    end
  end

  def destroy
    @song.destroy
    @songs = Song.all.includes(:artist).includes(:album)
    respond_to do |format|
      format.html
      format.json
      format.js
    end
  end

  private
  def set_song
    @song = Song.find(params[:id])
  end

  def song_params
    params.require(:song).permit(:name, :album_id, :artist_id)
  end
end
