class V1::PublicationsController < ApplicationController

  def index
    publications = Publication.all
    render json: publications.as_json
  end

  def create
    publication = Publication.find_by(id: params[:id])
    Publication.create(
    name: params[:name],
    lean: params[:lean]
    )
    render json: publication.as_json 
  end

  def show
    publication = Publication.find_by(id: params[:id])
    render json: publication.as_json
  end
end
