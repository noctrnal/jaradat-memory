# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

sentences = [
  ["Always wear your seatbelt in a car.", 1],
  ["You keep clothes in a dresser.", 1],
  ["You can boil water in a saucepan.", 1],
  ["The colour of a banana is yellow.", 1],
  ["You wear socks on your feet.", 1],
  ["Your teeth are in your mouth.", 1],
  ["A car has four wheels.", 1],
  ["A magician performs magic.", 1],
  ["The number after four is five.", 1],
  ["I can smell with my nose.", 1],
  ["I can see with my eyes.", 1],
  ["The opposite of long is short.", 1],
  ["A house is made of bricks.", 1],
  ["A king wears a crown.", 1],
  ["You can hear with your ears.", 1],
  ["The sea is very deep.", 1],
  ["The number after two is three.", 1],
  ["The number after ten is eleven.", 1],
  ["Stone is very hard.", 1],
  ["Thomas is a name for a boy.", 1],
  ["A baby duck is called a duckling.", 1],
  ["Jack and Jill went up the hill.", 1],
  ["A birthday cake has candles.", 1],
  ["A feather is very light.", 1],
  ["Schools have a playground.", 1],
  ["A flower has petals.", 1],
  ["To make tea you need a teapot.", 1],
  ["A hairdresser cuts hair.", 1],
  ["You can use an umbrella if it rains.", 1],
  ["Rockets fly in outer space.", 1],
  ["If you are thirsty you have a drink.", 1],
  ["If you are hungry you eat food.", 1],
  ["A pineapple is coloured pink.", 0],
  ["An onion is a fruit.", 0],
  ["We celebrate Christmas in July.", 0],
  ["There are forty months in a year.", 0],
  ["There are two hundred letters in the alphabet.", 0],
  ["A freezer keeps your food warm.", 0],
  ["Pigs live on the moon.", 0],
  ["Horses go to the supermarket.", 0],
  ["A biscuit is made of wood.", 0],
  ["A toaster can drive a kart.", 0],
  ["A shark can run a race.", 0],
  ["Donkeys live in dustbins.", 0],
  ["A bat can fly a in helicopter.", 0],
  ["A squirrel likes to eat potatoes.", 0],
  ["We have Easter in November.", 0],
  ["A suitcase is made of jelly.", 0],
  ["A trampoline is made of butter.", 0],
  ["A crocodile is coloured blue.", 0],
  ["A cloud is made of rubber.", 0],
  ["Boots are made of milk.", 0],
  ["Your nose is on your arm.", 0],
  ["You eat your dinner with a spade.", 0],
  ["Fish can play the guitar.", 0],
  ["You tell the time with a calculator.", 0],
  ["Rainbows appear on the fridge.", 0],
  ["A boat likes to eat crisps.", 0],
  ["Sand is very sharp.", 0],
  ["A book is a musical instrument.", 0],
  ["Ice cream feels very hot.", 0],
  ["A pavement is made of plums.", 0],
  ["Heavy is the opposite of the short.", 0],
]

sentences.each do |sentence, veracity|
  Sentence.create(sentence: sentence, veracity: veracity )
end
