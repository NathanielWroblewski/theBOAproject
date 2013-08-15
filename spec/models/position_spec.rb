require 'spec_helper'

describe Position, 'associations' do
  it { expect(subject).to have_many(:sub_positions) }
  it { expect(subject).to have_many(:grips) }
end

describe Position, 'validations' do
  it { expect(subject).to validate_presence_of(:name) }
end
