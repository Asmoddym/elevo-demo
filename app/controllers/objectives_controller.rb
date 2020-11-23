class ObjectivesController < ApplicationController
  def create
    objective = Objective.create! name: "default name"
    render json: { success: true, objective: objective }, status: 200
  end
end
