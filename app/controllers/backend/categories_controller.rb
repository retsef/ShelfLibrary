class Backend::CategoriesController < Backend::BaseController
  before_action :create_category, only: [:create, :new]
  before_action :find_category, only: [:edit, :update, :destroy]

  def index
    @categories = Category.all
  end
0
  def new

  end

  def create
    @category.update_attributes(category_params)
    if @category.save
      redirect_to backend_categories_path, notice: 'category created Successfully!'
    else
      render 'new'
    end
  end

  def edit

  end

  def update
    if @category.update_attributes(category_params)
      redirect_to backend_categories_path, notice: 'category edit Successfully!'
    else
      render 'edit'
    end
  end

  def destroy
    Category.delete(@category)
    redirect_to backend_categories_path, notice: 'category delete Successfully!'
  end

  private

  def find_category
    @category = Category.find(params[:id])
  end

  def create_category
    @category ||= Category.new
  end

  def category_params
    params.require(:category).permit(:title)
  end

end