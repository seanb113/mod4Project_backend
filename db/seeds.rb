require 'rest-client'
require 'byebug'
require 'json'
CoffeeShop.destroy_all

google_key = Rails.application.credentials.google_maps[:api_key2]
key = Rails.application.credentials.yelp[:api_key]
response_Yelp = RestClient.get('https://api.yelp.com/v3/businesses/search?categories=coffee&location=washingtondc&limit=50', {:Authorization => "Bearer #{key}"})
response_hash = JSON.parse(response_Yelp)
cafe_array = response_hash['businesses']



cafe_array.each do |shop|
    name = shop["name"]
    location = shop["location"]["display_address"].join(" ")
    price = shop["price"]
    image = shop["image_url"]
    phone_number = shop["display_phone"]
    rating = shop["rating"]
    review_count = shop["review_count"]
    distance = shop["distance"]
    latitude = shop["coordinates"]["latitude"]
    longitude = shop["coordinates"]["longitude"]
    CoffeeShop.create(name: name, location: location, price: price, image_url: image, display_phone: phone_number, rating: rating, review_count: review_count, distance: distance, latitude: latitude, longitude: longitude)
    # Location.create(latitude: latitude, longitude: longitude, name: name)
end





