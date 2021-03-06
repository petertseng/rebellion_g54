require 'spec_helper'

require 'rebellion_g54/action/intellectual'

RSpec.describe RebellionG54::Action::Intellectual do
  let(:game) { example_game(2, coins: 7, roles: :intellectual) }
  let(:user) { game.choice_names.keys.first }
  let(:opponent) { game.users.last }

  context 'when being couped' do
    before(:each) { game.take_choice(user, 'coup', opponent) }

    it 'asks opponent for lose decision' do
      expect(game.choice_names).to be == { opponent => [
        'lose1', 'lose2', 'intellectual1', 'intellectual2'
      ]}
    end

    context 'when opponent uses intellectual1' do
      before(:each) { game.take_choice(opponent, 'intellectual1') }

      it 'asks me for challenge decision' do
        expect(game.choice_names).to be == { user => ['challenge', 'pass']}
      end

      context 'when I pass' do
        before(:each) { game.take_choice(user, 'pass') }

        it 'gives opponent 5 coins' do
          expect(game.user_coins(opponent)).to be == 12
        end

        it 'ends my turn' do
          expect(game.current_user).to_not be == user
        end
      end
    end
  end
end
