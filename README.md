---
type: Page
title: HotSec API 
createdAt: 2023-09-07 21:23
lastUpdated: 2023-09-07 22:50
tags: ['PHP', 'MVC', 'MySQL', 'API', 'REST', 'JSON']
---


## Config setup

1. Go to api/config/config.sample.php and update file with your own db credentials.
2. Remove '.sample' from the file name.
3. The accompanied sample data are to be found in the root file hotsec.sql.
4. Use postman or similar interface to test out the HotSec API as follows:

### SELLERS

#### GET: Sellers index

```text
/sellers
```

#### GET: Lists sellers in ascending order by first- or last name  

```text
/sellers/?sort=firstname
```

```text
/sellers/?sort=lastname
```

#### GET: Enriched seller data

```text
/sellers?id=1
```

#### POST: Create new seller

Use the following template to insert a new seller into the HotSec database:

```text
/sellers
```

```json
{
    "body" : {
        "firstname" : "",
        "lastname" : ""
    }
} 
```

### ITEMS

#### GET: Items index

```text
/items
```

#### GET: Order items by price

```text
/items/?sort=price
```

#### POST: Create new item

Use the following template to insert a new item into the HotSec database:

```text
/items
```

```json
{
    "body" : {
        "title" : "",
        "price" : 00.00,
        "size" : 0,
        "about" : "",
        "seller_id" : 0
    }
}
```

#### PUT: Change an items retail state (sold / not sold)

Select item by setting "id" parameter, then set the "sold" paramter value to "1" for sold, or "0" for not sold. Example:

```text
/items/?id=1&sold=1
```

---

## Prerequisites met for further development

### Database Structure

This project utilizes a database with several tables to manage data related to sellers, items, and events. Here's an overview of the table structure:

#### Sellers Table

- This table stores information about sellers, such as their names, contact details, and any other relevant information. Each seller is assigned a unique identifier (primary key), which is used to establish relationships with other tables.

#### Items Table

- The items table maintains records of all registered items. Each item is associated with details like the item's name, price, description, retail state etc. Each item has a unique identifier (primary key) that helps establish relationships with other tables.

#### Events Table

- The events table stores information about different events. It includes details such as the event's name, date and time. Further columns may be added in the future. Each event is assigned a unique identifier (primary key).

#### Seller_Events Table

- The seller_events table acts as a junction or association table, establishing a many-to-many relationship between sellers and events. It includes foreign keys that reference the primary keys of both the sellers table and the events table. This table allows multiple sellers to be associated with multiple events and vice versa.

#### Item_Events Table

- Similar to the seller_events table, the item_events table serves as a junction or association table. It enables a many-to-many relationship between items and events, with foreign keys referencing the primary keys of both the items table and the events table. This table allows multiple items to be associated with multiple events and vice versa.
