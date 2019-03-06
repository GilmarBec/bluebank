class Route < ApplicationRecord
  has_many :office_relating, dependent: :destroy
end
