require 'rails_helper'

describe AstronautMission, type: :model do
  describe 'Relationships' do
    it { should belong_to :mission}
    it { should belong_to :astronaut}
  end
end
