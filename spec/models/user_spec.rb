require 'spec_helper'

describe User, 'validations' do
  it { expect(subject).to validate_presence_of(:password) }
  it { expect(subject).to validate_presence_of(:username) }
  it { expect(subject).to validate_presence_of(:email) }
end
