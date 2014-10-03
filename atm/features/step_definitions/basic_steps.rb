require File.join(File.dirname(__FILE__), '..', '..', 'lib', 'nice_bank')

CAPTURE_CASH_AMOUNT = Transform /^\$\d+$/ do |number|
  number.to_i
end

module KnowsMyAccount
  def my_account
    @my_account  ||= Account.new
  end

  def cash_slot
    @cash_slot ||= CashSlot.new
  end

  def teller
    @teller = Teller.new cash_slot
  end
end

World(KnowsMyAccount)

Given /^I have deposited (#{CAPTURE_CASH_AMOUNT}) in my account$/ do |amount|
  my_account.deposit(amount)
  expect(my_account.balance).to eq(amount),
    "Expected the balance to be #{amount} but it was #{my_account.balance}"
end

When /^I withdraw (#{CAPTURE_CASH_AMOUNT})$/ do |amount|
  teller.withdraw_from(my_account, amount)
end

Then /^(#{CAPTURE_CASH_AMOUNT}) should be dispensed$/ do |amount|
  expect(cash_slot.contents).to eq amount
end
