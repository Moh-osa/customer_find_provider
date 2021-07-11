# frozen_string_literal: true

require 'test_helper'

class ProviderTest < ActiveSupport::TestCase
  setup do
    # 1.70 km away from 52.5087612, 13.3733575
    Provider.create(
      name: 'wood provider',
      lat: 52.512963,
      lng: 13.398775,
      operating_radius: 1650,
      average_rating: 4,
      provider_specialities: [ProviderSpeciality.create(category: 'flooring', material: 'wood')]
    )
    # 3.24 km away from 52.5087612, 13.3733575
    Provider.create(
      name: 'carpet provider',
      lat: 52.534632,
      lng: 13.396429,
      operating_radius: 3300,
      average_rating: 4,
      provider_specialities: [ProviderSpeciality.create(category: 'flooring', material: 'carpet')]
    )
  end

  test 'supports_category_and_material selects correct material' do
    results = Provider.supports_category_and_material('flooring', 'wood')
    assert_equal(1, results.size)
    assert_equal('wood provider', results[0].name)
  end

  test 'supports_category_and_material selects correct category' do
    results = Provider.supports_category_and_material('other', 'wood')
    assert_equal(0, results.size)
  end

  test 'within_operating_radius selects matching providers withing provider radius' do
    results = Provider.within_operating_radius(52.5087612, 13.3733575)
    assert_equal(1, results.size)
    assert_equal('carpet provider', results[0].name)
  end
end
