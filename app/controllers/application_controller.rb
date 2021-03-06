class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

    def article_params
    	params.require(:article).permit(:title, :text, :tag_list)
  	end

end
