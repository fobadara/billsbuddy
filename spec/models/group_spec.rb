require 'rails_helper'

RSpec.describe Group, type: :model do
  valid_image = Rack::Test::UploadedFile.new("#{Rails.root}/app/assets/images/test-logo.png")
  user = User.create(id: '1', name: 'John', email: 'john@mail.com', password: 'password')
  subject { Group.new(id: '1', name: 'Test Group', user_id: user.id, image: valid_image) }

  before { subject.save }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without an image' do
    subject.image = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid with a name greater than 50 characters' do
    subject.name = 'a' * 51
    expect(subject).to_not be_valid
  end

  it 'is not valid with an invalid image' do
    subject.image = Rack::Test::UploadedFile.new("#{Rails.root}/app/assets/images/wrong.svg")
    expect(subject).to_not be_valid
  end
end
