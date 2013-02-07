require 'sinatra'
require 'dm-core'

DataMapper::setup(:default, {:adapter => 'yaml', :path => 'db'})

class Name
  include DataMapper::Resource
  property :id, Serial
  property :name, String
end

class Hours
  include DataMapper::Resource
  property :id, Serial
  property :floorhours, Integer
  property :lifehours, Integer
end

class Restaurants
  include DataMapper::Resource
  property :id, Serial
  property :m2m, Integer
  property :chipotle, Integer
  property :cafetasia, Integer
  property :space_market, Integer
  property :pizza_mercato, Integer
  property :pret, Integer
end

class Alcohol
  include DataMapper::Resource
  property :id, Serial
  property :monday, Integer
  property :tuesday, Integer
  property :wednesday, Integer
  property :thursday, Integer
  property :friday, Integer
  property :saturday, Integer
  property :sunday, Integer
end

class Sleep
  include DataMapper::Resource
  property :id, Serial
  property :sleep, Integer
  property :awake, Integer
end

DataMapper.finalize

# Main route
get '/' do
  @nav = "Finals, Finals, Finals"
  erb :home
end

# Question 1
post '/step1' do
  @nav = "Step 1"
  
  @name = params[:name]
  
  newName = Name.new
  newName.name = @name
  newName.save
  
  erb :step1
end

# Question 2
post '/step2' do
  @nav = "Step 2"
  
  @floorhours = params[:floorhours]
  @lifehours = params[:lifehours]
  
  newHours = Hours.new
  newHours.floorhours = @floorhours
  newHours.lifehours = @lifehours
  newHours.save
  #raise Exception, newHours.save

  erb :step2
end

post '/step3' do
  @nav = "Step 3"
  
  @m2m = params[:m2m]
  @chipotle = params[:chipotle]
  @cafetasia = params[:cafetasia]
  @space_market = params[:space_market]
  @pizza_mercato = params[:pizza_mercato]
  @pret = params[:pret]
  
  newRestaurants = Restaurants.new  
  newRestaurants.m2m = @m2m
  newRestaurants.chipotle = @chipotle
  newRestaurants.cafetasia = @cafetasia
  newRestaurants.space_market = @space_market
  newRestaurants.pizza_mercato = @pizza_mercato
  newRestaurants.pret = @pret
  newRestaurants.save
  
  erb :step3
end

post '/step4' do
  @nav = "Step 4"
  
  @monday = params[:monday]
  @tuesday = params[:tuesday]
  @wednesday = params[:wednesday]
  @thursday = params[:thursday]
  @friday = params[:friday]
  @saturday = params[:saturday]
  @sunday = params[:sunday]
  
  newAlcohol = Alcohol.new
  newAlcohol.monday = @monday
  newAlcohol.tuesday = @tuesday
  newAlcohol.wednesday = @wednesday
  newAlcohol.thursday = @thursday
  newAlcohol.friday = @friday
  newAlcohol.saturday = @saturday
  newAlcohol.sunday = @sunday
  newAlcohol.save
  
  erb :step4
end

post '/output' do
  @nav = "Life During Finals"
  
  @sleep = params[:sleep]
  @awake = params[:awake]
  
  newSleep = Sleep.new
  newSleep.sleep = @sleep
  newSleep.sleep = @awake
  newSleep.save
  
  @name = Name.last.name
  
  @floorhours = Hours.last.floorhours
  @lifehours = Hours.last.lifehours
  
  @m2m = Restaurants.last.m2m
  @chipotle = Restaurants.last.chipotle
  @cafetasia = Restaurants.last.cafetasia
  @space_market = Restaurants.last.space_market
  @pizza_mercato = Restaurants.last.pizza_mercato
  @pret = Restaurants.last.pret
  
  @monday = Alcohol.last.monday
  @tuesday = Alcohol.last.tuesday
  @wednesday = Alcohol.last.wednesday
  @thursday = Alcohol.last.thursday
  @friday = Alcohol.last.friday
  @saturday = Alcohol.last.saturday
  @sunday = Alcohol.last.sunday

  erb :output
end

