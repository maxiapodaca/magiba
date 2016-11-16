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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20161115184324) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cards", force: :cascade do |t|
    t.integer  "numero"
    t.integer  "anio_vencimiento"
    t.integer  "mes_vencimiento"
    t.string   "nombre_prop"
    t.string   "apellido_prop"
    t.string   "dni_titular"
    t.string   "cod_seguridad"
    t.integer  "user_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "comments", force: :cascade do |t|
    t.string   "user_id"
    t.string   "favor_id"
    t.string   "detalle"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "compras", force: :cascade do |t|
    t.integer  "cantidad_de_puntos"
    t.integer  "precio_de_compra"
    t.integer  "user_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "favors", force: :cascade do |t|
    t.string   "titulo"
    t.string   "descripcion"
    t.string   "localidad"
    t.string   "imagen",          default: "http://fotos.subefotos.com/c4472a12d1a15e9517d1cd0862cdfd23o.png"
    t.string   "fecha_caducidad"
    t.string   "id_ganador"
    t.datetime "created_at",                                                                                   null: false
    t.datetime "updated_at",                                                                                   null: false
  end

  create_table "logros", force: :cascade do |t|
    t.string   "nombre"
    t.text     "descripcion"
    t.boolean  "marca"
    t.integer  "limite_inferior_rango"
    t.integer  "limite_superior_rango"
    t.string   "campo"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "postulacions", force: :cascade do |t|
    t.integer  "id_favor"
    t.integer  "id_userfav"
    t.string   "fecha"
    t.string   "descripcion"
    t.boolean  "es_ganador"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.integer  "logro_id"
    t.string   "name"
    t.boolean  "admin",                  default: false
    t.string   "apellido"
    t.string   "dni",                    default: "",    null: false
    t.string   "localidad",              default: "",    null: false
    t.string   "telefono"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
