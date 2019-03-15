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
        # ExampleMailer.contribute_book(@current_user,@book).deliver_later
        ContributeJob.set(wait: 1.minute).perform_later(@current_user,@book)
        redirect_to :controller => 'books', :action => 'index'
      else
        @book = Book.new(book_params)
        @book.qty = 1
        if @book.save
          render plain:flash[:alert] = "Successfully added a book"
          @booksContribute = @book.books_contribute.create()
          @booksContribute.bname = @book.bname
          @booksContribute.contributors = current_user.id
          @booksContribute.save
          # ExampleMailer.contribute_book(@current_user,@book).deliver_later
          ContributeJob.set(wait: 1.minute).perform_later(@current_user,@book)
          redirect_to 'index' , :flash => { :success => "Message" }
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
       
        BorrowJob.set(wait: 1.minute).perform_later(@current_user,@booksBorrow)
        ReturnJob.set(wait: 5.minutes).perform_later(@current_user,@booksBorrow)
        if @booksBorrow.save
          flash[:alert] = "Successfully borroed a book!!"
        end
        @book.qty-=1
        @book.save
        redirect_to :controller => 'books', :action => 'index'
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
