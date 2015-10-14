TestelevenHomepage::App.controllers :users do
  get :new, :map => '/contact' do
    @user = User.new
    render 'new'
  end

  post :create do
    @user = User.new(params[:user])

    if @user.save
      deliver(:signup, :signup_email, @user.name, @user.email)
      redirect ('/')
    else
      render 'new'
    end
  end
end
