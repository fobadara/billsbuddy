require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(id: '50', name: 'Test User', email: 'abc@mail.com', password: '123abcf#') }

  before { subject.save }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without an email' do
    subject.email = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a password' do
    subject.password = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid with a duplicate email address' do
    subject2 = User.new(name: 'Test User 2', email: subject.email, password: '123456')
    expect(subject2).to_not be_valid
  end

  it 'is not valid with a duplicate email address regardless of case' do
    subject2 = User.new(name: 'Test User 2', email: subject.email.upcase, password: '123456')
    expect(subject2).to_not be_valid
  end

  it 'is not valid with a password less than 6 characters' do
    subject.password = '12345'
    expect(subject).to_not be_valid
  end

  it 'is not valid with a password greater than 20 characters' do
    subject.password = '123456789012345678901'
    expect(subject).to_not be_valid
  end

  it 'is not valid with a name greater than 50 characters' do
    subject.name = 'a' * 51
    expect(subject).to_not be_valid
  end

  it 'is not valid with an email greater than 255 characters' do
    subject.email = "#{'a' * 244}@example.com"
    expect(subject).to_not be_valid
  end

  it 'is not valid with an invalid email address' do
    subject.email = 'invalid_email'
    expect(subject).to_not be_valid
  end

  it 'is not valid with an invalid email address regardless of case' do
    subject.email = 'invalid_email'.upcase
    expect(subject).to_not be_valid
  end

  it 'is not valid with an invalid password' do
    subject.password = '123'
    expect(subject).to_not be_valid
  end

  it 'is not valid with an invalid password regardless of case' do
    subject.password = '123'.upcase
    expect(subject).to_not be_valid
  end

  it 'is not valid with a password containing only numbers' do
    subject.password = '123456'
    expect(subject).to_not be_valid
  end

  it 'is not valid with a password containing only letters' do
    subject.password = 'abcdef'
    expect(subject).to_not be_valid
  end

  it 'is not valid with a password containing only special characters' do
    subject.password = '!@#$%^&*()'
    expect(subject).to_not be_valid
  end

  it 'is not valid with a password containing only numbers and special characters' do
    subject.password = '123!@#$%^&*()'
    expect(subject).to_not be_valid
  end

  it 'is not valid with a password containing only letters and special characters' do
    subject.password = 'abc!@#$%^&*()'
    expect(subject).to_not be_valid
  end

  it 'is not valid with a password containing only numbers and letters' do
    subject.password = 'abc123'
    expect(subject).to_not be_valid
  end

  it 'is not valid with a password containing only letters and numbers' do
    subject.password = '123abc'
    expect(subject).to_not be_valid
  end
end
