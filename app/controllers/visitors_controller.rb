class VisitorsController < ApplicationController
  def index
    @objectives = Objective.all
    @key_results = KeyResult.all
    set_error_messages
  end

  def set_error_messages
    @error_messages = {
      objectives: {},
      global: ''
    }
    set_global_error_message
    set_objectives_error_messages
  end

  private

  def set_global_error_message
    validator = WeightValidator.new(:objectives).perform
    @error_messages[:global] = validator.get_error_message if validator.has_failed?
  end

  def set_objectives_error_messages
    @objectives.each do |objective|
      validator = WeightValidator.new(:key_results, objective).perform
      @error_messages[:objectives][objective.id] = validator.has_failed? ? validator.get_error_message : nil
    end
  end

end
