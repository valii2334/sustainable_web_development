class WidgetsController < ApplicationController
  def new
    @widget = Widget.new
    @manufacturers = Manufacturer.all
  end

  def create
    @widget = Widget.create(
      name: params.require(:widget)[:name],
      price_cents: params.require(:widget)[:price_cents],
      manufacturer_id: params.require(:widget)[:manufacturer_id],
      widget_status: WidgetStatus.first
    )

    if @widget.valid?
      redirect_to widget_path(@widget)
    else
      @manufacturers = Manufacturer.all
      render :new
    end
  end

  def show
    @widget = Widget.find(params[:id])
  end

  def index
    @widgets = [
      OpenStruct.new(id: 1234, name: 'Stembolt'),
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
