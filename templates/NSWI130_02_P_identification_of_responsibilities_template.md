# HealthTracker System

## Core features and responsibilities

<!-- A ### section for each feature -->
### Feature: Assessing health status based on health indicators

<!-- The feature described in a form of a user story -->
As a patient, I want my health status to be automatically assessed based on my remotely measured health indicators so that any worsening conditions can be promptly addressed, and a nurse can be notified.

#### Feature breakdown

<!-- The feature breakdown -->
1. Remote health monitoring devices measure health indicators.
2. The devices send the data to the health monitoring system.
3. The system analyzes the received data.
4. The system determines the health status of the patient as stable, at-risk or critical.
5. When moving from stable to at-risk or from at-risk to critical, the system alerts a nurse.
6. A nurse receives an alert on their monitoring dashboard and mobile notification.

#### Responsibilities

<!-- A ##### section for each group of responsibilities -->

##### Data collection responsibilities
* Integrate with various remote health monitoring devices
* Ensure transmission from devices to the centralized system.
* Ensure that transmitted data is syntactically correct.

##### Data analysis responsibilities
* Run various analytical and statistical methods on data
* Cache data for methods that need wider window of health indicators
* Store the analytical results

##### Health status determination responsibilities
* Classify the health status based on the results of the analysis
* Store the history of the determined statuses

##### Alerting responsibilities
* Detect health status change
* Generate alerts
* Prioritize alerts
* Trigger alerts

##### Nurse notification responsibilities
* Display alert on the nurse monitoring dashboard
* Send alert to the nurse’s email or mobile device
* Record to the audit log that the nurse was alerted.


<!-- Continue with ### sections for all other features. -->