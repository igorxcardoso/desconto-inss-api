json.extract! applicant, :id, :name, :cpf, :birth_date, :street, :number, :neighborhood, :city, :state, :zip_code, :personal_phone, :reference_phone, :salary, :created_at, :updated_at
json.url applicant_url(applicant, format: :json)
