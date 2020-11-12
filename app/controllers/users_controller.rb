class UsersController < ApplicationController

  before_action :authenticate_user, {only: [:index, :show, :edit, :update]}
  before_action :forbid_login_user, {only: [:new, :create, :login_form, :login]}
  before_action :ensure_correct_user, {only: [:edit, :update]}


  def index
    @users = User.where(is_trainer: true)


      if params[:prefecture].present?
         @users = @users.where(prefecture: params[:prefecture])
 p "=================="
 p @users
 p "==================="

      end

      if params[:sex].present?
         @users = @users.where(sex: params[:sex])
      end


  end

  def show
    @user = User.find_by(id: params[:id])



  end

  def new
    @user = User.new
  end

  def create

    @user = User.new(
      name: params[:name],
      sex: params[:sex],
      email: params[:email],
      image_name: "fashion-985556_1920.jpg",
      password: params[:password]
    )
    if params[:trainer] == "true"
     @user.is_trainer = true
     print params
   end


    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "ユーザー登録が完了しました"
      redirect_to("/users/#{@user.id}")
    else
      render("users/new")
    end

  end

  def edit
    @user = User.find_by(id: params[:id])

  end

  def update
     @user = User.find_by(id: params[:id])
    @user.name = params[:name]
    @user.email = params[:email]

    if params[:image]
      @user.image_name = "#{@user.id}.jpg"
      image = params[:image]
      File.binwrite("public/user_images/#{@user.image_name}", image.read)
    end
    if @user.is_trainer
       @user.prefecture = params[:prefecture]

    end
    if @user.is_trainer
       @user.mainegym = params[:mainegym]
    end
    if @user.is_trainer
       @user.profile = params[:profile]

    end

    if @user.save
      flash[:notice] = "ユーザー情報を編集しました"
      redirect_to("/users/#{@user.id}")
    else
      render("users/edit")
    end
  end

  def login_from
  end


  def login
    @user = User.find_by(email: params[:email])
    if @user && @user.valid_password?(params[:password])
      session[:user_id] = @user.id
      flash[:notice] = "ログインしました"
      redirect_to("/posts/index")
    else
      @error_message = "メールアドレスまたはパスワードが間違っています"
      @email = params[:email]
      @password = params[:password]
      render("users/login_form")

    end
  end

  def auth_failure
    @user = User.new
    render("users/login_form")
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = "ログアウトしました"
    redirect_to("/login")
  end

  def ensure_correct_user
    if @current_user.id != params[:id].to_i
      flash[:notice] = "権限がありません"
      redirect_to("/posts/index")
    end
  end


end
