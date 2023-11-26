workspace "SIS" "Description"{

    model {
        # actor
        user = person "User" "Committee, Teacher, Student"
        committee = person "Committee" "Assesses enrollment and building data to create the schedule"
        teacher = person "Teacher" "View schedule and request for schedule change "
        student = person "Student" "View Schedule"
        admin = person "Technical administrator" "Administers measuring devices."
        
        
        # software system
        scheduleSystem = softwareSystem "Schedule System" "Create and view schedule" {
            webapp = container "Web Application" "Create, analyze, and validate schedule." {
                formManager = component "Form Manager" "Forms submitted by users"
                scheduleAnalyzer = component "Schedule analyzer" "Analyze schedule." "Python analyzer"
                notificator = component "Notificator" "Generate notifications and send it" 
                scheduleManager = component "Schedule Manager" "Create/Delete/Update Schedule"
                emailSender = component "Email Sender" "Sends notifications via emails"
                
            }
            client = container "Client Application" "Dashboard, Calendar, Forms" {
                viewController = component "View Controller" "Provide view for different users (Committee, Teacher, Student)"
                committeeView = component "Committee View" "Provide functionality for committee in web browser such as create, validate, or change schedule"
                teacherView = component "Teacher View" "Provide functionality for teacher in web browser such as requesting schedule"
                studentView = component "Student View" "Provide functionality for student in web browser such as viewing schedule"
                
                calendar = component "Calendar (for Committee)" "Display schedule with calendar view"
                subjects = component "List of Subjects (for Committee)" "Display a list of subjects"
                settings = component "User Settings"
                schedule = component "Schedule" "Display teacher and student schedule"
                
                notificationClient = component "Notifications" "A part of the view displaying alerts via API"
                
                form = component "Requested Form" "Request preferred schedule by teacher to committee"
             
                
                
                user -> this "Interact with app"
            }
            api = container "API" "Defines the methods and data formats that use to communicate with systems and database. It is a communication center for the system." {
                internalAPI = component "Internal API" "Communicate with Schedule System"
                externalAPI = component "External API" "Communicate with external systems"
                databaseAPI = component "DataBase API" "Communicate with Schedule DataBase"
                ana = component "Authentication and Authorization" "Implement security measures to ensure that only authorized users can access or modify data. This might involve OAuth tokens, API keys, or other security protocols."
                dataValidation = component "External Data Validation" "Validate incoming data for correctness and completeness before it is processed or stored"
            }
            db = container "Schedule Database" "Store schedule, history, forms" "" "Database" {
            }

            !docs docs
        }
        
        # external system
        enrollmentSystem = softwareSystem "Enrollment System" "Store enrollment records such as available subjects." "Existing System"{
            enrollDB = container "Schedule Database" "Store schedule, history, forms" "" "Database"
        }
        studentSystem = softwareSystem "Student System" "Store student records such as name, age, department, etc." "Existing System"{
            studentDB = container "Student Database" "" "Database"
        }
        buildingSystem = softwareSystem "Building System" "Store records such as available buildings, rooms, etc." "Existing System"{
            buildingDB = container "Building Database" "" "Database"
        }
        
        
        # relationships between external systems and scheduleSystem
        scheduleSystem -> enrollmentSystem "Make API calls to get enrollment data."
        scheduleSystem -> studentSystem "Make API calls to get student data."
        scheduleSystem -> buildingSystem "Make API calls to get building data."
        
        # relationships between users and scheduleSystem
        committee -> scheduleSystem "View, create, and validate schedule"
        teacher -> scheduleSystem "View and request a changed schedule"
        student -> scheduleSystem "View schedule"
        
        
        # relationships between containers
        api -> db "Fetches and stores data from DB"
        api -> enrollmentSystem "Fetches data from system"
        api -> studentSystem "Fetches data from system"
        api -> buildingSystem "Fetches data from system"
        
        enrollmentSystem -> api "Request data from schedule system"
        studentSystem -> api "Request data from schedule system"
        buildingSystem -> api "Request data from schedule system"
        client -> api "Communication with app API"
        api -> webapp "Interacts with application"
        
        webapp -> api "Communication with app API"
        
        # relationships in Web app
        api -> formManager "Retrieve form"
        formManager -> scheduleManager "Request schedule update"
        scheduleManager -> api "Fetch data"
        scheduleManager -> scheduleAnalyzer "Validate schedule"
        scheduleAnalyzer -> scheduleManager "Send response"
        notificator -> api "Send alerts"
        scheduleManager -> notificator "Request to create notification"
        api -> scheduleManager "Request changes in the schedule"
        notificator -> emailSender "Request to send email"
        emailSender -> api "Fetch Emails"
      
        # relationships in API app
        client -> ana "Request data"
        internalAPI -> client "Response data"
        ana -> internalAPI "Authenticate User Request"
        internalAPI -> webapp "Send Request"
        
        databaseAPI -> db "Read and write data"
        webapp -> databaseAPI "Request data"
        databaseAPI -> webapp "Send data"
        
        webapp -> internalAPI "Send a respond"
        webapp -> externalAPI "Request data"
        
        externalAPI -> dataValidation "Send External Data"
        dataValidation -> webapp "External Data Validation Results"
        
        externalAPI -> enrollmentSystem "Request Data"
        enrollmentSystem -> externalAPI "Response Data"
        externalAPI -> studentSystem "Request Data"
        studentSystem -> externalAPI "Response Data"
        externalAPI -> buildingSystem "Request Data"
        buildingSystem -> externalAPI "Response Data"
        
        
        # relationships in Client app
        viewController -> calendar "Gets component"
        viewController -> subjects "Gets component"
        viewController -> settings "Gets user data"
        viewController -> form "Get component"
        viewController -> schedule "Get component"
        viewController -> notificationClient "Get component"
        
        committeeView -> viewController "Get content"
        teacherView -> viewController "Get content"
        studentView -> viewController "Get content"
     
        form -> api "Post request"
        settings -> api "Gets/Sets settings"
        subjects -> api "Fetches subjects"
        calendar -> api "Fetches subjects"
        schedule -> api "Fetches data"
        notificationClient -> api "Send request for any alerts"
        
        # deployment 
        deploymentEnvironment "Live"    {
            deploymentNode "User's Web Server" "" ""    {
                clientAppInstance = containerInstance client
            }
            deploymentNode "Application Server 1" "" "Ubuntu 18.04 LTS"   {
                deploymentNode "Web server" "" "Apache Tomcat 10.1.15"  {
                    webappInstance = containerInstance webapp
                    # apiInstance = containerInstance api
                }
            }
            deploymentNode "Application Server 2" "" "Ubuntu 18.04 LTS"   {
                deploymentNode "Web server" "" "Apache Tomcat 10.1.15"  {
                    # webappInstance = containerInstance webapp
                    apiInstance = containerInstance api
                }
            }
            
            deploymentNode "Database Server" "" "Ubuntu 18.04 LTS"   {
                deploymentNode "Relational DB" "" "Oracle 19.1.0" {
                    scheduleDBInstance = containerInstance db
                }
            }
     
            
        }
    }

    views {
        systemContext scheduleSystem {
            include *
            autolayout lr
            exclude "user -> scheduleSystem"
            exclude "user"
        }

        container scheduleSystem "Containers"{
            include *
            # autolayout lr
        }
        
        component client "client"{
            include *
            autolayout lr
        }
        component webapp "webapp"{
            include *
            # autolayout lr
        }
        component api "api"{
            include *
            # autolayout lr
        }
        deployment scheduleSystem "Live" "Live_Deployment"   {
            include *
            autolayout lr
        }

        theme default
        
        styles {
            element "Existing System" {
                background #999999
                color #ffffff
            }
            element "Web Front-End"  {
                shape WebBrowser
            }
            element "Database"  {
                shape Cylinder
            }
        }
    }
