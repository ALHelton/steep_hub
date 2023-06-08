# SteepHub


## Endpoints

<details>
<summary> GET "/api/v1/customers/1/subscriptions" </summary>


## Response:

<pre>
<code>

status: 200
body:

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
</pre>
</code>
</details>


<details>
<summary> POST /api/v1/customers/1/subscriptions </summary>

- Upon sending a frequency in the request, the corresponding price will be generated in the response

## Request:

<pre>
<code>
Content-Type: application/json
Accept: application/json

{
  "title": "Tasty Tea Sub",
  "frequency": "monthly"
}
</pre>
</code>

## Response:

<pre>
<code>

status: 201
body:

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

</pre>
</code>

## Errors:

### 401 Unauthorized

#### Invalid Customer:

POST /api/v1/customers/12309845710928347/subscriptions

<pre>
<code>

status: 401
body:

{
    "error": "Invalid Credentials"
}

</pre>
</code>
</details>

#### Nil Frequency:

POST /api/v1/customers/1/subscriptions

##### Request:

<pre>
<code>
Content-Type: application/json
Accept: application/json

{
  "title": "Tasty Tea Sub",
  "frequency": "monthly"
}
</pre>
</code>

##### Response:

<pre>
<code>

status: 401
body:

{
    "error": "Invalid Credentials"
}

</pre>
</code>
</details>


<details>
<summary> GET /api/v1/customers/1/subscriptions/1 </summary>

## Response:

<pre>
<code>

status: 200
body:

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

</pre>
</code>
</details>


<details>
<summary> PATCH /api/v1/customers/1/subscriptions/1 </summary>

## Cancelled Status: 
### Request:

<pre>
<code>

Content-Type: application/json
Accept: application/json

body:

{
  "status": "cancelled"
}

</pre>
</code>

### Response:

<pre>
<code>

status: 200
body:

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
</pre>
</code>
</details>

## Update Subscription Frequency: 

- Upon sending an updated frequency in the request, the new corresponding price will be generated in the response

### Request:

<pre>
<code>

Content-Type: application/json
Accept: application/json

body:

{
  "frequency": "weekly"
}

</pre>
</code>

### Response:

<pre>
<code>

status: 200
body:

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
</pre>
</code>
</details>

## Update Subscription Title: 

### Request:

<pre>
<code>

Content-Type: application/json
Accept: application/json

body:

{
  "title": "Way Cooler Title"
}

</pre>
</code>

### Response:

<pre>
<code>

status: 200
body:

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
</pre>
</code>
</details>
</details>