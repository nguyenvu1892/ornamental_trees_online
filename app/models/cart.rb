class Cart < ApplicationRecord
  belongs_to :product

  scope :new_cart, -> session_id {
    where(session_id: session_id)
  }
end
