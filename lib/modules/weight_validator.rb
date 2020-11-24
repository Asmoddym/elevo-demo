class WeightValidator
  def initialize(indicator, objective = nil)
    case indicator
    when :objectives
      @items = Objective.all
      @error_message_indicator = 'objectives'
    when :key_results
      @items = objective.key_results
      @error_message_indicator = 'key_results'
    end
  end

  def perform
    check_items
    self
  end

  def has_failed?
    !@status
  end

  def get_error_message
    I18n.t("#{@error_message_indicator}.weight_error.#{@error}", { sum: @weight_sum })
  end

  private

  def check_items
    return true if no_weight_present?

    @weight_sum = calculate_total_sum
    @error = check_sum
    @status = @error.nil?

    @status
  end

  def no_weight_present?
    @items.where('weight IS NOT NULL OR weight != 0').count == 0
  end

  def check_sum
    if @weight_sum > 100
      return 'too_many_weight'
    elsif @weight_sum < 100
      return 'too_few_weight'
    else
      return nil
    end
  end

  def calculate_total_sum
    sum = 0
    @items.each do |item|
      sum += item.weight if !item.weight.nil?
    end
    sum
  end
end
