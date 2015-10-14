require 'spec_helper'

RSpec.describe User do
  let(:user) { build(:user) }

  it 'can be created' do
    expect(user).to_not be_nil
  end

  it 'must have a name' do
    user.name = ""
    expect(user.save).to be false
  end

  it 'must have an email address' do
    user.email = ""
    expect(user.save).to be false
  end

  it 'must have a password' do
    user.password = ""
    expect(user.save).to be false
  end

  it 'must have a password at least 6 characters long' do
    user.password = 'to'
    user.name = "testname"
    user.email = "user@example.com"
    expect(user).to_not be_valid
  end

  describe 'email address' do
    let(:user_second) { build(:user) }

    it 'has a valid email' do
      addresses = %w[scos@example.com test@example.ca]
      addresses.each do |email|
        user_second.email = email
        expect(user_second).to be_valid
      end
    end

    it 'has an invalid email' do
      addresses = %w[test.com spam.spam]
      addresses.each do |email|
        user_second.email = email
        expect(user_second).to_not be_valid
      end
    end
  end

  describe 'when email is already used' do
    let(:user_second) { build(:user) }

    it 'should not be saved' do
      expect(user_second.save).to be false
    end
  end
end
