# frozen_string_literal: true

Rails.application.routes.draw do
  resource :customer_flooring_requests, only: [:create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
