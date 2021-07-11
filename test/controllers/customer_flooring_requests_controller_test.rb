# frozen_string_literal: true

require 'test_helper'

class CustomerFlooringRequestsControllerTest < ActionDispatch::IntegrationTest
  test 'accepts valid parameters and return matching providers' do
    Provider.create(
      name: 'wood provider',
      lat: 52.524642,
      lng: 13.404618,
      operating_radius: 5000,
      average_rating: 4,
      provider_specialities: [ProviderSpeciality.create(category: 'flooring', material: 'wood')]
    )

    assert_difference -> { CustomerFlooringRequest.count } do
      post customer_flooring_requests_path, params: {
        customer_flooring_request: {
          "lat": 52.524642,
          "lng": 13.404618,
          "phone_number": '+494545415415',
          "material": 'wood',
          "square_meters": 20
        }
      }
    end

    assert_response :success
    response_body = JSON.parse(response.body)
    assert_equal(1, response_body.size)
    assert_equal('wood provider', response_body[0]['name'])
    assert_equal('52.524642', response_body[0]['lat'])
    assert_equal('13.404618', response_body[0]['lng'])
    assert_equal(4.0, response_body[0]['average_rating'])
    assert_nil(response_body[0]['operating_radius'])
    assert_nil(response_body[0]['created_at'])
    assert_nil(response_body[0]['updated_at'])
  end

  test 'returns validation error if params were not correct' do
    post customer_flooring_requests_path, params: {
      customer_flooring_request: {
        "lat": 52.524642,
        "lng": 13.404618,
        "phone_number": '+494545415415',
        "material": 'wod',
        "square_meters": 20
      }
    }
    assert_response(422)

    response_body = JSON.parse(response.body)
    assert_equal({ 'reason' => ['wod is not a valid material'] }, response_body)
  end
end
