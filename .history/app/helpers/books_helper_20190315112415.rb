module BooksHelper
    def contributor?(book)
        @contributes = book.books_contribute
        cont = true
        @contributes.each do |c| 
            if (c.contributors == current_user.id)
                cont = false
                render plain: cont
            end
        end
        return cont
    end     
end
