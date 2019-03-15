class PagesController < ApplicationController
    def search
        if params[:search].blank?  
 
        else  
            @parameter = params[:search].downcase  
            @results = Book.all.where("lower(bname) LIKE :search", search: @parameter)   
        end
    end             
end
