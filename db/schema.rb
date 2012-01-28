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

ActiveRecord::Schema.define(:version => 20120115172325) do

  create_table "categories", :force => true do |t|
    t.string  "name"
    t.integer "parent_category_id"
    t.integer "creator_id"
  end

  add_index "categories", ["creator_id"], :name => "index_categories_on_creator_id"
  add_index "categories", ["parent_category_id"], :name => "index_categories_on_parent_category_id"

  create_table "object_categories", :force => true do |t|
    t.integer "categorisable_id"
    t.string  "categorisable_type"
    t.integer "category_id"
  end

  add_index "object_categories", ["categorisable_id", "categorisable_type"], :name => "index_object_categories_on_categorisable_name_and_type"
  add_index "object_categories", ["category_id"], :name => "index_object_categories_on_category_id"

  create_table "players", :force => true do |t|
    t.string  "name"
    t.integer "user_id"
  end

  create_table "questions", :force => true do |t|
    t.text     "data"
    t.string   "type"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "creator_id"
  end

  create_table "quiz_items", :force => true do |t|
    t.integer  "quiz_id"
    t.text     "data"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "quiz_items", ["quiz_id"], :name => "index_quiz_items_on_quiz_id"

  create_table "quiz_rounds", :force => true do |t|
    t.integer  "quiz_id"
    t.integer  "round_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "quiz_rounds", ["quiz_id", "round_id"], :name => "index_quiz_rounds_on_quiz_id_and_round_id"
  add_index "quiz_rounds", ["quiz_id"], :name => "index_quiz_rounds_on_quiz_id"
  add_index "quiz_rounds", ["round_id"], :name => "index_quiz_rounds_on_round_id"

  create_table "quizzes", :force => true do |t|
    t.string   "name"
    t.text     "data"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "creator_id"
    t.string   "type"
  end

  create_table "round_items", :force => true do |t|
    t.integer  "round_id"
    t.text     "data"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
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
    t.text     "data"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "creator_id"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                            :null => false
    t.datetime "updated_at",                                            :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
