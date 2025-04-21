class AddInssDiscountToApplicants < ActiveRecord::Migration[7.2]
  def change
    add_column :applicants, :inss_discount, :float
  end
end
