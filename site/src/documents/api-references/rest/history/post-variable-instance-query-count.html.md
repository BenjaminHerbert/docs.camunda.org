---

title: 'Get Variable Instances Count (POST)'
category: 'History'

keywords: 'historic post query list'

---


Query for historic variable instances that fulfill the given parameters.
This method takes the same message body as the [POST query](ref:#history-get-variable-instances-post) and therefore it is more powerful regarding variable values than the [GET query count](ref:#history-get-variable-instances) method.


Method
------

POST `/history/variable-instance/count`


Parameters
----------

#### Request body

A JSON object with the following properties:

<table class="table table-striped">
  <tr>
    <th>Name</th>
    <th>Description</th>
  </tr>
  <tr>
    <td>variableName</td>
    <td>Filter by variable name.</td>
  </tr>
  <tr>
    <td>variableNameLike</td>
    <td>Restrict to variables with a name like the parameter.</td>
  </tr>
  <tr>
    <td>variableValue</td>
    <td>Filter by variable value. May be <code>String</code>, <code>Number</code> or <code>Boolean</code>.</td>
  </tr>
  <tr>
    <td>processInstanceId</td>
    <td>Filter by the process instance the variable belongs to.</td>
  </tr>
  <tr>
    <td>executionIdIn</td>
    <td>Only include historic variable instances which belong to one of the passed execution ids.</td>
  </tr>
  <tr>
    <td>caseInstanceId</td>
    <td>Filter by the case instance the variable belongs to.</td>
  </tr>
  <tr>
    <td>caseExecutionIdIn</td>
    <td>Only include historic variable instances which belong to one of the passed case execution ids.</td>
  </tr>
  <tr>
    <td>taskIdIn</td>
    <td>Only include historic variable instances which belong to one of the passed task ids.</td>
  </tr>
  <tr>
    <td>activityInstanceIdIn</td>
    <td>Only include historic variable instances which belong to one of the passed activity instance ids.</td>
  </tr>
</table>


Result
------

A JSON object that contains the count as the only property.

<table class="table table-striped">
  <tr>
    <th>Name</th>
    <th>Value</th>
    <th>Description</th>
  </tr>
  <tr>
    <td>count</td>
    <td>Number</td>
    <td>The number of matching historic variable instances.</td>
  </tr>
</table>


Response codes
--------------

<table class="table table-striped">
  <tr>
    <th>Code</th>
    <th>Media type</th>
    <th>Description</th>
  </tr>
  <tr>
    <td>200</td>
    <td>application/json</td>
    <td>Request successful.</td>
  </tr>
  <tr>
    <td>400</td>
    <td>application/json</td>
    <td>Returned if some of the query parameters are invalid. See the <a href="ref:#overview-introduction">Introduction</a> for the error response format.</td>
  </tr>
</table>


Example
-------

#### Request

POST `/history/variable-instance/count`

Request body:

```json
{
  "variableName": "someVariable",
  "variableValue": 42
}
```

#### Response

```json
{
  "count": 1
}
```
