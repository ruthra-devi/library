module BooksHelper
    def contributor?(book)
        @contributes = book.books_contribute
        cont = true
        @contributes.each do |c| 
            if (c.contributors == current_user.id)
                cont = false
            end
        end
        return cont
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
          @booksBorrow.save
          @book.qty-=1
          @book.save
          
          flash[:success] = "Successfully borrowed a book"
        end
      end      
end
