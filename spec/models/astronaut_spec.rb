require 'rails_helper'

describe Astronaut, type: :model do
  describe 'Validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :age }
    it { should validate_presence_of :job }
  end

  describe 'Relationships' do
    it { should have_many :astronaut_missions}
    it { should have_many :missions}
  end

  describe 'Class Methods' do
    it 'can average the age' do
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
      expect(Astronaut.average_age).to eq(59)
    end
  end
end
