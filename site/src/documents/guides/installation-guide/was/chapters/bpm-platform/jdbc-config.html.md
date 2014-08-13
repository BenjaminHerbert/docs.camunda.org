---

title: 'JDBC / Datasource Configuration'
category: 'BPM Platform'
weight: 30

---


The camunda BPM engine uses one or multiple process engines. Use your application server management tooling for the configuration of the datasources.
The JNDI name of the datasource must be equal to the name used in the datasource-Element of the process engine(s) configured in the bpm-platform.xml file.


## Default JNDI Name

The default JNDI name is <code>jdbc/ProcessEngine</code>

The following screenshot shows the configuration of an XA datasource: 

<a href="ref:asset:/guides/installation-guide/was/assets/img/jdbc.png" target="_blank">
  <img class="tile" src="ref:asset:/guides/installation-guide/was/assets/img/jdbc.png" alt=""/>
</a>

Note that you may configure multiple datasources used by different process engine instances. See the <a href="ref:/guides/user-guide/">User Guide</a> for details.