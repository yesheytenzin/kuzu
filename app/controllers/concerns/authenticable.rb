module Authenticable
  extend ActiveSupport::Concern

  def encode(payload)
    headers = {
        "typ" => "JWT",
        "alg" => "HS256"
    }
    headers_base64 = Base64.urlsafe_encode64(headers.to_json, padding: false)
    payload_base64 = Base64.urlsafe_encode64(payload.to_json, padding: false)
    signature = OpenSSL::HMAC.digest("SHA256", "MY_KEY", headers_base64 + "." + payload_base64)
    signature_base64 = Base64.urlsafe_encode64(signature, padding: false)

    headers_base64 + "." + payload_base64 + "." + signature_base64
  end

  def decode(token)
    headers, claims = token.split(".")
    headers_decoded = JSON.parse(Base64.urlsafe_decode64(headers))
    claims_decoded = JSON.parse(Base64.urlsafe_decode64(claims))

    [ claims_decoded, headers_decoded ]
  end

  def current_user
    token = request.authorization.to_s.split(" ").last
    User.find_by(id: decode(token)[0]["user_id"])
  end
end
