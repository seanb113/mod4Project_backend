require 'rest-client'
require 'byebug'
require 'json'
CoffeeShop.destroy_all

key = Rails.application.credentials[:api_key]
google_key = Rails.application.credentials[:api_key2]
response_Yelp = RestClient.get('https://api.yelp.com/v3/businesses/search?categories=coffee&location=washingtondc&limit=50', {:Authorization => "Bearer #{key}"})
response_hash = JSON.parse(response_Yelp)
cafe_array = response_hash['businesses']

sean = User.create(name: "John", password: "123")
sean.profile_pic.attach(io: File.open('./db/IMG_5851.JPG'), filename: 'IMG_5851.JPG')



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
    categories = shop["categories"].map{|c| c["alias"]}
    CoffeeShop.create(name: name, location: location, price: price, image_url: image, display_phone: phone_number, rating: rating, review_count: review_count, distance: distance, latitude: latitude, longitude: longitude, categories: categories)
end





