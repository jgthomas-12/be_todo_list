require 'rails_helper'

RSpec.describe Task, type: :model do
  describe "validations" do
    it { should validate_presence_of :name}
    it { should validate_presence_of :description}
    it { should validate_inclusion_of(:completed).in_array([true, false])}
  end
end
