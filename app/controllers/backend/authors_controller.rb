class Backend::AuthorsController < Backend::BaseController
  before_action :create_author, only: [:create, :new]
  before_action :find_author, only: [:edit, :update, :destroy]

  def index
    @authors = Author.all
  end
0
  def new

  end

  def create
    @author.update_attributes(author_params)
    if @author.save
      redirect_to backend_authors_path, notice: 'author created Successfully!'
    else
      render 'new'
    end
  end

  def edit

  end

  def update
    if @author.update_attributes(author_params)
      redirect_to backend_authors_path, notice: 'author edit Successfully!'
    else
      render 'edit'
    end
  end

  def destroy
    Author.delete(@author)
    redirect_to backend_authors_path, notice: 'author delete Successfully!'
  end

  private

  def find_author
    @author = Author.find(params[:id])
  end

  def create_author
    @author ||= Author.new
  end

  def author_params
    params.require(:author).permit(:name, :surname)
  end

end