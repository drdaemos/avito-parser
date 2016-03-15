class CreateItem < ActiveRecord::Migration
  def change
    create_table :items do |t|
    	t.string :url
    	
    	t.timestamps
    end
  end
end
