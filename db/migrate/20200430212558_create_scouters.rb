class CreateScouters < ActiveRecord::Migration[6.0]
  def change
    create_table :scouters do |t|
      t.string :team
      t.string :player1
      t.string :player2
      t.string :player3
      t.string :player4
      t.string :player5

      t.timestamps
    end
  end
end
