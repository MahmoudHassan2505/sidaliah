INSERT INTO users(
    username, password, enabled, phone)
VALUES ('admin', '{noop}admin', 1, 01098400483),('mahmoud', '{noop}mahmoud', 1, 01098400483);

INSERT INTO authorities(
    username, authority)
VALUES ('admin', 'ROLE_ADMIN'),('admin', 'ROLE_EMPLOYEE'),('mahmoud','ROLE_EMPLOYEE');

INSERT INTO supplier(name)
VALUES ('South Egypt Drug Industries Co (SEDICO)'),
       ('Viatris Egypt'),
       ('ابن سينا فارما'),
       ('اخناتون للتجاره والتوزيع'),
       ('الشرق الاوسط للكيماويات'),
       ('الشركه المصريه لتجاره الادويه'),
       ('العربيه المتحده للادويه'),
       ('المتحده للصيادله'),
       ('رامكو فارم لتجاره الادويه'),
       ('سوفيكو فارم'),
       ('فارما اوفر سيز'),
       ('شركه ليمتليس للمستحضرات الصيدليه و المكملات الغائيه'),
       ('مينا فارم'),
       ('مالتي فارما للادويه'),
       ('The Egyption company for blood transfusion services'),
       ('ALLMED Middle East'),
       ('Biolinx');

INSERT INTO medicine_category(name)
VALUES ('اقراص'),
       ('امبولات'),
       ('قطرات'),
       ('مراهم'),
       ('كريمات'),
       ('شراب'),
       ('مستلزمات طبيه');

INSERT INTO medicine(
    barcode, name, dosageform, strength, manufacturer, activeingredient, alertexpired, alertamount, category_id, arabicname)
VALUES ( 51616, 'testing medicine name','soup', '500mg', 'a7med company', 'no active ingredient','2-15-2023' , 520, 1, 'دوا شركه ');

INSERT INTO orders(
    supplyrequest, deliveryrequest, supplier_id, dateofsupply)
VALUES (1561651,215605 ,1, '1-30-2020');

INSERT INTO order_medicine(
    order_id, medicine_id, amount, expirydate, price)
VALUES (1,1, 1, '2-15-2025', 320);


