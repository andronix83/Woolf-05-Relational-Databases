-- Create categories table
CREATE TABLE categories (
    id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT
);

-- Create customers table
CREATE TABLE customers (
    id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    contact VARCHAR(255),
    address VARCHAR(255),
    city VARCHAR(100),
    postal_code VARCHAR(50),
    country VARCHAR(100)
);

-- Create employees table
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    last_name VARCHAR(100) NOT NULL,
    first_name VARCHAR(100) NOT NULL,
    birthdate DATE,
    photo VARCHAR(255),
    notes TEXT
);

-- Create shippers table
CREATE TABLE shippers (
    id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    phone VARCHAR(50)
);

-- Create suppliers table
CREATE TABLE suppliers (
    id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    contact VARCHAR(255),
    address VARCHAR(255),
    city VARCHAR(100),
    postal_code VARCHAR(50),
    country VARCHAR(100),
    phone VARCHAR(50)
);

-- Create products table with foreign keys referencing categories and suppliers
CREATE TABLE products (
    id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    supplier_id INT,
    category_id INT,
    unit VARCHAR(100),
    price DECIMAL(10, 2),
    FOREIGN KEY (supplier_id) REFERENCES suppliers(id) ON DELETE SET NULL ON UPDATE CASCADE,
    FOREIGN KEY (category_id) REFERENCES categories(id) ON DELETE SET NULL ON UPDATE CASCADE
);

-- Create orders table with foreign keys referencing customers, employees, and shippers
CREATE TABLE orders (
    id INT PRIMARY KEY,
    customer_id INT,
    employee_id INT,
    date DATE,
    shipper_id INT,
    FOREIGN KEY (customer_id) REFERENCES customers(id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id) ON DELETE SET NULL ON UPDATE CASCADE,
    FOREIGN KEY (shipper_id) REFERENCES shippers(id) ON DELETE SET NULL ON UPDATE CASCADE
);

-- Create order_details table with foreign keys referencing orders and products
CREATE TABLE order_details (
    id INT PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL CHECK (quantity > 0),
    FOREIGN KEY (order_id) REFERENCES orders(id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE CASCADE ON UPDATE CASCADE
);