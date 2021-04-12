class AdminMailer < ApplicationMailer
  def edited_widget(widget)
    @widget = widget
  end

  def edited_widget_for_supervisor(widget)
    @widget = widget
  end
end
