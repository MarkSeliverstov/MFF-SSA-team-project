## Views

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

## API Decomposition View

![](embed:apiDiagram)