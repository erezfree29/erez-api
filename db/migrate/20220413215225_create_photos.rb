# frozen_string_literal: true

class CreatePhotos < ActiveRecord::Migration[5.1]
  def change
    create_table :photos do |t|
      t.string :name

      t.timestamps
    end
  end
end
