-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 19/11/2025 às 14:59
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
-- Banco de dados: `biblioteca`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `acervos`
--

CREATE TABLE `acervos` (
  `Codigo` int(11) NOT NULL,
  `tituloUm` varchar(200) NOT NULL,
  `tituloDois` varchar(200) DEFAULT NULL,
  `autor` varchar(200) DEFAULT NULL,
  `outrosAutores` varchar(200) DEFAULT NULL,
  `editora` int(11) DEFAULT NULL,
  `tipoAcervo` int(11) DEFAULT NULL,
  `codExemplar` int(11) DEFAULT NULL,
  `anoEdicao` int(11) DEFAULT NULL,
  `origem` int(11) DEFAULT NULL,
  `categoria` int(11) DEFAULT NULL,
  `numTombo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `acervos`
--

INSERT INTO `acervos` (`Codigo`, `tituloUm`, `tituloDois`, `autor`, `outrosAutores`, `editora`, `tipoAcervo`, `codExemplar`, `anoEdicao`, `origem`, `categoria`, `numTombo`) VALUES
(1, 'Dom Casmurro', NULL, 'Machado de Assis', NULL, 2, 1, 101, 1899, 1, 1, 1001),
(2, 'O Hobbit', NULL, 'J. R. R. Tolkien', NULL, 3, 2, 102, 1937, 1, 2, 1002),
(3, 'História do Brasil', NULL, 'Bóris Fausto', NULL, 4, 3, 103, 2006, 1, 3, 1003),
(4, 'Python para Iniciantes', NULL, 'João Silva', NULL, 5, 4, 104, 2021, 2, 4, 1004),
(5, 'Chapeuzinho Vermelho', NULL, 'Autor Desconhecido', NULL, 1, 5, 105, 1950, 3, 5, 1005);

-- --------------------------------------------------------

--
-- Estrutura para tabela `acervos_autor`
--

CREATE TABLE `acervos_autor` (
  `codAcervo` int(11) NOT NULL,
  `codAutor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `acervos_autor`
--

INSERT INTO `acervos_autor` (`codAcervo`, `codAutor`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

-- --------------------------------------------------------

--
-- Estrutura para tabela `autor`
--

CREATE TABLE `autor` (
  `codigo` int(11) NOT NULL,
  `nome` varchar(150) DEFAULT NULL,
  `numAutor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `autor`
--

INSERT INTO `autor` (`codigo`, `nome`, `numAutor`) VALUES
(1, 'Machado de Assis', 1),
(2, 'J. R. R. Tolkien', 2),
(3, 'Bóris Fausto', 3),
(4, 'João Silva', 4),
(5, 'Desconhecido', 5);

-- --------------------------------------------------------

--
-- Estrutura para tabela `categoria`
--

CREATE TABLE `categoria` (
  `codigo` int(11) NOT NULL,
  `descricao` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `categoria`
--

INSERT INTO `categoria` (`codigo`, `descricao`) VALUES
(1, 'Romance'),
(2, 'Ficção Científica'),
(3, 'História'),
(4, 'Tecnologia'),
(5, 'Infantil');

-- --------------------------------------------------------

--
-- Estrutura para tabela `clientes`
--

CREATE TABLE `clientes` (
  `codigo` int(11) NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `endereco` varchar(100) DEFAULT NULL,
  `cidade` varchar(100) DEFAULT NULL,
  `telefone` varchar(100) DEFAULT NULL,
  `observacao` varchar(100) DEFAULT NULL,
  `situacao` varchar(100) DEFAULT NULL,
  `codOpCliente` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `clientes`
--

INSERT INTO `clientes` (`codigo`, `nome`, `endereco`, `cidade`, `telefone`, `observacao`, `situacao`, `codOpCliente`) VALUES
(1, 'Ana Souza', 'Rua X, 10', 'São Paulo', '119111111', 'Nenhuma', 'Ativo', 1),
(2, 'Pedro Lima', 'Rua Y, 20', 'São Paulo', '119222222', 'Atrasou livro uma vez', 'Ativo', 2),
(3, 'João Mendes', 'Rua Z, 30', 'Campinas', '119333333', 'Cliente novo', 'Ativo', 3),
(4, 'Bruna Castro', 'Rua B1, 40', 'Sorocaba', '119444444', 'Observação teste', 'Inativo', 4),
(5, 'Tiago Alves', 'Rua D2, 50', 'Diadema', '119555555', 'Pegou multa', 'Ativo', 5);

-- --------------------------------------------------------

--
-- Estrutura para tabela `editora`
--

CREATE TABLE `editora` (
  `codigo` int(11) NOT NULL,
  `descricao` varchar(100) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `editora`
--

INSERT INTO `editora` (`codigo`, `descricao`, `telefone`) VALUES
(1, 'Editora Abril', '1130303030'),
(2, 'Companhia das Letras', '1140404040'),
(3, 'Editora Moderna', '1150505050'),
(4, 'Editora Globo', '1160606060'),
(5, 'Saraiva', '1170707070');

-- --------------------------------------------------------

--
-- Estrutura para tabela `emprestimo`
--

CREATE TABLE `emprestimo` (
  `codigo` int(11) NOT NULL,
  `dataEmp` date DEFAULT NULL,
  `dataDevol` date DEFAULT NULL,
  `codExemplar` int(11) DEFAULT NULL,
  `codCliente` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `emprestimo`
--

INSERT INTO `emprestimo` (`codigo`, `dataEmp`, `dataDevol`, `codExemplar`, `codCliente`) VALUES
(1, '2025-01-10', '2025-01-20', 101, 1),
(2, '2025-01-11', '2025-01-21', 102, 2),
(3, '2025-01-12', '2025-01-22', 103, 3),
(4, '2025-01-13', '2025-01-23', 104, 4),
(5, '2025-01-14', '2025-01-24', 105, 5);

-- --------------------------------------------------------

--
-- Estrutura para tabela `parametrosbiblioteca`
--

CREATE TABLE `parametrosbiblioteca` (
  `nome` varchar(100) DEFAULT NULL,
  `endereco` varchar(100) DEFAULT NULL,
  `cidade` varchar(100) DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL,
  `pais` varchar(100) DEFAULT NULL,
  `cep` varchar(100) DEFAULT NULL,
  `telefone` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `valorMulta` decimal(6,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `parametrosbiblioteca`
--

INSERT INTO `parametrosbiblioteca` (`nome`, `endereco`, `cidade`, `estado`, `pais`, `cep`, `telefone`, `email`, `valorMulta`) VALUES
('Biblioteca Central', 'Rua A, 100', 'São Paulo', 'SP', 'Brasil', '01000-000', '11223344', 'contato@bib.com', 2.50),
('Biblioteca Campus 2', 'Av B, 200', 'São Paulo', 'SP', 'Brasil', '02000-000', '119999999', 'campus2@bib.com', 3.00),
('Biblioteca Infantil', 'Rua das Flores, 30', 'Campinas', 'SP', 'Brasil', '13000-000', '114444444', 'infantil@bib.com', 1.50),
('Biblioteca Municipal', 'Av Central, 500', 'Sorocaba', 'SP', 'Brasil', '18000-000', '153333333', 'municipal@bib.com', 2.00),
('Biblioteca Comunitária', 'Rua X, 45', 'Diadema', 'SP', 'Brasil', '09900-000', '114567890', 'comunitaria@bib.com', 1.00);

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `codigo` int(11) NOT NULL,
  `none` varchar(100) DEFAULT NULL,
  `tipoUsuario` varchar(100) DEFAULT NULL,
  `telefone` varchar(100) DEFAULT NULL,
  `login` varchar(100) DEFAULT NULL,
  `senha` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `usuarios`
--

INSERT INTO `usuarios` (`codigo`, `none`, `tipoUsuario`, `telefone`, `login`, `senha`) VALUES
(1, 'Carlos Silva', 'Administrador', '11999990000', 'carlos', '123'),
(2, 'Mariana Rocha', 'Bibliotecária', '11888880000', 'mariana', 'abc'),
(3, 'Paulo Lima', 'Atendente', '11777770000', 'paulo', 'senha'),
(4, 'Sandra Texeira', 'Atendente', '11666660000', 'sandra', 'senha123'),
(5, 'Julia Melo', 'Estagiária', '11555550000', 'julia', 'teste');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `acervos`
--
ALTER TABLE `acervos`
  ADD PRIMARY KEY (`Codigo`),
  ADD UNIQUE KEY `numTombo` (`numTombo`),
  ADD KEY `editora` (`editora`),
  ADD KEY `categoria` (`categoria`);

--
-- Índices de tabela `acervos_autor`
--
ALTER TABLE `acervos_autor`
  ADD PRIMARY KEY (`codAcervo`,`codAutor`),
  ADD KEY `codAutor` (`codAutor`);

--
-- Índices de tabela `autor`
--
ALTER TABLE `autor`
  ADD PRIMARY KEY (`codigo`);

--
-- Índices de tabela `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`codigo`);

--
-- Índices de tabela `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `codOpCliente` (`codOpCliente`);

--
-- Índices de tabela `editora`
--
ALTER TABLE `editora`
  ADD PRIMARY KEY (`codigo`);

--
-- Índices de tabela `emprestimo`
--
ALTER TABLE `emprestimo`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `codCliente` (`codCliente`);

--
-- Índices de tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`codigo`);

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `acervos`
--
ALTER TABLE `acervos`
  ADD CONSTRAINT `acervos_ibfk_1` FOREIGN KEY (`editora`) REFERENCES `editora` (`codigo`),
  ADD CONSTRAINT `acervos_ibfk_2` FOREIGN KEY (`categoria`) REFERENCES `categoria` (`codigo`);

--
-- Restrições para tabelas `acervos_autor`
--
ALTER TABLE `acervos_autor`
  ADD CONSTRAINT `acervos_autor_ibfk_1` FOREIGN KEY (`codAcervo`) REFERENCES `acervos` (`Codigo`),
  ADD CONSTRAINT `acervos_autor_ibfk_2` FOREIGN KEY (`codAutor`) REFERENCES `autor` (`codigo`);

--
-- Restrições para tabelas `clientes`
--
ALTER TABLE `clientes`
  ADD CONSTRAINT `clientes_ibfk_1` FOREIGN KEY (`codOpCliente`) REFERENCES `usuarios` (`codigo`);

--
-- Restrições para tabelas `emprestimo`
--
ALTER TABLE `emprestimo`
  ADD CONSTRAINT `emprestimo_ibfk_1` FOREIGN KEY (`codCliente`) REFERENCES `clientes` (`codigo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
