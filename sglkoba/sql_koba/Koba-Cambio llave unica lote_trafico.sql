--
ALTER TABLE movimiento.lote_trafico DROP CONSTRAINT uq_lote_trafico;

ALTER TABLE movimiento.lote_trafico
  ADD CONSTRAINT uq_lote_trafico UNIQUE(ltraflote, ltrafnumtrafico, ltrafproducto);
