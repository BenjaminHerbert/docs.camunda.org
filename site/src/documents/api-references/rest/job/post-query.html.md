---

title: 'Get Jobs (POST)'
category: 'Job'

keywords: 'post query list'

---


Query for jobs that fulfill given parameters. This method is slightly more powerful than the [GET query](ref:#job-get-jobs) because it allows filtering by multiple jobs of types <code>String</code>, <code>Number</code> or <code>Boolean</code>.


Method
------

POST <code>/job</code>


Parameters
----------

#### Query Parameters

<table class="table table-striped">
  <tr>
    <th>Name</th>
    <th>Description</th>
  </tr>
  <tr>
    <td>firstResult</td>
    <td>Pagination of results. Specifies the index of the first result to return.</td>
  </tr>
  <tr>
    <td>maxResults</td>
    <td>Pagination of results. Specifies the maximum number of results to return. Will return less results if there are no more results left.</td>
  </tr>
</table>

#### Request Body

A JSON object with the following properties:

<table class="table table-striped">
  <tr>
    <th>Name</th>
    <th>Description</th>
  </tr>
  <tr>
    <td>jobId</td>
    <td>Filter by job id.</td>
  </tr>
  <tr>
    <td>processInstanceId</td>
    <td>Only select jobs which exist for the given process instance.</td>
  </tr>
  <tr>
    <td>executionId</td>
    <td>Only select jobs which exist for the given execution.</td>
  </tr>
  <tr>
    <td>processDefinitionId</td>
    <td>Filter by the id of the process definition the jobs run on.</td>
  </tr>
  <tr>
    <td>processDefinitionKey</td>
    <td>Filter by the key of the process definition the jobs run on.</td>
  </tr>
  <tr>
    <td>activityId</td>
    <td>Only select jobs which exist for an activity with the given id.</td>
  </tr>
  <tr>
    <td>withRetriesLeft</td>
    <td>Only select jobs which have retries left. Valid value is a <code>boolean</code>.</td>
  </tr>
  <tr>
    <td>executable</td>
    <td>Only select jobs which are executable, ie. retries &gt; 0 and due date is <code>null</code> or due date is in the past. Valid value is a <code>boolean</code>.</td>
  </tr>
  <tr>
    <td>timers</td>
    <td>Only select jobs that are timers. Cannot be used together with <code>messages</code>. Valid value is a <code>boolean</code>.</td>
  </tr>
  <tr>
    <td>messages</td>
    <td>Only select jobs that are messages. Cannot be used together with <code>timers</code>. Valid value is a <code>boolean</code>.</td>
  </tr>
  <tr>
    <td>dueDates</td>
    <td>Only select jobs where the due date is lower or higher than the given date.
    Due date expressions are comma-separated and are structured as follows:<br/>
    A valid condition value has the form <code>operator_value</code>.
    <code>operator</code> is the comparison operator to be used and <code>value</code> the date value as string.<br/>
    <br/>
    Valid operator values are: <code>gt</code> - greater than; <code>lt</code> - lower than.<br/>
    <code>value</code> may not contain underscore or comma characters.
    </td>
  </tr>
  <tr>
    <td>withException</td>
    <td>Only select jobs that failed due to an exception. Valid value is a <code>boolean</code>.</td>
  </tr>
  <tr>
    <td>exceptionMessage</td>
    <td>Only select jobs that failed due to an exception with the given message.</td>
  </tr>
  <tr>
    <td>noRetriesLeft</td>
    <td>Only select jobs which have no retries left.</td>
  </tr>
  <tr>
    <td>active</td>
    <td>Only include active jobs.</td>
  </tr>
  <tr>
    <td>suspended</td>
    <td>Only include active jobs.</td>
  </tr>
  <tr>
    <td>sortBy</td>
    <td>Sort the results lexicographically by a given criterion. Valid values are
    <code>jobId</code>, <code>executionId</code>, <code>processInstanceId</code>, <code>jobRetries</code> and <code>jobDueDate</code>.
    Must be used in conjunction with the <code>sortOrder</code> parameter.</td>
  </tr>
  <tr>
    <td>sortOrder</td>
    <td>Sort the results in a given order. Values may be <code>asc</code> for ascending order or <code>desc</code> for descending order.
    Must be used in conjunction with the <code>sortBy</code> parameter.</td>
  </tr>
</table>


Result
------

A JSON array of job objects.
Each job object has the following properties:

<table class="table table-striped">
  <tr>
    <th>Name</th>
    <th>Value</th>
    <th>Description</th>
  </tr>
  <tr>
    <td>id</td>
    <td>String</td>
    <td>The id of the job.</td>
  </tr>
  <tr>
    <td>dueDate</td>
    <td>String</td>
    <td>The date on which this job is supposed to be processed.</td>
  </tr>
  <tr>
    <td>processInstanceId</td>
    <td>String</td>
    <td>The id of the process instance which execution created the job.</td>
  </tr>
  <tr>
    <td>executionId</td>
    <td>String</td>
    <td>The specific execution id on which the job was created.</td>
  </tr>
  <tr>
    <td>processDefinitionId</td>
    <td>String</td>
    <td>The id of the process definition which this job belongs to.</td>
  </tr>
  <tr>
    <td>processDefinitionKey</td>
    <td>String</td>
    <td>The key of the process definition which this job belongs to.</td>
  </tr>
  <tr>
    <td>retries</td>
    <td>Number</td>
    <td>The number of retries this job has left.</td>
  </tr>
  <tr>
    <td>exceptionMessage</td>
    <td>String</td>
    <td>The message of the exception that occurred, the last time the job was executed. Is null when no exception occurred.</td>
  </tr>
  <tr>
    <td>suspended</td>
    <td>Boolean</td>
    <td>A flag indicating whether the job is suspended or not.</td>
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
    <td>Returned if some of the query parameters are invalid, for example if a <code>sortOrder</code> parameter is supplied, but no <code>sortBy</code>, or if an invalid operator for due date comparison is used. See the <a href="ref:#overview-introduction">Introduction</a> for the error response format.</td>
  </tr>
</table>


Example
-------

#### Request

<!-- TODO: Insert a 'real' example -->
POST <code>/job</code>

Request body:

    {
      "dueDates":
        [
          {
            "operator": "gt",
            "value": "2012-07-17'T'17:00:00"
          },
          {
            "operator": "lt",
            "value": "2012-07-17'T'18:00:00"
          }
        ]
    }

#### Response

    [
      {
        "id": "aJobId",
        "dueDate": "2013-07-17'T'17:05:00",
        "processInstanceId": "aProcessInstanceId",
        "executionId": "anExecutionId",
        "retries": 0,
        "exceptionMessage": "An exception Message"
      },
      {
        "id": "anotherJobId",
        "dueDate": "2013-07-17'T'17:55:00",
        "processInstanceId": "aProcessInstanceId",
        "executionId": "anotherExecutionId",
        "retries": 0,
        "exceptionMessage": "Another exception Message"
      }
    ]
