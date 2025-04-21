require 'faker'
require 'cpf_cnpj'

Faker::Config.locale = 'pt-BR'

User.create!(email: 'teste@teste.com', password: '123456')

Applicant.all.destroy_all

20.times do
  Applicant.create!(
    name: Faker::Name.name,
    cpf: CPF.generate(true),
    birth_date: Faker::Date.birthday(min_age: 18, max_age: 65),
    street: Faker::Address.street_name,
    number: Faker::Address.building_number,
    neighborhood: Faker::Address.community,
    city: Faker::Address.city,
    state: Faker::Address.state_abbr,
    zip_code: Faker::Address.postcode,
    personal_phone: Faker::PhoneNumber.cell_phone, # ou cell_phone_in_e164 se preferir com +55
    reference_phone: Faker::PhoneNumber.phone_number,
    salary: Faker::Number.between(from: 0, to: 6101.06).round(2),
    inss_discount: Faker::Number.decimal(l_digits: 2, r_digits: 2)
  )
end
