module BooksHelper
    def contributor?(book)
        @contributes = book.books_contribute
        cont = false
        @contributes.each do |c| 
            if (c.contributors == current_user.id)
                cont = true
                
            end
        end
        return cont
    end     
end
