class PagesController < ApplicationController
    def search
     
            @parameter = "%"+params[:search] + "%"
            @results = Book.all.where("lower(bname) LIKE :search", search: @parameter)   
       
    end             
end
