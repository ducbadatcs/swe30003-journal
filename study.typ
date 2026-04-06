#import "@preview/mmdr:0.2.1": mermaid
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#import fletcher.shapes: rect, diamond

#set document(title: [SWE30003 - Journal], author: "Hoàng Minh Đức")
#set page(paper: "a4", numbering: "1")
#set text(font: "TeX Gyre Pagella" , size: 14pt)
#set heading(numbering: "1.1.")
#show quote: set pad(x: 3em)

#show outline.entry: set block(above: 1.2em)

#title()
#outline(title: "Table of Contents")
#outline(target: figure, title: "List of figures")
#pagebreak()

= Software Development Life Cycle and Requirements

The Software Development Life Cycle (SDLC) is a structured framework used by software organizations to design, develop, and test high-quality software. It defines the entire process of software production, from the initial idea to the final deployment and maintenance.

The SDLC is described below:

#let r = 1.6
#let points = ()
#let offset = (2, 2)
#for i in range(1, 7){
  let x = -r * calc.cos(i * calc.pi / 3) + offset.at(0)
  let y = -r * calc.sin(i * calc.pi / 3) + offset.at(1)
  points.push((x, y))
}

#figure(diagram(
  let (a1, a2, a3, a4, a5, a6) = points,
  node-stroke: 1pt,
  node(a1, [1. Planning]),
  node(a2, [2. Defining]),
  node(a3, [3. Design]),
  node(a4, [4. Development]),
  node(a5, [5. Testing]),
  node(a6, [6. Deployment]),
  for i in range(points.len() - 1){
    edge(points.at(i), points.at(i + 1), "->")
  }
), caption: [Software Development Life Cycle]
)

In planning, the team must define what they are building and why (S1). Then, the specific product requirements must be defined and documented (S2).

== Verification v.s. Validation

Verification is the process of *ensuring* that the software work products (such as requirements, design, and code) *conform to specified requirements and standards*. It focuses on *checking correctness and consistency* without necessarily executing the software. Verification asks: "Are we *building the product right*?"

Validation is the process of *evaluating the software* during or after development to *ensure it fulfills its intended use* and meets user and stakeholder needs. It typically involves executing the software and observing its behavior in real or simulated environments. Validation asks: "Are we *building the right product*?"

== Types of requirements:

Only functional v.s. non-functional

=== Requirements

- *Functional requirements* are requirements that describe *system services* and *functions*
- *Non-functional requirements* (a.k.a *quality requirements*) are *constraints* on the services and/or the development process
- *Domain requirements* stem from application domain of a system, which might be functional/non-functional

=== Non-functional requirements

There are various types of non-functional requirements:

#figure(table(
  columns: (auto, auto, auto),
  inset: 5pt,
  align: horizon,
  table.header(
    [*Requirement Type*], [*Definition*], [*Example*]
  ),
  [*Product Requirement*],
  [Specify how the system should behave or perform (e.g. speed, reliability, functionality)],
  [`latexmk` must call the LaTeX compiler enough times to resolve all references],

  [*Organizational Requirement*],
  [Requirements derived from organizational policies, standards, or processes],
  [The system must conform to the process defined in an internal policy document],

  [*External Requirement*],
  [Requirements arising from external factors such as laws, regulations, or interoperability needs],
  [The system must allow users to check whether their personal data is stored, in compliance with data protection laws]
), caption: [Requirement Types])

== Requirements Engineering

Requirements Engineering is the process of identifying, eliciting, analyzing, specifying, validating, and managing the needs and expectations of stakeholders for a software system.

The requirements engineering process is as following:

#figure(diagram(
  node-stroke: 1pt,
  spacing: 0.9cm,
  let (a, b, c, d) = ((-1, 0), (0, 0), (1, 1), (2, 2)),
  node(a, [Feasibility \ study]),
  node(b, [Requirements \ Elicitation \ and Analysis]),
  node(c, [Requirements \ Specification]),
  node(d, [Requirements \ Validation]),

  let (e, f, g, h) = ((-1, 2), (0, 2), (1, 3), (2, 4)),
  node(e, [Feasibility \ Report]),
  node(f, [System \ Models]),
  node(g, [User and System \ Requirements]),
  node(h, [Requirements \ document]),

  edge(a, b, "-|>"),
  edge(b, "d", c, "-|>"),
  edge(c, "u", b, "-|>"),
  edge(c, "d",  d, "-|>"),
  edge(d, "u", c, "-|>"),

  edge(a, e, "-|>"),
  edge(b, f, "-|>"),
  edge(f, (0, 3.75), (2, 3.75), "-|>"),
  edge(g, "d", h, "-|>"),
  edge(d, h, "-|>")
),
caption: [Requirements Engineering process])

