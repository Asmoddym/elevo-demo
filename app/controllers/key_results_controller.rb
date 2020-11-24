class KeyResultsController < ApplicationController
  def create
    objective = Objective.find(params['objective_id'])
    key_result = objective.key_results.create! name: "default key result"
    render json: { success: true, key_result: key_result }, status: 200
  end

  def update
    key_result = KeyResult.find(params['id'])
    key_result.update_attributes weight: params['weight'].to_i

    validator = WeightValidator.new(:key_results, key_result.objective).perform
    render json: { success: true, error_message: validator.has_failed? ? validator.get_error_message : nil }, status: 200
  end
end
