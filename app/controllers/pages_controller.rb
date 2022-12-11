class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @vinyl = Vinyl.find_by(title: "Doggystyle")
    @vinylTwo = Vinyl.find_by(title: "Ben")
    @vinylThree = Vinyl.find_by(title: "Queen")
    @vinylFour = Vinyl.find_by(title: "Des Bises De Moi Pour Toi (From Me To You)")
  end
end