and has some activities:

#table(
  columns: (auto, auto),
  inset: 5pt,
  table.header(
    [*Activity*], [*Function*]
  ),

  align: horizon,
  [*Feasibility study*], [Determine if the *user needs can be satisfied* with the available technology and budget.],
  [*Requirements elicitation*], [Find out what *system stakeholders* require from the system],
  [*Requirements analysis*], [*Clarify/define/document the requirements* in a form understandable to the customer],
  [*Requirements specification*], [*Define the requirements* in detail. (Written as a contract between client and  contractor.)]
)

=== Requirements Elicitation

Sometimes called *requirements discovery*, it involes expert working with customers to define *domain*, *services* (functionality + quality), and operational *constraints*. It involves various *stakeholders*, such as end-users, managers, engineers, domain experts, etc.

=== Requirements Analysis

Requirements Analysis require *collaboration* of people with different backgrounds, such as *users* with domain knowledge, and *developers*, and it bridges the gaps between them.



= Software design

#quote(block: true, [The design of a system determines a set of components and inter-component interfaces that satisfy a specified set of requirements.])

Software Design can be seen as *translating and refining* a (problem) domain model into abstractions that can be directly mapped to an implementation in a programming language.

#figure(diagram(
  node-stroke: 1pt,
  let (a, b, c) = ((0, 0), (0, 1), (0, 2)),
  let (d, e) = ((1, 1), (2, 1)),
  node(a, [Requirements \ Specification]),
  node(b, [Constraints:  \ resources, \ deadlines, etc]),
  node(c, [Designer's \ decisions]),
  node(d, [Design \ process]),
  node(e, [Design \ Documentation]),
  edge(a, d, "->"),
  edge(b, d, "->"),
  edge(c, d, "->"),
  edge(d, e, "->"),
),
caption: [Software Design Process]
)

Design Patterns conduct standard solutions to common software design problems.

= Abstractions and Models

== Models

Models are *simplification of reality*. Models are created to better understanding of the problem, the domain, the system to be built.

A model can capture and represent:

- Structure (static model)
- Behavior (dynamic model)

Example:

- Architectural blueprint
- Drawn UI
- Class diagrams

== Abstractions

Abstractions are *concepts or ideas* not associated with any specific instance. It leaves out irrelevant detail, and highlights important events.

Some examples of abstractions:

- Instruction
- Condition
- Subsystems
- Packages
- Interfaces
- Abstract data types
- etc

== Models in abstractions

*Models are abstractions*, in the sense that they are created for better understanding.

A domain model is a model that *captures* the *domain entities / concepts relevant to the original problem*. A *domain vocabulary* defines the meaning / interpretation of domain entities. The relationships between domain entities define an _abstraction over the problem domain_.


= Scenarios and use cases

== User perspective

Users tend to think about systems in terms of "features" (what system can do), e.g. the system must provide a function to $X$. They should tell *stories* involving those features, and *scenarios* and *use cases* can assist to get requirements complete and consistent.

Scenarios: Users interact with a computer systems to complete a *task* or achieve a *goal*, which can be captures as a set of scenarios, i.e.

#quote(block: true, attribution: [Example user story])[Mary browses the catalogue and adds desired items (chocolate) to the shopping basket. When she has finished shopping, Mary provides her address for delivery, credit card  information and then confirms the transaction. The system confirms her payment and e-mails a transaction record.]

We note that we covered the *ideal interaction* (everything works properly). But:

- What happens if the credit-card payment fails?
- What if the customer is a repeat customer, so shipping details are already in the system?

The key scenario remains, but to answer the questions we have to add _alternative_ scenarios.

Scenarios can also be written down as a series of steps, and we need to identify scenarios that can be written up.

== Use cases

If we structure scenarios, they can represent the behavioural requirements of the system, _from the users' viewpoint_. Every use case is directly or indirectly _invoked by an actor_, and must be _tied to a specfic goal_.

== Actors

An *actor* is a *role the user plays* when they interact with a system. They _perform_ use cases. Actors can have multiple use cases, and single use case may have several actors.

Actors don't have to be human.

= Goal-Design Scale (unclear why a scale, but ok)

