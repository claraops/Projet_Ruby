class AddNbrePasToWeightEntries < ActiveRecord::Migration[7.2]
  def change
    add_column :weight_entries, :nbre_pas, :integer
  end
end
