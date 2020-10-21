require 'bcrypt'
class User < ApplicationRecord
    include BCrypt
    has_many :favorites
    has_many :reviews
    # has_many :movies, through: :favorites
    # has_many :movies, through: :reviews
    #validates :favorites, uniqueness: true
    has_secure_password

    
    def allMovieIDs
        self.favorites.map {|fav| fav.movie_id }
    end
end
