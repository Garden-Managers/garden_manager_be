class Api::V1::PlantSearchController < ApplicationController

  def index
    render json: PlantSerializer.new(Plant.name_search(params[:q]))
  end
end
