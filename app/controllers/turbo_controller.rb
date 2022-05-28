class TurboController < ApplicationController

class Responder < ActionController::Responder

  def to_turbo_stream
    controller.render(options.merge(formats: :html))
    resue ActionView::MissingTemplate => error
     if get?
       raise error
    elseif has_errors? && default_action
       render rendering_options.merge(formats: :html, status: :unprocessable_entity)
     else
       redirect_to navigation_location
    end

  end
end

self.responder = Responder
respond_to :html, :turbo_streams

end
