

class Owner


attr_accessor :pets
attr_reader :species, :name

@@all = []


def initialize(name,species="human")
  @name = name
  @species = species 
  @mood = "nervous"
  @@all << self
  @pets = { :dog => [], :cat => []}
end

def say_species 
    return "I am a #{species}."
end

def buy_dog(name_of_dog)    
  name_of_dog = Dog.new(name_of_dog,self)
end

def buy_cat(name_of_cat)    
 name_of_cat = Cat.new(name_of_cat,self)
end

def walk_dogs
  
  self.dogs.each {|dog| dog.mood ="happy"}

end

def feed_cats   
  self.cats.each {|cat| cat.mood ="happy"}
end

def sell_pets
  pets = self.dogs + self.cats 
  pets.each do |pet|
    pet.owner = nil 
    pet.mood = "nervous"
  end
end

def list_pets
  
   "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
end
def cats 
    
  Cat.all.select do |cat|
    cat.owner == self
  end
end

def dogs
  
  Dog.all.select do |dog|
    dog.owner == self
  end
end

def self.all
  @@all
end

def self.count 
  @@all.size
end

def self.reset_all
  @@all.clear
end
end


