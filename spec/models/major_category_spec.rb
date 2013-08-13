require 'spec_helper'

describe MajorCategory, 'associations' do
  it { expect(subject).to have_many(:instructional_videos) }
end
