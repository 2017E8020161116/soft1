class Admin::IndexsController < Admin::BaseController
    
    def index
        
         @user = User.all
        
      
    end
    def new
        @user=User.new
        
    end
    
    
    
    def destroy
        @user = User.find(params[:id])
        @user.destroy
         redirect_to admin_user_path
    
    end
    
    private
    
     def user_params
         params.require(:user).permit(:email, :nickname, :password, :password_confirmation)
     end
    
end