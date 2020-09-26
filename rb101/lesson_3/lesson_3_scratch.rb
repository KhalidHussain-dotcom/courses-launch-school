advice = "Few things in life are as important as house training your pet dinosaur."
advice.gsub!('important', 'urgent')

famous_words = "seven years ago"
famous_words.prepend("Four score and ")
puts famous_words
famous_words = "Four score and " + famous_words
puts famous_words

flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }
p flintstones.assoc("Barney")

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
puts ages["Spot"] == nil
puts ages.include?("Spot")
ages.each { |key, value| puts "True" if key == "Spot" }

advice = "Few things in life are as important as house training your pet dinosaur."
puts advice.include?("Dino")

statement = "The Flintstones Rock!"
count = 0
statement.split('').each { |character| count += 1 if character == 't' }
puts statement.count("t")
puts count