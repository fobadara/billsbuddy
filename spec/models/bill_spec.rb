require 'rails_helper'

RSpec.describe Bill, type: :model do
  user = User.create(id: '1', name: 'John', email: 'john@mail.com', password: 'password')
  subject do
    Bill.new(
      id: 1,
      name: 'Test Bill',
      amount: '100',
      description: 'Test Description', due_date: Date.today, user_id: user.id,
      category: '2'
    )
  end

  before { subject.save }

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without an amount' do
    subject.amount = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without an user_id' do
    subject.user_id = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without category' do
    subject.category = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid with a name greater than 50 characters' do
    subject.name = 'a' * 51
    expect(subject).to_not be_valid
  end

  it 'is not valid with an amount which is not a number' do
    subject.amount = 'a'
    expect(subject).to_not be_valid
  end

  it 'is not valid with an amount less than 0' do
    subject.amount = -1
    expect(subject).to_not be_valid
  end
end
