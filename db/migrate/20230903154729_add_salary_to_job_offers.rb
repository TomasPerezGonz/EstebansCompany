class AddSalaryToJobOffers < ActiveRecord::Migration[7.0]
  def change
    add_column :job_offers, :salary, :integer
  end
end
