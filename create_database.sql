-- =====================================================
-- База данных: Система управления магазином обуви ООО «Обувь»
-- Версия: 1.0
-- СУБД: PostgreSQL / MySQL (совместимый синтаксис)
-- Нормальная форма: 3НФ
-- Дата создания: 04.02.2026
-- =====================================================

-- Удаление существующих таблиц (для повторного запуска)
DROP TABLE IF EXISTS order_items CASCADE;
DROP TABLE IF EXISTS orders CASCADE;
DROP TABLE IF EXISTS products CASCADE;
DROP TABLE IF EXISTS categories CASCADE;
DROP TABLE IF EXISTS manufacturers CASCADE;
DROP TABLE IF EXISTS suppliers CASCADE;
DROP TABLE IF EXISTS pickup_points CASCADE;
DROP TABLE IF EXISTS users CASCADE;
DROP TABLE IF EXISTS roles CASCADE;

-- =====================================================
-- СПРАВОЧНЫЕ ТАБЛИЦЫ
-- =====================================================

-- Таблица: Роли пользователей
CREATE TABLE roles (
    role_id SERIAL PRIMARY KEY,
    role_name VARCHAR(100) NOT NULL UNIQUE,
    description TEXT
);

-- Таблица: Пользователи системы
CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    role_id INT NOT NULL,
    full_name VARCHAR(255) NOT NULL,
    login VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (role_id) REFERENCES roles(role_id) ON DELETE RESTRICT ON UPDATE CASCADE
);

-- Таблица: Категории товаров
CREATE TABLE categories (
    category_id SERIAL PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL UNIQUE,
    description TEXT
);

-- Таблица: Производители
CREATE TABLE manufacturers (
    manufacturer_id SERIAL PRIMARY KEY,
    manufacturer_name VARCHAR(100) NOT NULL UNIQUE,
    description TEXT
);

-- Таблица: Поставщики
CREATE TABLE suppliers (
    supplier_id SERIAL PRIMARY KEY,
    supplier_name VARCHAR(100) NOT NULL UNIQUE,
    contact_info TEXT
);

-- Таблица: Пункты выдачи
CREATE TABLE pickup_points (
    pickup_point_id SERIAL PRIMARY KEY,
    address VARCHAR(255) NOT NULL UNIQUE,
    postal_code VARCHAR(10),
    city VARCHAR(100),
    street VARCHAR(100),
    building VARCHAR(10)
);

-- =====================================================
-- ОСНОВНЫЕ ТАБЛИЦЫ
-- =====================================================

-- Таблица: Товары
CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    article VARCHAR(50) NOT NULL UNIQUE,
    product_name VARCHAR(255) NOT NULL,
    unit_of_measure VARCHAR(20) NOT NULL,
    price DECIMAL(10, 2) NOT NULL CHECK (price >= 0),
    supplier_id INT NOT NULL,
    manufacturer_id INT NOT NULL,
    category_id INT NOT NULL,
    discount_percent INT DEFAULT 0 CHECK (discount_percent >= 0 AND discount_percent <= 100),
    quantity_in_stock INT DEFAULT 0 CHECK (quantity_in_stock >= 0),
    description TEXT,
    photo_filename VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id) ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (manufacturer_id) REFERENCES manufacturers(manufacturer_id) ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (category_id) REFERENCES categories(category_id) ON DELETE RESTRICT ON UPDATE CASCADE
);

-- Таблица: Заказы
CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    order_number VARCHAR(50) NOT NULL UNIQUE,
    user_id INT,
    order_date DATE NOT NULL,
    delivery_date DATE,
    pickup_point_id INT NOT NULL,
    pickup_code VARCHAR(10) NOT NULL,
    order_status VARCHAR(50) NOT NULL DEFAULT 'Новый',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE SET NULL ON UPDATE CASCADE,
    FOREIGN KEY (pickup_point_id) REFERENCES pickup_points(pickup_point_id) ON DELETE RESTRICT ON UPDATE CASCADE,
    CHECK (delivery_date IS NULL OR delivery_date >= order_date)
);

-- Таблица: Состав заказа (связь многие-ко-многим между заказами и товарами)
CREATE TABLE order_items (
    order_item_id SERIAL PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL CHECK (quantity > 0),
    price_at_order DECIMAL(10, 2) NOT NULL CHECK (price_at_order >= 0),
    discount_at_order INT DEFAULT 0 CHECK (discount_at_order >= 0 AND discount_at_order <= 100),
    FOREIGN KEY (order_id) REFERENCES orders(order_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (product_id) REFERENCES products(product_id) ON DELETE RESTRICT ON UPDATE CASCADE
);

-- =====================================================
-- ИНДЕКСЫ ДЛЯ ОПТИМИЗАЦИИ ЗАПРОСОВ
-- =====================================================

CREATE INDEX idx_users_login ON users(login);
CREATE INDEX idx_users_role ON users(role_id);
CREATE INDEX idx_products_article ON products(article);
CREATE INDEX idx_products_category ON products(category_id);
CREATE INDEX idx_products_manufacturer ON products(manufacturer_id);
CREATE INDEX idx_products_supplier ON products(supplier_id);
CREATE INDEX idx_orders_user ON orders(user_id);
CREATE INDEX idx_orders_status ON orders(order_status);
CREATE INDEX idx_orders_date ON orders(order_date);
CREATE INDEX idx_order_items_order ON order_items(order_id);
CREATE INDEX idx_order_items_product ON order_items(product_id);

-- =====================================================
-- КОММЕНТАРИИ К ТАБЛИЦАМ
-- =====================================================

COMMENT ON TABLE roles IS 'Справочник ролей пользователей';
COMMENT ON TABLE users IS 'Пользователи системы';
COMMENT ON TABLE categories IS 'Категории товаров';
COMMENT ON TABLE manufacturers IS 'Производители товаров';
COMMENT ON TABLE suppliers IS 'Поставщики товаров';
COMMENT ON TABLE pickup_points IS 'Пункты выдачи заказов';
COMMENT ON TABLE products IS 'Товары (обувь)';
COMMENT ON TABLE orders IS 'Заказы клиентов';
COMMENT ON TABLE order_items IS 'Состав заказов (позиции)';

-- =====================================================
-- ТРИГГЕРЫ ДЛЯ АВТОМАТИЧЕСКОГО ОБНОВЛЕНИЯ TIMESTAMPS
-- =====================================================

-- Функция для обновления поля updated_at
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Триггер для таблицы products
CREATE TRIGGER update_products_updated_at
BEFORE UPDATE ON products
FOR EACH ROW
EXECUTE FUNCTION update_updated_at_column();

-- Триггер для таблицы orders
CREATE TRIGGER update_orders_updated_at
BEFORE UPDATE ON orders
FOR EACH ROW
EXECUTE FUNCTION update_updated_at_column();

-- =====================================================
-- КОНЕЦ СКРИПТА
-- =====================================================