- _Goal Level_ requirements satisfy business goals, e.g. calculations hit 5%
- _Domain Level_ requirements satisfy the activities that go on outside the product, e.g. products support cost recording and quotation with experience data, e.g. product supports cost recording and quotation with experience data
- _Product Level_ requirements specify what should come in and out of the product, e.g. product must have recording and retrieval function for experience data
- _Design level_ requirements specify interface details between the system and other entities, interacting with it (such as users and other systems) and internals of the system, e.g. System shall have sreen pictures


= Domain Model Development

Also called _Domain Modelling_, the process is as follows:

+ Perform a *textual analysis* of the problem by understanding the problem domain; _circling all nouns_ and _underlining all verbs_
+ Write down relevant *domain entities*, which is normally some of the nouns defined above
+ Revisit the specification to extract the *associations*
+ Record *associations* with the corresponding *domain entities*

= Task Descriptions

Each Task Description has:

- *Purpose*: What the task aims to *achieve*
- *Trigger*: The *event that starts* the task
- *Precondition*: The condition that allows the task to occur
- *Frequency*: *How often* the task occurs
	- *Critical*: Special *high-pressure or large-scale* situations
- *Subtasks*: A list of steps that make up the task
	- Written in *neutral language*.
	- Describe what the user and computer must accomplish _together_.
- *Variants*: *Special cases or alternative ways* to perform subtasks.

Good tasks should have:

- All events covered
- Critical tasks covered

= Workflows

A *workflow* is a coherent representation of the *(temporal)* dependencies between _the major steps of a project_. It focuses on:

- Actors of each step
- Dependencies between steps
- _Sequencing_

Workflows assist in identifying _high-level_ tasks and a sequence of _good_ user tasks.

= Object Oriented Design

Object Oriented Design (_OOD_) is a method of design encompassing the process of *object-oriented decomposition*. It views the system as _interactions of different objects_.

The goal of _OOD_ is to find the important *object-based abstractions* of the system. We should ask questions:

- How can we *identify classes/objects*?
- How do objects *interact*?
- What *roles and responsibilities* do objects perform?.


== Objects and classes

Objects are an *abstract model of a real-world entity* that has an independent *identity*. In design and implementation, it is a *component* that _contains a collection of data and related procedures_.

Objects can also *receive* and *response* to messages, and has behavior that may be dependent on its internal state, (the state can change by responding to messages).

Classes is a *description* of a *group of objects* with common data attributes, common operations, common relationships and semantics. Classes can be used to _create_ objects called *instances*. A class should also capture *one and only one* key abstraction. If this is violated, it reduces _cohesion_ (see @coupling-cohesion).

*Do not* create god classes/objects. They have many responsibilities, with significant complexity and difficult to understand and maintain.

Classes can be described/represented in _UML_, using Mermaid Diagrams, i.e.:

```mermaid
classDiagram
    class Rectangle{
        - width: int
        - length: int
        + calculate_area() int
        + calculate_parameter() int
    }
```

where the plus signs mean public attributes and the negative signs mean private attributes.

#figure(mermaid(
"classDiagram
    class Rectangle{
        - width: int
        - length: int
        + calculate_area() int
        + calculate_parameter() int
    }",
), caption: [Sample UML diagram]
)

== Object-Oriented Design Process

The process then works with:

+ Find the *classes*
+ Determine the *responsibilities* of each class, and study the requirements specficiation;
+ Determine *how objects collaborate* to fulfill their responsibilities

Then

4. *Factor* common responsibilties to build class hierarchies
+ *Streamline collaborations* between objects.
  - e.g. is message traffic heavy in parts of the system?
+ Apply *design heuristics* to improve specific design aspects

The result in the design process is *not* a final product. Design decisions may be revisited, and it is rarely linear. Furthermore, design methods provide _guidelines_, not fixed rules. A good _sense of style_ often helps produce _clean, elegant designs_, a.k.a designs that make sense from the engineering standpoint.

== Finding classes

Identify:

- What are the *goals* of the system being designed, and the expected *inputs* and *outputs*?
- Look for *noun phrases*, separate into *obvious* classes, *uncertain* candidates, and *nonsense*.
  - Example noun phrases: *physical objects*, *conceptual entities*, etc.

*CRC Cards* can help with finding classes.

=== CRC Cards

CRC (_Class, Responsbility and Collaborations_) cards are used to capture and organize information about classes and responsibilities within a software system

#figure(
  table(
    columns: (auto, auto),
    inset: 5pt,
    table.header(
      [*Animal*], []
    ),
    [*Responsibility*], [*Collaboration*],
    [Model The Animal], [Zoo]

  ),
  caption: [Example CRC Card]
)

