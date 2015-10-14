class AddMessageFieldToUsers < ActiveRecord::Migration

  @fields = [:message]

  def self.up
    change_table :users do |t|
      @fields.each { |field| t.text field }
    end
  end

  def self.down
    change_table :users do |t|
      @fields.each { |field| remove_column field }
    end
  end
end
