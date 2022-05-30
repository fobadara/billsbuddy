require 'rails_helper'

RSpec.describe Group, type: :model do
  subject { Group.new(name: 'Test Group', icon: 'fa-user') }

  before { subject.save }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without an icon' do
    subject.icon = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid with a duplicate name' do
    subject2 = Group.new(name: subject.name, icon: 'fa-user')
    expect(subject2).to_not be_valid
  end

  it 'is not valid with a duplicate name regardless of case' do
    subject2 = Group.new(name: subject.name.upcase, icon: 'fa-user')
    expect(subject2).to_not be_valid
  end

  it 'is not valid with a name greater than 50 characters' do
    subject.name = 'a' * 51
    expect(subject).to_not be_valid
  end

  it 'is not valid with an icon greater than 50 characters' do
    subject.icon = 'a' * 51
    expect(subject).to_not be_valid
  end

  it 'is not valid with an invalid icon' do
    subject.icon = 'invalid_icon'
    expect(subject).to_not be_valid
  end

  it 'is not valid with an icon that is not a font-awesome icon' do
    subject.icon = 'fa-invalid'
    expect(subject).to_not be_valid
  end

  it 'is not valid with an icon that is not a font-awesome icon regardless of case' do
    subject.icon = 'FA-invalid'
    expect(subject).to_not be_valid
  end
end
