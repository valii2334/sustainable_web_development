class WidgetsController < ApplicationController
  def new
    @widget = Widget.new
    @manufacturers = Manufacturer.all
  end

  def create
    render plain: 'Thanks!'
  end

  def show
    manufacturer = OpenStruct.new(
      id: rand(100),
      name: 'Sector 7G',
      address: OpenStruct.new(
        id: rand(100),
        country: 'UK'
      )
    )

    widget_name = if params[:id].to_i == 1234
                    'Stembolt'
                  else
                    "Widget #{params[:id]}"
                  end

    @widget = OpenStruct.new(
      id: params[:id],
      manufacturer_id: manufacturer.id,
      manufacturer: manufacturer,
      name: widget_name
    )

    def @widget.widget_id
      if self.id.to_s.length < 3
        self.id.to_s
      else
        self.id.to_s[0..-3] + '.' + self.id.to_s[-2..-1]
      end
    end
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
