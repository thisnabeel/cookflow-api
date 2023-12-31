class MediaController < ApplicationController
  before_action :set_medium, only: %i[ show update destroy ]

  # GET /media
  # GET /media.json
  def index
    @media = Medium.all
  end

  # GET /media/1
  # GET /media/1.json
  def show
  end

  # POST /media
  # POST /media.json
  def create
    @medium = Medium.new(medium_params)

    if @medium.save
      render :show, status: :created, location: @medium
    else
      render json: @medium.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /media/1
  # PATCH/PUT /media/1.json
  def update
    if @medium.update(medium_params)
      render :show, status: :ok, location: @medium
    else
      render json: @medium.errors, status: :unprocessable_entity
    end
  end

  # DELETE /media/1
  # DELETE /media/1.json
  def destroy
    @medium.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_medium
      @medium = Medium.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def medium_params
      params.require(:medium).permit(:mediable_type, :mediable_id, :media_url, :media_type, :description, :title, :position)
    end
end
