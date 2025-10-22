#import "@preview/polylux:0.4.0": *
#import "@preview/metropolis-polylux:0.1.0" as metropolis
#import metropolis: new-section, focus

#enable-handout-mode(false)

#show: metropolis.setup.with(
  text-font: "Helvetica Neue",
  math-font: "New Computer Modern Math",
  code-font: "Monaco",
)

// Set up footer with slide numbers
#set page(footer: [
  #set text(size: 0.8em, fill: gray)
  #align(right)[#toolbox.slide-number / #toolbox.last-slide-number]
])

#slide[
  #set page(header: none, footer: none, margin: 3em)

  #text(size: 1.3em)[
    *The Institutional Stance *
    #text(size: 0.7em)[
    (Jara-Ettinger & Dunham, 2024)
  ]
  ]

  

  #metropolis.divider

  #set text(size: .85em, weight: "light")
  Prepared by Joseph Low \
  Research Engineer \@ Metagov  \

  October 22, 2025

  #v(0.5em)


  #v(0.5em)

  #grid(
    columns: (auto, auto, auto),
    column-gutter: 1em,
    image("images/banner_metagov.png", height: 1.5em),
    image("images/banner_publicai.png", height: 1.5em),
    image("images/banner_daostar.jpeg", height: 1.5em),
  )
]

#slide[
  = Outline

  #toolbox.all-sections((sections, current) => {
    enum(..sections)
  })
]

#new-section[Introduction]

#slide[
  = The Puzzle: Friday at the Office

  #toolbox.side-by-side[
    #image("images/office.jpg", width: 100%)
  ][
    #one-by-one[
      Imagine you're interning at a company.
    ][
      #v(1em)
      Your boss comes in and asks you: "Can you help me get lunch and print out these documents?"
    ][
      #v(1em)
      You get it done.
    ]
  ]
]

#slide[
  = The Puzzle: Saturday at the Movies

  #toolbox.side-by-side[
    #image("images/movies.jpeg", width: 100%)
  ][
    #one-by-one[
      You go to watch a movie.
    ][
      #v(1em)
      Then your boss spots you from a few rows ahead and asks you to get popcorn for them.
    ][
      #v(1em)
      #text(fill: red)[*Would you do this?*]
    ]
  ]
]

#slide[
  = The Mentalistic Stance Prediction

  #toolbox.side-by-side[
    #one-by-one[
      *At the office:*

      Boss desires: lunch, documents

      Boss believes: intern will get it if asked
    ][

      Intern desires: to help boss

      Intern believes: they can fulfill this task
    ]
  ][
    #one-by-one(start: 3)[
      *At the movies:*

      Boss desires: popcorn

      Boss believes: intern will get it if asked
    ][

      Intern desires: to help boss

      Intern believes: they can fulfill this task
    ]
  ]

  #one-by-one(start: 5)[
    *Theory of Mind says:* Movies scenario should be unsurprising
  ][
    - Same mental states, same belief-desire structure
  ][
    #text(fill: red)[*But it feels WRONG. Why?*]
  ]
]

#slide[
  = The Institutional Stance Explanation

  #toolbox.side-by-side[
    #one-by-one[
      *At the office:*

      Boss occupies role: "CEO"

      Intern occupies role: "assistant"
    ][

      Role-based norms: CEO can delegate tasks, assistant complies
    ]
  ][
    #one-by-one(start: 4)[
      *At the movies:*

      Boss: person at a movie theater

      Intern: person on a date
    ][

      CEO/assistant roles are NOT ACTIVE in this context
    ][

      #text(fill: red)[Behavior violates norms]
    ]
  ]

  #one-by-one(start: 7)[
    Humans automatically track which roles are operative in each  context
  ]
]

#slide[
  = The Rental Car Example

  #one-by-one[
    Laurie arrives at a rental car agency. Paul greets her and helps with the paperwork.

  ][
    Fee is higher than expected → argument starts.

  ][
    Paul briefly excuses himself. A few minutes later, Alex appears and picks up the discussion with Laurie *right where Paul left off*.

  ][
    *Mentalistic stance:* Transfer of Paul's beliefs/desires to Alex is strikingly odd!

    *Institutional stance:* Unsurprising. Same role = same goals/behaviors.

  ]
]

#slide[
  = Compare to Personal Relationships

  Imagine during a personal argument with a close friend, the friend excuses themselves and a casual acquaintance steps in to continue arguing...

  #text(fill: red)[*Now it would be bizarre!*]

  The institutional stance is *not* warranted in personal relationships—transfer of goals would be surprising, if not off-putting.
]

#slide[
  = Mentalistic Stance vs Institutional Stance visualized

  #toolbox.side-by-side(columns: (1fr, 1fr))[
    #one-by-one[
      #align(center)[
        #image("images/fig1a.png", width: 90%)

        #text(size: 0.8em)[*Mentalistic Stance:* Individual beliefs and desires]
      ]
    ]
  ][
    #one-by-one(start: 2)[
      #align(center)[
        #image("images/fig1b.png", width: 90%)

        #text(size: 0.8em)[*Institutional Stance:* Roles and normative relations]
      ]
    ]
  ]
]



