class GameScore
    def self.calculate(rolls)
        begin
            frame = 0.0
            i = 0
            sum = 0

            rolls.downcase!
            scores = to_num_arr(rolls)

            while frame < 10 do
                case rolls[i]
                when '/'
                    sum+= scores[i] + scores[i-1]
                    frame+=0.5
                when 'x'
                    sum+= scores[i] + scores[i+1] + scores[i+2]
                    frame+=1
                else
                    sum+=scores[i]
                    frame+=0.5
                end
                i+=1
            end
            sum
        rescue
            raise GameScoreError
        end
    end

    def self.to_num_arr(str)
        scores = (str.gsub!(/\s+/, "") || str).split('')
        scores.each_with_index do |s, i|
            case s
            when '/'
                scores[i] = 10 - scores[i-1].to_i
            when 'x'
                scores[i] = 10
            else
                scores[i] = scores[i].to_i
            end
        end
        scores
    end

    private_class_method :to_num_arr
end

class GameScoreError < StandardError
def initialize(msg='Value can not be calculated!')
    super
  end
end
