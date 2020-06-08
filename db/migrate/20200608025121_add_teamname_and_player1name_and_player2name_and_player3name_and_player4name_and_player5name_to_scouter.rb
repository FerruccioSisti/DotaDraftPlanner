class AddTeamnameAndPlayer1nameAndPlayer2nameAndPlayer3nameAndPlayer4nameAndPlayer5nameToScouter < ActiveRecord::Migration[6.0]
  def change
    add_column :scouters, :teamname, :string
    add_column :scouters, :player1name, :string
    add_column :scouters, :player2name, :string
    add_column :scouters, :player3name, :string
    add_column :scouters, :player4name, :string
    add_column :scouters, :player5name, :string
  end
end
