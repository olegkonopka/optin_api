class OptIn < ActiveRecord::Base
  validates :email, :mobile, :first_name, :last_name,
            :permission_type, :channel, :company_name, presence: true
  validates :permission_type, inclusion: { in: %w(one-time permanent) }
  validates :channel, inclusion: { in: %w(sms email sms+email) }
  VALID_EMAIL = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, uniqueness: true, format: { with: VALID_EMAIL }
  VALID_PHONE_NUMBER = /\(\d{3}\)\d{3}-\d{2}-\d{2}\z/
  validates :mobile, uniqueness: true, format: { with: VALID_PHONE_NUMBER }
  validates :company_name, uniqueness: { scope: :channel }
  
  def disable!
    update_attributes permission_type: "one-time"
  end

  def active?
    permission_type == "permanent"
  end
end