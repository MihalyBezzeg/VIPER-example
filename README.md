# Summary of the demo application
The application displays one simple table view with input fields in the cells. Each cell should allow text input and the last two cells  should have a clear and a show input button.
Pressing the clear button should erase all the inputs from the cells, and pressing the show input button should present all the values in an AlertView.

# The architecture
The demo application demonstrates the usage of (B)VIPER architecture with Reactive programming.
(B)VIPER uses an additional **Builder** layer which is responsible for assembling modules by using Dependency Injection and results in easily replaceable components. For example, if you have different login modules for different userbase Builder will be able to instantiate the right component.

* **View:** Views display the received data for the users and they should be easy to replace.
* **Interactor:** Interactor is responsible for the business logic layer and for collecting data from different places (eg using a service,  cache or database)
* **Presenter:** Presenter is the coordinator of the architecture: it uses the interactor to for generating the next set of data and drive the views with the results.
* **Entity:** Entities are transformed objects used communicating between the components 
* **Router:** Routers are responsible for handling the navigation between components, eg screen transitions or presenting alerts.
* **Service:** Services are responsible for collecting the actual data, eg: using API calls or using the database layer.

In the demo application I used RxSwift instead of delegation pattern, where the observable data are defined through **Event Emitters**. With the solution it's easy to define module-wide or global events which can be observed from any part of the application and makes simple to react to changes.  
