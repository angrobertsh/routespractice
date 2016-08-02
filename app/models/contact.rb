class Contact < ActiveRecord::Base
  validates :name, :email, :user_id, presence: true
  validates :name, :presence => true, :uniqueness => {:scope => :email}

  belongs_to :owner,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  has_many :contact_shares

  has_many :shared_users,
    through: :contact_shares,
    source: :user

  has_many :comments, as: :person

end
