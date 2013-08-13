require 'spec_helper'

describe SubPosition, 'associations' do
  it { expect(subject).to belong_to(:position) }
  it { expect(subject).to have_many(:grips) }
  it { expect(subject).to validate_presence_of(:name) }
  it { expect(subject).to validate_presence_of(:position_id) }
end
