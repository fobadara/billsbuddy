require 'rails_helper'

RSpec.describe Bill, type: :model do
  subject { Bill.new(name: 'Test Bill', amount: '100', description: 'Test Description', due_date: Date.today, author_id: '1', group_id: '1') }

  before { subject.save }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without an amount' do
    subject.amount = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a due_date' do
    subject.due_date = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without an author_id' do
    subject.author_id = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a group_id' do
    subject.group_id = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid with a duplicate name' do
    subject2 = Bills.new(name: subject.name, amount: 100, due_date: '2020-01-01', author_id: '1', group_id: '1')
    expect(subject2).to_not be_valid
  end

  it 'is not valid with a duplicate name regardless of case' do
    subject2 = Bills.new(name: subject.name.upcase, amount: '100', due_date: '2020-01-01', author_id: '1', group_id: '1')
    expect(subject2).to_not be_valid
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

  it 'is not valid with a due_date which is not a date' do
    subject.due_date = 'a'
    expect(subject).to_not be_valid
  end

  it 'is not valid with a due_date which is in the past' do
    subject.due_date = '2000-01-01'
    expect(subject).to_not be_valid
  end
end
