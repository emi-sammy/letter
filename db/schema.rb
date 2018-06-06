ActiveRecord::Schema.define(version: 20180530151418) do


  enable_extension "plpgsql"

  create_table "letters", force: :cascade do |t|
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
