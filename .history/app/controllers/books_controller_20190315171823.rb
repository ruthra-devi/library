class BooksController < ApplicationController
    def new
      if !logged_in?
        flash[:danger] = "Login to contribute book"
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
        flash[:success] = "Successfully added a book"
        # ExampleMailer.contribute_book(@current_user,@book).deliver_later
        ContributeJob.set(wait: 1.minute).perform_later(@current_user,@book)
        redirect_to :controller => 'books', :action => 'index'
      else
        @book = Book.new(book_params)
        @book.qty = 1
        if @book.save
          flash[:success] = "Successfully added a book"
          @booksContribute = @book.books_contribute.create()
          @booksContribute.bname = @book.bname
          @booksContribute.contributors = current_user.id
          @booksContribute.save
          # ExampleMailer.contribute_book(@current_user,@book).deliver_later
          ContributeJob.set(wait: 1.minute).perform_later(@current_user,@book)
          
          redirect_to :index
         
        else
          render 'new'
        end
      end
    end
    def borrow
      if !logged_in?
        flash[:danger] = "Login to borrow book"
        redirect_to :controller => 'users', :action => 'new'    
      else
        @book = Book.find(params[:id])
        @booksBorrow = @book.books_borrow.create()
        @booksBorrow.bname = @book.bname
        @booksBorrow.sdate = DateTime.now
        @booksBorrow.edate = DateTime.now + 10
        @booksBorrow.borrowers = current_user.id
        BorrowJob.set(wait: 1.minute).perform_later(@current_user,@booksBorrow)
        ReturnJob.set(wait: 5.minutes).perform_later(@current_user,@booksBorrow)
        if @booksBorrow.save
          flash[:success] = "Successfully borroed a book!!"
        end
        @book.qty-=1
        @book.save
        redirect_to :controller => 'books', :action => 'index'
      end
    end      

    def index  
        @books = Book.paginate(:page => params[:page], per_page: 6)
      
    end
    def show
      if !logged_in?
        flash[:danger] = "Login to view"
        redirect_to :controller => 'users', :action => 'new'  
      else
        @book = Book.find(params[:id])
      end
    end

    def contributed
      
      @books_contributed = BooksContribute.where(:contributors => current_user.id)
    end
    
    private 
    def book_params
      params.require(:book).permit(:bname, :desc)
    end
end
