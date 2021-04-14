class WidgetsController < ApplicationController
  def show
    manufacturer = OpenStruct.new(
      id: rand(100),
      name: 'Sector 7G',
      address: OpenStruct.new(
        id: rand(100),
        country: 'UK'
      )
    )

    @widget = OpenStruct.new(
      id: params[:id],
      manufacturer_id: manufacturer.id,
      manufacturer: manufacturer,
      name: "Widget #{params[:id]}"
    )
  end

  def index
    @widgets = [
      OpenStruct.new(id: 1, name: 'Stembolt'),
      OpenStruct.new(id: 2, name: 'Flux Capacitor')
    ]
  end

  def edit
    @widget = Widget.find(params[:id])
  end

  def update
    widget = Widget.find(params[:id])

    @widget = WidgetEditingService.new.edit_widget(
      widget, widget_params
    )

    if @widget.valid?
      redirect_to widgets_path
    else
      render :edit
    end
  end

  private

  def widget_params
    params.require(:widget).permit(:name, :status, :type)
  end
end
