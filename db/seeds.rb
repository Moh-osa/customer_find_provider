# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Provider.create(
  name: 'wood provider',
  lat: 52.524642,
  lng: 13.404618,
  operating_radius: 5000,
  average_rating: 4,
  provider_specialities: [ProviderSpeciality.create(category: 'flooring', material: 'wood')]
)

Provider.create(
  name: 'carpet provider',
  lat: 52.524642,
  lng: 13.404618,
  operating_radius: 4000,
  average_rating: 4.5,
  provider_specialities: [ProviderSpeciality.create(category: 'flooring', material: 'carpet')]
)
Provider.create(
  name: 'tiles provider',
  lat: 52.524642,
  lng: 13.404618,
  operating_radius: 3500,
  average_rating: 3.5,
  provider_specialities: [ProviderSpeciality.create(category: 'flooring', material: 'tiles')]
)
Provider.create(
  name: 'everything provider',
  lat: 52.524642,
  lng: 13.404618,
  operating_radius: 2000,
  average_rating: 4.6,
  provider_specialities: [
    ProviderSpeciality.create(category: 'flooring', material: 'wood'),
    ProviderSpeciality.create(category: 'flooring', material: 'carpet'),
    ProviderSpeciality.create(category: 'flooring', material: 'tiles')
  ]
)
