# Schedule System

# Core features and responsibilities

## Feature 1: Schedule Creation

As a scheduling committee, I want to create schedules for each class in the semester for teachers and students so that a schedule exists.

#### Feature breakdown
1. The Committee navigates to the dashboard of the system and opens the "Schedule Builder" module.
2. The system retrieves a list of available subjects, rooms, and buildings for the current semester from the database.
3. The Committee sees a calendar with a list of subjects.
4. The Committee chooses a subject.
5. The system loads a form for this subject.
6. The Committee inputs the time, frequency, and class in which this subject will be taught.
7. The system saves the data and adds it to the calendar view, if there is a conflict, the system notifies the Committee.

#### Responsibilities

##### Data collection responsibilities
* Retrieve a list of available subjects, rooms, and buildings for the current semester from the database.
* Ensure that data is syntactically correct.

##### Visualization responsibilities
* Display a calendar with a list of subjects.
* Load a form for the selected subject.
* Add the created schedule to the calendar view.
* Notify the Committee if there is a conflict.

##### Saving responsibilities
* Validate data
* Save the created schedule to the database.

##### Form responsibilities
* Input the time, frequency, and class in which the subject will be taught.
* Prefill existing info about scheduled subject.

##### Notification responsibilities
* Notify the Committee if there is a conflict.
* Notify the Committee if the schedule is successfully created.
* Notify the Committee if the schedule is not created due to an error.


## Feature 2: Teacher Schedule Management

As a teacher, I want to view my schedule for all my classes so that I can see my teaching time, students can see my available time.

#### Feature breakdown
1. Teacher go the the dashboard and click on "Schedule" button
2. The system will show a list of subjects (title, schedule, room, building, number of students enrolled) that the teacher will teach in the current semester by:
    - Day by day view (Default view)
    - Calendar view (weekly view)
3. The system will notify the teachers via email when there is a time conflict. 
4. The teacher can also export their schedule as a PDF, Excel, or ICS file extension. 
5. The teacher can accept the new schedules assigned by the committee or request a new schedule with comments to the committee. 

#### Responsibilities

##### Data collection responsibilities
* Retrieve a list of subjects that the teacher will teach in the current semester from the database.

##### Visualization responsibilities
* Display a calendar with a list of subjects.
* Add the created schedule to the calendar view.

## Feature 3: Student Schedule Access

As a student, I want to vew my schedule for all the classes so that I can manage and plan my studying time accordingly.

#### Feature breakdown
1. Student go to the dashboard and click on "Schedule" button 
2. The system will show a list of subjects (title, schedule, room, building, and professor) that the student has enrolled by:
    - Day by day view (Default view)
    - Calendar view (weekly view)
3. The system will notify the student via email when there is a time conflict. 
4. Student can also export their schedule as a PDF, Excel, or ICS file extension. 
#### Responsibilities

##### Data collection responsibilities
* Retrieve a list of subjects that the student has enrolled for the current semester from the database.
  
##### Visualization responsibilities
* Display a calendar with a list of subjects.
* Add the created schedule to the calendar view.

##### Notification responsibilities
* Canceling of classes

##### Exporting responsibilities
* Export schedule as csv/pdf/ics
