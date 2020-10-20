class FavoritesController < ApplicationController
  ## maybe doesn't need a controller and instead can exist on user
  ## User.favorites

  def new
    @favorite = Favorite.new

    @users = User.all
    @movies = Movie.all
  end

  def create
    favorite = Favorite.create(favorite_params)

    redirect_to movie_path(favorite.movie)
  end

  private

  def favorite_params
    p params
    params.permit(:movie_id, :user_id)
  end
    # def index #user#favorites
    #     @favs = []
    #     favorites.each { |elm| 
    #         temp = getResponse("https://api.themoviedb.org/3/movie/#{elm}?api_key=7d5fc19bc307c5d1ca314e7fb11bf51e")
    #         @favs.push(temp)
    # }
    # end

    # def favorites 
    #     return [528085, 475430]
    # end

    # private

    # def getResponse(url)
    #     newObj = {}
    #     var = RestClient.get(url) 
    #     var = JSON.parse(var.body)
    #     return createSymbols(var)
    # end

    # def createSymbols(hash)
    #     newObj = {}
    #     hash.each { |key, value|
    #     ##ternary?  
    #         if(value.is_a?(Array))
    #             newObj[key.to_sym] = createSymbolsFromArray(value)
    #         else 
    #             newObj[key.to_sym] = value
    #         end
    #         }
    #     return newObj
    # end

    # def createSymbolsFromArray(array)
    #     newArray = []
    #     array.each_with_index { |elm, index|
    #         tempObj = {}
    #         elm.each { |key, value| 
    #             tempObj[key.to_sym] = value
    #         }
    #     newArray[index] = tempObj
    #     }

    #     p newArray
    # end
end
