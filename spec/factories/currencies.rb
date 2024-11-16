FactoryBot.define do
  factory :dollar do
    name { 'United States dollar' }
    code { 'USD' }
  end

  factory :euro do
    name { 'Euro' }
    code { 'EUR' }
  end

  factory :bitcoin do
    name { 'Bitcoin' }
    code { 'BTC' }
  end
end