#new-section[Three Stages of the Institutional Stance]

#slide[
  = The Puzzle of Animal Social Coordination

  #one-by-one[
    Theory of Mind is powerful but cannot explain all social complexity

  ][
    Many species exhibit complex social coordination and cooperation

  ][
    Yet these species lack the sophisticated mentalizing abilities of humans

  ][
    *The Question:* If animals don't have Theory of Mind, how do they coordinate and cooperate with one another?

  ]
]

#slide[
  = A Hypothesis: Three Critical Stages

  Solutions to social coordination evolved through three critical stages:

  1. *Proto-institutional:* Rigid role-based systems (biologically determined)

  2. *Fixed institutional:* Role-filler independence (roles can be swapped)

  3. *Generative institutional:* Grammar of institutions (uniquely human)

  Each stage adds flexibility and representational power
]


// TODO: Use animal example. Imprint. Identify their parents. Duckling imprinting
#slide[
  = Stage 1: Proto-Institutional Reprensentations
  #toolbox.side-by-side[
    #image("images/stage_1.png", width: 60%)
  ][
    *The core idea:* Learn that specific individuals occupy specific roles

    This allows us to:
    - Predict how this individual will act
    - Understand how to interact with them
    - Different roles = different social affordances
  ]
]

#slide[
  = Stage 1 Example: Imprinting

  #toolbox.side-by-side[
    #image("images/imprinting.png", width: 90%)
  ][
    Shortly after hatching, ducklings identify the first moving object as "mother"

    Proto-institutional representation:
    - Learn to identify who occupies the "mother" role
    - Associate this specific individual with caregiving behaviors
    - To the duckling, mother-role and occupier of role are fused
  ]
]

#slide[
  = Stage 1: Key Limitation

  *No abstract representation of role vs. occupier*

  The agent IS the role—just an association of specific individuals to social affordances

  No role swapping possible

  Still enables coordination without mentalizing
]

// TODO: Maybe add animals here! Duckling imprinting
#slide[
  = Stage 2: Fixed Institutional Reprensentations

  #toolbox.side-by-side[
    #image("images/stage_2.png", width: 80%)
  ][
    *The core idea:* Any individual can occupy specific roles

    Abstract representation of roles independent of who occupies them

    Agents can track and remember:
    - Which role an individual occupies
    - When roles change
    - How to adjust behavior accordingly
  ]
]

#slide[
  = Stage 2 Example: Lions Coordinated Hunting

  #toolbox.side-by-side[
    #image("images/lion.png", width: 100%)
  ][
    Lions hunt in coordinated formations: center hunters and wing hunters

    Fixed institutional representation:
    - Role specialization with ability to switch positions
    - Must understand all roles need filling
    - Know which role each lion currently occupies
    - Can adapt when roles change
  ]
]

#slide[
  = Stage 2: Key Limitation

  *The set of roles available to interpret behavior are pre-determined*

  No cultural evolution or emergence of novel institutional structures

  Cannot create new roles or institutional arrangements

  The institutional representations are fixed—determined by biology or evolutionary history
]

#slide[
  = Stage 3: Generative Institutional Representations

  #toolbox.side-by-side[
    #image("images/stage_3.png", width: 80%)
  ][
    *The core idea:* Generative system to synthesize novel institutional structures

    This enables us to:
    1. Identify normatively structured systems of interconnected roles
    2. Compositionally construct new such systems
    3. Use that knowledge to interact with others
  ]
]

#slide[
  = Stage 3 Example: Attending Catholic Mass as Non-Catholic

  #toolbox.side-by-side[
    #image("images/mass.png", width: 90%)
  ][
    Even without prior experience, you can understand mass as an institutional structure:
    - Identify roles: priest, altar servers, congregation
    - Recognize hierarchical relations and ritual patterns
    - Compositionally combine: religious authority + ceremony + worship
    - Navigate appropriately without explicit instruction
  ]
]

#new-section[Institutions as Graphs]

#slide[
  = What is an Institution?

  #one-by-one[
    An institution can be modelled as a *graph of roles with normative relations*

  ][
    *Nodes = Roles*
    - Purpose: Task and Function. Who can occupy the role. 
    - Power: Powers granted by the role
    - Limitations: Obligations imposed by it

  ][
    *Edges = Relations between roles*
    - How roles interact with one another
    - Can be directional or undirectional
    - Can grant social power over another role

  ][
    *Key insight:* Roles are not isolated—they're understood as part of a broader institutional structure

  ]
]

#slide[
  = Example: Rental Car Agency

  #align(center)[
    #image("images/rental_car_clean.png", width: 100%)
  ]

  *Role-Filler Independence:* Paul and Alex can both occupy the Service Rep role. When Alex replaces Paul, Alex inherits all norms of the role.
]

#slide[
  = Discussion Question

  - Do people understand each other in ways that cannot be reduced to mentalizing?
  - What does it mean to reduce social reasoning to mentalizing?
]

