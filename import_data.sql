-- =====================================================
-- Скрипт импорта данных для базы данных ООО «Обувь»
-- Версия: 1.0
-- Дата: 04.02.2026
-- =====================================================

-- =====================================================
-- ЗАПОЛНЕНИЕ СПРАВОЧНИКОВ
-- =====================================================

-- Роли пользователей
INSERT INTO roles (role_name, description) VALUES
('Администратор', 'Полный доступ к системе'),
('Менеджер', 'Просмотр товаров и заказов'),
('Авторизированный клиент', 'Просмотр товаров'),
('Гость', 'Ограниченный просмотр товаров');

-- Пользователи
INSERT INTO users (role_id, full_name, login, password) VALUES
(1, 'Никифорова Весения Николаевна', '94d5ous@gmail.com', 'uzWC67'),
(1, 'Сазонов Руслан Германович', 'uth4iz@mail.com', '2L6KZG'),
(1, 'Одинцов Серафим Артёмович', 'yzls62@outlook.com', 'JlFRCZ'),
(2, 'Степанов Михаил Артёмович', '1diph5e@tutanota.com', '8ntwUp'),
(2, 'Ворсин Петр Евгеньевич', 'tjde7c@yahoo.com', 'YOyhfR'),
(2, 'Старикова Елена Павловна', 'wpmrc3do@tutanota.com', 'RSbvHv'),
(3, 'Михайлюк Анна Вячеславовна', '5d4zbu@tutanota.com', 'rwVDh9'),
(3, 'Ситдикова Елена Анатольевна', 'ptec8ym@yahoo.com', 'LdNyos'),
(3, 'Ворсин Петр Евгеньевич', '1qz4kw@mail.com', 'gynQMT');

-- Категории товаров
INSERT INTO categories (category_name, description) VALUES
('Женская обувь', 'Обувь для женщин'),
('Мужская обувь', 'Обувь для мужчин'),
('Детская обувь', 'Обувь для детей');

-- Производители
INSERT INTO manufacturers (manufacturer_name, description) VALUES
('Kari', 'Российская компания по производству обуви'),
('Marco Tozzi', 'Немецкий бренд обуви'),
('Рос', 'Российское производство обуви'),
('Rieker', 'Немецкий производитель обуви'),
('Alessio Nesca', 'Итальянский бренд обуви');

-- Поставщики
INSERT INTO suppliers (supplier_name, contact_info) VALUES
('Kari', 'Официальный поставщик Kari'),
('Обувь для вас', 'Оптовый поставщик обуви');

-- Пункты выдачи
INSERT INTO pickup_points (address, postal_code, city, street, building) VALUES
('420151, г. Лесной, ул. Вишневая, 32', '420151', 'Лесной', 'Вишневая', '32'),
('125061, г. Лесной, ул. Подгорная, 8', '125061', 'Лесной', 'Подгорная', '8'),
('630370, г. Лесной, ул. Шоссейная, 24', '630370', 'Лесной', 'Шоссейная', '24'),
('400562, г. Лесной, ул. Зеленая, 32', '400562', 'Лесной', 'Зеленая', '32'),
('614510, г. Лесной, ул. Маяковского, 47', '614510', 'Лесной', 'Маяковского', '47'),
('410542, г. Лесной, ул. Светлая, 46', '410542', 'Лесной', 'Светлая', '46'),
('620839, г. Лесной, ул. Цветочная, 8', '620839', 'Лесной', 'Цветочная', '8'),
('443890, г. Лесной, ул. Коммунистическая, 1', '443890', 'Лесной', 'Коммунистическая', '1'),
('603379, г. Лесной, ул. Спортивная, 46', '603379', 'Лесной', 'Спортивная', '46'),
('603721, г. Лесной, ул. Гоголя, 41', '603721', 'Лесной', 'Гоголя', '41'),
('420151, г. Лесной, ул. Молодежная, 50', '420151', 'Лесной', 'Молодежная', '50'),
('125061, г. Лесной, ул. Набережная, 30', '125061', 'Лесной', 'Набережная', '30'),
('630370, г. Лесной, ул. Фрунзе, 43', '630370', 'Лесной', 'Фрунзе', '43'),
('400562, г. Лесной, ул. Школьная, 50', '400562', 'Лесной', 'Школьная', '50'),
('614510, г. Лесной, ул. Комсомольская, 26', '614510', 'Лесной', 'Комсомольская', '26'),
('410542, г. Лесной, ул. Чехова, 3', '410542', 'Лесной', 'Чехова', '3'),
('620839, г. Лесной, ул. Дзержинского, 28', '620839', 'Лесной', 'Дзержинского', '28'),
('443890, г. Лесной, ул. Больничная, 4', '443890', 'Лесной', 'Больничная', '4'),
('603379, г. Лесной, ул. Некрасова, 10', '603379', 'Лесной', 'Некрасова', '10'),
('603721, г. Лесной, ул. Октябрьская, 34', '603721', 'Лесной', 'Октябрьская', '34');

