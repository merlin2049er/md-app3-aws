# frozen_string_literal: true

class TodoList < ApplicationRecord
  validates_presence_of :title
  validates_presence_of :description
end
