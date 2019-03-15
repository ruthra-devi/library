class BooksController < ApplicationController
    def new
      if !logged_in?
        redirect_to :controller => 'users', :action =>'new'
      end
        @book = Book.new
        
    end
    def create
      if Book.exists?(:bname =>  params[:book][:bname])
        @book = Book.find_by_bname(params[:book][:bname])
        @book.qty+=1
        @book.save
        @booksContribute = @book.books_contribute.create()
        @booksContribute.bname = @book.bname
        @booksContribute.contributors = current_user.id
        @booksContribute.save
        ExampleMailer.contribute_book(@current_user,@book).deliver
        redirect_to @book
      else
        @book = Book.new(book_params)
        @book.qty = 1
        if @book.save
          flash[:success] = "Successfully added a book"
          @booksContribute = @book.books_contribute.create()
          @booksContribute.bname = @book.bname
          @booksContribute.contributors = current_user.id
          @booksContribute.save
          ExampleMailer.contribute_book(@current_user,@book).deliver_now
          redirect_to @book
        else
          render 'new'
        end
        
      end
    end
    def borrow
      if !logged_in?
        redirect_to :controller => 'users', :action => 'new'
      else
        @book = Book.find(params[:id])
        @booksBorrow = @book.books_borrow.create()
        # @book = @author.books.create(published_at: Time.now)

        @booksBorrow.bname = @book.bname
        @booksBorrow.sdate = DateTime.now
        @booksBorrow.edate = DateTime.now + 10
        @booksBorrow.borrowers = current_user.id
        ExampleMailer.delay_until(3.days.from_now).borrow_book(@current_user,@booksBorrow)
      
        if @booksBorrow.save
          flash[:success] = "Successfully borroed a book!!"
        end
        @book.qty-=1
        @book.save
        
      end
    end      

    def index
      if logged_in?
        @books = Book.paginate(:page => params[:page], per_page: 6)
      else
        redirect_to :controller => 'users', :action =>'new'
      end 
    end
    def show
      @book = Book.find(params[:id])
    end
    
    private 
    def book_params
      params.require(:book).permit(:bname, :desc)
    end
end
