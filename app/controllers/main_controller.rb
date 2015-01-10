class MainController < ApplicationController
  def index
    @science = {computer_scientiest: "Информационные технологии", math: "Математика", physics: "Физика"}
    @array2 = { computer_scientiest: ["программирование", "кибернетика", "Грид",], math: ["интегрирование", "производная"]}
    gon.array1 = @array1
    gon.array2 = @array2
  end

end
