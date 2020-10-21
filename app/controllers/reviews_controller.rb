class ReviewsController < ApplicationController
    def new
        @review = Review.new
        @users = User.all
        @movies = Movie.all
      end
    
      def create
        review = Review.create(review_params)
        if review.save
            redirect_to movie_path(review.movie)
        else
            flash[:errors] = review.errors.full_messages
            redirect_back fallback_location: movies_path
        end
      end
    
      private
    
      def review_params
        p params
        params.permit(:movie_id, :user_id, :title, :content)
      end
end
