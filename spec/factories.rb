FactoryGirl.define do
  factory :grip do
    name 'cross-side lapel'
    sub_position
  end

  factory :instructional_video do
    url 'http://www.hip-scape.com/videos/this_video'
    title 'video title'
    description 'video description'
    major_category
    grip
    instructional_video_uploader

    trait :instructional_video_uploader do

    end
  end

  factory :major_category do
    name 'submission'
  end

  factory :position do
    name 'one up, one down'
    top true
  end

  factory :sub_position do
    name 'x-guard'
    position
  end

  factory :user do
    username 'username'
    password 'password'
    password_confirmation 'password'
    email 'test@gmail.com'
    first_name 'nate'
    last_name 'wroblewski'
    rank 'brown'
    gym 'fusion'
    about 'heel hooks etc'
    location 'san francisco'
  end
end
