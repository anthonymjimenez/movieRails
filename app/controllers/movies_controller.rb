

class MoviesController < ApplicationController
    
    def index
        @movies = Movie.all
    end

    def show
        @movie = Movie.find(params[:id])
        @current_user = User.find_by(id: session[:user_id])
    end

    
    
end