-- =====================================================
-- ЗАПОЛНЕНИЕ ТОВАРОВ
-- =====================================================

INSERT INTO products (article, product_name, unit_of_measure, price, supplier_id, manufacturer_id, category_id, discount_percent, quantity_in_stock, description, photo_filename) VALUES
('А112Т4', 'Ботинки', 'шт.', 4990.00, 1, 1, 1, 3, 6, 'Женские Ботинки демисезонные kari', '1.jpg'),
('F635R4', 'Ботинки', 'шт.', 3244.00, 2, 2, 1, 2, 13, 'Ботинки Marco Tozzi женские демисезонные, размер 39, цвет бежевый', '2.jpg'),
('H782T5', 'Туфли', 'шт.', 4499.00, 1, 1, 2, 4, 5, 'Туфли kari мужские классика MYZ21AW-450A, размер 43, цвет: черный', '3.jpg'),
('G783F5', 'Ботинки', 'шт.', 5900.00, 1, 3, 2, 2, 8, 'Мужские ботинки Рос-Обувь кожаные с натуральным мехом', '4.jpg'),
('J384T6', 'Ботинки', 'шт.', 3800.00, 2, 4, 2, 2, 16, 'B3430/14 Полуботинки мужские Rieker', '5.jpg'),
('D572U8', 'Кроссовки', 'шт.', 4100.00, 2, 3, 2, 3, 6, '129615-4 Кроссовки мужские', '6.jpg'),
('F572H7', 'Туфли', 'шт.', 2700.00, 1, 2, 1, 2, 14, 'Туфли Marco Tozzi женские летние, размер 39, цвет черный', '7.jpg'),
('D329H3', 'Полуботинки', 'шт.', 1890.00, 2, 5, 1, 4, 4, 'Полуботинки Alessio Nesca женские 3-30797-47, размер 37, цвет: бордовый', '8.jpg'),
('B320R5', 'Туфли', 'шт.', 4300.00, 1, 4, 1, 2, 6, 'Туфли Rieker женские демисезонные, размер 41, цвет коричневый', '9.jpg'),
('G432E4', 'Кроссовки', 'шт.', 3200.00, 1, 1, 2, 5, 10, 'Кроссовки мужские Kari спортивные', '10.jpg');

-- =====================================================
-- ЗАПОЛНЕНИЕ ЗАКАЗОВ
-- =====================================================

-- Заказ 1
INSERT INTO orders (order_number, user_id, order_date, delivery_date, pickup_point_id, pickup_code, order_status) 
VALUES ('1', 4, '2025-02-15', '2025-04-08', 1, '901', 'Завершен');

INSERT INTO order_items (order_id, product_id, quantity, price_at_order, discount_at_order)
SELECT 1, product_id, 2, price, discount_percent FROM products WHERE article = 'А112Т4'
UNION ALL
SELECT 1, product_id, 2, price, discount_percent FROM products WHERE article = 'F635R4';

-- Заказ 2
INSERT INTO orders (order_number, user_id, order_date, delivery_date, pickup_point_id, pickup_code, order_status)
VALUES ('2', 1, '2022-10-12', '2025-04-09', 11, '902', 'Завершен');

