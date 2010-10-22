class AwesomeAnimal

  ADJECTIVES = File.read('lib/adjective.txt').split("\n").shuffle
  ANIMALS = File.read('lib/animals.txt').split("\n").shuffle

  def self.random
    "#{ADJECTIVES.choice} #{ANIMALS.choice}"
  end

end
