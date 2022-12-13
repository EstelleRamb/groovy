class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @vinyl = Vinyl.find_by(title: "Doggystyle")
    @vinylTwo = Vinyl.find_by(title: "Ben")
    @vinylThree = Vinyl.find_by(title: "Queen")
    @vinylFour = Vinyl.find_by(title: "Des Bises De Moi Pour Toi (From Me To You)")
    @vinylFive = Vinyl.find_by(title: "L'Aventurier")
    @vinylSix = Vinyl.find_by(title: "I Don't Wanna Cry")
    @vinylSeven = Vinyl.find_by(title: "Everybody Join Hands / Ain't No Sunshine")
    @vinylEight = Vinyl.find_by(title: "Dizzidence Politik")
    @vinylNine = Vinyl.find_by(title: "Maria (You Were The Only One)")
    @vinylTen = Vinyl.find_by(title: "So High")
    @vinylEleven = Vinyl.find_by(title: "Purrr!")
    @vinylTwelve = Vinyl.find_by(title: "Mount Curve Avenue")
  end
end
