class AstronautsController < ApplicationController
  def index
    @astronauts = Astronaut.all
    @average = Astronaut.average_age
  end
end
