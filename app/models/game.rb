class Game < ApplicationRecord
    after_create :calculate_total_score
    validates :line, presence: true

    private

    def calculate_total_score
        # score = begin
            score = GameScore.calculate(self.line)
        # rescue StandardError
            # nil
        # end
        self.update_column(:total_score, score)
    end
end
