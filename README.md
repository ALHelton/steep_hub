# SteepHub


## Endpoints

<details>
<summary> GET "/api/v1/customers/1/subscriptions" </summary>


## Response:

status: 200
body:

```json
{
    "data": [
        {
            "id": "1",
            "type": "subscription",
            "attributes": {
                "title": "Andra's Subscription #1",
                "price": 10.0,
                "status": "active",
                "frequency": "monthly"
            }
        },
        {
            "id": "2",
            "type": "subscription",
            "attributes": {
                "title": "Andra's Subscription #2",
                "price": 15.0,
                "status": "cancelled",
                "frequency": "weekly"
            }
        },
        {
            "id": "3",
            "type": "subscription",
            "attributes": {
                "title": "Andra's Subscription #3",
                "price": 100.0,
                "status": "cancelled",
                "frequency": "yearly"
            }
        }
    ]
}
```
</details>


<details>
<summary> POST /api/v1/customers/1/subscriptions </summary>
<br>
Upon sending a frequency in the request, the corresponding price will be generated in the response

## Request:

Content-Type: application/json
Accept: application/json

```json
{
  "title": "Tasty Tea Sub",
  "frequency": "monthly"
}
```

## Response:

status: 201
body:

```json
{
    "data": {
        "id": "8",
        "type": "subscription",
        "attributes": {
            "title": "Tasty Tea Sub",
            "price": 10.0,
            "status": "active",
            "frequency": "monthly"
        }
    }
}
```
## Errors:

### 401 Unauthorized

#### Invalid Customer:

POST /api/v1/customers/12309845710928347/subscriptions

status: 401
body:

```json
{
    "error": "Invalid Credentials"
}
```
<br>

#### Nil Frequency:

POST /api/v1/customers/1/subscriptions

##### Request:

Content-Type: application/json
Accept: application/json

```json
{
  "title": "Tasty Tea Sub"
}
```

##### Response:

status: 401
body:

```json
{
    "error": "Invalid Credentials"
}
```
</details>


<details>
<summary> GET /api/v1/customers/1/subscriptions/1 </summary>

## Response:

status: 200
body:

```json
{
    "data": {
        "id": "1",
        "type": "subscription",
        "attributes": {
            "title": "Andra's Subscription #1",
            "price": 10.0,
            "status": "active",
            "frequency": "monthly"
        }
    }
}
```
</details>


<details>
<summary> PATCH /api/v1/customers/1/subscriptions/1 </summary>
<br>

## Cancelled Status: 
### Request:

Content-Type: application/json
Accept: application/json

body:

```json
{
  "status": "cancelled"
}
```

### Response:

status: 200
body:

```json
{
    "data": {
        "id": "1",
        "type": "subscription",
        "attributes": {
            "title": "Andra's Subscription #1",
            "price": 10.0,
            "status": "cancelled",
            "frequency": "monthly"
        }
    }
}
```

## Update Subscription Frequency: 
<br>
Upon sending an updated frequency in the request, the new corresponding price will be generated in the response

### Request:

Content-Type: application/json
Accept: application/json

body:

```json
{
  "frequency": "weekly"
}
```

### Response:

status: 200
body:

```json
{
    "data": {
        "id": "1",
        "type": "subscription",
        "attributes": {
            "title": "Andra's Subscription #1",
            "price": 15.0,
            "status": "active",
            "frequency": "weekly"
        }
    }
}
```

## Update Subscription Title: 

### Request:

Content-Type: application/json
Accept: application/json

body:

```json
{
  "title": "Way Cooler Title"
}
```

### Response:

status: 200
body:

```json
{
    "data": {
        "id": "1",
        "type": "subscription",
        "attributes": {
            "title": "Way Cooler Title",
            "price": 15.0,
            "status": "active",
            "frequency": "weekly"
        }
    }
}
```
</details>