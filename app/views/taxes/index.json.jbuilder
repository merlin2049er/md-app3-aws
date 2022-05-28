# frozen_string_literal: true

json.array! @taxes, partial: 'taxes/tax', as: :tax
