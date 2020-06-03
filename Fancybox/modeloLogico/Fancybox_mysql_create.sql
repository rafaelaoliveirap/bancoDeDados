CREATE TABLE `usuario` (
	`cpf` INT NOT NULL UNIQUE,
	`nome` varchar(15) NOT NULL,
	`id_usuario` INT NOT NULL AUTO_INCREMENT,
	`sobrenome` varchar(60) NOT NULL,
	`email` varchar(120) NOT NULL,
	`senha` varchar(15) NOT NULL,
	`logradouro` varchar(200) NOT NULL,
	`estado` varchar(40) NOT NULL,
	`cidade` varchar(60) NOT NULL,
	`bairro` varchar(60) NOT NULL,
	`complemento` varchar(60) NOT NULL,
	`cep` INT(8) NOT NULL,
	PRIMARY KEY (`id_usuario`)
);

CREATE TABLE `ong` (
	`nome` varchar(120) NOT NULL,
	`id_ong` INT NOT NULL AUTO_INCREMENT,
	`cnpj` INT(14) NOT NULL UNIQUE,
	`valorDoado` FLOAT NOT NULL,
	PRIMARY KEY (`id_ong`)
);

CREATE TABLE `doacao` (
	`id_cliente` INT NOT NULL AUTO_INCREMENT,
	`id_ong` INT NOT NULL
);

CREATE TABLE `produto` (
	`preco` FLOAT NOT NULL,
	`quantidade` INT NOT NULL,
	`id_produto` INT NOT NULL AUTO_INCREMENT UNIQUE,
	`marca` varchar(120) NOT NULL,
	`nome` varchar NOT NULL,
	PRIMARY KEY (`id_produto`)
);

CREATE TABLE `carrinho` (
	`id_usuario` INT NOT NULL,
	`id_produto` INT NOT NULL
);

ALTER TABLE `doacao` ADD CONSTRAINT `doacao_fk0` FOREIGN KEY (`id_cliente`) REFERENCES `usuario`(`id_usuario`);

ALTER TABLE `doacao` ADD CONSTRAINT `doacao_fk1` FOREIGN KEY (`id_ong`) REFERENCES `ong`(`id_ong`);

ALTER TABLE `carrinho` ADD CONSTRAINT `carrinho_fk0` FOREIGN KEY (`id_usuario`) REFERENCES `usuario`(`id_usuario`);

ALTER TABLE `carrinho` ADD CONSTRAINT `carrinho_fk1` FOREIGN KEY (`id_produto`) REFERENCES `produto`(`id_produto`);

