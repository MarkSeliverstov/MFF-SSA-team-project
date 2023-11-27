## Views

### Overview

**Schedule System use a 3-tier architecture with API comprised of four interconnected components:**

- Client Application: serves as a presentation layer of our system, providing an interactive and intuitive interface for Committee members, Teachers, and Students.
- Web Application: a core component of the Schedule System, intricately designed to handle various aspects of schedule logic. It designed to streamline the process of creating, analyzing, and validating academic schedules. 
- API: serves as the integrative core of the Schedule System, orchestrating the flow of data between internal components and external systems. 
- Database: Store data
Committees, Teachers, Students use the Client Application to manage and view schedules. The Client Application sends user requests through the API to the Web Application, where the requested tasks are executed. The API plays a pivotal role in both internal communication and external data exchange with integrated systems.

![](embed:Containers)

### Web Application

The Schedule System's Web Application is a core component of the Schedule System, 
intricately designed to handle various aspects of schedule logic. It designed to 
streamline the process of creating, analyzing, and validating academic schedules.

**Components of the Web Application**

- Form Manager: Handles the submission and management of forms by Teachers, where
each teacher can send a form for requestting changes of his schedule.

- Schedule Analyzer: A component that analyzes and validates the schedules, ensuring
they meet set criteria and constraints, such as time slots, teacher availability, 
and room assignments.

- Notificator: It keeps all users informed by sending out timely notifications about
schedule updates, changes, or important alerts. This feature is vital for maintaining 
clear communication within the system.

- Schedule Manager: At the heart of the application, this component oversees the 
creation, updating, and deletion of schedules. It ensures that the scheduling process 
runs smoothly and efficiently.

- Email Sender: Facilitates communication by sending out email notifications, 
working in tandem with the Notificator to ensure timely and accurate information 
dissemination.

![](embed:webappDiagram)

### API

#### Overview

The API container serves as the integrative core of the Schedule System, orchestrating the flow of data between internal components and external systems. It manages incoming and outgoing requests, ensuring that each component of the Schedule System communicates effectively. The API container's role encompasses the authentication of requests, validation of data, and the provision of a structured conduit through which all data passes, thus maintaining the system's integrity and operational efficiency.

#### Responsibilities

The API container is responsible for:

- Managing the bidirectional routing of requests and data between the Client Application and the Web Application.
- Offering the means for the Web Application to interface with the Schedule Database, allowing for efficient data querying and updates.
- Handling authentication and authorization to ensure secure access to the system's functionalities.
- Serving as an intermediary between the system and external systems, such as the Enrollment, Student, and Building Systems.
- Validating incoming data to maintain the integrity of the information processed by the system.

#### Components

**Authentication and Authorization (A&A)**

- **Description:** Enforces security by managing user access rights.
- **Functionality:** Validates user credentials and determines the user's permissions for specific actions within the system. Upon confirming that the user is permitted to perform the requested operation, A&A forwards the request to the Internal API.

**Internal API**

- **Description:** Manages communication between the Client Application and the Web Application.
- **Functionality:**
    - Receives data requests that have been validated and authorized by A&A from the Client Application.
    - Directs these verified requests to the Web Application and conveys the results back to the originating Client Application.

**External API**

- **Description:** Manages the exchange of data between the Schedule System and external systems.
- **Functionality:**
    - Sends requests from Web Application to and receives responses from external systems like the Enrollment, Student, and Building Systems.
    - Coordinates with the External Data Validation component to ensure data integrity.

**External Data Validation**

- **Description:** Validates the correctness and completeness of incoming data.
- **Functionality:**
    - Validates and reformats data from external sources to meet the Web Application's requirements.
    - Once validated and formatted, forwards the data to the Web Application for further processing.

**Database API**

- **Description:** Handles all interactions with the Schedule Database.
- **Functionality:**
    - Performs read and write operations to the database.
    - Processes requests for data retrieval and storage from the Web Application.

![](embed:apiDiagram)

### Client Application

The Client Application in the Schedule System serves as a presentation layer of our 
System, providing an interactive and intuitive interface for Committee members, Teachers, 
and Students.The controller determines which component to show to the user, constructs 
components using data from database extracted via the API and shows the user

**Components of the Client Application**

- **View Controller**: This component acts as the central hub for managing the user interface. 
It dynamically provides the appropriate view based on the user type – Committee, Teacher, 
or Student.

- **Committee View**: Tailored for committee members, this component offers functionalities 
like creating, validating, or changing schedules. It's designed for users who manage and 
oversee the scheduling process.

- **Teacher View**: This component is customized for teachers, allowing them to view their 
schedules and submit requests for schedule changes.

- **Student View**: Designed for students, this component enables them to view their class 
schedules. It's a straightforward interface focused on accessibility and clarity.

- **Calendar**: Specifically for Committee use, this component displays the schedule in a 
calendar view, making it easier to visualize and manage time slots and assignments.

- **List of Subjects**: Another feature for the Committee, this component displays a 
comprehensive list of subjects, aiding in the scheduling process. Upon selecting a 
subject, Committee members can seamlessly switch to the Calendar component. This integration 
allows for a smooth transition from viewing the list of subjects to visualizing them in the 
calendar, aiding in efficient schedule planning.

- **User Settings**: This component allows all users to customize settings, manage profiles,
 and configure preferences, enhancing the overall user experience.

- **Schedule Display**: A vital component for Teachers and Students, it shows their respective 
schedules in an easy-to-understand format.

- **Notifications**: Integrated within the application, this component alerts users about schedule 
changes, updates, or other important information.

- **Requested Form**: Available to Teachers, this component allows them to submit forms requesting
schedule changes, which are then processed by the system.

![](embed:clientDiagram)

### Deployment

Our deployment topology are
- User's Web Server: Serves as the front-end for user interactions.
- Application Server: Hosts web applications and APIs.
- Database Server: Manages the relational database for scheduling.

![](embed:deploymentDiagram)
