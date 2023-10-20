# frozen_string_literal: true

module RequestSpecHelper
  def json
    body = JSON.parse(response.body)

    body.try(:with_indifferent_access) || body
  end

  def common_headers
    {
      'Content-Type' => 'application/json',
      'Accept' => 'application/json'
    }
  end
end
