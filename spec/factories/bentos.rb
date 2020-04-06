FactoryBot.define do
  factory :bento do
    name { 'test bento' }
    description { 'RSpec & Capybara & FactoryBot を準備する' }
    shop    
  end
end
