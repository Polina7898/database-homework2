DROP TABLE IF EXISTS order_items CASCADE;
DROP TABLE IF EXISTS orders CASCADE;
DROP TABLE IF EXISTS product CASCADE;
DROP TABLE IF EXISTS customer CASCADE;


CREATE TABLE customer (
    customer_id INTEGER PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    gender VARCHAR(10),
    DOB DATE,
    job_title VARCHAR(100),
    job_industry_category VARCHAR(100),
    wealth_segment VARCHAR(50),
    deceased_indicator VARCHAR(10),
    owns_car VARCHAR(10),
    address VARCHAR(200),
    postcode INTEGER,
    state VARCHAR(50),
    country VARCHAR(50),
    property_valuation INTEGER
);


CREATE TABLE product (
    product_id INTEGER PRIMARY KEY,
    brand VARCHAR(100),
    product_line VARCHAR(50),
    product_class VARCHAR(20),
    product_size VARCHAR(20),
    list_price DECIMAL(10,2),
    standard_cost DECIMAL(10,2)
);


CREATE TABLE orders (
    order_id INTEGER PRIMARY KEY,
    customer_id INTEGER,
    order_date DATE,
    order_status VARCHAR(50),
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);


CREATE TABLE order_items (
    order_item_id INTEGER PRIMARY KEY,
    order_id INTEGER,
    product_id INTEGER,
    quantity INTEGER,
    item_list_price_at_sale DECIMAL(10,2),
    item_standard_cost_at_sale DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES product(product_id)
);
