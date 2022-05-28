# frozen_string_literal: true

class Notification < ApplicationRecord
  belongs_to :user

  validates_presence_of :user_id
  validates_presence_of :notify_msg
end
