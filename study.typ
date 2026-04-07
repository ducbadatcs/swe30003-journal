#import "@preview/mmdr:0.2.1": mermaid
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#import fletcher.shapes: rect, diamond

#set document(title: [SWE30003 - Journal], author: "Hoàng Minh Đức")
#set page(paper: "a4", numbering: "1")
#set text(font: "TeX Gyre Pagella" , size: 14pt)
#set heading(numbering: "1.1.")
#show heading: set block(below: 1.5em)
#set par(
  // first-line-indent: (amount: 1.5em, all: true),
  spacing: 1.5em)
#set list(spacing: 1em)
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

= Goal-Design Scale

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
-Subclasses can only *weaken service pre-conditions* or *strengthen service post-conditions*

The benefits of DbC are

- Explicit notion of contextualized correctness
- Enforces _seperation of concerns_, which helps assign responsbilities to the correct class(es)
- Facilitates _testing_ and _debugging_
- Enhances _documentation_

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

= Patterns

== What are patterns?

*Patterns* are problems that *occurs over and over again*, and described the *core of the solution* to the problem. *Design patterns* are _standard solutions_ to common software design problems.

The following are *not* design patterns:

- *Algorithms*. They solve _computation problems_, not _design problems_.
- *Software components*. Design patterns describe a _way_ to solve a problem, and document pros and cons of implementations. Software components are _implementations_ which may be implemented _using_ design patterns
- *Frameworks*. Frameworks *implement a "generic" software architecture*, while a design pattern _documents_ the solution to a specific problem. Frameworks may be _used and documented_ with design patterns, and design patterns are *drawn from experience* with multiple applications solving related problems

== What do patterns solve?

Software design patterns _document design experience_ by:

- *Enabling widespread reuse* of software structures
- *Improving communication* within and across software teams
- *Capture knowledge* that experienced developers _already_ understand implicitly.
- Arise from *practical experience*, and *faciliate* training of new developers.
- *Transcend "programming-language centric"* viewpoints.

== Idioms, Frameworks, Libraries

An *idiom* is a *low-level pattern* specific to a programming language, and describes how to implement *particular aspects of components* or *the relationships between them* using features of the programming language.

Some example idioms include:

- *Delegation* is when an object *delegates* some of its work to another object. It is *more flexible, less structured* than interface; and is one of the _most basic_ object-oriented idioms.
- *Interfaces*. Interfaces can be used to keep *clients* of a service *independent of classes that provide the service*.
  - In particular, if a *concrete class* is a service provider, then only instances of that class _or_ its subclasses can be used in the future. By using interfaces, an instance of _any_ classes that implement the interface can be used to provide the service.

== Comparison of definitions

#figure(
  table(
    columns: (auto, auto),
    align: horizon + center,
    inset: 5pt,
    table.header(
      [*Term*], [*Definition*]
    ),
    [*Idiom*], [Idioms are *common programming techniques and conventions*, and are often _language-specfic_],
    [*Pattern*], [Patterns document *common solutions* to *design problems*, and are _language-independent_],
    [*Libraries*], [Libraries are *collections of functions, procedures or abstractions* that can be used in many applications],
    [*Frameworks*], [
      Frameworks are *open libraries* that define the *generic architecture* of an application, and can be extended by adding or deriving new classes.

      Frameworks typically make use of *common idioms* and *patterns*
    ]
  ),
  caption: [Definition of Idioms, Patterns, Libraries and Frameworks]
)

In traditional application architectures, *user code makes use of library functionality* in the form of procedures of classes. A framework _reverses_ this relationship by providing both *generic functionality* and *application architecture*. Frameworks therefore calls user classes.

== Design Patterns

A *design pattern* provides a *scheme* for *refining the subsystems or components* of a software system, or the relationships between them. It describes a *commonly-recurring structure* of *communicating components* that solve a *general-design problem* within *a particular context*

The format of a pattern consists of:

- *Pattern Name* and *Classification*, which should convey the essence of a pattern
- *The Problem Forces*, a.k.a when to apply the pattern:
  - *Intent*: Short Statement of rationale and intended usem i.e.
  - *Motivation*: A problem scenario and example solution, i.e.
  - *Applicability*: in which solutions can the pattern be applied
- *The Solution* *Abstract* description of design elements:
  - *Structure*: Class and scenario diagrams
  - *Participants*: participating classes/objects and their responsibilities
  - *Collaborators*: how participants carry out responsibilities
- *The Consequences*: results and trade-offs of applying the pattern
  - *Implementation*: pitfalls, hints, techniques, language issues etc.
  - *Sample Code*: illustrative examples in various programming languages
  - *Known Uses*: examples of the pattern found in real systems
  - *Related Patterns*: competing and supporting patterns