CRC cards are used to *explore* possible designs, and *are not specification of designs*.

== Responsibilities and Assigning Responsibilties

=== What are responsibilities?
Responsibilities are the *knowledge* an object maintains and provides, and the *actions* it can perform. It represents the *public services* an object may provide to client. Namely, it states what it does, *not* how it does.

To identify responsbilities, study the requirements specification, namely:
- Highlight *verbs*,
- Explore *alternative scenarios*
- Identify *actions* resulting from *different inputs*

Furthermore:
- Study classes, and use class names to infer roles and responsibilities.
- Use recorded purposes on cards (CRC cards?) as responsibilities

=== Assigning Responsibilities

Use Pelrine’s Laws:
- #quote([Don't do anything you can push off to someone else.])
- #quote([Don't let anyone else play with you])

which means:
- *Evenly distribute* system intelligence (or _work_) _uniformly_ among *top-level classes*:
  - avoid *centralization*, and keeps responsilbilities close to objects.
- State responsibilities as *generally* as possible
- Keep *behavior* together with related information.
- Keep information about *one thing* in *one place*. If multiple objects need to access the same information, we need a *new object to manage*, *one obvious candidate*, or *collapse*
- *Break down complex responsibilities* and _share_ responsibilities among related objects.
- *Maintaining information* _is_ a respobsibility

== Relationships between classes

=== Example relationships

Additional responsibilities can be uncovered by examining relationships between classes.

#figure(
  table(
    columns: (auto, auto),
    inset: 6pt,
    table.header(
      [*Relationship Type*], [*Definition*],
    ),

    [*Is-Kind-Of*], [Classes sharing a *common attribute* often share a *superclass* $=>$ common responsibilities],

    [*Is-Analogous-To*], [*Similarities* between classes can suggest undiscovered *superclasses*],

    [*Is-Part-Of*], [*Distinguish* responsibilities between _part_ and _whole_]
  ),
  caption: [Some kinds of relationships between classes]
)

=== Association and Aggregation (and Composition)

- *Composition* is a "part-of" relationship where the *lifecycle of the contained object(s)* are is *completely dependent on the container object*.
- *Aggregation* is a "has-a" relationship where *the contained object exists indepdently of the container*.
  - It is useful for building *modular and reusable* components.
- *Association* is a relationship between *two independent classes*, where an object uses or interacts with other object(s).
  - Associations can be either _unidirectional_ or _bidirectional_ and exists in forms as _one-to-one_, _one-to-many_, _many-to-one_ and _many-to-many_

For good design, whenever there is a choice in an OOD between a *containment relationship* and an *association relationship*, pick the former, since it reduces amount of exposure of internals of a class #footnote([something something encapsulation])

=== Collections

The elements of an assocation / aggregation generally needs some form of expandable container / collection in the corresponding enclosing object. Some notes of how to design collections:

- If you want to *avoid duplicates*, choose a *set-like collection*.
- If you want to *access elements by index*, choose a _indexable_ collection (i.e. Array)
- If you want to *have a specific element order*, choose a collection that *allows ordering*.
- If you want some of the above, choose the collections that *supports all*.

== Inheritance and Abstract Classes

=== Inheritance

*Model Inheritance* reflects "is-a" relations between abstractions in the model. *Software Inheritance* expresses relations between the software system.

Inheritance should be used *only* to model a *specialization hierarchy* (which classes are speicalizations of others?)

Theoretically, inheritance hierarchies can be _really_ deep, but in practice, they are rarely deep, and should be no deeper than the short-term memory of a developer (5-7 layers).

=== Abstract Classes

*Abstract Classes* are classes that factor common behavior shared by other classes. It groups *related classes* with common responsibilities, and help introduces parent classes that represents the group.

=== How to design abstract classes

Good candidates for abstract classes are _categories_.

All abstract classes must be _base_ classes (other classes derive from them). and all base classes should be abstract classes.

Concrete classes may be both instantiated and inherited from, while abstract classes can only be inherited from (i.e. *no* inheriting abstract classes from concrete classes). Sub-classes should *support all inherited responsbilities* (and possibly more). They may refine or specialize a responsibilitity, but never hide them from the parent class.



== Colaborations

In OOD, objects *collaborate* to perform the desires responsbilities.

For each responsibilitity, ask whether the class can fulfill the responsibility *by itself*, and *if not*, then:

- what does it *need*?
- From what _other_ class can it obtain that?

For each class, ask:

- What does it *know*?
- What _other_ class(es) need its *information / results*?

