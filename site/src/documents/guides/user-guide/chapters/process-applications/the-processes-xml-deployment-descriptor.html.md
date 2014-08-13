---

title: 'The processes.xml deployment descriptor'
category: 'Process Applications'
weight: 30

---

The processes.xml deployment descriptor contains the deployment metadata for a process application. The following example is a simple example of a `processes.xml` deployment descriptor:

    <process-application
      xmlns="http://www.camunda.org/schema/1.0/ProcessApplication"
      xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">

      <process-archive name="loan-approval">
        <process-engine>default</process-engine>
        <properties>
          <property name="isDeleteUponUndeploy">false</property>
          <property name="isScanForProcessDefinitions">true</property>
        </properties>
      </process-archive>

    </process-application>

A single deployment (process-archive) is declared. The process archive has the name *loan-approval* and is deployed to the process engine with the name *default*. Two additional properties are specified:

  * `isDeleteUponUndeploy`: this property controls whether the undeployment of the process application should entail that the process engine deployment is deleted from the database. The default setting is false. If this property is set to true, undeployment of the process application leads to the removal of the deplyoment (including process instances) from the database.
  * `isScanForProcessDefinitions`: if this property is set to true, the classpath of the process application is automatically scanned for process definition resources. Process definition resources must end in `.bpmn20.xml` or `.bpmn`.

See [Deployment Descriptor Reference](ref:/api-references/deployment-descriptors/#descriptors-processesxml) for complete documentation of the syntax of the `processes.xml` file.

## Empty processes.xml

The processes.xml may optionally be empty (left blank). In this case default values are used. The empty processes.xml corresponds to the following configuration:

    <process-application
      xmlns="http://www.camunda.org/schema/1.0/ProcessApplication"
      xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">

      <process-archive>
        <properties>
          <property name="isDeleteUponUndeploy">false</property>
          <property name="isScanForProcessDefinitions">true</property>
        </properties>
      </process-archive>

    </process-application>

The empty processes.xml will scan for process definitions and perform a single deployment to the default process engine.

## Location of the processes.xml file

The default location of the processes.xml file is `META-INF/processes.xml`. The camunda BPM platform will parse and process all processes.xml files on the classpath of a process application. Composite process applications (WAR / EAR) may carry multiple subdeployments providing a META-INF/processes.xml file.

In an apache maven based project, add the the processes.xml file to the `src/main/resources/META-INF` folder.

## Custom location for the processes.xml file

If you want to specify a custom location for the processes.xml file, you need to use the `deploymentDescriptors` property of the `@ProcessApplication` annotation:

    @ProcessApplication(
        name="my-app",
        deploymentDescriptors={"path/to/my/processes.xml"}
    )
    public class MyProcessApp extends ServletProcessApplication {

    }

The provided path(s) must be resolvable through the `ClassLoader#getResourceAsStream(String)`-Method of the classloader returned  by the `AbstractProcessApplication#getProcessApplicationClassloader()` method of the process application.

Multiple distinct locations are supported.

## Configuring process engines in the processes.xml file

The processes.xml file can also be used for configuring one or multiple process engine(s). The following is an example of a configuration of a process engine inside a processes.xml file:

    <process-application
    xmlns="http://www.camunda.org/schema/1.0/ProcessApplication"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">

      <process-engine name="my-engine">
        <configuration>org.camunda.bpm.engine.impl.cfg.StandaloneInMemProcessEngineConfiguration</configuration>
      </process-engine>

      <process-archive name="loan-approval">
        <process-engine>my-engine</process-engine>
        <properties>
          <property name="isDeleteUponUndeploy">false</property>
          <property name="isScanForProcessDefinitions">true</property>
        </properties>
      </process-archive>

    </process-application>

The `<configuration>...</configuration>` property allows specifying the name of a process engine configuration class to be used when building the process engine.

## Process Application Deployment

When deploying a set of BPMN 2.0 files to the process engine, a process deployment is created. The process deployment is performed to the process engine database so that when the process engine is stopped and restarted, the process definitions can be restored from the database and execution can continue. When a process application performs a deployment, in addition to the database deployment it will create a registration for this deployment with the process engine. This is illustrated in the following figure:

<center><img class="img-responsive" src="ref:asset:/guides/user-guide/assets/img/process-application-deployment.png"></img></center>

Deployment of the process application "invoice.war" is illustrated on the left hand side:

1. The process application "invoice.war" deploys the invoice.bpmn file to the process engine.
2. The process engine checks the database for a previous deployment. In this case, no such deployment exists. As a result, a new database deployment `deployment-1` is created for the process definition.
3. The process application is registered for the `deployment-1` and the registration is returned.

When the process application is undeployed, the registration for the deployment is removed (see right hand side of the illustration above). After the registration is cleared, the deployment is still present in the database.

The registration allows the process engine to load additional Java Classes and resources from the process application when executing the processes. In contrast to the database deployment, which can be restored whenever the process engine is restarted, the registration of the process application is kept as in-memory state. This in-memory state is local to an individual cluster node, allowing us to undeploy or redeploy a process application on a particular cluster node without affecting the other nodes and without having to restart the process engine. If the Job Executor is deployment aware, job execution will also stop for jobs created by this process application. However, as a consequence, the registration also needs to be re-created when the application server is restarted. This happens automatically if the process application takes part in the application server deployment lifecycle. For instance, ServletProcessApplications are deployed as ServletContextListeners and when the servlet context is started, it creates the deployment and registration with the process engine. The redeployment process is illustrated in the next figure:

<center><img class="img-responsive" src="ref:asset:/guides/user-guide/assets/img/process-application-redeployment.png"></img></center>

(a) Left hand side: invoice.bpmn has not changed:

1. The process application "invoice.war" deploys the invoice.bpmn file to the process engine.
2. The process engine checks the database for a previous deployment. Since `deployment-1` is still present in the database, the process engine compares the xml content of the database deployment with the bpmn20.xml file from the process application. In this case, both xml documents are identical which means that the existing deployment can be resumed.
3. The process application is registered for the existing deployment `deployment-1`.

(b) Right hand side: invoice.bpmn has changed:

1. The process application "invoice.war" deploys the invoice.bpmn file to the process engine.
2. The process engine checks the database for a previous deployment. Since `deployment-1` is still present in the database, the process engine compares the xml content of the database deployment with the invoice.bpmn file from the process application. In this case, changes are detected which means that a new deployment must be created.
3. The process engine creates a new deployment `deployment-2`, containing the updated invoice.bpmn process.
3. The process application is registered for the new deployment `deployment-2` AND the existing deployment `deployment-1`.

The resuming of the previous deployment (deployment-1) is a feature called `resumePreviousVersions` and is activated by default. If you want to deactivate this feature, you have to set the property to `false` in processes.xml file:

    <process-application
    xmlns="http://www.camunda.org/schema/1.0/ProcessApplication"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">

      <process-archive name="loan-approval">
        ...
        <properties>
          ...
          <property name="isResumePreviousVersions">false</property>
        </properties>
      </process-archive>

    </process-application>
