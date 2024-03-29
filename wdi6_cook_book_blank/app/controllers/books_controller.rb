class BooksController < ApplicationController

  before_filter :signed_in_user, only: [:create, :new, :edit, :update]
  
  def index
    @books = Book.all
  end
  def new
    @book = Book.new
  end
  def create
    @book = Book.create(params[:book])
    render :show
  end
  def show
    @book = Book.find(params[:id])
  end
  def edit
    @book = Book.find(params[:id])
  end
  def update
    @book = Book.find(params[:id])
    @book.update_attributes(params[:book])
    render :show
  end
  def destroy
    book = Book.find(params[:id])
    book.delete
    redirect_to(books_path)
  end
end
