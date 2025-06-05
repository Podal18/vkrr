-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3312
-- Время создания: Июн 06 2025 г., 00:22
-- Версия сервера: 8.0.30
-- Версия PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `diplom`
--

-- --------------------------------------------------------

--
-- Структура таблицы `applications`
--

CREATE TABLE `applications` (
  `id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `full_name` varchar(100) DEFAULT NULL,
  `age` int DEFAULT NULL,
  `experience` int DEFAULT NULL,
  `vacancy_id` int DEFAULT NULL,
  `resume_text` text,
  `status` enum('new','approved','rejected') DEFAULT 'new',
  `reviewed_by` int DEFAULT NULL,
  `reviewed_at` datetime DEFAULT NULL,
  `applied_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `applications`
--

INSERT INTO `applications` (`id`, `user_id`, `full_name`, `age`, `experience`, `vacancy_id`, `resume_text`, `status`, `reviewed_by`, `reviewed_at`, `applied_at`) VALUES
(1, 1, 'Кирилл Федотов', 40, 1, 1, 'Работал три года на разных объектах. Семьянин', 'rejected', 3, '2025-06-05 18:56:08', '2025-05-29 21:55:21'),
(2, 2, NULL, NULL, NULL, 3, 'Резюме бухгалтера', 'approved', 3, '2025-06-05 19:01:19', '2025-05-29 21:55:21'),
(3, 1, NULL, NULL, NULL, 3, 'Повторная заявка', 'rejected', 3, '2025-06-05 18:56:08', '2025-05-29 21:55:21'),
(5, 6, 'Борисов Георгий Витальевич', 50, 10, 2, 'Работал в компании \"У Палыча\"', 'rejected', 3, '2025-06-03 19:49:46', '2025-06-03 19:49:20'),
(6, 7, 'Доровских Василий', 42, 9, 1, 'Работал в нескольких компаниях', 'approved', 3, '2025-06-03 19:52:18', '2025-06-03 19:51:57'),
(7, 8, 'Подгорнова Александра', 20, 0, 3, 'Легка в обучении', 'approved', 3, '2025-06-03 20:41:06', '2025-06-03 20:40:52'),
(8, 9, 'Кимов Сергей Сергеевич', 22, 12, 2, 'работаю 24/7 есть машина жигули', 'approved', 3, '2025-06-03 21:43:26', '2025-06-03 21:42:54'),
(9, 1, 'test', 20, 0, 1, 'test_text', 'rejected', 3, '2025-06-05 18:56:08', '2025-06-05 18:55:34'),
(10, 1, 'test', 20, 0, 2, 'test_text', 'rejected', 3, '2025-06-05 18:56:08', '2025-06-05 18:55:44'),
(11, 2, 'test', 16, 0, 5, 'testtext', 'approved', 3, '2025-06-05 19:01:19', '2025-06-05 18:57:47'),
(12, 2, 'test', 16, 0, 2, 'testtext', 'approved', 3, '2025-06-05 19:01:19', '2025-06-05 18:57:55'),
(13, 2, 'test', 16, 0, 2, 'q', 'approved', 3, '2025-06-05 19:01:19', '2025-06-05 19:00:06'),
(14, 2, 'test', 16, 0, 3, 'q', 'approved', 3, '2025-06-05 19:01:19', '2025-06-05 19:01:02'),
(15, 13, 'Иванов Иван', 30, 3, 6, 'о себе', 'approved', 3, '2025-06-06 00:08:13', '2025-06-06 00:07:30'),
(16, 22, 'Кузнецова Елизавета', 25, 3, 6, 'Занималась раскруткой Одноклассников', 'approved', 3, '2025-06-06 00:21:38', '2025-06-06 00:21:02');

-- --------------------------------------------------------

--
-- Структура таблицы `attendance`
--

CREATE TABLE `attendance` (
  `id` int NOT NULL,
  `employee_id` int DEFAULT NULL,
  `date` date NOT NULL,
  `login_time` time DEFAULT NULL,
  `status` enum('present','late','absent') NOT NULL,
  `notes` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `attendance`
--

INSERT INTO `attendance` (`id`, `employee_id`, `date`, `login_time`, `status`, `notes`) VALUES
(1, 1, '2020-12-12', NULL, 'late', 'Работала 5 лет по специальности'),
(2, 2, '2025-06-01', NULL, 'present', NULL),
(3, 2, '2025-05-31', NULL, 'present', NULL),
(4, 2, '2025-05-30', NULL, 'present', NULL),
(5, 2, '2025-05-29', NULL, 'absent', NULL),
(6, 2, '2025-05-28', NULL, 'present', NULL),
(7, 2, '2025-05-27', NULL, 'late', NULL),
(8, 2, '2025-05-26', NULL, 'present', NULL),
(9, 2, '2025-05-25', NULL, 'present', NULL),
(10, 2, '2025-05-24', NULL, 'absent', NULL),
(92, 7, '2025-06-04', '06:00:00', 'present', 'Автоматически создано при входе'),
(93, 7, '2025-06-03', '11:30:00', 'absent', 'Автоматически создано при входе'),
(94, 7, '2025-06-05', '09:16:00', 'late', 'Автоматически создано при входе'),
(95, 7, '2025-06-06', '00:10:00', 'present', 'Автоматически создано при входе'),
(96, 20, '2025-06-06', '00:21:00', 'present', 'Автоматически создано при входе');

--
-- Триггеры `attendance`
--
DELIMITER $$
CREATE TRIGGER `set_attendance_status` BEFORE INSERT ON `attendance` FOR EACH ROW BEGIN
    IF NEW.login_time IS NOT NULL THEN
        IF NEW.login_time <= '09:00:00' THEN
            SET NEW.status = 'present';
        ELSEIF NEW.login_time <= '10:00:00' THEN
            SET NEW.status = 'late';
        ELSE
            SET NEW.status = 'absent';
        END IF;
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Структура таблицы `employees`
--

CREATE TABLE `employees` (
  `id` int NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `profession` varchar(100) DEFAULT NULL,
  `photo_path` varchar(255) DEFAULT NULL,
  `passport_scan_path` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `user_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `employees`
--

INSERT INTO `employees` (`id`, `full_name`, `profession`, `photo_path`, `passport_scan_path`, `is_active`, `user_id`) VALUES
(1, 'Анна Смирнова', 'HR-специалист', 'C:\\Users\\\\kapra\\PycharmProjects\\diplom\\фото\\DHS_6327_w.jpg', NULL, 0, 1),
(2, 'Игорь Кузнецов', 'Инженер', 'C:\\\\Users\\\\kapra\\\\PycharmProjects\\\\diplom\\\\фото\\\\images.jpg', NULL, 1, 6),
(3, 'Мария Орлова', 'Бухгалтер', 'C:\\Users\\\\kapra\\PycharmProjects\\diplom\\фото\\DHS_6327_w.jpg', NULL, 1, 4),
(4, 'Сергей Петров', 'Прораб', 'C:\\\\Users\\\\kapra\\\\PycharmProjects\\\\diplom\\\\фото\\\\Foto-na-dokumenty-ot-pechaterfoto-3.jpg', NULL, 1, 3),
(5, 'test_user1', 'Инженер ПТО', NULL, NULL, 1, 5),
(6, 'test_user1', 'Инженер ПТО', NULL, NULL, 1, 2),
(7, 'Vasiliy', 'Инженер ПТО', 'C:/Users/kapra/OneDrive/Рабочий стол/49476038-2492844.jpg', 'C:/Users/kapra/OneDrive/Рабочий стол/49476038-2492844.jpg', 1, 7),
(10, 'test_user2', 'Бухгалтер', NULL, NULL, 1, NULL),
(19, 'test4', 'SMM', 'C:/Users/kapra/OneDrive/Изображения/image_1.jpg', 'C:/Users/kapra/OneDrive/Изображения/image_1.jpg', 1, NULL),
(20, 'test12', 'SMM', NULL, NULL, 1, 22);

-- --------------------------------------------------------

--
-- Структура таблицы `firings`
--

CREATE TABLE `firings` (
  `id` int NOT NULL,
  `employee_id` int DEFAULT NULL,
  `reason` text,
  `fired_by` int DEFAULT NULL,
  `fired_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `firings`
--

INSERT INTO `firings` (`id`, `employee_id`, `reason`, `fired_by`, `fired_at`) VALUES
(2, 4, 'Нарушение трудовой дисциплины', 1, '2025-05-29 21:55:29'),
(3, 1, 'Уволен вручную', 1, '2025-06-01 10:32:36'),
(4, 1, 'Уволен вручную', 3, '2025-06-02 14:31:48'),
(5, 3, 'прогулы', 1, '2025-06-02 18:03:54'),
(6, 4, 'Опоздания', 3, '2025-06-03 19:53:34'),
(7, 1, 'late', NULL, '2025-06-06 00:05:52');

-- --------------------------------------------------------

--
-- Структура таблицы `logs`
--

CREATE TABLE `logs` (
  `id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `description` text,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `logs`
--

INSERT INTO `logs` (`id`, `user_id`, `action`, `description`, `created_at`) VALUES
(140, 3, 'Вход', 'Пользователь с ID 3 вошёл в систему', '2025-06-05 23:36:00'),
(141, 17, 'Вход', 'Пользователь с ID 17 вошёл в систему', '2025-06-05 23:38:00'),
(142, 20, 'Вход', 'Пользователь с ID 20 вошёл в систему', '2025-06-05 23:43:00'),
(143, 4, 'Вход', 'Пользователь с ID 4 вошёл в систему', '2025-06-05 23:44:00'),
(144, 21, 'Сброс пароля', 'Пользователь test11 сбросил пароль', '2025-06-06 00:02:49'),
(145, 10, 'Вход', 'Пользователь с ID 10 вошёл в систему', '2025-06-06 00:02:00'),
(146, 11, 'Вход', 'Пользователь с ID 11 вошёл в систему', '2025-06-06 00:03:00'),
(147, 12, 'Вход', 'Пользователь с ID 12 вошёл в систему', '2025-06-06 00:03:00'),
(148, 13, 'Вход', 'Пользователь с ID 13 вошёл в систему', '2025-06-06 00:06:00'),
(149, 3, 'Вход', 'Пользователь с ID 3 вошёл в систему', '2025-06-06 00:07:00'),
(150, 13, 'Вход', 'Пользователь с ID 13 вошёл в систему', '2025-06-06 00:08:00'),
(151, 13, 'Вход', 'Пользователь с ID 13 вошёл в систему', '2025-06-06 00:09:00'),
(152, 7, 'Вход', 'Пользователь с ID 7 вошёл в систему', '2025-06-06 00:10:00'),
(153, 22, 'Вход', 'Пользователь с ID 22 вошёл в систему', '2025-06-06 00:20:00'),
(154, 3, 'Вход', 'Пользователь с ID 3 вошёл в систему', '2025-06-06 00:21:00'),
(155, 22, 'Вход', 'Пользователь с ID 22 вошёл в систему', '2025-06-06 00:21:00');

-- --------------------------------------------------------

--
-- Структура таблицы `motivation_actions`
--

CREATE TABLE `motivation_actions` (
  `id` int NOT NULL,
  `employee_id` int DEFAULT NULL,
  `action_type` enum('bonus','training','promotion') NOT NULL,
  `reason` text,
  `created_by` int DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `motivation_actions`
--

INSERT INTO `motivation_actions` (`id`, `employee_id`, `action_type`, `reason`, `created_by`, `created_at`) VALUES
(1, 1, 'promotion', 'qwrty', 3, '2025-06-02 14:24:36'),
(2, 1, 'bonus', 'ЗА старательную работу', 3, '2025-06-02 18:05:14'),
(3, 4, 'promotion', 'test', 3, '2025-06-02 18:06:06'),
(4, 2, 'promotion', 'За успехи в работе', 3, '2025-06-03 19:53:07'),
(6, 2, 'training', 'test', 3, '2025-06-05 19:03:11'),
(7, 7, 'bonus', 'Премия', NULL, '2025-06-06 00:04:31');

-- --------------------------------------------------------

--
-- Структура таблицы `roles`
--

CREATE TABLE `roles` (
  `id` int NOT NULL,
  `name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `roles`
--

INSERT INTO `roles` (`id`, `name`) VALUES
(1, 'Administrator'),
(2, 'Employee'),
(3, 'HR'),
(4, 'Candidat'),
(5, 'Uvolenni');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `login` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `role` int NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `login`, `password_hash`, `role`, `created_at`) VALUES
(1, 'test_user1', 'hash1', 5, '2025-05-29 21:55:21'),
(2, 'test_user2', 'hash2', 2, '2025-05-29 21:55:21'),
(3, 'hr', 'hr', 3, '2025-05-29 22:24:50'),
(4, 'adm', 'adm', 1, '2025-05-29 22:25:17'),
(5, 'Ivan', '111', 5, '2025-05-31 00:53:11'),
(6, 'Georgiy', '123', 5, '2025-06-03 19:48:13'),
(7, 'Vasiliy', '123', 2, '2025-06-03 19:51:19'),
(8, 'Sasha', '123', 2, '2025-06-03 20:38:22'),
(9, 'sergey', 'qwerty123', 5, '2025-06-03 21:40:46'),
(10, 'test1', 'test1', 1, '2025-06-05 23:24:30'),
(11, 'test2', 'test2', 2, '2025-06-05 23:24:42'),
(12, 'test3', 'test3', 3, '2025-06-05 23:24:53'),
(13, 'test4', 'test4', 2, '2025-06-05 23:25:03'),
(14, 'log', 'log', 2, '2025-06-05 23:27:41'),
(15, 'test5', 'test5', 5, '2025-06-05 23:34:16'),
(16, 'test6', 'test6', 2, '2025-06-05 23:36:01'),
(17, 'test7', 'test7', 4, '2025-06-05 23:37:57'),
(18, 'test8', 'test8', 2, '2025-06-05 23:38:40'),
(19, 'test9', 'test9', 3, '2025-06-05 23:42:46'),
(20, 'test10', 'test10', 4, '2025-06-05 23:43:39'),
(21, 'test11', 'qwerty', 4, '2025-06-05 23:54:26'),
(22, 'test12', 'test12', 2, '2025-06-06 00:20:13');

-- --------------------------------------------------------

--
-- Структура таблицы `vacancies`
--

CREATE TABLE `vacancies` (
  `id` int NOT NULL,
  `title` varchar(100) NOT NULL,
  `city` varchar(100) DEFAULT NULL,
  `salary` decimal(10,2) DEFAULT NULL,
  `employment_type` enum('ТК','ГПХ','Самозанятый') NOT NULL,
  `required_experience` int DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `vacancies`
--

INSERT INTO `vacancies` (`id`, `title`, `city`, `salary`, `employment_type`, `required_experience`, `is_active`) VALUES
(1, 'Инженер ПТО', 'Москва', '80000.00', 'ТК', 3, 1),
(2, 'Прораб', 'Санкт-Петербург', '90000.00', 'ГПХ', 5, 1),
(3, 'Бухгалтер', 'Казань', '70000.00', 'Самозанятый', 2, 0),
(5, 'Юрист', 'Москва', '60000.00', 'ТК', 0, 0),
(6, 'SMM', 'любой', '25000.00', 'Самозанятый', 0, 1);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `applications`
--
ALTER TABLE `applications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `vacancy_id` (`vacancy_id`),
  ADD KEY `reviewed_by` (`reviewed_by`);

--
-- Индексы таблицы `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_id` (`employee_id`);

--
-- Индексы таблицы `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Индексы таблицы `firings`
--
ALTER TABLE `firings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_id` (`employee_id`),
  ADD KEY `fired_by` (`fired_by`);

--
-- Индексы таблицы `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `idx_created_at` (`created_at`);

--
-- Индексы таблицы `motivation_actions`
--
ALTER TABLE `motivation_actions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_id` (`employee_id`),
  ADD KEY `created_by` (`created_by`);

--
-- Индексы таблицы `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`login`),
  ADD KEY `role` (`role`);

--
-- Индексы таблицы `vacancies`
--
ALTER TABLE `vacancies`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `applications`
--
ALTER TABLE `applications`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT для таблицы `attendance`
--
ALTER TABLE `attendance`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;

--
-- AUTO_INCREMENT для таблицы `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT для таблицы `firings`
--
ALTER TABLE `firings`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=156;

--
-- AUTO_INCREMENT для таблицы `motivation_actions`
--
ALTER TABLE `motivation_actions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT для таблицы `vacancies`
--
ALTER TABLE `vacancies`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `applications`
--
ALTER TABLE `applications`
  ADD CONSTRAINT `applications_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `applications_ibfk_2` FOREIGN KEY (`vacancy_id`) REFERENCES `vacancies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `applications_ibfk_3` FOREIGN KEY (`reviewed_by`) REFERENCES `users` (`id`);

--
-- Ограничения внешнего ключа таблицы `attendance`
--
ALTER TABLE `attendance`
  ADD CONSTRAINT `attendance_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `employees`
--
ALTER TABLE `employees`
  ADD CONSTRAINT `fk_employee_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `firings`
--
ALTER TABLE `firings`
  ADD CONSTRAINT `firings_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  ADD CONSTRAINT `firings_ibfk_2` FOREIGN KEY (`fired_by`) REFERENCES `users` (`id`);

--
-- Ограничения внешнего ключа таблицы `logs`
--
ALTER TABLE `logs`
  ADD CONSTRAINT `logs_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Ограничения внешнего ключа таблицы `motivation_actions`
--
ALTER TABLE `motivation_actions`
  ADD CONSTRAINT `motivation_actions_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  ADD CONSTRAINT `motivation_actions_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`);

--
-- Ограничения внешнего ключа таблицы `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role`) REFERENCES `roles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
