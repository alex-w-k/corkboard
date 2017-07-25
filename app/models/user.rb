class User < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :zipcode, presence: true
  validates :email, presence: true, uniqueness: true
  validates :phone_number, presence: true
  validates :country_code, presence: true
  has_secure_password validations: false

  has_many :user_roles, dependent: :destroy
  has_many :roles, through: :user_roles
  has_many :requested_projects, :class_name => 'Project', :foreign_key => 'requester_id'

  has_many :messages

  def self.from_omniauth(auth_info)
    user = where(uid: auth_info[:uid]).first_or_initialize do |new_user|
      new_user.uid = auth_info.uid
    end
  end

  def update_uid(uid)
    update_attribute(:uid, uid)
  end

  def is_valid_code?(code)
    verification_code == code
  end

 def self.locate_by(data, oauth=false)
  oauth ? find_or_initialize_by(uid: data["uid"]) : find_by(email: data)
 end

 def full_name
   "#{first_name} #{last_name}"
 end
end
