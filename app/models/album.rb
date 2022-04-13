class Album < ApplicationRecord
    has_many :photos, class_name: 'Photo', foreign_key: 'album_id'
end
