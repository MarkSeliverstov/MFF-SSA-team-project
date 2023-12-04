workspace "Exam Module workspace" "This workspace documents the architecture of the Exam Module which enables teachers to create, manage exam dates and notify students about them, while the students can obtain information and enroll to said exams." {
    model { 
        //software system
        exams = softwareSystem "Exam System" "Enables to create, enroll and evaluate exams."{
            studentDashboard = container "Student Dashboard" "Provides functionalities for enrollment and other student releted tasks in a web browser" "React.js: HTML+JavaScript" "Web Front-End" 
            teacherDashboard = container "Teacher Dashboard"  "Provides functionalities for exam creation and management for the teacher in a web browser" "React.js: HTML+JavaScript" "Web Front-End" 
    
            studentApp = container "Student App" "Provides a dashboard to the students and allows them to enroll to exams and get notified about them."
            teacherApp = container "Teacher App" "Provides a dashboard to the teachers and allows them to create and manage exams."

            apiGateway = container "API Gateway" "Provides a unified interface for the frontend applications to communicate with the backend services."

            subjectProvider = container "Subject Provider" "Allows the possibility to check subjects one is attributed to" {
                subjectRequestHandler = component "Subject Request Handler" "Handles requests from the api gateway and forwards them to the subject controller"
                subjectController = component "Subject Controller" "Allows overview and management of instructed or enrolled subjects"
                subjectRepository = component "Subject Repository" "Serves as a centralized component for retrieving subject-related data"
            }

            studentActivityProvider = container "Student Activity Provider" "Provides information about current status of student" {
                activityRequestHandler = component "Activity Request Handler" "Handles requests from the api gateway and forwards them to the activity controller"
                activityController = component "Activity Controller" "Allows overview and management of students' status"
                activityRepository = component "Activity Repository" "Serves as a centralized component for retrieving student-related data."
            }

            examProvider = container "Exam Provider" "Manages grading, scheduling, and enrollments"{
                examRequestHandler = component "Exam Request Handler" "Handles requests from the api gateway and forwards them to the exam controller"
                scheduleController = component "Schedule Controller" "Manages scheduling-related operations, such as creating, updating, and deleting exams."
                gradingController = component "Grading Controller" "Handles grading tasks."
                enrollmentController = component "Enrollment Controller" "Is responsible for student enrollment processes, retrieves and stores relevant exam information."
                prerequisiteValidator  = component "Prerequisite Validator" "Ensures that students meet necessary requirements before enrolling in specific exams." "" "Service"

                examRepository = component "Exam Repository" "Serves as a centralized component for retrieving exam-related data."
                
                notificationManager = component "Notification Manager" "Provides an interface for sending notifications to students"                
                roomAndTimeTableManager = component "Room and timetable manager" "Manages availability of rooms"
            }

            
            examsDatabase = container "Exams and Students database" "Serves as a centralized component for storing exam-related data." "" "Database" 
        }
        
        //--------- Existing System ---------//
        universitySchedulingSystem = softwareSystem "University Scheduling System" "Provides the necessary data to locate exams." "Existing System"

        mailServer = softwareSystem "Mail Server" "Sends notifications to students about exams." "Existing System"
        
        // --------- Users ---------//
        teacher = person "Teacher" "Responsible for creating and administrating exams"
        student = person "Student" "Enroll to exams and gets notified about them"

        //------------Relations--------//
        teacher -> teacherDashboard "Uses the dashboard provided by"
        student -> studentDashboard "Uses the dashboard provided by"
        
        studentApp -> studentDashboard "Provides the dashboard for"
        teacherApp -> teacherDashboard "Provides the dashboard for"
        
        notificationManager -> mailServer "Sends notifications to students via"
        roomAndTimeTableManager -> universitySchedulingSystem  "Retrieves schedule information from"

        studentDashboard -> apiGateway "Makes API call to"
        teacherDashboard -> apiGateway "Makes API call to"

        apiGateway -> examRequestHandler "Forwards API call to"
        apiGateway -> activityRequestHandler "Forwards API call to"
        apiGateway -> subjectRequestHandler "Forwards API call to"
        
        activityRequestHandler -> activityController "Forwards request to get information about student activity"
        subjectRequestHandler -> subjectController "Forwards request to recieve list of subjects"

        scheduleController -> roomAndTimeTableManager "Requests room availability information from"

        //-----------------Exam Provider View relations----------------------//
        examRequestHandler -> enrollmentController "Forwards request to enroll and get information about exams"    
        examRequestHandler -> scheduleController "Forwards request to schedule exams"
        examRequestHandler -> gradingController "Forwards request to grade exams"
        
        examRepository -> examsDatabase "Fetches/Sends data from/to"
        enrollmentController -> prerequisiteValidator "Checks for student's validity with"
        enrollmentController -> examRepository "Sends exam enrollment data to"
        scheduleController -> examRepository "Sends exam scheduling data to"
        gradingController -> examRepository "Sends exam grading data to"

        prerequisiteValidator  -> examRepository "Recieves exam prerequisites data from"
        prerequisiteValidator -> activityRequestHandler "Asks for student's activity from"

        scheduleController -> notificationManager "Initiates the email sending about scheduled exams" 
        gradingController -> notificationManager "Initiates the email sending about graded exams"
        enrollmentController -> notificationManager "Initiates the email sending about enrollment confirmation"
        
        //-----------------Subject Provider View relations----------------------//
        subjectController -> subjectRepository "Issues commands or requests data from"
        subjectRepository -> examsDatabase "Fetches/Sends data from/to"
        
        //-----------------Activity Provider View relations---------------------//
        activityController -> activityRepository "Issues commands or requests data from"
        activityRepository -> examsDatabase "Fetches/Sends data from/to"
    
        deploymentEnvironment "Live" {
            deploymentNode "Student's web browser" "" "React.js: HTML+JavaScript" {
                studentDashboardInstance = containerInstance studentDashboard
            } 
            deploymentNode "Teacher's web browser" "" "React.js: HTML+JavaScript" {
                teacherDashboardInstance = containerInstance teacherDashboard
            } 

            deploymentNode "Frontend Application server" "" "Ubuntu 22.04.3 LTS" {
                deploymentNode "Student Web Server" "" "Apache Tomcat 10.1.15" {
                    studentAppInstance = containerInstance studentApp
                } 
                deploymentNode "Teacher Web Server" "" "Apache Tomcat 10.1.15" {
                    teacherAppInstance = containerInstance teacherApp
                }
            }
            
            deploymentNode "Backend Application server" "" "Ubuntu 22.04.3 LTS" {
                deploymentNode "Exam Provider" "" "Node.js 20.10.0" {
                    examProviderInstance = containerInstance examProvider
                }
                deploymentNode "Subject Provider" "" "Node.js 20.10.0" {
                    subjectControllerInstance = containerInstance subjectProvider
                }
                deploymentNode "Student Activity Provider" "" "Node.js 20.10.0" {
                    activityControllerInstance = containerInstance studentActivityProvider
                }
                deploymentNode "API Gateway" "" "Node.js 20.10.0" {
                    apiGatewayInstance = containerInstance apiGateway
                }
            }

            deploymentNode "Database server" "" "Ubuntu 22.04.3 LTS" {
                deploymentNode "Database" "" "MySQL 8.0.26" {
                    examsDatabaseInstance = containerInstance examsDatabase
                
                }
            }
        }
    }


    views {
        systemContext exams "examsSystemContextDiagram" {
            include *
            autoLayout lr
        }
        
        container exams "studentAppContainerDiagram" {
            include *
            autoLayout lr
            exclude teacher
            exclude teacherApp
            exclude teacherDashboard
            exclude roomAndTimeTableManager
            exclude universitySchedulingSystem
            exclude "examProvider -> studentActivityProvider"
        }

        container exams "teacherAppContainerDiagram" {
            include *
            autoLayout lr
            exclude student
            exclude studentApp
            exclude studentDashboard
        }

        component examProvider "ExamProvider" {
            include *
            autoLayout lr
            include notificationManager
            include mailServer
            exclude "apiGateway -> studentActivityProvider"
            exclude "studentActivityProvider -> examsDatabase" 
        }

        component studentActivityProvider "StudentActivityProvider" {
            include *
            autoLayout lr
            exclude "apiGateway -> examProvider"
            exclude "examProvider -> examsDatabase" 
        }
        
        component subjectProvider "SubjectProvider" {
            include *
            autoLayout lr
        }
        
        deployment exams "Live" "deploymentDiagram" {
            include *
            autoLayout lr
            exclude "examProvider -> studentActivityProvider"
        }

        theme default   
        
        styles {            
            element "Existing System" {
                background #999999
                color #ffffff
            }
            
            element "Database" {    
                shape Cylinder
            }

            element "Web Front-End"  {
                shape WebBrowser
            }

            element "Service" {
                stroke #ff0000
            }
        }
    }
}