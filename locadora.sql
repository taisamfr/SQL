
CREATE TABLE `aluguel` (
  `id` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_carro` int(11) NOT NULL,
  `data_reserva` date NOT NULL,
  `data_devolucao` date NOT NULL,
  `observacao` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



INSERT INTO `aluguel` (`id`, `id_cliente`, `id_carro`, `data_reserva`, `data_devolucao`, `observacao`) VALUES
(1, 1, 1, '2025-09-01', '2025-09-05', 'Cliente pediu GPS'),
(2, 2, 2, '2025-09-02', '2025-09-06', NULL),
(3, 3, 3, '2025-09-03', '2025-09-07', 'Devolução antecipada'),
(4, 4, 4, '2025-09-04', '2025-09-08', NULL),
(5, 5, 5, '2025-09-05', '2025-09-09', 'Cliente solicitou cadeira infantil'),
(6, 6, 6, '2025-09-06', '2025-09-10', NULL),
(7, 7, 7, '2025-09-07', '2025-09-11', 'Cliente pediu tanque cheio'),
(8, 8, 8, '2025-09-08', '2025-09-12', NULL),
(9, 9, 9, '2025-09-09', '2025-09-13', 'Cliente pediu seguro completo'),
(10, 10, 10, '2025-09-10', '2025-09-14', NULL);


CREATE TABLE `carro` (
  `id` int(11) NOT NULL,
  `modelo` varchar(100) NOT NULL,
  `marca` varchar(50) DEFAULT NULL,
  `placa` varchar(20) NOT NULL,
  `ano` int(11) NOT NULL,
  `cor` varchar(30) DEFAULT NULL,
  `status` varchar(20) DEFAULT 'disponível'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;




INSERT INTO `carro` (`id`, `modelo`, `marca`, `placa`, `ano`, `cor`, `status`) VALUES
(1, 'Civic', 'Honda', 'ABC1A23', 2020, 'Preto', 'disponível'),
(2, 'Corolla', 'Toyota', 'DEF2B34', 2019, 'Branco', 'disponível'),
(3, 'Onix', 'Chevrolet', 'GHI3C45', 2021, 'Prata', 'disponível'),
(4, 'Gol', 'Volkswagen', 'JKL4D56', 2018, 'Vermelho', 'disponível'),
(5, 'HB20', 'Hyundai', 'MNO5E67', 2022, 'Azul', 'disponível'),
(6, 'Ka', 'Ford', 'PQR6F78', 2017, 'Cinza', 'disponível'),
(7, 'Renegade', 'Jeep', 'STU7G89', 2020, 'Verde', 'disponível'),
(8, 'Sandero', 'Renault', 'VWX8H90', 2019, 'Amarelo', 'disponível'),
(9, 'Fit', 'Honda', 'YZA9I01', 2021, 'Branco', 'disponível'),
(10, 'Cruze', 'Chevrolet', 'BCD0J12', 2022, 'Preto', 'disponível');


CREATE TABLE `cliente` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `idade` int(11) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `endereco` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;




INSERT INTO `cliente` (`id`, `nome`, `idade`, `email`, `telefone`, `endereco`) VALUES
(1, 'Ana Souza', 28, 'ana.souza@email.com', '11999990001', 'Rua das Flores, 123'),
(2, 'Carlos Lima', 35, 'carlos.lima@email.com', '11999990002', 'Av. Brasil, 456'),
(3, 'Fernanda Rocha', 42, 'fernanda.rocha@email.com', '11999990003', 'Rua Verde, 789'),
(4, 'João Pedro', 30, 'joao.pedro@email.com', '11999990004', 'Rua Azul, 321'),
(5, 'Mariana Silva', 25, 'mariana.silva@email.com', '11999990005', 'Av. Central, 654'),
(6, 'Ricardo Alves', 38, 'ricardo.alves@email.com', '11999990006', 'Rua do Sol, 987'),
(7, 'Beatriz Costa', 27, 'beatriz.costa@email.com', '11999990007', 'Rua da Paz, 111'),
(8, 'Lucas Martins', 33, 'lucas.martins@email.com', '11999990008', 'Av. das Árvores, 222'),
(9, 'Juliana Mendes', 29, 'juliana.mendes@email.com', '11999990009', 'Rua do Campo, 333'),
(10, 'Eduardo Tavares', 40, 'eduardo.tavares@email.com', '11999990010', 'Rua do Lago, 444');


--
ALTER TABLE `aluguel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_cliente` (`id_cliente`),
  ADD KEY `fk_carro` (`id_carro`);


ALTER TABLE `carro`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `placa` (`placa`);

--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

ALTER TABLE `aluguel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

ALTER TABLE `carro`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;


ALTER TABLE `cliente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;


ALTER TABLE `aluguel`
  ADD CONSTRAINT `fk_carro` FOREIGN KEY (`id_carro`) REFERENCES `carro` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;
