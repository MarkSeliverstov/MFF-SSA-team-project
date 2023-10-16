Business logic: schedule for management, schedule for teacher/student

# Resp

## Schedule managment

### Data collection responsibilities
* Retrieve a list of available subjects, rooms, and buildings for the current semester from the database.
* Ensure that data is syntactically correct.

##### Visualization responsibilities
* Display a calendar with a list of subjects.
* Load a form for the selected subject.
* Add the created schedule to the calendar view.
* Notify the Committee if there is a conflict.

### Editing Schedule
* Save the created schedule to the database.

### Validation schedule
* Validate data

##### Form responsibilities
* Input the time, frequency, and class in which the subject will be taught.
* Prefill existing info about scheduled subject.

##### Notification responsibilities
* Notify the Committee if there is a conflict.
* Notify the Committee if the schedule is successfully created.
* Notify the Committee if the schedule is not created due to an error.

## Schedule viewing

### Visualization responsibilities
* Display a calendar with a list of subjects.
* Add the created schedule to the calendar view.

### Exporting responsibilities
* Export schedule as csv/pdf/ics

### For student

##### Notification responsibilities
* Canceling of classes

##### Data collection responsibilities
* Retrieve a list of subjects that the student has enrolled for the current semester from the database.

### For Teacher

##### Data collection responsibilities
* Retrieve a list of subjects that the teacher will teach in the current semester from the database.