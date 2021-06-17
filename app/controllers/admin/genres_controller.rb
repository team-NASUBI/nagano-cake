class Admin::GenresController < ApplicationController
  def index
    @genre_new = Genre.new
    @genres = Genre.all
  end

  def edit
  end
end
