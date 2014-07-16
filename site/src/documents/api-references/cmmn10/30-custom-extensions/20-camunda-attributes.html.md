---

title: 'camunda Extension Attributes'
category: 'Custom Extensions'

---

The following attributes are extension attributes for the `camunda` namespace `http://camunda.org/schema/1.0/cmmn`.

### camunda:assignee

<table class="table table-striped">
  <tr>
    <th>Description</th>
    <td>
      The attribute specifies a performer of a <a href="ref:#tasks-human-task">Human Task</a>.
    </td>
  </tr>
  <tr>
    <th>Type</th>
    <td><code>java.lang.String</code> or <code>org.camunda.bpm.engine.delegate.Expression</code></td>
  </tr>
  <tr>
    <th>Possible Values</th>
    <td>
      The name of a performer as <code>java.lang.String</code> or an expression which evaluates to a <code>java.lang.String</code> e.g. <code>${perfomer}</code>
    </td>
  </tr>
  <tr>
    <th>Default Value</th>
    <td>&ndash;</td>
  </tr>
  <tr>
    <th>CMMN 1.0 Elements</th>
    <td>
      <a href="ref:#tasks-human-task">Human Task</a>
    </td>
  </tr>
</table>


### camunda:candidateGroups

<table class="table table-striped">
  <tr>
    <th>Description</th>
    <td>
      The attribute specifies which group(s) will be candidate for performing the <a href="ref:#tasks-human-task">Human Task</a>.
    </td>
  </tr>
  <tr>
    <th>Type</th>
    <td><code>java.lang.String</code> or <code>org.camunda.bpm.engine.delegate.Expression</code></td>
  </tr>
  <tr>
    <th>Possible Values</th>
    <td>
      Comma separated list of group ids as <code>java.lang.String</code> or expressions that evaluate to a <code>java.lang.String</code> or a <code>java.util.Collection</code> of <code>java.lang.String</code>, e.g. <code>management</code> or <code>management, ${accountancyGroupId()}</code>
    </td>
  </tr>
  <tr>
    <th>Default Value</th>
    <td>&ndash;</td>
  </tr>
  <tr>
    <th>CMMN 1.0 Elements</th>
    <td>
      <a href="ref:#tasks-human-task">Human Task</a>
    </td>
  </tr>
</table>

### camunda:candidateUsers

<table class="table table-striped">
  <tr>
    <th>Description</th>
    <td>
      The attribute specifies which user(s) will be candidate for performing the <a href="ref:#tasks-human-task">Human Task</a>.
    </td>
  </tr>
  <tr>
    <th>Type</th>
    <td><code>java.lang.String</code> or <code>org.camunda.bpm.engine.delegate.Expression</code></td>
  </tr>
  <tr>
    <th>Possible Values</th>
    <td>
      Comma separated list of user ids as <code>java.lang.String</code> or expressions that evaluate to a <code>java.lang.String</code> or a <code>java.util.Collection</code> of <code>java.lang.String</code>, e.g. <code>kermit, gonzo</code> or <code>${ldapService.findAllSales()}</code>
    </td>
  </tr>
  <tr>
    <th>Default Value</th>
    <td>&ndash;</td>
  </tr>
  <tr>
    <th>CMMN 1.0 Elements</th>
    <td>
      <a href="ref:#tasks-human-task">Human Task</a>
    </td>
  </tr>
</table>

### camunda:caseBinding

<table class="table table-striped">
  <tr>
    <th>Description</th>
    <td>
      The attribute specifies which case definition version should be called inside the case task.
    </td>
  </tr>
  <tr>
    <th>Type</th>
    <td><code>java.lang.String</code></td>
  </tr>
  <tr>
    <th>Possible Values</th>
    <td>
      <code>latest</code>, <code>deployment</code>, <code>version</code>
    </td>
  </tr>
  <tr>
    <th>Constraints</th>
    <td colspan="2">
      If the value is set to <code>version</code> the attribute <a href="ref:#custom-extensions-camunda-extension-attributes-camundacaseversion">camunda:caseVersion</a> is required, see <a href="ref:#subprocesses-call-activity-calledelement-binding">Called Element Binding</a> for more information.
    </td>
  </tr>
  <tr>
    <th>Default Value</th>
    <td>&ndash;</td>
  </tr>
  <tr>
    <th>CMMN 1.0 Elements</th>
    <td>
      <a href="ref:#tasks-case-tasks">Case Task</a>
    </td>
  </tr>
</table>

### camunda:caseVersion

<table class="table table-striped">
  <tr>
    <th>Description</th>
    <td>
      The attribute <strong>explicitly</strong> defines which case definition version should be called inside the case task.
    </td>
  </tr>
  <tr>
    <th>Type</th>
    <td><code>java.lang.Integer</code> or <code>org.camunda.bpm.engine.delegate.Expression</code></td>
  </tr>
  <tr>
    <th>Possible Values</th>
    <td>
      All deployed version numbers of the case definition to call or an expression which evaluates to a <code>java.lang.Integer</code>
    </td>
  </tr>
  <tr>
    <th>Default Value</th>
    <td>&ndash;</td>
  </tr>
  <tr>
    <th>CMMN 1.0 Elements</th>
    <td>
      <a href="ref:#tasks-case-tasks">Case Task</a>
    </td>
  </tr>
