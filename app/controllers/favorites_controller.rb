class FavoritesController < ApplicationController
  ## maybe doesn't need a controller and instead can exist on user
  ## User.favorites

  def new
    @favorite = Favorite.new

    @users = User.all
    @movies = Movie.all
    
  end

  def create
    fav = Favorite.new(favorite_params)
    @current_user = User.find_by(id: session[:user_id])
    if @current_user.allMovieIDs.include?(fav.movie_id)
        @current_user.errors.add(:movie_id, "Cannot favorite the same movie more than once")
        redirect_back fallback_location: movies_path
    else
      fav.save
      redirect_back fallback_location: movies_path
      
    end
  end

  private

  def favorite_params
    p params
    params.permit(:movie_id, :user_id)
  end
    
end
