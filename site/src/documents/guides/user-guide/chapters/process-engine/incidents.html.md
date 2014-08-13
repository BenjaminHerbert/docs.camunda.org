---

title: 'Incidents'
category: 'Process Engine'
weight: 180

---

Incidents are notable events that happen in the process engine. Such incidents usually indicate some kind of problem related to process execution. Examples of such incidents may be a failed job with elapsed retries (retries = 0), indicating that an execution is stuck and manual administrative action is necessary to repair the process instance. Or the fact that a process instance has entered an error state which could be modeled as a BPMN Error Boundary event or a User Task explicitly marked as "error state". If such incidents arise, the process engine fires an internal event which can be handled by a configurable incident handler.

In the default configuration, the process engine writes incidents to the process engine database. You may then query the database for different types and kinds of incidents using the `IncidentQuery` exposed by the `RuntimeService`:

    runtimeService.createIncidentQuery()
      .processDefinitionId("someDefinition")
      .list();

Incidents are stored in the ACT_RU_INCIDENT database table.

If you want to customize the incident handling behavior, it is possible to replace the default incident handlers in the process engine configuration and provide custom implementations (see below).

## Incident Types

There are different types of incidents. Currently the process engine supports the following incidents:

  * **Failed Job**: this type of incident is raised when automatic retries for a Job (Timer or Asynchronous continuation) have elapsed. The incident indicates that the corresponding execution is stuck and will not continue automatically. Administrative action is necessary.
  The incident is resolved when the job ism manually executed or when the retries for the corresponding job are reset to a value > 0.

## (De-)Activating Incidents

The process engine allows you to configure  whether certain incidents should be raised or not on an incident type base.

The following properties are available in the `org.camunda.bpm.engine.ProcessEngineConfiguration` class:

  * `createIncidentOnFailedJobEnabled`: indicates whether Failed Job incidents should be raised or not.

## Implementing custom Incident Handlers

Incident Handlers are responsible for handling incidents of a certain type (see <a href="ref:#process-engine-incidents-incident-types">Incident Types</a>).

An Incident Handler implements the following interface:

    public interface IncidentHandler {

      public String getIncidentHandlerType();

      public void handleIncident(String processDefinitionId, String activityId, String executionId, String configuration);

      public void resolveIncident(String processDefinitionId, String activityId, String executionId, String configuration);

    }

The `handleIncident` method is called when a new incident is created. The `resolveIncident` method is called when an incident is resolved. If you want to provide a custom incident handler implementation you can replace one or multiple incident handlers using the following method:

    org.camunda.bpm.engine.impl.cfg.ProcessEngineConfigurationImpl.setCustomIncidentHandlers(List<IncidentHandler>)

An example of a custom incident handler could be a handler which, in addition to the default behavior, also sends an email to an administrator.

