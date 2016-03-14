class CategoriesController < ApplicationController
 before_action :require_admin, except: [:index, :show]
  def index
    @categories = Category.paginate(page: params[:page], per_page: 5)
  end
  
  def new
   @category = Category.new
  end
  
  def create
   @category = Category.new(category_params)
   if @category.save
    flash[:success] = "La categoria é stata creata con successo."
    redirect_to categories_path
   else
    render 'new'
   end
  end
  
  def show
   
  end
  
  private
  
  def set_article
    @category = Category.find(params[:id])
  end
  
  def category_params
   params.require(:category).permit(:name)
  end
  
  def require_admin
   if !logged_in? || (logged_in? and !current_user.admin?)
    flash[:danger] ="Solo l'amministratore può compire questa azione"
    redirect_to categories_path
   end
  end
end