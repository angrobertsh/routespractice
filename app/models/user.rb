class User < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true

  has_many :contacts,
  dependent: :destroy

  has_many :contact_shares,
  dependent: :destroy

  has_many :shared_contacts,
    through: :contact_shares,
    source: :contact

  has_many :comments, as: :person

  has_many :authored_comments,
    primary_key: :id,
    foreign_key: :author_id,
    class_name: :Comment


end
