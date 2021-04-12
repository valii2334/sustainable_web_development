class WidgetEditingService
  def edit_widget(widget, widget_params)
    widget.update(widget_params)

    if widget.valid?
      # create the InventoryReport
      # check the manufacturer to see who to notify
      # trigger the AdminMailer to notify whoever
      # should be notified

      EditWidgetJob.perform_later(widget.id)
    end

    widget
  end

  def post_widget_edit(widget)
    # Create the inventory report
    # check the manufacturer to see who to notify
    # trygger the AdminMailer to notify whoever
    # should be notified
  end
end
