class CreateApplicants < ActiveRecord::Migration[7.2]
  def change
    create_table :applicants do |t|
      t.string :name
      t.string :cpf
      t.date :birth_date
      t.string :street
      t.string :number
      t.string :neighborhood
      t.string :city
      t.string :state
      t.string :zip_code
      t.string :personal_phone
      t.string :reference_phone
      t.decimal :salary

      t.timestamps
    end
  end
end
