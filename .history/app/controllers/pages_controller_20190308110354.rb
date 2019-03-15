class PagesController < ApplicationController
    def search
        if params[:search].blank?  
            redirect_to(root_path, alert: "Empty field!") and return  
        end
    end  
end
