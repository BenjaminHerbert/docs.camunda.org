---

title: 'Expression Resolving'
category: 'Cdi and Java EE Integration'
weight: 40

---

The `camunda-engine-cdi` library exposes Cdi beans via Expression Language, using a custom resolver. This makes it possible to reference beans from the process:

    <userTask id="authorizeBusinessTrip" name="Authorize Business Trip"
                            camunda:assignee="#{authorizingManager.account.username}" />
    </script>

Where "authorizingManager" could be a bean provided by a producer method:

```
@Inject
@ProcessVariable
private Object businessTripRequesterUsername;

@Produces
@Named
public Employee authorizingManager() {
        TypedQuery<Employee> query = entityManager.createQuery("SELECT e FROM Employee e WHERE e.account.username='"
                + businessTripRequesterUsername + "'", Employee.class);
        Employee employee = query.getSingleResult();
        return employee.getManager();
}
```

We can use the same feature to call a business method of an EJB in a service task, using the `camunda:expression="myEjb.method()"`-extension.
Note that this requires a `@Named`-annotation on the MyEjb-class.
