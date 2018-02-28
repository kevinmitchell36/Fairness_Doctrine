class V1::PublicationsController < ApplicationController
  # before_action :authenticate_user
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

  def update
    publication = Publication.find_by(id: params[:id])
    publication.name = params[:name] || publication.name
    publication.lean = params[:lean] || publication.lean
    publication.save
    render json: publication.as_json
  end

  def destroy
    publication = Publication.find_by(id: params[:id])
    publication.destroy
    render json: {message: "Publication deleted"}
  end
end
