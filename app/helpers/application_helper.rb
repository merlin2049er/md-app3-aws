# frozen_string_literal: true

module ApplicationHelper
  def custom_bootstrap_flash
    flash_messages = []
    flash.each do |type, message|
      type = 'success' if type == 'notice'
      type = 'error' if type == 'alert'
      type = 'warning' if type == 'danger'
      type = 'info' if type == 'success'

      text = "toastr.#{type}('#{message}');"
      flash_messages << text.html_safe if message
    end
    flash_messages = flash_messages.join('\n')

    "<script>$(document).ready(function() { #{flash_messages} });</script>"
      .html_safe
  end
end
