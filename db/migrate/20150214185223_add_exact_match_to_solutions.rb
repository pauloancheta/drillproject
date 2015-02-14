class AddExactMatchToSolutions < ActiveRecord::Migration
  def change
  	add_column :solutions, :exact_match, :boolean, default: true
  end
end
