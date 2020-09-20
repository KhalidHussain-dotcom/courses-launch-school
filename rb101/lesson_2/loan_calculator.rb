require "pry"

# Input is loan amount, APR, loan duration
# Output is monthly interest rate, loan duration in months, monthly payment.

loan_amount = nil
apr = nil
loan_duration_years = nil

def valid_number?(number)
  (number == number.to_i.to_s || number == number.to_f.to_s) &&
    (number.to_i >= 0 || number.to_f >= 0)
end

def calculate_payment(loan_amount, monthly_interest_rate, loan_duration_months)
  if monthly_interest_rate == 0
    loan_amount / loan_duration_months
  else
    loan_amount * (monthly_interest_rate /
                  (1 - (1 + monthly_interest_rate)**(-loan_duration_months)))
  end
end

puts "Welcome to the Loan Calculator! \n\n"

loop do
  loop do
    print "Please enter the loan amount: "
    loan_amount = gets.chomp
    if valid_number?(loan_amount)
      loan_amount = loan_amount.to_f
      break
    else
      puts "Invalid input."
    end
  end

  loop do
    print "Please enter the APR amount: "
    apr = gets.chomp
    if valid_number?(apr)
      apr = apr.to_f / 100
      break
    else
      puts "Invalid input."
    end
  end

  loop do
    print "Please enter the loan duration in years: "
    loan_duration_years = gets.chomp
    if valid_number?(loan_duration_years)
      loan_duration_years = loan_duration_years.to_f
      break
    else
      puts "Invalid input."
    end
  end

  monthly_interest_rate = (apr / 12)
  loan_duration_months = loan_duration_years * 12

  puts "Your monthly interest rate is : #{monthly_interest_rate.round(3)}%"
  puts "The loan duration in months is : #{loan_duration_months}"
  puts "Your monthly payment is
        #{calculate_payment(loan_amount, monthly_interest_rate,
                            loan_duration_months).round(2)}"

  answer = ''

  puts "\n"

  loop do
    print "Do you want to perform another calculation? ('y' or 'n') "
    answer = gets.chomp.downcase
    if answer == 'y' || answer == 'n' || answer == 'yes' || answer == 'no'
      break
    else
      puts "Invalid answer."
    end
  end

  if answer == 'n' || answer == 'no'
    break
  else
    puts "\n"
  end
end
