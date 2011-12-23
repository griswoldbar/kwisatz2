# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20111222220524) do

  create_table "questions", :force => true do |t|
    t.text     "data"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "quiz_items", :force => true do |t|
    t.integer  "quiz_id"
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "quiz_items", ["quiz_id"], :name => "index_quiz_items_on_quiz_id"

  create_table "quiz_rounds", :force => true do |t|
    t.integer  "quiz_id"
    t.integer  "round_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "quiz_rounds", ["quiz_id", "round_id"], :name => "index_quiz_rounds_on_quiz_id_and_round_id"
  add_index "quiz_rounds", ["quiz_id"], :name => "index_quiz_rounds_on_quiz_id"
  add_index "quiz_rounds", ["round_id"], :name => "index_quiz_rounds_on_round_id"

  create_table "quizzes", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "round_items", :force => true do |t|
    t.integer  "round_id"
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "round_items", ["round_id"], :name => "index_round_items_on_round_id"

  create_table "round_questions", :force => true do |t|
    t.integer "round_id"
    t.integer "question_id"
  end

  add_index "round_questions", ["question_id"], :name => "index_round_questions_on_question_id"
  add_index "round_questions", ["round_id", "question_id"], :name => "index_round_questions_on_round_id_and_question_id"
  add_index "round_questions", ["round_id"], :name => "index_round_questions_on_round_id"

  create_table "rounds", :force => true do |t|
    t.string   "name"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