</table>

### camunda:dueDate

<table class="table table-striped">
  <tr>
    <th>Description</th>
    <td>
      The attribute specifies the initial due date of a <a href="ref:#tasks-human-task">Human Task</a> when it is created.
    </td>
  </tr>
  <tr>
    <th>Type</th>
    <td><code>org.camunda.bpm.engine.delegate.Expression</code></td>
  </tr>
  <tr>
    <th>Possible Values</th>
    <td>
      An expression which evaluates to a <code>java.util.Date</code>, <code>java.util.String</code> (<a href="http://en.wikipedia.org/wiki/ISO_8601">ISO 8601</a> formatted) or <code>null</code>, e.g. <code>${dueDate}</code>
    </td>
  </tr>
  <tr>
    <th>Default Value</th>
    <td>&ndash;</td>
  </tr>
  <tr>
    <th>CMMN 1.0 Elements</th>
    <td>
      <a href="ref:#tasks-human-task">Human Task</a>
    </td>
  </tr>
</table>

### camunda:formKey

<table class="table table-striped">
  <tr>
    <th>Description</th>
    <td>
      The attribute specifies a form resource. See <a href="ref:/guides/user-guide/#tasklist-task-forms">task forms</a> for more information.
    </td>
  </tr>
  <tr>
    <th>Type</th>
    <td><code>java.lang.String</code></td>
  </tr>
  <tr>
    <th>Possible Values</th>
    <td>
      A <code>java.lang.String</code> of a form resource which can be evaluated by the <a href="ref:/guides/user-guide/#tasklist">Tasklist</a>
    </td>
  </tr>
  <tr>
    <th>Default Value</th>
    <td>&ndash;</td>
  </tr>
  <tr>
    <th>CMMN 1.0 Elements</th>
    <td>
      <a href="ref:#tasks-human-task">Human Task</a>
    </td>
  </tr>
</table>

### camunda:priority

<table class="table table-striped">
  <tr>
    <th>Description</th>
    <td>
      The attribute specifies the initial priority of a <a href="ref:#tasks-human-task">Human Task</a> when it is created.
    </td>
  </tr>
  <tr>
    <th>Type</th>
    <td><code>org.camunda.bpm.engine.delegate.Expression</code></td>
  </tr>
  <tr>
    <th>Possible Values</th>
    <td>
      An expression which evaluates to a <code>java.lang.Number</code> or a <code>java.lang.String</code> which represents a number or <code>null</code>, e.g. <code>${priority}</code>
    </td>
  </tr>
  <tr>
    <th>Default Value</th>
    <td>&ndash;</td>
  </tr>
  <tr>
    <th>CMMN 1.0 Elements</th>
    <td>
      <a href="ref:#tasks-human-task">Human Task</a>
    </td>
  </tr>
</table>

### camunda:processBinding

<table class="table table-striped">
  <tr>
    <th>Description</th>
    <td>
      The attribute specifies which process definition version should be called inside the process task.
    </td>
  </tr>
  <tr>
    <th>Type</th>
    <td><code>java.lang.String</code></td>
  </tr>
  <tr>
    <th>Possible Values</th>
    <td>
      <code>latest</code>, <code>deployment</code>, <code>version</code>
    </td>
  </tr>
  <tr>
    <th>Constraints</th>
    <td colspan="2">
      If the value is set to <code>version</code> the attribute <a href="ref:#custom-extensions-camunda-extension-attributes-camundaprocessversion">camunda:processVersion</a> is required, see <a href="ref:#tasks-process-task-process-binding">Called Element Binding</a> for more information.
    </td>
  </tr>
  <tr>
    <th>Default Value</th>
    <td>&ndash;</td>
  </tr>
  <tr>
    <th>CMMN 1.0 Elements</th>
    <td>
      <a href="ref:#tasks-process-tasks">Process Task</a>
    </td>
  </tr>
</table>

### camunda:processVersion

<table class="table table-striped">
  <tr>
    <th>Description</th>
    <td>
      The attribute <strong>explicitly</strong> defines which process definition version should be called inside the process task.
    </td>
  </tr>
  <tr>
    <th>Type</th>
    <td><code>java.lang.Integer</code> or <code>org.camunda.bpm.engine.delegate.Expression</code></td>
  </tr>
  <tr>
    <th>Possible Values</th>
    <td>
      All deployed version numbers of the process definition to call or an expression which evaluates to a <code>java.lang.Integer</code>
    </td>
  </tr>
  <tr>
    <th>Default Value</th>
    <td>&ndash;</td>
  </tr>
  <tr>
    <th>CMMN 1.0 Elements</th>
    <td>
      <a href="ref:#tasks-process-tasks">Process Task</a>
    </td>
  </tr>
</table>