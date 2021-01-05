-- Adminer 4.7.6 PostgreSQL dump

\connect "copycrab";

CREATE TABLE "public"."_category" (
    "code" text NOT NULL,
    "name" text NOT NULL,
    CONSTRAINT "_category_pkey" PRIMARY KEY ("code")
) WITH (oids = false);


CREATE TABLE "public"."_customer" (
    "username" text NOT NULL,
    "password" text NOT NULL,
    "name" text NOT NULL,
    "phone" text NOT NULL,
    "email" text NOT NULL,
    "sex" text NOT NULL,
    CONSTRAINT "_customer_pkey" PRIMARY KEY ("username")
) WITH (oids = false);


CREATE TABLE "public"."_customervoucher" (
    "key" text NOT NULL,
    "isused" boolean NOT NULL,
    "expireddate" timestamp NOT NULL,
    "customer_username" text NOT NULL,
    "voucher_code" text NOT NULL,
    CONSTRAINT "_customervoucher_pkey" PRIMARY KEY ("key"),
    CONSTRAINT "_customervoucher_customer_username_fkey" FOREIGN KEY (customer_username) REFERENCES _customer(username) ON DELETE RESTRICT NOT DEFERRABLE,
    CONSTRAINT "_customervoucher_voucher_code_fkey" FOREIGN KEY (voucher_code) REFERENCES _voucher(code) ON DELETE RESTRICT NOT DEFERRABLE
) WITH (oids = false);

CREATE INDEX "_customervoucher_customer_username_idx" ON "public"."_customervoucher" USING btree ("customer_username");

CREATE INDEX "_customervoucher_voucher_code_idx" ON "public"."_customervoucher" USING btree ("voucher_code");


CREATE TABLE "public"."_driver" (
    "username" text NOT NULL,
    "password" text NOT NULL,
    "name" text NOT NULL,
    "phone" text NOT NULL,
    "email" text NOT NULL,
    "platenumber" text NOT NULL,
    "sex" text NOT NULL,
    CONSTRAINT "_driver_pkey" PRIMARY KEY ("username")
) WITH (oids = false);


CREATE TABLE "public"."_favoritemenu" (
    "key" text NOT NULL,
    "note" text,
    "customer_username" text NOT NULL,
    "menu_id" bigint NOT NULL,
    CONSTRAINT "_favoritemenu_pkey" PRIMARY KEY ("key"),
    CONSTRAINT "_favoritemenu_customer_username_fkey" FOREIGN KEY (customer_username) REFERENCES _customer(username) ON DELETE RESTRICT NOT DEFERRABLE,
    CONSTRAINT "_favoritemenu_menu_id_fkey" FOREIGN KEY (menu_id) REFERENCES _menu(id) ON DELETE RESTRICT NOT DEFERRABLE
) WITH (oids = false);

CREATE INDEX "_favoritemenu_customer_username_idx" ON "public"."_favoritemenu" USING btree ("customer_username");

CREATE INDEX "_favoritemenu_menu_id_idx" ON "public"."_favoritemenu" USING btree ("menu_id");


CREATE TABLE "public"."_loginlog" (
    "username" integer NOT NULL
) WITH (oids = false);


CREATE SEQUENCE _menu_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."_menu" (
    "id" bigint DEFAULT nextval('_menu_id_seq') NOT NULL,
    "name" text NOT NULL,
    "price" double precision NOT NULL,
    "imagename" text NOT NULL,
    "restaurant_username" text NOT NULL,
    CONSTRAINT "_menu_pkey" PRIMARY KEY ("id"),
    CONSTRAINT "_menu_restaurant_username_fkey" FOREIGN KEY (restaurant_username) REFERENCES _restaurant(username) ON DELETE RESTRICT NOT DEFERRABLE
) WITH (oids = false);

CREATE INDEX "_menu_restaurant_username_idx" ON "public"."_menu" USING btree ("restaurant_username");


CREATE TABLE "public"."_menucategory" (
    "key" text NOT NULL,
    "menu_id" bigint NOT NULL,
    "category_code" text NOT NULL,
    CONSTRAINT "_menucategory_pkey" PRIMARY KEY ("key"),
    CONSTRAINT "_menucategory_category_code_fkey" FOREIGN KEY (category_code) REFERENCES _category(code) ON DELETE RESTRICT NOT DEFERRABLE,
    CONSTRAINT "_menucategory_menu_id_fkey" FOREIGN KEY (menu_id) REFERENCES _menu(id) ON DELETE RESTRICT NOT DEFERRABLE
) WITH (oids = false);

CREATE INDEX "_menucategory_category_code_idx" ON "public"."_menucategory" USING btree ("category_code");

