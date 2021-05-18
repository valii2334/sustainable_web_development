class WidgetFromNewManufacturerCheckJob < ApplicationJob
  def perform(widget_id, original_manufacturer_created_at)
    WidgetCreator.new.widget_from_new_manufacturer_check(
      widget_id,
      Date.parse(original_manufacturer_created_at)
    )
  end
end
