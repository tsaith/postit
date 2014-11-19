class DropTableCrazyMonkeys < ActiveRecord::Migration
  def change
    drop_table :crazy_monkeys
  end
end
