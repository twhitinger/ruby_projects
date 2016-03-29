# Prompt the player to enter their name.
print "Hello player, please enter your name... "
# Get input from the player
name = gets.chomp
# Use name to print a greeting
puts "Welcome #{name}, to the final game you will play..."
# Generate a random number from 1 to 100
target_number = rand(100) + 1
# Let user know how many guesses they have left
guess = 10
puts "You have #{guess} guesses left. Don't choke."
# Get guess from user
print "Enter your guess for the number (1-100): "
user_guess = ""
count = 0
# Branching logic
while guess > 0 && user_guess != target_number
  user_guess = gets.to_i
  count += 1
  while user_guess < 1 || user_guess > 100 || user_guess.class != Fixnum
    print "You have to guess a whole number (1-100): "
    user_guess = gets.to_i
  end
  if user_guess > target_number
     puts "Oops, #{user_guess} is too HIGH!"
  elsif user_guess < target_number
     puts "Oops, #{user_guess} is too LOW!"
  end
  if user_guess != target_number
      guess -= 1
      puts "You have #{guess} guesses left...nearing DEATH!"
  else
      puts "Winner, winner, Chicken dinner. #{target_number} is correct #{name}."
      puts "It took you #{count} guesses."
  end
  if guess == 0
    puts "The number was #{target_number}, You Just Died..."
  end
end
