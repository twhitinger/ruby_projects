def create_list
  print "What is the list name? "
  name = gets.chomp

  hash = { "name" => name, "items" => Array.new }
  return hash
end

def add_list_item
  print "What is the item called? "
  item_name = gets.chomp

  print "How much? "
  quantity = gets.chomp.to_i

  hash = { "name" => item_name, "quantity" => quantity}
  return hash
end

def print_seperator(character = "-")
  puts character * 75
end

def print_list(list)
  puts "List: #{list['name']}"
  print_seperator

  list['items'].each do |item|
    puts "Item: #{item['name']} \t\t\t Quantity: #{item['quantity']}"
  end

  print_seperator
end

list = create_list

puts "Great! Add some items to your list."
list["items"].push(add_list_item)
list["items"].push(add_list_item)
list["items"].push(add_list_item)
puts "Here's your list:"
print_list(list)
