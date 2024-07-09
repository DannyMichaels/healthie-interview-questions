require_relative 'foods'

# Create classes Cat, Dog, Chicken, CatFood, DogFood, HumanFood, Lemons
# a cat likes CatFood, Chicken, and Milk
# a dog likes DogFood, CatFood, Chicken, HumanFood
# a Cat can meow and a Dog can bark (print "meow" or "bark" to STDOUT)
# when an animal eats food it likes, it makes a noise three times
# when an animal eats food it dislikes, it makes a noise one time

LIKE_FOOD_NOISE_COUNT = 3
DISLIKE_FOOD_NOISE_COUNT = 1

class Animal
  attr_accessor :likes

  def initialize
    @likes = []
  end

  def say_likes
    puts "I like: #{likes.join(', ')}"
  end

  def eat(food)
    if is_like?(food)
      make_noise(LIKE_FOOD_NOISE_COUNT)
    else
      make_noise(DISLIKE_FOOD_NOISE_COUNT)
    end
  end

  def is_like?(food)
    likes.include?(food)
  end

  def make_noise(times)
    raise NotImplementedError, 'This method should be overridden in the subclass'
  end
end

# I have a cat named Yuki, she's a Siberian Neva Masquerade cat about 1.5 years old, here is her instagram: https://www.instagram.com/yuki_bluev
class Cat < Animal 
  def initialize
    super
    @likes = [CatFood, Chicken, Milk]
  end 

  def make_noise(times)
    times.times { puts 'meow' }
  end
end

class Dog < Animal 
  def initialize
    super
    @likes = [DogFood, CatFood, Chicken, HumanFood]
  end 

  def make_noise(times)
    times.times { puts 'bark' }
  end
end