-- VALIDAÇÃO 177
-- Autônomo com vinculo com a categoria_esocial diferente de 701

select hf.i_entidades,
       hf.i_funcionarios,
       hf.i_vinculos 
  from bethadba.hist_funcionarios hf 
  join bethadba.funcionarios f
    on hf.i_entidades = f.i_entidades
   and hf.i_funcionarios = f.i_funcionarios 
  join bethadba.vinculos v
    on hf.i_vinculos = v.i_vinculos
 where f.tipo_func = 'A' 
   and f.conselheiro_tutelar = 'N'
   and v.categoria_esocial not in ('701', '711', '741');


-- CORREÇÃO
-- Atualizar a categoria_esocial do vinculo para 701

UPDATE bethadba.funcionarios
   SET conselheiro_tutelar = 'S'
  FROM bethadba.funcionarios f
  JOIN bethadba.hist_funcionarios hf
    ON hf.i_entidades = f.i_entidades
   AND hf.i_funcionarios = f.i_funcionarios
  JOIN bethadba.vinculos v
    ON hf.i_vinculos = v.i_vinculos
 WHERE f.tipo_func = 'A'
   AND f.conselheiro_tutelar = 'N'
   AND hf.i_vinculos = 7
   AND v.categoria_esocial NOT IN ('701', '711', '741')