module Authenticable
  extend ActiveSupport::Concern

  def encode(payload)
    Base64.encode64(payload.to_json)
  end

  def decode(payload)
    Base64.decode64(payload.to_json)
  end
end
