class Product < ApplicationRecord
  belongs_to :category
  has_many :order_details
  has_many :reviews
  has_many :images
  has_many :carts
  has_many :comments, dependent: :destroy
  mount_uploader :image, ImagesUploader

  validates :name, presence: true
  validate :image_size

  scope :search_by_name, (lambda do |name|
    where('name LIKE ? OR price LIKE ?', "%#{name}%", "%#{name}%") unless name.nil?
  end)

  scope :order_desc, -> {order created_at: :desc}

  private

  def image_size
    if image.size > 5.megabytes
      errors.add(:image, "should be less than 5MB")
    end
  end
end
