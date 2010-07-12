# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100712014619) do

  create_table "country_groups", :force => true do |t|
    t.string  "country"
    t.integer "group_id"
  end

  create_table "customers", :force => true do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "phone"
    t.string "street_address"
    t.string "zip_code"
    t.string "state"
    t.string "country"
    t.string "city"
    t.string "shipping_method"
  end

  create_table "domains", :force => true do |t|
    t.string   "name"
    t.string   "title"
    t.string   "description"
    t.string   "keywords"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "elements", :force => true do |t|
    t.string   "name"
    t.integer  "position"
    t.string   "ancestry"
    t.integer  "ancestry_depth",  :default => 0
    t.integer  "attachable_id"
    t.string   "attachable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "galleries", :force => true do |t|
    t.string   "title"
    t.string   "description"
    t.string   "layout_name"
    t.text     "custom_layout_content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "locations", :force => true do |t|
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.string   "postal_code"
    t.string   "country"
    t.integer  "locationable_id"
    t.string   "locationable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", :force => true do |t|
    t.integer "transaction_id"
    t.integer "product_id"
    t.integer "quantity"
  end

  create_table "pages", :force => true do |t|
    t.string   "title"
    t.string   "description"
    t.string   "keywords"
    t.boolean  "show_share_links",      :default => true
    t.string   "layout_name"
    t.text     "custom_layout_content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "paragraphs", :force => true do |t|
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pictures", :force => true do |t|
    t.string   "title"
    t.string   "description"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", :force => true do |t|
    t.integer  "shop_id"
    t.string   "name"
    t.string   "title"
    t.string   "description"
    t.date     "expiration_date"
    t.string   "image_link"
    t.string   "link"
    t.string   "location"
    t.string   "payment_accepted"
    t.string   "payment_notes"
    t.boolean  "pickup"
    t.integer  "price"
    t.string   "price_type"
    t.string   "quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", :force => true do |t|
    t.string   "title"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shipping_rates", :force => true do |t|
    t.float   "from_weight"
    t.float   "to_weight"
    t.string  "method"
    t.float   "rate"
    t.integer "country_group"
  end

  create_table "shopping_transaction_statuses", :force => true do |t|
    t.string "status"
    t.string "description"
  end

  create_table "shopping_transactions", :force => true do |t|
    t.datetime "date"
    t.integer  "status_transaction_id"
    t.integer  "total"
    t.integer  "customer_id"
  end

  create_table "shops", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "taggable_type"
    t.string   "context"
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type", "context"], :name => "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", :force => true do |t|
    t.string "name"
  end

  create_table "tax_rates", :force => true do |t|
    t.float  "rate"
    t.string "state"
    t.string "country"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                               :default => "", :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "", :null => false
    t.string   "password_salt",                       :default => "", :null => false
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
