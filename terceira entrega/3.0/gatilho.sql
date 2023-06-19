-- Criação da função de gatilho
CREATE OR REPLACE FUNCTION atualizar_quantidade_produto()
  RETURNS TRIGGER AS
$BODY$
BEGIN
  -- Atualiza a quantidade do produto após a venda
  UPDATE produtos
  SET quantidade = quantidade - NEW.qtd
  WHERE id = NEW.produto_id;

  RETURN NEW;
END;
$BODY$
LANGUAGE plpgsql;

-- Criação do gatilho
CREATE TRIGGER trg_atualizar_quantidade_produto
AFTER INSERT ON vendas_produtos
FOR EACH ROW
EXECUTE FUNCTION atualizar_quantidade_produto();