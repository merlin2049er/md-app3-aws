# frozen_string_literal: true

ValidatesTimeliness.setup do |config|
  # Extend ORM/ODMs for full support (:active_record included).
  config.extend_orms = %i[active_record] # config.parser.remove_us_formats
end
