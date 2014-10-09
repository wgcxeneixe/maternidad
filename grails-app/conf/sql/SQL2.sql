INSERT INTO sami.pais VALUES (1,0,'AR','ARG.',true,'Argentinos','Argentina');

INSERT INTO sami.provincia VALUES (1,0,'ER','Entre Rios',1);

INSERT INTO sami.localidad VALUES (1,0,'CDELU',true,'3260','Conccepcion del Uruguay',1);


INSERT INTO sami.tipo_documento VALUES (1,0,'DNI',true,'DNI','Doc. Nac. Identidad','Registro Civil','Doc. Nac. Identidad',1,1);

INSERT INTO sami.estado_civil VALUES (1,0,'Soltero');

INSERT INTO sami.persona VALUES (1,0,'Administrador','Piedras 13','3260',20666666666,'Villaguay',1,1,1,'Administrador',66666666,13,true,0,'SINRAZON',1);
select setval('sami.seq_persona', 2, true)
insert into sami.usuario values (1,0,false,false,true,'8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918',false,1,'admin');
select setval('sami.seq_usuario', 2, true)

insert into sami.concepto_caja values(1,0,true,'EFE','EFECTIVO','EFECTIVO');

insert into sami.obra_social values(1,0,true,'OS100',20282094712,'OS100',1,'');

insert into sami.plan values(1,0,true,'F100','F100',1,'');

insert into sami.usuario values(1,0,false,false,true,'',false,1,'admin')