Some interaction considerations:
- *Minimize* the number of classes with which another class collaborates (i.e. don't have way too many collaborators for one class).
- *Minimize* the amount of collaboration between a class and its collaborators, (minimize the *number of messages sent*).
- *Do not* turn an operation in to a class.
- Classes that *do not interact* with others should be discarded.

=== Roles and Protocols

Collaborations are often described using *protocols*. Each participant in a protocol play a given *role*.

For example:

#quote(block: true,)[
  *Drawing Element* is a class of the graphics editor. It defines three _roles_:
  + _Client_: Uses other elements of the application
  + _Child_: Can be contained in a Group Element
  + _Subject_: state being observed by other elements.

  Each of these roles implies a number of *related respobsibilities*, and the usage of a particular *collaboration protocol*.
]

== Design by Contract

*Design by Contract* is a design concept introduced by Bertrand Mayer in the late 1980s. It views the relationship between a *service provider* (an object) and *service consumer* (a _client_ of the object) as a *formal agreement* (a _contract_) with rights and obligations.

It extend the definition of abstract data types (i.e. _classes_) with *pre-conditions, post-conditions, invariants*, and how they can be refined in classes.

In DbC:

- A _service consumer_ must ensure that a service on a provider is only ever invoked *when the service's preconditions are met*.
- A _service provider_ must ensure that *after successful completion of a service, the postconditions are met*.
- Invariants of the service provider must be held *after the successful execution* of any externally visible service(s).
- Subclasses can only *weaken service pre-conditions* or *strengthen service post-conditions*



=== Abstract State v.s. Concrete State.

Every object contains *stateful information* (i.e. objects have *state*).

The externally visible properties of this state defines the *abstract state*. The internal representations define the *concrete state* #footnote([So it seems like _abstract state = public_ and _concrete state = private_. What the hell happened to _protected_? ]).

Clients should only rely on an objects' abstract state, and similarly object equality should only ever be defined over the abstract state.

=== Command-Query seperation principle.

All methods of a class should be divided into two non-overlapping categories:

#figure(
  table(
    columns: (auto, auto),
    inset: 5pt,
    table.header([*Queries*], [*Commands*]),
    [Returns a result, *without changing the observable state*], [*Changes the (abstract) state* without returning a result.]
  ),
  caption: [Command-Query Seperation Principle]
)

For example:

```python
>>> a = [1, 2, 3, 4] # object declaration
>>> a.__len__() # query, returns a result, doesn't change the object
4
>>> a
[1, 2, 3, 4]
>>> a.append(5) # command, doesn't return a result, changes the object
>>> a
[1, 2, 3, 4, 5]
```


== Decomposition

Decomposition (also called _divide-and-conquer_) is a process that helps to *manage the complexity* of a system.

#figure(diagram(
  node-stroke: 1pt,
  let (a, b, c) = ((0, 0), (0, 1), (0, 2)),
  node(a, [High(er) level-view]),
  node(b, [Go lower \ add more details]),
  node(c, [Good level of detail]),
  edge(a, b, "-|>"),
  edge(b, a, "-|>", bend: 20deg),
  edge(b, c, "-|>")
), caption: [Decomposition Process])

There are two types of decomposition: _functional_ and _object-oriented_ decomposition.

=== Functional v.s. Object-oriented Decomposition

#figure(
  table(
    columns: (auto, auto, auto),
    inset: 10pt,
    align: horizon,
    table.header(
      [*Type*], [*How to Decompose?*], [*Issues*]
    ),

    [*Functional*], [Decompose according to *functions* a system should perform], [
      - Naive: modern systems perform *more than one function*
      - Maintainability: System functions evolve, design affects whole system
      - Interoperability: Interfacing with other system is difficult],

    [*Object-oriented*], [Decompose according to the *objects* a system is supposed to manipulate], [Needs to identify objects]
  ),
  caption: [Functional v.s. Object-oriented Decomposition]
)

== Coupling and Cohesion <coupling-cohesion>

Coupling and Cohesion are *measures* of *how well the parts of a system are tied together* to form the system itself.

#figure(
  table(
    columns: (auto, auto),
    inset: 10pt,
    table.header(
      [*Measure*], [*Definition*]
    ),
    [*Coupling*], [*inter-dependency* between system parts],
    [*Cohesion*], [*intra-dependency* of a system part]
  ),
  caption: [Coupling and Cohesion]
)

The goal of good OOD is to have *weak coupling* (system parts are independent and changing one shouldn't change others) and *strong cohesion* (code is tightly related, each module has one purpose)
