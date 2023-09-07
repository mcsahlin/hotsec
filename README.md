---
type: Page
title: HotSec API Documentation
createdAt: 2023-09-07 21:23
lastUpdated: 2023-09-07 22:03
tags: [REST, API, HotSec, PHP, MVC, MySQL, JSON, Postman]
---



Use postman or similar interface to test out the HotSec API as follows:

## SELLERS REQUESTS

## GET: Sellers

### Sellers index

```text
/sellers
```

### Lists sellers in ascending order by first- or last name  

```text
/sellers/?sort=firstname
```

```text
/sellers/?sort=lastname
```

### Enriched seller data

```text
/sellers?id=1
```

---

## POST

### Create new seller

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

---

## ITEMS REQUESTS

## GET: Items

### Items index

```text
/items
```

### Order items by price

```text
/items/?sort=price
```

---

## POST: Items

### Create new item

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

---

## PUT: Items

### Toggle an items sale status

Select item by setting "id" parameter, then set the "sold" paramter value to "1" for sold, or "0" for not sold. Example:

```text
/items/?id=1&sold=1
```

---

## Prerequisites met for further development

- The items table automatically adds a column for creation date, facilitating further development around this metric.

- The database contains an "events" table in order to connect and track associated events across database structures.
