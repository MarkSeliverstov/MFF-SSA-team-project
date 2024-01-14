# Lectures notes

## Structure and architectural styles

Describe how does the system works and why does it work this way.

- Structure
    - Architecture styles:
        - Layered
            - Presentation
            - Business
            - Persistence
            - Database
        - Microservices
        - Monolith
        - Microkernel
        - Service - oriented

- Quality (non-functional) Requirements
    - Define the success criteria of a software system.
    - Orthogonal to functional requirements
    - Examples: Testability, Scalability, Usability, Security, Availability,
      Performance, Modifiability.

- Architectural decisions
    - Result from reasoning architectural questions.
    - Answer the "Why" questions.

- Design principles: Guidelines that support architects in their decisions.

## Modularizing software architecture

- Module := logical grouping of related code. 
- Modularity := how the code is logically structured.
- How to measure it := cohesion (straight of the logic), coupling (direct
knowledge that one module ha of another) 

Cohesion - rectangles; Coupling - arrows between it.

### Cohesion

**Cohesion** refers to how closely the responsibilities and functions within a
module are related. High cohesion means that a module's tasks are closely
related and focused, leading to more maintainable code.

There are several types of cohesion, ranked from the highest cohesion to the
lowest:
1. Functional Cohesion: A module has functional cohesion when all the functions
   or operations within it are closely related and work together to achieve a
   single, well-defined task or purpose.
2. Sequential Cohesion: This occurs when the functions within a module are
   executed sequentially and depend on the output of the previous one.
3. Communicational Cohesion: In this case, the functions within a module work
   on the same data or share a common input or output.
4. Procedural Cohesion: Functions in a module are grouped together because they
   are executed in a specific order, even if they are not closely related.
5. Temporal Cohesion: Functions within a module are related by their timing,
   i.e., they need to be executed together within a certain time frame.
6. Logical Cohesion: Functions within a module are grouped together based on
   their logical structure, but not necessarily related in terms of
   functionality.

- Impact of Cohesion:
    - Development: we must develop whole module before we can start using it.
    - Maintenance: If something breaks, we must change whole knife; If you need
      to add new tool, you can not use it until this new tool is added.
    - Reliability: One thing in the tool may affect another tool.
    - Scaling: If you need only one small thing, you need to do whole big
      thing.

- Why is it important?

Cohesion is important in software design because it enhances maintainability,
reusability, and testability of code. Highly cohesive modules are easier to
understand, debug, and scale, while promoting code reusability and simplifying
testing. It also leads to self-documenting code, making it more manageable and
reliable in the long run.

### Coupling

**Coupling** measures the degree of interdependence between modules. Low
coupling means that modules have minimal dependencies on each other, making the
system more modular and easier to maintain.

There are different levels of coupling, from the least coupled to the most
coupled:
1. Low Coupling (or Loose Coupling): Modules have minimal dependencies on each
   other. Changes in one module have little or no impact on other modules.
2. Medium Coupling: Modules have some dependencies on each other, but they can
   still be maintained and modified relatively independently.
3. High Coupling (or Tight Coupling): Modules have strong dependencies on each
   other, making it difficult to modify one module without affecting others.
   This can lead to a lack of flexibility and maintainability.

## C4-model

One or more code elements -> component -> Container -> Software System

## Architectural styles

Software architecture is the high-level design of a software system, which
defines the structure, components, relationships, and principles that guide the
system's organization. Various architectural styles exist, each with its own
characteristics and suitability for different types of applications. Here's a
description and comparison of some common architectural styles:

1. Monolithic Architecture:

    - In a monolithic architecture, the entire application is built as a
      single, cohesive unit.
    - Components are tightly coupled, and the entire system shares the same
      codebase.
    - Easy to develop initially, but can become complex and challenging to
      maintain as the system grows.
    - Scaling is often done by replicating the entire application, which may
      lead to resource inefficiency.

2. Layered Architecture:

    - In a layered architecture, the application is divided into distinct
      layers, each with specific responsibilities.
    - Common layers include presentation, business logic, and data storage.
    - Promotes separation of concerns and modularity.
    - Suitable for medium-sized applications, but may suffer from performance
      issues due to communication between layers.

3. Client-Server Architecture:

    - In client-server architecture, the system is divided into two main
      components: the client and the server.
    - Clients request services or data from servers, which process the requests
      and send responses back.
    - Common in web applications, where clients are browsers and servers host
      web services.
    - Allows for scalability and separation of concerns, but network
      communication can introduce latency.

4. Microservices Architecture:

    - In microservices architecture, the application is broken down into small,
      independently deployable services.
    - Each service handles a specific set of functionalities.
    - Promotes agility, scalability, and fault tolerance.
    - Requires robust communication and orchestration between services, which
      can be complex to manage.

5. Event-Driven Architecture:

    - Event-driven architecture is based on events and messages.
    - Components communicate by publishing and subscribing to events.
    - Well-suited for real-time applications, IoT systems, and event sourcing.
    - Complex event handling and message processing can be challenging to
      implement.

6. Service-Oriented Architecture (SOA):

    - SOA is a design approach that focuses on building software as a
      collection of loosely coupled services.
    - Services are designed to be reusable and can be accessed over a network.
    - Promotes flexibility and reusability but can lead to complexity in
      service orchestration.

