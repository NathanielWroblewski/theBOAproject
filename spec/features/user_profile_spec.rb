require 'spec_helper'

describe 'A logged-in user visiting their own profile' do
  it 'can see their profile information'

  it 'can edit their profile information'
end

describe 'A non-user visiting a profile page' do
  it 'gets bounced to the log-in page'
end

describe 'A logged-in user visiting another user profile' do
  it 'cannot edit the profile information'

  it 'can see their profile information'
end
