require 'spec_helper'

describe Position, 'associations' do
  it { expect(subject).to have_many(:sub_positions) }
  it { expect(subject).to have_many(:grips) }
  it { expect(subject).to validate_presence_of(:name)}
end
