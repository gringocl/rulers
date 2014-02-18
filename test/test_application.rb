require_relative "test_helper"

class TestApp < Rulers::Application
end

class RulersAppTest < Minitest::Test
  include Rack::Test::Methods

  def app
    TestApp.new
  end

  def test_request
    get "/"

    assert last_response.ok?
    body = last_response.body
    assert body["Hello"]
  end

  def test_status_response
    get "/"

    assert last_response.ok?
    status = last_response.status
    assert status[200]
  end

  def test_header_response
    get "/"

    assert last_response.ok?
    header = last_response.header
    assert header["Content-Type"] == 'text/html'
  end
end
