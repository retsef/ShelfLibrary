class Backend::PublishersController < Backend::BaseController
  before_action :create_publisher, only: [:create, :new]
  before_action :find_publisher, only: [:edit, :update, :destroy]

  def index
    @publishers = Publisher.all
  end

  def new

  end

  def create
    @publisher.update_attributes(publisher_params)
    if @publisher.save
      redirect_to backend_categories_path, notice: 'publisher created Successfully!'
    else
      render 'new'
    end
  end

  def edit

  end

  def update
    if @publisher.update_attributes(publisher_params)
      redirect_to backend_categories_path, notice: 'publisher edit Successfully!'
    else
      render 'edit'
    end
  end

  def destroy
    Publisher.delete(@publisher)
    redirect_to backend_categories_path, notice: 'publisher delete Successfully!'
  end

  private

  def find_publisher
    @publisher = Publisher.find(params[:id])
  end

  def create_publisher
    @publisher ||= Publisher.new
  end

  def publisher_params
    params.require(:publisher).permit(:name)
  end

end