CREATE INDEX "_menucategory_menu_id_idx" ON "public"."_menucategory" USING btree ("menu_id");


CREATE SEQUENCE _menupromotion_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."_menupromotion" (
    "id" bigint DEFAULT nextval('_menupromotion_id_seq') NOT NULL,
    "expireddate" timestamp NOT NULL,
    "menu_id" bigint NOT NULL,
    "promotion_code" text NOT NULL,
    CONSTRAINT "_menupromotion_pkey" PRIMARY KEY ("id"),
    CONSTRAINT "_menupromotion_menu_id_fkey" FOREIGN KEY (menu_id) REFERENCES _menu(id) ON DELETE RESTRICT NOT DEFERRABLE,
    CONSTRAINT "_menupromotion_promotion_code_fkey" FOREIGN KEY (promotion_code) REFERENCES _promotion(code) ON DELETE RESTRICT NOT DEFERRABLE
) WITH (oids = false);

CREATE INDEX "_menupromotion_menu_id_idx" ON "public"."_menupromotion" USING btree ("menu_id");

CREATE INDEX "_menupromotion_promotion_code_idx" ON "public"."_menupromotion" USING btree ("promotion_code");


CREATE SEQUENCE _order_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."_order" (
    "id" bigint DEFAULT nextval('_order_id_seq') NOT NULL,
    "date" timestamp NOT NULL,
    "destination" text NOT NULL,
    "fee" double precision NOT NULL,
    "ratescore" double precision,
    "paymentmethod" text,
    "customer_username" text NOT NULL,
    "driver_username" text NOT NULL,
    "customervoucher_key" text,
    CONSTRAINT "_order_pkey" PRIMARY KEY ("id"),
    CONSTRAINT "_order_customer_username_fkey" FOREIGN KEY (customer_username) REFERENCES _customer(username) ON DELETE RESTRICT NOT DEFERRABLE,
    CONSTRAINT "_order_customervoucher_key_fkey" FOREIGN KEY (customervoucher_key) REFERENCES _customervoucher(key) ON DELETE RESTRICT NOT DEFERRABLE,
    CONSTRAINT "_order_driver_username_fkey" FOREIGN KEY (driver_username) REFERENCES _driver(username) ON DELETE RESTRICT NOT DEFERRABLE
) WITH (oids = false);

CREATE INDEX "_order_customer_username_idx" ON "public"."_order" USING btree ("customer_username");

CREATE INDEX "_order_customervoucher_key_idx" ON "public"."_order" USING btree ("customervoucher_key");

CREATE INDEX "_order_driver_username_idx" ON "public"."_order" USING btree ("driver_username");


CREATE TABLE "public"."_ordermenu" (
    "key" text NOT NULL,
    "amount" integer DEFAULT '1' NOT NULL,
    "note" text,
    "order_id" bigint NOT NULL,
    "menu_id" bigint NOT NULL,
    CONSTRAINT "_ordermenu_pkey" PRIMARY KEY ("key"),
    CONSTRAINT "_ordermenu_menu_id_fkey" FOREIGN KEY (menu_id) REFERENCES _menu(id) ON DELETE RESTRICT NOT DEFERRABLE,
    CONSTRAINT "_ordermenu_order_id_fkey" FOREIGN KEY (order_id) REFERENCES _order(id) ON DELETE RESTRICT NOT DEFERRABLE
) WITH (oids = false);

CREATE INDEX "_ordermenu_menu_id_idx" ON "public"."_ordermenu" USING btree ("menu_id");

CREATE INDEX "_ordermenu_order_id_idx" ON "public"."_ordermenu" USING btree ("order_id");


CREATE TABLE "public"."_promotion" (
    "code" text NOT NULL,
    "type" text NOT NULL,
    "value" double precision NOT NULL,
    CONSTRAINT "_promotion_pkey" PRIMARY KEY ("code")
) WITH (oids = false);


CREATE TABLE "public"."_restaurant" (
    "username" text NOT NULL,
    "password" text NOT NULL,
    "name" text NOT NULL,
    "address" text NOT NULL,
    "phone" text NOT NULL,
    "email" text NOT NULL,
    "license" text,
    CONSTRAINT "_restaurant_pkey" PRIMARY KEY ("username")
) WITH (oids = false);


CREATE TABLE "public"."_voucher" (
    "code" text NOT NULL,
    "type" text NOT NULL,
    "value" double precision NOT NULL,
    "detail" text NOT NULL,
    "expireddate" timestamp NOT NULL,
    CONSTRAINT "_voucher_pkey" PRIMARY KEY ("code")
) WITH (oids = false);


-- 2020-05-19 09:06:06.457704+00
