FactoryBot.define do
  factory :board do
    association   :user
    title         { 'aaaaaaa' }
    information   { 'aaaaaaa' }
    genre_id      { 2 }
  end
end
