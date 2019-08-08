require 'rails_helper'

RSpec.describe Like, type: :model do

  let(:like) {build(:like)}
  let(:like2) {build(:like_two)}

  context "validations"do
    it 'ensures like is not save without user' do
      like.user_id = nil
      expect(like.valid?).to eq(false)
    end
  end


end
