class V1::PublicationsController < ApplicationController

  def index
    publications = Publication.all
    render json: publications.as_json
  end
end
