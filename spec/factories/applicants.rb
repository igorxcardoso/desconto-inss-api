require 'cpf_cnpj'
Faker::Config.locale = 'pt-BR'

FactoryBot.define do
  factory :applicant do
    name             { Faker::Name.name }
    cpf              { CPF.generate(true) } # você pode usar a gem 'faker-cpf' se quiser
    birth_date       { Faker::Date.birthday(min_age: 18, max_age: 65) }
    street           { Faker::Address.street_name }
    number           { Faker::Address.building_number }
    neighborhood     { Faker::Address.community }
    city             { Faker::Address.city }
    state            { Faker::Address.state_abbr }
    zip_code         { Faker::Address.zip_code }
    personal_phone   { Faker::PhoneNumber.cell_phone }
    reference_phone  { Faker::PhoneNumber.phone_number }
    salary           { Faker::Number.between(from: 0, to: 6101.06).round(2) }
    inss_discount    { Faker::Number.decimal(l_digits: 3, r_digits: 2) }
  end
end
