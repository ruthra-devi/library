class PagesController < ApplicationController
    def search
        if params[:search].blank?  
            redirect_to('/index', alert: "Empty field!") and return  
        end
    end             
end
