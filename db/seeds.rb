# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'



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

movies = getResponse('https://api.themoviedb.org/3/discover/movie?api_key=7d5fc19bc307c5d1ca314e7fb11bf51e')


movies[:results].each do |x|
    Movie.create(title: x[:title], overview: x[:overview], release_date: x[:release_date] )
end

u = User.create(name: "m", username: "m", email: "m@m.com", password: "p")
#byebug
0