# SteepHub

## Summary
<br>
SteepHub is an API only application for users to create and manage their tea subscriptions. Users can make, or update a subscription by selecting a frequency of weekly, monthly, or yearly. Upon creation or change of info, a corresponding price will be saved for that subscription based on the frequency selected. 
<br>

![steephub cover](https://github.com/ALHelton/steep_hub/assets/116662742/70e2c4ad-104d-4195-9550-a808edff9241)

<br>

## Versions
- Ruby 3.1.1
- Rails 7.0.5

## Setup

1. Fork and Clone the repository
```shell
git clone git@github.com:ALHelton/steephub.git
```

2. Navigate to the directory
```shell
cd steep_hub
```

3. Install Gem Packages
```shell
bundle install
```

4. Update Gem Packages
```shell
bundle update
```

5. Run the Migrations
```shell
rails db:{drop,create,migrate,seed}
```
<br>

## Schema
<img width="1206" alt="SteepHub Schema" src="https://github.com/ALHelton/steep_hub/assets/116662742/962150ab-265d-4983-9c5f-16fd1f032f6c">

<br>


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
<br>
<br>
<br>
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
<br>
<br>
<br>
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
<br>
<br>
<br>
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
