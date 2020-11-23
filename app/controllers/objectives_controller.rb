class ObjectivesController < ApplicationController
  def create
    objective = Objective.create! name: "default name"
    render json: { success: true, objective: objective }, status: 200
  end

  def destroy
    objective = Objective.find(params['id'])
    objective.destroy
    render json: { success: true }, status: 200
  end

  def update
    objective = Objective.find(params['id'])
    objective.update_attributes weight: params['weight'].to_i
    render json: { success: true }, status: 200
  end
end
