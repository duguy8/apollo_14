require "rails_helper"

RSpec.describe 'As a visitor' do
  describe "when I visit '/astronauts'" do
    before :each do
      @astro1 = Astronaut.create!(
        name: "Neil Armstrong",
        age: 37,
        job: "Commander"
      )
      @astro2 = Astronaut.create!(
        name: "Buzz Aldrin",
        age: 90,
        job: "Awesome Commander"
      )
      @astro3 = Astronaut.create!(
        name: "Zap Branagan",
        age: 50,
        job: "Schweet"
      )
      @mission1 = Mission.create!(
        title: "Good ol mission",
        time_in_space: 11
      )
      @mission2 = Mission.create!(
        title: "Sweet",
        time_in_space: 5
      )
      @mission3 = Mission.create!(
        title: "Bad one",
        time_in_space: 11
      )
      # @astro1.missions << @mission1
      @astro1.missions = [@mission1, @mission2]
      @astro2.missions = [@mission3, @mission2, @mission1]
      # require "pry"; binding.pry

    end

    it 'I see list of astronauts with attributes' do

      visit "/astronauts"

      within("#astronaut-#{@astro1.id}") do
        expect(page).to have_content(@astro1.name)
        expect(page).to have_content(@astro1.age)
        expect(page).to have_content(@astro1.job)
      end

      within("#astronaut-#{@astro2.id}") do
        expect(page).to have_content(@astro2.name)
        expect(page).to have_content(@astro2.age)
        expect(page).to have_content(@astro2.job)
      end

      within("#astronaut-#{@astro3.id}") do
        expect(page).to have_content(@astro3.name)
        expect(page).to have_content(@astro3.age)
        expect(page).to have_content(@astro3.job)
      end
    end

      it 'shows average age of all astronauts' do

        visit "/astronauts"
        expect(page).to have_content(Astronaut.average_age)
    end

      it 'Has all missions in alphabetical order for each astronaut' do

        visit "/astronauts"

        within("#astronaut-#{@astro2.id}") do
          expect(@mission3.title).to appear_before(@mission1.title)
          expect(@mission3.title).to appear_before(@mission2.title)
          expect(@mission1.title).to appear_before(@mission2.title)
        end
    end

    it 'Total time in space shown for each astronaut' do


      visit "/astronauts"

      within("#astronaut-#{@astro2.id}") do
        expect(@astro2.time_in_space).to eq(27)
        expect(page).to have_content(27)
      end
    end
  end
end
