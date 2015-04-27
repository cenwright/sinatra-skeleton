 class AddForeignKeys < ActiveRecord::Migration
    def change
        change_table :albums do |t|
            t.references :user
            
        end
        change_table :reviews do |t|
            t.references :user
            t.references :album
        end
     
    end
end