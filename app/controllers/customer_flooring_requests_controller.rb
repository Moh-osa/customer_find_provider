# frozen_string_literal: true

class CustomerFlooringRequestsController < ApplicationController
  def create
    return unless validate_material

    customer_request = CustomerFlooringRequest.new(customer_flooring_request_params)
    if customer_request.valid?
      customer_request.save!
      render json: customer_request.matching_providers
    else
      render json: { reason: customer_request.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  # https://github.com/rails/rails/issues/13971
  def validate_material
    return true if CustomerFlooringRequest.valid_material? customer_flooring_request_params[:material]

    render json: { reason: ["#{customer_flooring_request_params[:material]} is not a valid material"] },
           status: :unprocessable_entity
    false
  end

  def customer_flooring_request_params
    params.require(:customer_flooring_request).permit(:lat, :lng, :phone_number, :material, :square_meters)
  end
end
