TestelevenHomepage::App.controllers :page do

  get :about, :map => '/about' do
    render 'about'
  end

  get :home, :map => '/' do
    render 'home'
  end

  get :new_website, :map => '/new-website' do
    render 'new_website'
  end

  get :wordpress, :map => '/new-website/wordpress' do
    render 'wordpress'
  end

  get :static_site, :map => '/new-websites/static-site' do
    render 'static_site'
  end

  get :website_repair, :map => '/website-repair' do
    render 'website_repair'
  end

  get :mobile_conversion, :map => '/mobile-conversion' do
    render 'mobile_conversion'
  end

  get :discourse, :map => '/discourse' do
    render 'discourse'
  end
end
