require './lib/game_score'

RSpec.describe GameScore do
    let(:valid_record) {
        {line: 'xxxxxxxxxxxx', total_score: 300}
    }
    let(:invalid_record) {
        {line: 'fdsj584bfd'}
    }

    describe 'calculate' do
        context 'when valid bowling line' do
            it 'returns correct value' do
                expect(GameScore.calculate(valid_record[:line])).to eql(valid_record[:total_score])
            end
        end
        context 'when invalid bowling line' do
            it 'raises GameScoreError error ' do
                expect { GameScore.calculate(invalid_record[:line]) }.to raise_error(GameScoreError, 'Value can not be calculated!')
            end
        end
    end
end
