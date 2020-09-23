# Input is loan amount, APR, loan duration
# Output is monthly interest rate, loan duration in months, monthly payment.

VALID_ANSWERS = ["y", "yes", "n", "no"]
NEGATIVE_ANSWERS = ["no", "n"]
loan_amount = nil
apr = nil
loan_duration_years = nil

def valid_number?(number)
  (number == number.to_i.to_s || number == number.to_f.to_s) &&
    (number.to_i >= 0 || number.to_f >= 0)
end

def calculate_payment(loan_amount, monthly_interest_rate, loan_duration_months)
  if loan_duration_months == 0
    loan_amount
  elsif monthly_interest_rate == 0
    loan_amount / loan_duration_months
  else
    loan_amount * (monthly_interest_rate /
                  (1 - (1 + monthly_interest_rate)**(-loan_duration_months)))
  end
end

def retrieve_input(string_request)
  user_input = ''
  loop do
    print(string_request)
    user_input = gets.chomp
    if valid_number?(user_input)
      return user_input.to_f
    else
      puts "Invalid input!"
    end
  end
end

def valid_new_calc_answer
  answer = ''
  puts "\n"
  loop do
    print "Do you want to perform another calculation? ('y' or 'n') "
    answer = gets.chomp.downcase
    if VALID_ANSWERS.include?(answer)
      return answer
    else
      puts "Invalid answer."
    end
  end
end

puts "Welcome to the Loan Calculator! \n\n"

loop do
  loan_amount = retrieve_input("Please enter the loan amount: ")
  apr = retrieve_input("Please enter the APR amount: ") / 100
  loan_duration_years =
    retrieve_input("Please enter the loan duration in years: ")

  monthly_interest_rate = (apr / 12)
  loan_duration_months = loan_duration_years * 12

  puts "Your monthly interest rate is : #{monthly_interest_rate.round(3)}%"
  puts "The loan duration in months is : #{loan_duration_months}"
  puts "Your monthly payment is #{calculate_payment(
    loan_amount, monthly_interest_rate, loan_duration_months
  ).round(2)}"

  if NEGATIVE_ANSWERS.include?(valid_new_calc_answer)
    puts "\nThank you for using Khalid's Loan Calculator!"
    break
  else
    system("clear")
  end
end
