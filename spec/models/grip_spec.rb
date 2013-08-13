require 'spec_helper'

describe Grip, 'associations' do
  it { expect(subject).to belong_to(:sub_position) }
  it { expect(subject).to have_many(:instructional_videos) }
  it { expect(subject).to have_many(:major_categories) }
end
