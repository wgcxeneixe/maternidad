

INSERT INTO rol VALUES (3, 0, 'ROLE_CAJA');
INSERT INTO rol VALUES (4, 0, 'ROLE_FACTURACION');
INSERT INTO rol VALUES (5, 0, 'ROLE_LIQUIDACION');
INSERT INTO rol VALUES (7, 0, 'ROLE_PLANILLA');
INSERT INTO rol VALUES (8, 0, 'ROLE_STOCK');
INSERT INTO rol VALUES (9, 0, 'ROLE_GENERAL');
INSERT INTO rol VALUES (6, 0, 'ROLE_CONVENIO');




INSERT INTO usuario VALUES (3, 0, false, false, true, 'bb193a7368d0ae052c6e9fceb8c25facf5125f1958ad8ff9fd9c70b5634b5d6d', false, 'Mariela');
INSERT INTO usuario VALUES (4, 0, false, false, true, '96d9673d5b381e2069368cea3aa95ece4bb989ffc36d0703c0c6f9dba3b8ca05', false, 'Fernanda');
INSERT INTO usuario VALUES (5, 0, false, false, true, 'ee6aa9381e07c60412e8bca2932326f413828ccabca7b96380b4170f7e704605', false, 'Adriana');
INSERT INTO usuario VALUES (6, 0, false, false, true, '2d5668b34a81c73f9341f063c169855700fac8f8b9571d891f09692648e54ac8', false, 'Caja');




INSERT INTO usuario_rol VALUES (3, 6);
INSERT INTO usuario_rol VALUES (9, 6);
INSERT INTO usuario_rol VALUES (7, 6);
INSERT INTO usuario_rol VALUES (4, 3);
INSERT INTO usuario_rol VALUES (5, 3);
INSERT INTO usuario_rol VALUES (6, 3);
INSERT INTO usuario_rol VALUES (7, 3);
INSERT INTO usuario_rol VALUES (8, 3);
INSERT INTO usuario_rol VALUES (9, 3);
INSERT INTO usuario_rol VALUES (3, 4);
INSERT INTO usuario_rol VALUES (4, 4);
INSERT INTO usuario_rol VALUES (5, 4);
INSERT INTO usuario_rol VALUES (6, 4);
INSERT INTO usuario_rol VALUES (7, 4);
INSERT INTO usuario_rol VALUES (8, 4);
INSERT INTO usuario_rol VALUES (9, 4);
INSERT INTO usuario_rol VALUES (4, 5);
INSERT INTO usuario_rol VALUES (5, 5);
INSERT INTO usuario_rol VALUES (6, 5);
INSERT INTO usuario_rol VALUES (7, 5);
INSERT INTO usuario_rol VALUES (8, 5);
INSERT INTO usuario_rol VALUES (9, 5);