# frozen_string_literal: true

class Faq < ApplicationRecord
  validates_presence_of :question
  validates_presence_of :answer
end
