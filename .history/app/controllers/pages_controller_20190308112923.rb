class PagesController < ApplicationController
    def search
     
            @parameter = params[:search].downcase  
            @results = Book.all.where("lower(bname) LIKE :search", search: @parameter)   
       
    end             
end
