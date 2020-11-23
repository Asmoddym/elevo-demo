class VisitorsController < ApplicationController
  def index
    @objectives = Objective.all
    @key_results = KeyResult.all
  end
end
