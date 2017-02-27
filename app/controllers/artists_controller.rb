class ArtistsController < ApplicationController
  before_action :set_artist, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @artists = Artist.all
    uri = URI("https://randomuser.me/api/?results=#{@artists.size}")
    @response = JSON.parse(Net::HTTP.get(uri))
    respond_to do |format|
      format.html
      format.json
    end
  end

  def show
    unless @artist.avatar.present?
      uri = URI("https://randomuser.me/api/?results=50")
      @response = JSON.parse(Net::HTTP.get(uri))
      @artist.avatar = @response['results'][rand(50)]['picture']['medium']
      @artist.save
    end
    respond_to do |format|
      format.html
      format.json
    end
  end

  def new
    @artist = Artist.new
    respond_with(@publisher)
  end

  def edit

  end

  def create
    @artist = Artist.new(artist_params)
    @artist.save
    respond_to do |format|
      format.html
      format.json
    end
  end

  def update
    @artist.update(artist_params)
    respond_to do |format|
      format.html
      format.json
    end
  end

  def destroy
    @artist.destroy
    respond_to do |format|
      format.html
      format.json
    end
  end

  private
  def set_artist
    @artist = Artist.find(params[:id])
  end

  def artist_params
    params.require(:artist).permit(:name)
  end
end
