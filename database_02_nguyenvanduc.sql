CREATE TABLE "products" (
  "id" integer PRIMARY KEY NOT NULL,
  "name" varchar(50) NOT NULL,
  "quantity" integer NOT NULL,
  "status" boolean DEFAULT true,
  "price" integer NOT NULL,
  "created_at" timestamp NOT NULL,
  "updated_at" timestamp NOT NULL
);

CREATE TABLE "customers" (
  "id" integer PRIMARY KEY NOT NULL,
  "name" varchar(50) NOT NULL,
  "age" integer NOT NULL,
  "email" varchar(50) NOT NULL,
  "phone" varchar(50) NOT NULL,
  "address" varchar(50) NOT NULL
);

CREATE TABLE "orders" (
  "id" integer PRIMARY KEY NOT NULL,
  "name" varchar(50) NOT NULL,
  "price_total" integer NOT NULL,
  "quantity_total" integer NOT NULL,
  "status" boolean DEFAULT true,
  "created_at" timestamp NOT NULL,
  "updated_at" timestamp NOT NULL,
  "customer_id" integer
);

CREATE TABLE "orders_products" (
  "id" integer PRIMARY KEY NOT NULL,
  "order_id" integer NOT NULL,
  "product_id" integer NOT NULL,
  "price_total" integer NOT NULL,
  "created_at" timestamp NOT NULL,
  "updated_at" timestamp NOT NULL
);

ALTER TABLE "orders" ADD FOREIGN KEY ("customer_id") REFERENCES "customers" ("id");

ALTER TABLE "orders_products" ADD FOREIGN KEY ("order_id") REFERENCES "orders" ("id");

ALTER TABLE "orders_products" ADD FOREIGN KEY ("product_id") REFERENCES "products" ("id");


select * from customers
select * from orders
select * from products
select * from orders_products

customers.name,customers.email,customers.phone,

select orders_products.product_id,orders_products.quantity,products.price,products.price*orders_products.quantity as tongtien from orders inner join orders_products on orders.id=orders_products.order_id
inner join products on products.id=orders_products.product_id where orders.id=1

--cau1
select customers.name,customers.email,customers.phone,orders.id,sum(orders_products.quantity)as soluong,sum(orders_products.quantity*products.price) as tongtien,orders.status,orders.created_at from orders inner join orders_products on orders.id=orders_products.order_id
inner join products on products.id=orders_products.product_id inner join customers on customers.id=orders.customer_id
group by orders.id,customers.id
--------------------------------------
--cau2
select customers.name,customers.email,customers.phone,products.name,orders_products.product_id,products.price,orders_products.quantity,products.price*orders_products.quantity as tongtien,orders.status,orders.created_at,orders.updated_at from orders inner join orders_products on orders.id=orders_products.order_id
inner join products on products.id=orders_products.product_id inner join customers on customers.id=orders.customer_id where orders.id=1
--------------------------------------
