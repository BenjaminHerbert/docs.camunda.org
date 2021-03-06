---

title: 'Get Task Attachments'
category: 'Task'

keywords: 'get task attachments'

---


Gets the attachments for a task.


Method
------

GET `/task/{id}/attachment`


Parameters
----------

#### Path Parameters

<table class="table table-striped">
  <tr>
    <th>Name</th>
    <th>Description</th>
  </tr>
  <tr>
    <td>id</td>
    <td>The id of the task to retrieve the attachments for.</td>
  </tr>
</table>

Result
------

A JSON object containing a list of task attachments.

<table class="table table-striped">
  <tr>
    <th>Name</th>
    <th>Value</th>
    <th>Description</th>
  </tr>
  <tr>
    <td>id</td>
    <td>String</td>
    <td>The id of the task attachment.</td>
  </tr>
  <tr>
    <td>name</td>
    <td>String</td>
    <td>The name of the task attachment.</td>
  </tr>
  <tr>
    <td>taskId</td>
    <td>String</td>
    <td>The id of the task to which the comment belongs.</td>
  </tr>
  <tr>
    <td>description</td>
    <td>String</td>
    <td>The description of the task attachment.</td>
  </tr>
  <tr>
    <td>type</td>
    <td>String</td>
    <td>Indication of the type of content that this attachment refers to. Can be MIME type or any other indication.</td>
  </tr>
  <tr>
    <td>url</td>
    <td>String</td>
    <td>The url to the remote content of the task attachment.</td>
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
    <td>404</td>
    <td>application/json</td>
    <td>No task exists for the given task id. See the <a href="#overview-introduction">Introduction</a> for the error response format.</td>
  </tr>
</table>


Example
-------

#### Request

GET `/task/aTaskId/attachment`

#### Response

```json
[
  {
    "id": "attachmentId",
    "name": "attachmentName",
    "taskId": "aTaskId",
    "description": "attachmentDescription",
    "type": "attachmentType",
	"url": "http://my-attachment-content-url.de"
  },
  {
    "id": "anotherAttachmentId",
    "name": "anotherAttachmentName",
    "taskId": "aTaskId",
    "description": "anotherAttachmentDescription",
    "type": "anotherAttachmentType",
	"url": "http://my-another-attachment-content-url.de"
  },
  {
    "id": "yetAnotherAttachmentId",
    "name": "yetAnotherAttachmentName",
    "taskId": "aTaskId",
    "description": "yetAnotherAttachmentDescription",
    "type": "yetAnotherAttachmentType",
	"url": "http://yet-another-attachment-content-url.de"
  }
]
```
