class PressRelease < ApplicationRecord
  belongs_to :publisher
  has_one :organization, through: :publisher
  belongs_to :author, class_name: "User", foreign_key: "user_id"

  enum status: { draft: 0, published: 1, archived: 2 }
end
