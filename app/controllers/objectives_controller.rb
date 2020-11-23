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
end
