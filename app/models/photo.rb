# frozen_string_literal: true

class Photo < ApplicationRecord
  belongs_to :album
end