INSERT INTO order_items (order_id, product_id, quantity, price_at_order, discount_at_order)
SELECT 2, product_id, 1, price, discount_percent FROM products WHERE article = 'H782T5'
UNION ALL
SELECT 2, product_id, 1, price, discount_percent FROM products WHERE article = 'G783F5';

-- Заказ 3
INSERT INTO orders (order_number, user_id, order_date, delivery_date, pickup_point_id, pickup_code, order_status)
VALUES ('3', 2, '2025-03-09', '2025-04-10', 2, '903', 'Завершен');

INSERT INTO order_items (order_id, product_id, quantity, price_at_order, discount_at_order)
SELECT 3, product_id, 10, price, discount_percent FROM products WHERE article = 'J384T6'
UNION ALL
SELECT 3, product_id, 10, price, discount_percent FROM products WHERE article = 'D572U8';

-- Заказ 4
INSERT INTO orders (order_number, user_id, order_date, delivery_date, pickup_point_id, pickup_code, order_status)
VALUES ('4', 3, '2025-02-08', '2025-04-11', 11, '904', 'Завершен');

INSERT INTO order_items (order_id, product_id, quantity, price_at_order, discount_at_order)
SELECT 4, product_id, 5, price, discount_percent FROM products WHERE article = 'F572H7'
UNION ALL
SELECT 4, product_id, 4, price, discount_percent FROM products WHERE article = 'D329H3';

-- Заказ 5
INSERT INTO orders (order_number, user_id, order_date, delivery_date, pickup_point_id, pickup_code, order_status)
VALUES ('5', 4, '2025-03-05', '2025-04-12', 2, '905', 'Завершен');

INSERT INTO order_items (order_id, product_id, quantity, price_at_order, discount_at_order)
SELECT 5, product_id, 2, price, discount_percent FROM products WHERE article = 'А112Т4'
UNION ALL
SELECT 5, product_id, 2, price, discount_percent FROM products WHERE article = 'F635R4';

-- Заказ 6
INSERT INTO orders (order_number, user_id, order_date, delivery_date, pickup_point_id, pickup_code, order_status)
VALUES ('6', 1, '2025-02-17', '2025-04-13', 15, '906', 'Завершен');

INSERT INTO order_items (order_id, product_id, quantity, price_at_order, discount_at_order)
SELECT 6, product_id, 1, price, discount_percent FROM products WHERE article = 'H782T5'
UNION ALL
SELECT 6, product_id, 1, price, discount_percent FROM products WHERE article = 'G783F5';

-- Заказ 7
INSERT INTO orders (order_number, user_id, order_date, delivery_date, pickup_point_id, pickup_code, order_status)
VALUES ('7', 2, '2025-02-30', '2025-04-14', 3, '907', 'Завершен');

INSERT INTO order_items (order_id, product_id, quantity, price_at_order, discount_at_order)
SELECT 7, product_id, 10, price, discount_percent FROM products WHERE article = 'J384T6'
UNION ALL
SELECT 7, product_id, 10, price, discount_percent FROM products WHERE article = 'D572U8';

-- Заказ 8
INSERT INTO orders (order_number, user_id, order_date, delivery_date, pickup_point_id, pickup_code, order_status)
VALUES ('8', 3, '2025-03-19', '2025-04-15', 19, '908', 'Новый');

INSERT INTO order_items (order_id, product_id, quantity, price_at_order, discount_at_order)
SELECT 8, product_id, 5, price, discount_percent FROM products WHERE article = 'F572H7'
UNION ALL
SELECT 8, product_id, 4, price, discount_percent FROM products WHERE article = 'D329H3';

-- Заказ 9
INSERT INTO orders (order_number, user_id, order_date, delivery_date, pickup_point_id, pickup_code, order_status)
VALUES ('9', 4, '2025-03-21', '2025-04-16', 5, '909', 'Новый');

INSERT INTO order_items (order_id, product_id, quantity, price_at_order, discount_at_order)
SELECT 9, product_id, 5, price, discount_percent FROM products WHERE article = 'B320R5'
UNION ALL
SELECT 9, product_id, 1, price, discount_percent FROM products WHERE article = 'G432E4';

-- =====================================================
-- КОНЕЦ СКРИПТА
-- =====================================================
