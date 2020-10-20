class ReviewsController < ApplicationController
    def new
        @review = review.new
    
        @users = User.all
        @movies = Movie.all
      end
    
      def create
        review = Review.create(review_params)
    
        redirect_to movie_path(review.movie)
      end
    
      private
    
      def review_params
        p params
        params.permit(:movie_id, :user_id, :title, :content)
      end
end
