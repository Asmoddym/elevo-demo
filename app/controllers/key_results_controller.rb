class KeyResultsController < ApplicationController
  def create
    objective = Objective.find(params['objective_id'])
    key_result = objective.key_results.create! name: "default key result"
    render json: { success: true, key_result: key_result }, status: 200
  end

  def update
    key_result = KeyResult.find(params['id'])
    key_result.update_attributes weight: params['weight'].to_i
    render json: { success: true }, status: 200
  end
end