=== Common Patterns

Some common patterns include:

- *Factory Method*: Introduce a `Factory` method in a base class/interface and delegate the decision with concrete classes to instantiate to subclasses
- *Strategy*: Define a *common interface* for the family of algorithms and have *specific implementations implement the interface*
- *Composite*: Define a *common interface* (or *abstract base classes*) that both *parts* and *composites* implement from.
- *Observer*: An *observer* object _publishes_ state change events to its *subscribers*, who must implement a common interface for _receiving notification_.
  - Note that notification can be slow if there are _many observers for one observable_, or if _observers are observable_.
- *Null Object*: Implements the interface, but *does nothing*.
- *Singleton*: Introduce a *singleton* class that keeps track of a _static reference_ to its only instance, and provide a static method to access this sole instance.
- *Command*: Encapsulate requests in `Command` objects that can be passed around and executed when ready.

== Other kinds of patterns

Patterns are not limited to software designs, they can be found in many more problem domains:

- *Re-engineering* patterns
- *Usability* patterns
- *Documentation* patterns
- *Organizational* patterns

There are also _pattern systems_, since patterns *do not exist in isolation*, they always work together with other patterns. A plain catalogue of patterns does not reflect all realtionships, they should be *intervowen*.

= Software Architectures

#quote(block: true, attribution: [Dewayne Perry and Alexander Wolf, 1992])[
  A software architecture is a set of architectural (design) elements that have a particular form. Properties constrain the choice of architectural elements whereas rationale captures the motivation for the choice of elements and form.
]

The architecture of a software system is (often) described as:

- The *structures of its high-level processing elements*
- The *Externally visible properties* of the processing elements
- The *Relationships* between them.

A *rationale* explains *why a decision was made* and *what the implications are in changing it*. It can be used to explain:

- *implications of systemwide design choices*
- *effects on the architecture* in the context of add/removing requirements

== Subsystems, Modules, Components

A *sub-system* is a *system* (in its own right) whose operation is *independent* of the services provided by other subsystems.

A *module* is a system component that *provides services* to other components, but would *not* normally be considered as a seperate system.

A *component* is an independently deliverable unit of software that _encapsulates its design and implementation_, and offers interfaces to the outside; by which it may be composed with other components to form a larger whole.

== Why use architectures?

Architectures are the *technical interface* between the customer and the contractor building a system. A bad architecture *can not be rescued by good constructions*. There are *specialized types*, and *styles* of software architecture.

Furthermore:

- Architectural styles document *existing, well-proven* design experience
- Architectures *identify and classify* abstractions that are a *higher* level of abstraction compared to simple programming language constructs
- Architectural styles rovide a *common vocabulary* and *understanding* for design principles.
- Reference Architectures support the construction of software with well-defined properties.
- Guidelines help to choose suitable architectures given the problem domain or required quality attributes.

$=>$ Architectures help to manage software complexity.

== Architectural Styles

An *Architectural Style* defines a *family of software systems* in terms of their *structural organization*. It expresses *components and their relationships* with the constraints of the application, and the associated
 _composition and design rules_ for the construction.

Some popular architectural styles are:

- *Data-flow architectures*: Batch Sequential, Pipes-and-Filter
- *Call-and-return architectures*: Client-Server, Layered, Object Oriented, etc
- *Data-centered architectures*: Repository, Blackbaord
- *Virtual machine architectures*: Interpreter, rule-based systems
- *Independent Component Architectures*: P2P, Event-Driven

=== Layered Architectures

#figure(
  diagram(
    node-stroke: 1pt,
    let (a, b, d, n) = ((0, 0), (0, -1), (0, -2), (0, -3)),
    node(a, [Layer 1]),
    node(b, [Layer 2]),
    node(d, [...], shape: rect),
    node(n, [Layer $n$]),
    edge(a, b, "->"),
    edge(b, d, "->"),
    edge(d, n, "->")
  ),
  caption: [Visualization of Layered Architecture]
)

A *layered architecture* organizes a system/module/component into a *set of layers* each of which *provide a set of services to the layer above* and *uses services from the layer below*.

Elements in each layer can only see other elements in the same layer, or the layer below. Callbacks may be used to communicate to higher layers.

=== Dataflow Architecture

#figure(
  diagram(
    node-stroke: 1pt,
    spacing: 0.75cm,
    let (a, b, c, d, e) = ((0, 0), (1, 0), (2, 0), (3, 0), (4, 0)),
    node(a, [Input]),
    node(b, [Component 1]),
    node(c, [...], shape: rect),
    node(d, [Component $n$]),
    node(e, [Output]),
    edge(a, b, "->"),
    edge(b, c, "->"),
    edge(c, d, "->"),
    edge(d, e, "->")
  ),
  caption: [Visualization of Dataflow Architecture]
)

