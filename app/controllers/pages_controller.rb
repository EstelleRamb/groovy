class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @vinyl = Vinyl.find_by(title: "The Dark side of the moon")
    @vinylTwo = Vinyl.find_by(title: "A Night At The Opera")
    @vinylThree = Vinyl.find_by(title: "Queen II")
    @vinylFour = Vinyl.find_by(title: "Kind of blue")
    @vinylFive = Vinyl.find_by(title: "Round about Midnight")
    @vinylSix = Vinyl.find_by(title: "Fantaisie Militaire")
    @vinylSeven = Vinyl.find_by(title: "Abbey road")
    @vinylEight = Vinyl.find_by(title: "Rodeo")
    @vinylNine = Vinyl.find_by(title: "Good kid, M.A.A.D city")
    @vinylTen = Vinyl.find_by(title: "Ten")
    @vinylEleven = Vinyl.find_by(title: "Comme d'habitude")
    @vinylTwelve = Vinyl.find_by(title: "To pimp a butterfly")
  end
end
