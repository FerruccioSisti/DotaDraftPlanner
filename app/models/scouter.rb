class GoodnessValidator < ActiveModel::Validator
  def validate(record)
    if record.team == "" && record.player1 == "" && record.player2 == "" && record.player3 == "" && record.player4 == "" && record.player5 == ""
      record.errors[:base] << "Do not submit a blank form please"
    end
  end
end

class Scouter < ApplicationRecord
    # validates :player1, :presence => true
    validates_with GoodnessValidator
    self.per_page = 20
end
