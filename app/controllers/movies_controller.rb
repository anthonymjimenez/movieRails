require 'json'

class MoviesController < ApplicationController
    
    def index
        @movies = getResponse('https://api.themoviedb.org/3/discover/movie?api_key=7d5fc19bc307c5d1ca314e7fb11bf51e')
    end

    def show
        @movie = getResponse("https://api.themoviedb.org/3/movie/#{params[:id]}?api_key=7d5fc19bc307c5d1ca314e7fb11bf51e")
    end

    private 

    def getResponse(url)
        newObj = {}
        var = RestClient.get(url) 
        var = JSON.parse(var.body)
        return createSymbols(var)
    end

    def createSymbols(hash)
        newObj = {}
        hash.each { |key, value|
        ##ternary?  
            if(value.is_a?(Array))
                newObj[key.to_sym] = createSymbolsFromArray(value)
            else 
                newObj[key.to_sym] = value
            end
            }
        return newObj
    end

    def createSymbolsFromArray(array)
        newArray = []
        array.each_with_index { |elm, index|
            tempObj = {}
            elm.each { |key, value| 
                tempObj[key.to_sym] = value
            }
        newArray[index] = tempObj
        }
        return newArray
    end
end
