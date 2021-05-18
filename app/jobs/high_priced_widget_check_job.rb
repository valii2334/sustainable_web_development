class HighPricedWidgetCheckJob < ApplicationJob
  def perform(widget_id, original_price_cents)
    WidgetCreator.new.high_priced_widget_check(
      widget_id, original_price_cents
    )
  end
end
