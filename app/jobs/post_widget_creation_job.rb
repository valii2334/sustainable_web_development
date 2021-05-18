class PostWidgetCreationJob < ApplicationJob
  def perform(widget_id)
    widget = Widget.find(widget_id)
    WidgetCreator.new.post_widget_creation_job(widget)
  end
end
