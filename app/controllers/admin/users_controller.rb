class Admin::UsersController < Admin::BaseController
    skip_before_filter :authenticate,only: [:new,:create]
    def new 
        @user = User.new
    end
    def create
        @user = User.new(user_params)
        if @user.save
            sign_in @user
            redirect_to admin_indexes_path
        else render 'new'
        end
    end
    def index
          @user = User.find(params[:id])
        @user.destroy
        redirect_to admin_indexs_path
   
        
    end
    def show
        @user = User.find(params[:id])
        @user.destroy
        redirect_to admin_indexs_path
    
    end
    private
    
     def user_params
         params.require(:user).permit(:email, :nickname, :password, :password_confirmation)
     end
end
