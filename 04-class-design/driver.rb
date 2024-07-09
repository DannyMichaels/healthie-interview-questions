require_relative 'animal'

# Tests go here, add your own tests if you want.
puts 'Creating a Cat named Yuki'
yuki = Cat.new
puts 'Checking what Yuki likes'
yuki.say_likes
puts '---------------------'
puts 'Giving Yuki some CatFood'
yuki.eat(CatFood) # food she likes, expected behavior: three meows
puts '---------------------'
puts 'Giving Yuki some DogFood'
yuki.eat(DogFood) # food she dislikes, expected behavior: one meow
puts 'YUKI END'

puts '---------------------'
puts 'Creating a Dog named Max'
max = Dog.new
puts 'Checking what Max likes'
max.say_likes
puts '---------------------'
puts 'Giving Max some DogFood'
max.eat(DogFood) # food he likes, expected behavior: three barks
puts '---------------------'
puts 'Giving Max some Lemons'
max.eat(Lemons) # food he dislikes, expected behavior: one bark
puts 'MAX END'
puts '---------------------'