7. Component-Based Architecture:

    - Component-based architecture emphasizes building systems using reusable
      software components.
    - Components are independent and can be combined to create applications.
    - Common in desktop applications and libraries.
    - Encourages reusability and modular design.

8. Distributed Architecture:

    - Distributed architecture involves deploying components across multiple
      nodes or machines.
    - Suitable for building scalable and fault-tolerant systems.
    - Challenges include network communication, data consistency, and fault
      handling.

## Quality attributes

Quality attributes, also known as non-functional requirements or system
qualities, are essential characteristics that define the overall performance
and behavior of a software system. These attributes help architects and
developers design and evaluate the system's architecture to ensure that it
meets the desired levels of performance, reliability, security, and other key
aspects. Here are some common quality attributes in software architecture:

### Run-time

#### How to define it

- source of stimulation -stimulus-> artifact (Enviroment) -Resopnse-> Measure
- Container A -Unable to R for analys-> Database -Repeat,log-> by 6am next day

- **Performance**: Performance attributes include aspects such as response
  time, throughput, and resource utilization. Architects must consider factors
  like latency, data processing speed, and system scalability to ensure optimal
  system performance.

- **Reliability**: Reliability focuses on the system's ability to operate
  consistently and predictably over time. It involves minimizing downtime,
  handling failures gracefully, and providing fault tolerance mechanisms to
  ensure the system remains available and operational.

- **Scalability**: Scalability assesses the system's ability to handle
  increased workloads by adding resources or components. It can be horizontal
  (adding more servers) or vertical (upgrading existing hardware), and
  architects need to design the architecture to accommodate growth without
  compromising performance.

- **Availability**: Availability measures the percentage of time a system is
  operational and accessible. High availability architectures incorporate
  redundancy, failover mechanisms, and backup systems to minimize downtime and
  ensure continuous service.

- **Security**: Security attributes encompass protecting the system from
  unauthorized access, data breaches, and other security threats. This includes
  authentication, authorization, encryption, and secure communication
  protocols.

### Design-time

#### How to define it

- source of stimulation -stimulus-> artifact (Enviroment) -Resopnse-> Measure
- Measuring device -New kind of measures-> Design time -...-> 3 man-month

- **Maintainability**: Maintainability focuses on the ease with which the
  software can be modified, extended, or repaired. A maintainable architecture
  is crucial for reducing the cost and effort of making updates and
  improvements to the system.

- **Modifiability**: Modifiability is similar to maintainability but emphasizes
  how well the system can adapt to changing requirements. Architects need to
  design the architecture to be flexible and modular, allowing for easier
  modifications without causing unintended side effects.

- **Testability**: Testability ensures that the software can be thoroughly
  tested to detect and fix defects. A testable architecture enables efficient
  testing, debugging, and validation of the system's functionality.

- **Interoperability**: Interoperability evaluates how well the software can
  communicate and interact with other systems, protocols, or technologies.
  Architects must consider integration points and compatibility with external
  components.

- **Usability**: Usability assesses how user-friendly and intuitive the
  software is. While primarily a concern for the user interface, the overall
  system architecture can impact usability through factors like response times
  and system behavior.

### Difference between functional requirements

1. Functional Attributes (Functional Requirements):

- What the system should do: Functional attributes describe the specific
  features, functions, and capabilities that a software system must provide to
  meet its intended purpose and fulfill user or business needs.
- Examples: User authentication, data input validation, report generation, user
  registration, search functionality, and any other feature or behavior that
  directly contributes to achieving the system's primary goals.
- Focus: Functional attributes focus on the "what" of the system, outlining its
  expected behavior and functionality from a user or business perspective.

2. Quality Attributes (Non-Functional Requirements or System Qualities):

- How well the system should do it: Quality attributes specify the
  characteristics, properties, and qualities that describe how the system
  should perform and behave in terms of non-functional aspects.
- Examples: Performance, reliability, security, scalability, availability,
  maintainability, usability, and other attributes that define the system's
  performance, behavior, and quality.
- Focus: Quality attributes focus on the "how" of the system, emphasizing
  aspects related to performance, reliability, security, and other
  non-functional characteristics that may not be directly tied to specific
  user-visible features but are crucial for overall system success.

## Domain Driven Design and Microservices

#### Domain-Driven Design (DDD):

- Concept: Domain-Driven Design is a methodology and set of principles for
  designing software systems that closely align with the problem domain, the
  real-world context in which the software operates.

- Based on the Business Domains and Sub-domains: a business domains defines a
  company area of activity.

- Benefits:
    - DDD helps bridge the gap between technical and domain experts, leading to
      better communication and shared understanding.
    - It promotes a clear and well-structured architecture that reflects the
      problem domain's complexity.
    - DDD can lead to more maintainable, flexible, and scalable software.

#### Microservices:

- Concept: Microservices is an architectural style that structures a software
  application as a collection of small, independently deployable services that
  work together to deliver the overall application's functionality with
  **monolithic user interface**

- Benefits:

    - Microservices enable better agility and faster development cycles, as
      teams can work on individual services without affecting others.
    - They facilitate fault isolation, meaning that a failure in one service
      doesn't necessarily impact the entire system.
    - Microservices can help achieve better resource utilization by scaling
      only the services that need it.

