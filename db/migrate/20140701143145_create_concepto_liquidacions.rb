class CreateConceptoLiquidacions < ActiveRecord::Migration
  def change
    create_table :concepto_liquidacions do |t|
      t.integer :liquidacion_id
      t.integer :concepto_id
      t.string :formula_calculo
      t.string :calculo
      t.float :valor_calculado

      t.timestamps
    end
  end
end
