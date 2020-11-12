module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :session_id
  end

  def connect
    self.session_id = request.session.id
  end
end
