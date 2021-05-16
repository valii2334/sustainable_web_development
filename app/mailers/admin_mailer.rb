class AdminMailer < ApplicationMailer
  def edited_widget(widget)
    @widget = widget
  end

  def edited_widget_for_supervisor(widget)
    @widget = widget
  end

  def new_widget_from_new_manufacturer(widget)
    @widget = widget

    mail to: 'admin@example.com'
  end
end
