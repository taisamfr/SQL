-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 15/09/2025 às 18:54
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `clinica`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `consulta`
--

CREATE TABLE `consulta` (
  `id` int(11) NOT NULL,
  `id_paciente` int(11) DEFAULT NULL,
  `id_medico` int(11) DEFAULT NULL,
  `data_hora` datetime DEFAULT NULL,
  `observacoes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `medico`
--

CREATE TABLE `medico` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `especialidade` varchar(50) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `crm` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `medico`
--

INSERT INTO `medico` (`id`, `nome`, `especialidade`, `telefone`, `crm`) VALUES
(1, 'Dr. Carlos Souza', 'Cardiologista', '1111-2222', 'CRM12345'),
(2, 'Dr Ana Lima', 'Pediatra', '3333-4444', 'CRM67890'),
(3, 'Dr Marcos Alves', 'Dermatologista', '5555-6666', 'CRM12345'),
(5, 'Dr. Luiza Souza', 'Ginecologista', '777-8888', 'CRM67890'),
(6, 'Dra. Gracinda Campos', 'Gastroentrologista', '9999-1010', 'CRM12345'),
(7, 'Dr Marcelo Falcão', 'Hematologista', '1111-1212', 'CRM1325'),
(8, 'Dra. Juliana Pessoa', 'Geriatra', '1313-1414', 'CRM68790'),
(10, 'Dr.Francisco Garcia', 'Infectologia', '1515-1616', 'CRM32145'),
(11, 'Dr. Samuel Veloso', 'Neurologia', '1717-1818', 'CRM12345'),
(12, 'Dra. Lilian Britto', 'Oncologia', '1919-2020', 'CRM09876');

-- --------------------------------------------------------

--
-- Estrutura para tabela `paciente`
--

CREATE TABLE `paciente` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `data_nascimento` date DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `endereco` varchar(200) DEFAULT NULL,
  `cep` varchar(10) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `paciente`
--

INSERT INTO `paciente` (`id`, `nome`, `data_nascimento`, `telefone`, `endereco`, `cep`, `email`) VALUES
(1, 'João Silva', '1986-06-09', '1212-1212', 'Rua A,202', '23456-789', 'joao@gmail.com'),
(2, 'Maria Oliveira', '1985-09-23', '3333-4444', 'Rua B,456', NULL, 'maria@gmail.com'),
(3, 'Pedro Santos', '2000-07-15', '4444-5555', 'Rua C,789', NULL, 'pedro@gmail.com'),
(4, 'Ana Souza', '1995-02-20', '5555-6666', 'Rua D,101', NULL, 'ana@gmail.com'),
(5, 'Carla Lima', '1988-11-30', '6666-7777', 'Rua E,202', NULL, 'carla@gmail.com'),
(6, 'Eduarda Silva', '1999-12-13', '7777-8888', 'Rua F,112', NULL, 'eduarda@gmail.com'),
(7, 'Mateus Fernades', '2002-11-01', '8888-9999', 'Rua G,364', NULL, 'mateus@gmail.com'),
(8, 'Julia Azevedo', '2000-04-03', '9999-4444', 'Rua H,998', NULL, 'julia@gmail.com'),
(9, 'Antonio Pereira', '1988-02-11', '1010-9999', 'Rua I,333', NULL, 'antonio@gmail.com'),
(10, 'Giovana Garcia', '2001-09-04', '2121-8888', 'Rua J,046', NULL, 'giovana@gmail.com');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `consulta`
--
ALTER TABLE `consulta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_paciente` (`id_paciente`),
  ADD KEY `id_medico` (`id_medico`);

--
-- Índices de tabela `medico`
--
ALTER TABLE `medico`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `paciente`
--
ALTER TABLE `paciente`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `consulta`
--
ALTER TABLE `consulta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `medico`
--
ALTER TABLE `medico`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de tabela `paciente`
--
ALTER TABLE `paciente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `consulta`
--
ALTER TABLE `consulta`
  ADD CONSTRAINT `consulta_ibfk_1` FOREIGN KEY (`id_paciente`) REFERENCES `paciente` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `consulta_ibfk_2` FOREIGN KEY (`id_medico`) REFERENCES `medico` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
