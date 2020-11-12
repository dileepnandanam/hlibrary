class BookChannel < ApplicationCable::Channel
  def subscribed
    stream_from "book"
  end
end
