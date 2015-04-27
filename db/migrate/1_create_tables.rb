class CreateTables < ActiveRecord::Migration

    def change
        create_table :users do |t|
            t.string :firstname
            t.string :lastname
            t.string :username
            t.string :email
            t.string :password
            t.timestamps
        end

        create_table :albums do |t|
            t.string :title
            t.string :artist
            t.integer :year
            t.timestamps
        end

        create_table :reviews do |t|
            t.string :username
            t.string :album
            t.integer :rating
            t.string :opinion
            t.timestamps
        end
      

    end

end