#slide[
  = Social Ontology: What is the nature of the social world?

  Two philosophical stances in social ontology:

  #toolbox.side-by-side[
    #one-by-one[
      *Methodological Individualism*

      The view that social phenomena can and should be reduced to individual agents, their beliefs, actions, and interactions.

      All social facts are ultimately facts about individuals.
    ]
  ][
    #one-by-one(start: 2)[
      *Methodological Collectivism*

      The view that social phenomena have irreducible collective properties that cannot be fully reduced to individual-level facts.

      Social groups and institutions have properties and causal powers of their own.
    ]
  ]

  #one-by-one(start: 3)[
    #v(1em)
    #align(center)[
      #text(fill: rgb("#A23B72"))[
        *Is mentalizing an individual or collective action?*
      ]
    ]
  ]
]

#slide[
  = The Institutional Stance as Non-Reductive Theory

  Relates to work that straddles methodological individualism/collectivism

  #toolbox.side-by-side(columns: (1fr, 1fr, 1fr))[
    #one-by-one[
      *1. Representing Collectives*

      Categories like race and gender as structural positions rather than essential properties
    ]
  ][
    #one-by-one(start: 2)[
      *2. Representing Socially-Structured Behavior*

      Norms enforced through social pressure (injunctive) or that simply emerge (descriptive)
    ]
  ][
    #one-by-one(start: 3)[
      *3. Representing Interactions and Scripts*

      Schemas and scripts we learn, e.g. how to order coffee in a fancy cafe
    ]
  ]
]

// TODO: Put discussion question from the reflection.
// Before putting the papers answer
#slide[
  = Discussion Question

  #one-by-one[
    *Are institutions just collections of norms?*

  ][
    *Answer:* Reasoning about when a norm becomes relevant or active in social settings requires a latent representation of the institutional structure. An account that simply enumerates injunctive and descriptive norms will be insufficient for this.
  ][
    
    *Example:* When Alex replaces Paul at the rental car agency, he inherits the service rep role's norms—not because we transferred Paul's individual norms, but because both occupy the same structural position. The institutional graph activates norms based on role occupancy, not individual identity.
  ]
]

// 6.1 How do people acquire and learn these things?
// 6.2 When do people use institutional stance
// When do people use  BOTH together? fig 1c / fig 1d
// Institution having beliefs / desires 

#new-section[Creating New Institutions]

#slide[
  = The Generative Capacity of Humans

  #one-by-one[
    We can explicitly represent institutional structures and reason *about* them

  ][
    Not just reasoning *through* them (like proto-institutional animals)

  ][
    This enables two uniquely human capacities:

  ][
    1. *Taking an institutional stance as an analytic tool*

    Reveal hidden role-based systems

  ][
    2. *Social constitution*

    Create genuinely new domains of behavior and social reality

  ]
]

#slide[
  = Analytic Tool: Revealing Hidden Structures

  #one-by-one[
    We can analyze phenomena we might not initially think of as institutional

  ][
    *Example:* Race, gender, and caste systems

  ][
    Often essentialized (thought of as deep quasi-biological kinds)

  ][
    But can be analyzed in *structural terms*

  ][
    Revealed as hierarchical systems of interlocking social roles

  ][
    "Woman" as a structural position defined in subordination to "man"

  ][
    Once revealed → we can evaluate, modify, or intentionally subvert them

  ]
]

#slide[
  = Social Constitution: Creating New Realities

  #one-by-one[
    Some entities are *socially constituted* (not just constructed)

  ][
    Their existence is actively sustained by institutional structures

  ][
    *Examples:* Ballots, voting, citizenship

  ]
]

#slide[
  = Socially Constituted vs. Socially Constructed

  #toolbox.side-by-side[
    *Socially Constructed:*

    Hammers, carpentry, carpenters

    Social forces involved in creation, but existence doesn't require social agreement

    *A hammer remains a hammer even if institutions change*
  ][
    *Socially Constituted:*

    Ballots, voting, citizens

    Existence requires institutional structures

    *A ballot can cease to be a ballot through institutional change*

    Even without changing physical properties
  ]
]

#new-section[Conclusion]
// TODO: Add discussion question Q3. The authors argue that possessing the institutional stance allows people to move beyond treating social categories like race, gender or caste as an essential / immutable feature of an agent, and instead understand such categories as contingent roles within a (potentially oppressive) institution. If each of these stances corresponds to a probabilistic generative model of the social world, how would those models differ? What kind of evidence would cause someone to decrease their belief in an essentialist model of a social category, and increase their belief in an institutional model?

#slide[
  = Implications: The Power to Create and Transform
  #one-by-one[
    The institutional stance enables us to:
  ][
    1. *Analyze existing institutions*

    Reveal hidden hierarchies and role-based systems
  ][
    2. *Critique unfair systems*

    Evaluate oppressive institutional structures
  ][
    3. *Imagine alternatives*

    Consider how to modify or erase unjust institutions
  ][
    4. *Create new realities*

    Synthesize novel institutional structures that genuinely create new social kinds
  ][
    The generative aspect allows us to imagine and pursue genuine institutional alternatives
  ]
]

#slide[
  #show: focus
  Questions & Discussion
]
