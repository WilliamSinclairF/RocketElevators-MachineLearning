class User < ActiveRecord::Base # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable # Include default devise modules. Others available are:
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable

  has_many :quotes
  has_many :leads
  has_one :customer
  has_one :employee

  validates_uniqueness_of :email
  validates_presence_of :email

  mount_uploader :greeting_message, AttachmentUploader

  def custom_label_method
    "#{first_name} #{last_name}"
  end
end
