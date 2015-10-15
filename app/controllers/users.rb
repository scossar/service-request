TestelevenHomepage::App.controllers :users do
  get :new, :map => '/contact' do
    @user = User.new
    render 'new'
  end

  post :create do
    @user = User.new(params[:user])

    # Discourse stuff
    errors = process_user(params[:user])

    if errors
      puts 'THERE ARE ERRORS'
      errors.each do |error|
      puts error
    end
    end


    if @user.save
      deliver(:signup, :signup_email, @user.name, @user.email)
      redirect ('/')
    else
      render 'new'
    end
  end
end
