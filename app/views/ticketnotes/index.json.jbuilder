# frozen_string_literal: true

json.array! @ticketnotes, partial: 'ticketnotes/ticketnote', as: :ticketnote
