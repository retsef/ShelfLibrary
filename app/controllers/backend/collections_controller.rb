class Backend::CollectionsController < Backend::BaseController
  before_action :create_collection, only: [:create, :new]
  before_action :find_collection, only: [:edit, :update, :destroy]

  def index
    @collections = Collection.all
  end

  def new

  end

  def create
    @collection.update_attributes(collection_params)
    if @collection.save
      redirect_to backend_collections_path, notice: 'collection created Successfully!'
    else
      render 'new'
    end
  end

  def edit

  end

  def update
    if @collection.update_attributes(collection_params)
      redirect_to backend_collections_path, notice: 'collection edit Successfully!'
    else
      render 'edit'
    end
  end

  def destroy
    Collection.delete(@collection)
    redirect_to backend_collections_path, notice: 'collection delete Successfully!'
  end

  private

  def find_collection
    @collection = Collection.find(params[:id])
  end

  def create_collection
    @collection ||= Collection.new
  end

  def collection_params
    params.require(:collection).permit(:title)
  end

end