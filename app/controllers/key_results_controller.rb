class KeyResultsController < ApplicationController
  def create
    objective = Objective.find(params['objective_id'])
    key_result = objective.key_results.create! name: "default key result"
    render json: { success: true, key_result: key_result }, status: 200
  end
end