In a data-flow architecture, each components perform *functional transformations* on its inputs to *create outputs*.

Its main elements include:
- Data *sources* and data *sinks*
- *Filters* and *Transformers*

The data is organized so that each processing element (a _filter_) is discrete and only carry _one_ type of data information. The data flows from one processing element to another for processing. In general, there is a single input and output.

=== Repository Architectures

#let r = 1.4
#let points = ()
#let offset = (2, 2)
#let n = 4
#for i in range(1, n + 1){
  let x = -r * calc.cos(i * calc.pi * 2 / n) + offset.at(0)
  let y = -r * calc.sin(i * calc.pi * 2 / n) + offset.at(1)
  points.push((x, y))
}

#figure(
  diagram(
    node-stroke: 1pt,

    node(offset, [Repo], shape: rect),
    for (idx, point) in points.enumerate(){
      node(point, [Component #(idx + 1)], shape: rect)
      edge(point, offset, "->")
      edge(point, offset, "<-")
    },
  ),
  caption: [Visualization of Repository Architecture]
)

In a *repository architecture*, all data is managed in a *central repository* that is *accessible to all system components*. Components do not interact directly, only through the repository.

Howver, this means that components must agree on a repository data model, there is no scope, and it's difficult to distribute evenly. Examples are DB-based information systems, and document repositories.

=== Client-server Architectures

#figure(
  diagram(
    node-stroke: 1pt,
    spacing: 0.75cm,
    let c = (2, 1.5),
    node(c, [Central Registry]),
    for (i, v) in ("1", "2", "...", "n").enumerate(){
      node((0, i), [Client #v])
      edge((0, i), c, "<->")
      node((4, i), [Server #v])
      edge((4, i), c, "<->")
    }
  ),
  caption: [Visualization of client-server architecture]
)

In a *client-server architecture*, application logics and services are *distributed to a number of client and server subsystems*, each (potentially) running on a different machine and communication through the network.

Some advantages are straightforward distribution data, effective use of networked systems, and easy to add new servers. Some disadvnatages are lack of shared data model, redundant management, and require a _central registry_ of available names and services.

=== Event-driven architectures

#figure(
  diagram(
    node-stroke: 1pt,
    spacing: 2cm,
    let c = (2, 1.5),
    node(c, [Observable]),
    for (i, v) in ("1", "2").enumerate(){
      node((0, i + 1), [Observer \##i])
      edge((0, i + 1), c, "<-", label: "Event")
      // node((4, i), [Server \##i])
      // edge((4, i), c, "<-")
    }
  ),
  caption: [Visualization of client-server architecture]
)


In an *event-driven architecture*, components perform services *in reaction to external events* generated by other components. It has some models:
- *Interrupt-driven*: *real time interrupts* are detected by an *interrupt handler* and passed to some other component for processing.
- *Broadcast*: an event is broadcasted to all subsystems, and any system that can handle the event will handle it.

=== Peer-to-peer architectures

#let r = 1.6
#let points = ()
#let offset = (2, 2)
#let n = 4
#for i in range(1, n + 1){
  let x = -r * calc.cos(i * calc.pi * 2 / n + calc.pi / 4) + offset.at(0)
  let y = -r * calc.sin(i * calc.pi * 2 / n + calc.pi / 4) + offset.at(1)
  points.push((x, y))
}

#figure(
  diagram(
    node-stroke: 1pt,

    // node(offset, [Repo], shape: rect),
    for (idx, point) in points.enumerate(){
      node(point, [Peer #(idx + 1)], shape: rect)
      // edge(point, offset, "->")
      // edge(point, offset, "<-")
    },
    for x in range(points.len()){
      for y in range(points.len()){
        if x != y {
          edge(points.at(x), points.at(y), "->")
        }
      }
    }
  ),
  caption: [Visualization of Repository Architecture]
)

A *peer-to-peer* architecture is a type of *decentralized* and often *distributed* structure in which individual *nodes* are both as suppliers and consumers of resources. In a P2P network, tasks are often shared amongst multiple *inter-connected peers* who each make a portion of their resources available to other peers, *without centralized coordination*.

== Other

=== Heterogenous Styles

Large Software Systems *rarely confirm* to one single architectural model or style. They incorporate different styles at different levels of abstraction.

- *Locationally Heterogenous*: Different areas of a systems have different structures
- *Hirerarchitcally Heterogenous*: A component of one style, when decomposed, is structured like a different stlye.
- *Simultaneously Heterogenous*: A system can be described with various architectural styles.

=== Reference Models and Architectures

A *reference model* is a division of functionality together with data flow between the resulting elements.

A *reference architecture* is a reference model mapped into software components and data flows between those components.
