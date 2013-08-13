require 'spec_helper'

describe InstructionalVideo, 'associations' do
  it { expect(subject).to belong_to(:grip) }
  it { expect(subject).to belong_to(:major_category) }
end
