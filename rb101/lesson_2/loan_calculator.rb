require "pry"

# Input is loan amount, APR, loan duration
# Output is monthly interest rate, loan duration in months, monthly payment.

loan_amount = nil
apr = nil
loan_duration_years = nil

def valid_integer?(loan_amount)
  loan_amount == loan_amount.to_i.to_s
end

def valid_float?(apr)
  apr == apr.to_f.to_s
end

def calculate_payment(loan_amount, monthly_interest_rate, loan_duration_months)
  loan_amount * (monthly_interest_rate /
                (1 - (1 + monthly_interest_rate)**(-loan_duration_months)))
end

loop do
  print "Please enter the loan amount as an integer: "
  loan_amount = gets.chomp
  if valid_integer?(loan_amount)
    loan_amount = loan_amount.to_i
    break
  else
    puts "Invalid input."
  end
end

loop do
  print "Please enter the APR amount as a float: "
  apr = gets.chomp
  if valid_float?(apr)
    apr = apr.to_f / 100
    break
  else
    puts "Invalid input."
  end
end

loop do
  print "Please enter the loan duration in full years: "
  loan_duration_years = gets.chomp
  if valid_integer?(loan_duration_years)
    loan_duration_years = loan_duration_years.to_i
    break
  else
    puts "Invalid input."
  end
end

monthly_interest_rate = (apr / 12)
loan_duration_months = loan_duration_years * 12

puts "Your monthly interest rate is : #{monthly_interest_rate.round(3)}%"
puts "The loan duration in months is : #{loan_duration_months}"
puts "Your monthly payment is #{calculate_payment(loan_amount,
                                                  monthly_interest_rate,
                                                  loan_duration_months).round(2)
                              }"
