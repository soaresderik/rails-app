require 'test_helper'

def json_response
  ActiveSupport::JSON.decode @response.body
end

class HostControllerTest < ActionDispatch::IntegrationTest
  test "should get index and return 1 record" do
    get '/api/host'
    assert_response :success
    assert_instance_of Array, json_response
  end

  test "should create a new record" do
    post '/api/host', params: {
      "dns_records": {
      "ip": "1.1.1.1",
      "hostnames": [
          "lorem.com",
          "caram.com",
          "ipsum.com"
       ]
      }
    }
    assert_response :success

    assert_instance_of Integer, json_response
  end

  test "should throw a validation error" do
    post '/api/host', params: {
      "dns_records": {
      "hostname": [
        "lorem.com",
        ]
      }
    }
    assert_response 400
    assert_equal "Should have at least one hostname", json_response["error"]
  end
end
