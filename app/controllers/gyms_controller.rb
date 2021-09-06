class GymsController < ApplicationController
    wrap_parameters format: []

    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

    def index
        render json: Gym.all
    end

    def show
        render json: Gym.find_by!(id: params[:id])
    end

    def update
        gym = Gym.find_by(id: params[:id])
        gym.update!(gym_params)
        render json: gym, status: :accepted
    end

    def destroy
        gym = Gym.find_by!(id: params[:id])
        gym.destroy
        head :no_content
    end

    private

    def gym_params
        params.permit(:name, :address)
    end

    def render_unprocessable_entity_response(invalid)
        render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end

    def render_not_found_response(exception)
        render json: { error: "#{exception.model} not found" }, status: :not_found
    end

end
