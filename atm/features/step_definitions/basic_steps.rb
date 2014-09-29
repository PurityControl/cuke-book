class Account
  def deposit(amount)
    @balance = amount
  end
  
  def balance
    @balance
  end
end

CAPTURE_CASH_AMOUNT = Transform /^\$\d+$/ do |number|
  number.to_i
end

Given /^I have deposited (#{CAPTURE_CASH_AMOUNT}) in my account$/ do |amount|
  my_account = Account.new
  my_account.deposit(amount)
  expect(my_account.balance).to eq(amount),
    "Expected the balance to be #{amount} but it was #{my_account.balance}"
end

When /^I request (#{CAPTURE_CASH_AMOUNT})$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then /^(#{CAPTURE_CASH_AMOUNT}) should be dispensed$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end
