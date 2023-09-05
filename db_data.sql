DROP TABLE IF EXISTS `hotsec`.`sellers`;
DROP TABLE IF EXISTS `hotsec`.`items`;

CREATE TABLE `hotsec`.`sellers` (
  `id` INT(11) NOT NULL AUTO_INCREMENT , 
  `firstname` VARCHAR(255) NOT NULL , 
  `lastname` VARCHAR(255) NOT NULL , 
  PRIMARY KEY (`id`)
  ) ENGINE = InnoDB;

  CREATE TABLE sellers (
    id INT(11) NOT NULL AUTO_INCREMENT,
    firstname VARCHAR(255) NOT NULL,
    lastname VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)) engine = InnoDB;


CREATE TABLE `hotsec`.`items` (
  `id` INT(11) NOT NULL AUTO_INCREMENT , 
  `name` VARCHAR(255) NOT NULL , 
  `price` DECIMAL(10, 2) NOT NULL , 
  `size` VARCHAR(10) NOT NULL , 
  `description` TEXT NOT NULL , 
  `image_url` VARCHAR(255) NOT NULL , 
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP , 
  `seller_id` INT(11) NOT NULL , 
  PRIMARY KEY (`id`)) ENGINE = InnoDB;


INSERT INTO sellers (firstname, lastname)
VALUES
    ('Erik', 'Andersson'),
    ('Maria', 'Berg'),
    ('Johan', 'Carlsson'),
    ('Anna', 'Dahl'),
    ('Anders', 'Eriksson'),
    ('Linda', 'Fredriksson'),
    ('Jonas', 'Gustafsson'),
    ('Lisa', 'Hansson'),
    ('Nils', 'Isaksson'),
    ('Karin', 'Johansson'),
    ('Sven', 'Karlsson'),
    ('Ingrid', 'Lindberg'),
    ('Per', 'Magnusson'),
    ('Charlotte', 'Nilsson'),
    ('Mikael', 'Olofsson'),
    ('Helena', 'Persson'),
    ('Åke', 'Rydberg'),
    ('Margareta', 'Svensson'),
    ('Oscar', 'Thulin'),
    ('Lina', 'Ullman');

INSERT INTO items (seller_id, name, price, size, description, image_url)
VALUES
    (1, 'Skjorta från Hugo Boss', 549.99, 'L', 'Jättefin skjorta från Hugo Boss i använt skick (all items are second hand so description should reflect this)', 'https://imageurl.com/image1.jpg'),
    (2, 'Jeans från Levi\'s', 399.95, 'M', 'Snygga jeans från Levi\'s, nästan nya', 'https://imageurl.com/image2.jpg'),
    (3, 'Klänning från H&M', 199.50, 'S', 'Vacker klänning från H&M, perfekt för sommaren', 'https://imageurl.com/image3.jpg'),
    (4, 'Skor från Adidas', 699.00, '42', 'Sportiga skor från Adidas, bekväma och stilrena', 'https://imageurl.com/image4.jpg'),
    (5, 'Jacka från North Face', 799.99, 'XL', 'Håll dig varm i vintern med denna jacka från North Face', 'https://imageurl.com/image5.jpg'),
    (6, 'Tröja från Ralph Lauren', 299.75, 'L', 'Snygg tröja från Ralph Lauren i bra skick', 'https://imageurl.com/image6.jpg'),
    (7, 'Mössa från Acne Studios', 99.50, 'One Size', 'Trendig mössa från Acne Studios', 'https://imageurl.com/image7.jpg'),
    (8, 'Kavaj från Zara', 349.00, 'M', 'Elegant kavaj från Zara, perfekt för kontorsklädsel', 'https://imageurl.com/image8.jpg'),
    (9, 'Jeanskjol från Gina Tricot', 149.95, 'S', 'Snygg jeanskjol från Gina Tricot', 'https://imageurl.com/image9.jpg'),
    (10, 'Sneakers från Puma', 299.99, '38', 'Sköna sneakers från Puma i bra skick', 'https://imageurl.com/image10.jpg'),
    (11, 'Kjol från Vero Moda', 179.99, 'M', 'Snygg kjol från Vero Moda i fint skick', 'https://imageurl.com/image31.jpg'),
    (12, 'Hoodie från Nike', 429.50, 'XL', 'Bekväm hoodie från Nike för kyliga dagar', 'https://imageurl.com/image32.jpg'),
    (13, 'Byxor från H&M', 249.00, 'S', 'Klassiska byxor från H&M', 'https://imageurl.com/image33.jpg'),
    (14, 'Skinnjacka från Mango', 599.00, 'M', 'Stilren skinnjacka från Mango', 'https://imageurl.com/image34.jpg'),
    (15, 'Sjal från Filippa K', 149.95, 'One Size', 'Elegant sjal från Filippa K', 'https://imageurl.com/image35.jpg'),
    (16, 'Badkläder från Speedo', 299.99, 'S', 'Snygga badkläder från Speedo', 'https://imageurl.com/image36.jpg'),
    (17, 'Vandringskängor från Salomon', 799.00, '43', 'Hållbara vandringskängor från Salomon', 'https://imageurl.com/image37.jpg'),
    (18, 'Skjorta från Gant', 349.99, 'L', 'Klassisk skjorta från Gant', 'https://imageurl.com/image38.jpg'),
    (19, 'Solglasögon från Ray-Ban', 899.00, 'One Size', 'Stiliga solglasögon från Ray-Ban', 'https://imageurl.com/image39.jpg'),
    (20, 'Klänning från Esprit', 259.95, 'S', 'Elegant klänning från Esprit', 'https://imageurl.com/image40.jpg'),
    (1, 'Vindjacka från Nike', 249.00, 'L', 'Lätt och bekväm vindjacka från Nike', 'https://imageurl.com/image30.jpg')
    (5, 'Halsduk från Calvin Klein', 129.50, 'One Size', 'Enkel och snygg halsduk från Calvin Klein', 'https://imageurl.com/image50.jpg'),
    (5, 'Jeansjacka från Wrangler', 459.99, 'M', 'Stilren jeansjacka från Wrangler', 'https://imageurl.com/image51.jpg'),
    (12, 'Vinterstövlar från Timberland', 699.00, '39', 'Hållbara vinterstövlar från Timberland', 'https://imageurl.com/image52.jpg'),
    (3, 'T-shirt från Puma', 149.50, 'S', 'Bekväm T-shirt från Puma', 'https://imageurl.com/image53.jpg'),
    (14, 'Regnjacka från Helly Hansen', 349.95, 'L', 'Vattentät regnjacka från Helly Hansen', 'https://imageurl.com/image54.jpg'),
    (5, 'Stickad tröja från Esprit', 249.00, 'M', 'Varm och bekväm stickad tröja från Esprit', 'https://imageurl.com/image55.jpg'),
    (3, 'Keps från New Era', 79.99, 'One Size', 'Snygg keps från New Era', 'https://imageurl.com/image56.jpg'),
    (7, 'Baddräkt från Speedo', 199.95, 'S', 'Snygg baddräkt från Speedo', 'https://imageurl.com/image57.jpg'),
    (18, 'Shorts från Adidas', 129.00, 'M', 'Bekväma shorts från Adidas', 'https://imageurl.com/image58.jpg'),
    (18, 'Väska från Fjällräven', 299.50, 'One Size', 'Praktisk och stilren väska från Fjällräven', 'https://imageurl.com/image59.jpg'),
    (10, 'Solhatt från Lindex', 59.95, 'One Size', 'Snygg solhatt från Lindex', 'https://imageurl.com/image60.jpg');

