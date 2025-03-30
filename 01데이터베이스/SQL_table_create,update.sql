-- MySQL 데이터베이스 생성 및 선택
CREATE DATABASE IF NOT EXISTS my_database;
USE my_database;

-- 테이블 생성
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total_amount DECIMAL(10,2),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- 데이터 삽입
INSERT INTO users (username, email) VALUES
    ('user1', 'user1@example.com'),
    ('user2', 'user2@example.com');

INSERT INTO orders (user_id, total_amount) VALUES
    (1, 100.50),
    (2, 200.75);

-- 기본 SELECT 쿼리
SELECT * FROM users;
SELECT * FROM orders;

-- JOIN 예시
SELECT u.username, o.order_id, o.total_amount
FROM users u
INNER JOIN orders o ON u.id = o.user_id;

-- 자주 사용하는 MySQL 함수들 예시

-- 문자열 함수
SELECT 
    CONCAT(username, ' - ', email) as user_info,
    UPPER(username) as upper_name,
    LOWER(email) as lower_email,
    LENGTH(username) as name_length,
    SUBSTRING(email, 1, 5) as email_start
FROM users;

-- 숫자 함수
SELECT 
    total_amount,
    ROUND(total_amount, 0) as rounded,
    CEIL(total_amount) as ceiling,
    FLOOR(total_amount) as floor_value
FROM orders;

-- 날짜 함수
SELECT 
    created_at,
    DATE(created_at) as only_date,
    DATE_FORMAT(created_at, '%Y-%m-%d %H:%i:%s') as formatted_date,
    YEAR(created_at) as year,
    MONTH(created_at) as month,
    DAY(created_at) as day
FROM users;

-- 집계 함수
SELECT 
    COUNT(*) as total_users,
    MAX(total_amount) as max_amount,
    MIN(total_amount) as min_amount,
    AVG(total_amount) as avg_amount,
    SUM(total_amount) as total_amount
FROM orders;

-- GROUP BY 예시
SELECT user_id, 
    COUNT(*) as order_count,
    SUM(total_amount) as total_spent
FROM orders
GROUP BY user_id
HAVING total_spent > 100;

-- 인덱스 생성
CREATE INDEX idx_username ON users(username);

-- 뷰 생성
CREATE VIEW user_orders_view AS
SELECT u.username, o.order_id, o.total_amount
FROM users u
JOIN orders o ON u.id = o.user_id;

-- 데이터 업데이트 예시
UPDATE users 
SET email = 'updated_email@example.com'
WHERE id = 1;

-- 데이터 삭제 예시
DELETE FROM orders WHERE order_id = 1;

-- 테이블 변경 예시
ALTER TABLE users
ADD COLUMN phone VARCHAR(20);

-- 트랜잭션 예시
START TRANSACTION;
    INSERT INTO users (username, email) 
    VALUES ('user3', 'user3@example.com');
    
    INSERT INTO orders (user_id, total_amount)
    VALUES (3, 300.00);
COMMIT;

-- 프로시저 예시
DELIMITER //
CREATE PROCEDURE GetUserOrders(IN userId INT)
BEGIN
    SELECT * FROM orders WHERE user_id = userId;
END //
DELIMITER ;

-- 프로시저 호출
CALL GetUserOrders(1);

-- 테이블 정보 조회
SHOW COLUMNS FROM users;
SHOW COLUMNS FROM orders;

-- 인덱스 정보 조회
SHOW INDEX FROM users;
SHOW INDEX FROM orders;