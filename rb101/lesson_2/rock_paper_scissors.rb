VALID_CHOICES = ['rock', 'paper', 'scissors', 'spock', 'lizard']
SHORTENED_CHOICES = ['r', 'p', 's', 'k', 'l']
GAME_LOGIC = { rock: ['scissors', 'lizard'],
               paper: ['rock', 'spock'],
               scissors: ['paper', 'lizard'],
               spock: ['scissors', 'rock'],
               lizard: ['paper', 'spock'] }
VALID_CONTINUE_CHOICES = ['y', 'yes', 'n', 'no']

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

def retrieve_user_choice
  choice = ''
  loop do
    prompt("Choose one: (r)ock, (p)aper, (s)cissors, spoc(k), (l)izard")
    choice = Kernel.gets().downcase().chomp()
    if VALID_CHOICES.include?(choice) || SHORTENED_CHOICES.include?(choice)
      (choice = convert_choice(choice)) if SHORTENED_CHOICES.include?(choice)
      return choice
    else
      prompt("That's not a valid choice.")
    end
  end
end

def display_choices(choice, computer_choice)
  Kernel.puts("You chose: #{choice}; Computer chose: #{computer_choice}")
end

def update_scores(scores, choice, computer_choice)
  scores[:player] += 1 if win?(choice, computer_choice)
  scores[:computer] += 1 if win?(computer_choice, choice)
end

def someone_grand_winner?(scores)
  scores[:player] >= 5 || scores[:computer] >= 5
end

def display_winner(scores)
  if scores[:player] >= 5
    prompt("Player is the grand winner with 5 total wins!")
  else
    prompt("Computer is the grand winner with 5 total wins!")
  end
end

def play_again?
  answer = ''
  loop do
    prompt("Do you want to play again?")
    answer = Kernel.gets().downcase().chomp()
    if VALID_CONTINUE_CHOICES.include?(answer)
      break
    else
      puts("Invalid answer! Please enter 'y' or 'n'")
    end
  end
  answer == 'y' || answer == 'yes'
end

def display_goodbye
  prompt("Thank you for playing!")
end

def display_welcome
  prompt("Welcome to the game, first to 5 wins is the grand winner!")
end

display_welcome
loop do
  scores = { player: 0, computer: 0 }
  loop do
    choice = retrieve_user_choice
    computer_choice = VALID_CHOICES.sample
    display_choices(choice, computer_choice)
    display_results(choice, computer_choice)
    update_scores(scores, choice, computer_choice)
    break if someone_grand_winner?(scores)
  end
  display_winner(scores) if someone_grand_winner?(scores)
  break unless play_again?
end
display_goodbye
