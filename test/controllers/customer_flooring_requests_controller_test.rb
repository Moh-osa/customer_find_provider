# frozen_string_literal: true

require 'test_helper'

class CustomerFlooringRequestsControllerTest < ActionDispatch::IntegrationTest
  test 'should get create' do
    post customer_flooring_requests_create_url
    assert_response :success
  end
end
