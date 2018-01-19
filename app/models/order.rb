class Order < ApplicationRecord
  belongs_to :user
  has_many :order_details, dependent: :destroy
  accepts_nested_attributes_for :order_details
  before_save :default_values

  WAIT = 0
  ACCEPTED = 1
  SHIPPING = 2
  RECEIVED = 4

  def default_values
    self.status ||= WAIT
  end

  def wait?
  	self.status == WAIT
  end

  def accepted?
  	self.status == ACCEPTED
  end

  def shipping?
  	self.status == SHIPPING
  end

  def received?
  	self.status == RECEIVED
  end

  def isstatus
    if self.status == WAIT
      return (I18n.t "users.show.comfirm")
    elsif self.status == ACCEPTED
      return (I18n.t "users.show.accepted")
    elsif self.status == SHIPPING
      return (I18n.t "users.show.shipping")
    elsif self.status == RECEIVED
      return (I18n.t "users.show.received")
    end
  end
end
