class MembershipsController < ApplicationController
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

  def create
    render json: Membership.create!(membership_params)
  end

  private

  def membership_params
    params.permit(:gym_id, :client_id, :charge)
  end

  def render_unprocessable_entity_response(exception)
    render json: { error: exception.record.errors.full_messages }, status: :unprocessable_entity
  end
end
