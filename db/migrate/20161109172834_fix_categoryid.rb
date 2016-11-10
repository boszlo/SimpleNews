class FixCategoryid < ActiveRecord::Migration[5.0]
  def change
    change_table :articles do |t|
      t.rename :categoryid, :category_id
    end
  end
end
