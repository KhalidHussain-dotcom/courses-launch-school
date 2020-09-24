VALID_CHOICES = ['rock', 'paper', 'scissors', 'spock', 'lizard']
SHORTENED_CHOICES = ['r', 'p', 's', 'k', 'l']
GAME_LOGIC = { rock: ['scissors', 'lizard'],
               paper: ['rock', 'spock'],
               scissors: ['paper', 'lizard'],
               spock: ['scissors', 'rock'],
               lizard: ['paper', 'spock'] }

def prompt(message)
  Kernel.puts("=> #{message}")
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("You won!")
  elsif win?(computer, player)
    prompt("computer won!")
  else
    prompt("It's a tie!")
  end
end

def win?(first, second)
  GAME_LOGIC[first.to_sym].include?(second)
end

def convert_choice(choice)
  case choice
  when 'r'
    'rock'
  when 'p'
    'paper'
  when 's'
    'scissors'
  when 'k'
    'spock'
  when 'l'
    'lizard'
  end
end

player_score = 0
computer_score = 0

loop do
  choice = ''

  loop do
    prompt("Choose one: (r)ock, (p)aper, (s)cissors, spoc(k), (l)izard")
    choice = Kernel.gets().downcase().chomp()
    if VALID_CHOICES.include?(choice) || SHORTENED_CHOICES.include?(choice)
      break
    else
      prompt("That's not a valid choice.")
    end
  end

  (choice = convert_choice(choice)) if SHORTENED_CHOICES.include?(choice)

  computer_choice = VALID_CHOICES.sample

  Kernel.puts("You chose: #{choice}; Computer chose: #{computer_choice}")

  display_results(choice, computer_choice)

  player_score += 1 if win?(choice, computer_choice)
  computer_score += 1 if win?(computer_choice, choice)

  if player_score >= 5 || computer_score >= 5
    if player_score >= 5
      prompt("Player is the grand winner with 5 total wins!")
    else
      prompt("Computer is the grand winner with 5 total wins!")
    end
    break
  end

  prompt("Do you want to play again?")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt("Thank you for playing!")
