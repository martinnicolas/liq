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

ActiveRecord::Schema.define(:version => 20140626154217) do

  create_table "agente_cargos", :force => true do |t|
    t.date     "fecha"
    t.string   "estado"
    t.string   "descripcion"
    t.integer  "agente_id"
    t.integer  "cargo_id"
    t.integer  "establecimiento_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "agentes", :force => true do |t|
    t.integer  "dni"
    t.string   "apellido"
    t.string   "nombre"
    t.string   "cuit_cuil"
    t.date     "fecha_ingreso"
    t.integer  "localidad_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "cargos", :force => true do |t|
    t.string   "categoria"
    t.string   "tipo_cargo"
    t.string   "nivel"
    t.string   "descripcion"
    t.float    "puntos"
    t.float    "indice"
    t.float    "hscargo"
    t.string   "doble"
    t.string   "hbase"
    t.float    "testigo"
    t.float    "basico"
    t.string   "hstexto"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "conceptos", :force => true do |t|
    t.string   "codigo"
    t.string   "nombre"
    t.string   "calculo_cargos"
    t.string   "calculo_horas_media"
    t.string   "calculo_horas_superior"
    t.string   "requerido"
    t.string   "carga_manual"
    t.string   "ayuda"
    t.string   "activado_x_defecto"
    t.string   "tipo"
    t.string   "tipo_liquidacion"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
  end

  create_table "establecimientos", :force => true do |t|
    t.integer  "numero"
    t.string   "nombre"
    t.string   "direccion"
    t.integer  "cue"
    t.integer  "localidad_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "liquidacions", :force => true do |t|
    t.date     "fecha"
    t.string   "tipo_liquidacion"
    t.integer  "dias_trabajados"
    t.integer  "agente_cargo_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "localidads", :force => true do |t|
    t.string   "nombre"
    t.string   "region"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "planta", :force => true do |t|
    t.date     "fecha_creacion"
    t.string   "estado"
    t.integer  "cargo_id"
    t.string   "descripcion"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

end
