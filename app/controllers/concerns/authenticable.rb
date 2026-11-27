module Authenticable
  extend ActiveSupport::Concern

  def encode(payload)
    headers = {
        "typ" => "JWT",
        "alg" => "HS256"
    }
    headers_base64 = Base64.urlsafe_encode64(headers.to_json, padding: false)
    payload_base64 = Base64.urlsafe_encode64(payload.to_json, padding: false)
    signature = OpenSSL::HMAC.digest("SHA256", Rails.application.credentials.secret_key_base, headers_base64 + "." + payload_base64)
    signature_base64 = Base64.urlsafe_encode64(signature, padding: false)

    headers_base64 + "." + payload_base64 + "." + signature_base64
  end

  def decode(token)
    unless signature_check?(token)
      render json: { error: "invalid signature", status: :unauthorized }
      # puts "invalid"
      return
    end

    headers, claims = token.split(".")
    headers_decoded = JSON.parse(Base64.urlsafe_decode64(headers))
    claims_decoded = JSON.parse(Base64.urlsafe_decode64(claims))

    [ claims_decoded, headers_decoded ]
  end

  def current_user
    token = request.authorization.to_s.split(" ").last
    User.find_by(id: decode(token)[0]["user_id"])
  end

  def signature_check?(token)
    headers_base64, payload_base64 = token.split(".")
    valid_signature = OpenSSL::HMAC.digest("SHA256", Rails.application.credentials.secret_key_base, headers_base64 + "." + payload_base64)

    actual = Base64.urlsafe_encode64(valid_signature, padding: false)
    recieved_signature = token.split(".").last

    OpenSSL.secure_compare(actual, recieved_signature)
  end
end
