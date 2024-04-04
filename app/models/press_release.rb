class PressRelease < ApplicationRecord
  belongs_to :author, class_name: "User", foreign_key: "user_id"
  belongs_to :publisher
end
