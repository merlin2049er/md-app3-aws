# frozen_string_literal: true

json.array! @blacklists, partial: 'blacklists/blacklist', as: :blacklist
