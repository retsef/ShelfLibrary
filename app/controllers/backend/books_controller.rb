class Backend::BooksController < Backend::BaseController
  before_action :create_book, only: [:create, :new]
  before_action :find_book, only: [:edit, :update, :destroy]

  def index
    @books = Book.all
  end

  def new

  end

  def create
    @book.update_attributes(book_params)
    if @book.save
      redirect_to backend_books_path, notice: 'Book created Successfully!'
    else
      render 'new'
    end
  end

  def edit

  end

  def update
    if params[:get_sbn_book_info]


      options = {}
      conn = ZOOM::Connection.new(options).connect('opac.sbn.it', 2100)
      conn.database_name = 'nopac'
      conn.preferred_record_syntax = 'UNIMARC'
      rset = conn.search("@attr 1=7 #{params[:book][:isbn_code]}")

      @book.isbn_code = params[:book][:isbn_code]
      if rset.size > 0
        initialize_book(rset[0].xml)
        flash.now[:notice] = "The book with SBN: #{params[:book][:isbn_code]} is found"
      else
        flash.now[:notice] = "The book with SBN: #{params[:book][:isbn_code]} is not found"
      end

      render 'edit'

    elsif @book.update_attributes(book_params)
      @book.cover_from_url("http://covers.openlibrary.org/b/isbn/#{@book.isbn_code.dup.tr('-', '')}-M.jpg") if @book.cover.present?
      @book.save
      redirect_to backend_books_path, notice: 'Book edit Successfully!'
    else
      render 'edit'
    end
  end

  def destroy
    Book.delete(@book)
    redirect_to backend_books_path, notice: 'Book delete Successfully!'
  end

  private

  def find_book
    @book = Book.find(params[:id])
  end

  def create_book
    @book ||= Book.new
  end

  def initialize_book(xml)
    doc = Nokogiri::XML(xml)

    field_1 = doc.xpath('//*[@tag="200"]')
    @book.title = field_1.xpath('*[@code="a"]').text()
    @book.subtitle = field_1.xpath('*[@code="e"]').text()
  end

  def book_params
    params.require(:book).permit(:title, :subtitle, :description, :isbn_code, :collection_id, :cover, :author_ids => [])
  end

end