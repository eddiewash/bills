class ContactForm
  include ActiveModel::Validations
  include ActiveModel::Conversion
  
  attr_accessor :name, :email, :body
  validates_presence_of :name, :email, :body
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, format: { with: VALID_EMAIL_REGEX }
  
  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end
  
  def persisted?
    false
  end
  
end