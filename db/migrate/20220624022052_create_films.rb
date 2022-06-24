class CreateFilms < ActiveRecord::Migration[6.1]
  def change
    create_table :films do |t|
      t.string:film_title
      t.string:introduction
      t.text:body
      t.float:evaluation, null: false
      t.integer:user_id
      t.timestamps
    end
  end
end