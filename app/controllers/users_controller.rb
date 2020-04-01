class UsersController < ApplicationController
  def login
    @user = User.new
  end

  def signup
    @user = User.new
  end
  
  def signin
    user = User.find_by(email: user_params[:email],
                        password: user_params[:password])
    if user
      session[:ccc9527] = user.email
    else
        redirect_to login_path
    end                      
  end

  def register
    # 新增使用者
    @user = User.new(user_params)
    if @user.save
      # 密碼加密
      # 幫登入
      session[:ccc9527] = @user.email
      redirect_to root_path
      else
      # 失敗，借signup的action的頁面來渲染
      render :signup 
    end           
  end
  def logout
    session[:ccc9527] = nil
    redirect_to root_path
  end


  private
  
  def user_params
    # Strong parameters 
    # params.require(:user) 
    # 等於 params[:user]
    params.require(:user).permit(:email, 
                                 :password, :password_confirmation)
  end
end