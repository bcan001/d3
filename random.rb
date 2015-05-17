# you can include a module within a class definition. When this happens, all the module's instance methods are suddenly available as methods in the class as well. They get mixed in. In fact, mixed-in modules effectively behave as superclasses.
# When a class can inherit features from more than one parent class, the class is supposed to show multiple inheritance.

module Name
	def sayMyName
		puts self.name
	end
end

module Modtwo
	def sayAge
		puts self.age
	end
end
	
class Animal
	# include the Name module
	include Name
	include Modtwo

	attr_accessor :name, :age, :sound
	def initialize(name)
		@name = name
	end
	# encapsulate the age attribute so that it can't be set to anything less than or equal to 0
	def setAge(input_age)
		if input_age > 0
			@age = input_age
		else
			puts 'invalid age set'
		end
	end
	def setSound
		@sound = "blahhhhh"
	end
end

# Dog and Cat subclasses inheret from superclass Animal
class Dog < Animal
	# override setSound method with 'woof woof'
	def setSound
		@sound = "woof woof"
	end
end
class Cat < Animal
	def setSound
		@sound = "meow meow"
	end
end


newAnimal = Animal.new("mouse")
newAnimal.setAge(0)
puts newAnimal.age


newDog = Dog.new("Lance")
newDog.setAge(5)
puts newDog.name
newDog.setSound
puts newDog.sound

puts newDog.sayMyName
puts newDog.sayAge

