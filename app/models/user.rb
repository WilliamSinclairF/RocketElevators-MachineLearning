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

  def self.company_name
    if self.company.name? "#{self.company_name}"

    else
      ' '
    end
  end

  def self.search(search)
    where(
      'lower(users.first_name) LIKE :search OR lower(users.last_name) LIKE :search',
      search: "%#{search}%"
    ).uniq
  end
end
