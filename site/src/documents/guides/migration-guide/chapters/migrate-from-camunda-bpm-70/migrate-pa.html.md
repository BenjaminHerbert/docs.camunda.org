---

title: 'Migrate your Process Application'
category: 'Migrate from camunda bpm 7.0 to 7.1'
weight: 20

---

To migrate your process application from from camunda BPM 7.0 to camunda BPM 7.1, you need to follow these steps:

*   If you use `@Inject` with TaskForm, you have to add a `@Named("...")` annotation to the `@Inject` annotation due to backward-compatibility of `camunda.taskForm`. 
	There you have two choices: If you are using `camunda.taskForm` in your process application and don't want to update all your jsf pages and beans you should use `@Named("camunda.taskForm")`, 
	otherwise you should use `@Named("camundaTaskForm")`. Your application server should write an error or a warning if you use the wrong one. So be careful! However, we recommend you to use the annotation `@Named("camundaTaskForm")`.
