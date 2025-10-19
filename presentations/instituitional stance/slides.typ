#import "@preview/polylux:0.4.0": *
#import "@preview/metropolis-polylux:0.1.0" as metropolis
#import metropolis: new-section, focus

#enable-handout-mode(true)

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
      #v(1em)

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

#new-section[Intuitive Theories and Norm Violations]

#slide[
  = What is an Intuitive Theory?

  #one-by-one[
    *Intuitive theories* are cognitive frameworks humans use to explain and predict behavior
  ][
    Like scientific theories, they:
    - Make predictions about unobserved phenomena
    - Explain causal relationships
    - Support counterfactual reasoning
  ][
    Unlike scientific theories:
    - Often implicit and automatic
    - Develop early in childhood
    - May not be consciously accessible
  ][
    Examples: intuitive physics, intuitive psychology (Theory of Mind), intuitive biology
  ]
]

#slide[
  = Understanding Norm Violations

  #toolbox.side-by-side[
    #one-by-one[
      *Theory of Mind (Mentalistic Stance):*
    ][
      Norms are _inferred_ from mental states
    ][
      "They violated a norm because they failed to consider my beliefs/desires"
    ][
      Norm violations = failures of mind-reading
    ]
  ][
    #one-by-one(start: 5)[
      *Theory of Institutions (Institutional Stance):*
    ][
      Norms are _first-class citizens_
    ][
      "They violated a norm because they acted outside their role"
    ][
      Norm violations = violations of institutional structure
    ]
  ]

  #v(1em)

  #one-by-one(start: 9)[
    The institutional stance treats social norms as fundamental features of reality, not derived from individual psychology
  ]
]

#slide[
  = Four Lines of Evidence for Theory of Mind

  #text(size: 0.9em)[
  #one-by-one[
    *1. Evidence from infants*
  ][
    - Infants as young as 6 months track others' beliefs and knowledge states
    - False belief understanding emerges early (implicit by 15 months)
    - Gaze-following and joint attention by 9-12 months
    - Suggests ToM is foundational to human cognition
  ][
    *2. Function in society*
  ][
    - Enables coordination without explicit communication
    - Predicting others' actions based on their mental states
    - Understanding deception, teaching, and cooperation
    - Essential for human social complexity
  ]
  ]
]

#slide[
  = Four Lines of Evidence for Theory of Mind (cont.)

  #text(size: 0.9em)[
  #one-by-one[
    *3. Neural circuitry*
  ][
    - Dedicated brain regions: temporoparietal junction (TPJ), medial prefrontal cortex (mPFC)
    - Consistent activation across mentalizing tasks
    - Disruption leads to difficulties in social cognition
    - Suggests specialized cognitive architecture
  ][
    *4. Automatic behavior*
  ][
    - Spontaneous mentalizing occurs without conscious effort
    - Hard to "turn off" mental state attribution
    - Adults automatically track others' perspectives even when irrelevant
    - Suggests ToM is a default mode of social cognition
  ][
    *Conclusion:* Theory of Mind is well-established as a core human cognitive capacity
  ]
  ]
]

#new-section[Three Stages of Institutions]

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

#slide[
  = Stage 1: Proto-Institutional
  #toolbox.side-by-side[
    #image("images/stage_1.png", width: 60%)
  ][
    #one-by-one[
      *The core idea:* Learn that specific individuals occupy specific roles
    ][
      This allows us to:
      - Predict how this individual will act
      - Understand how to interact with them
      - Different roles = different social affordances
    ][
      *Example (kinship):* From young age, learn to identify who mother is and distinguish her from other humans
    ]
  ]
]

#slide[
  = Stage 1: Key Limitation

  *No abstract representation of role vs. occupier*

  The agent IS the role—just an association of specific individuals to social affordances

  No role swapping possible

  Still enables coordination without mentalizing
]

#slide[
  = Stage 2: Fixed Institutional

  #toolbox.side-by-side[
    #image("images/stage_2.png", width: 80%)
  ][
    #one-by-one[
      *The core idea:* Any individual can occupy specific roles

    ][
      Abstract representation of roles independent of who occupies them

    ][
      Agents can track and remember:
      - Which role an individual occupies
      - When roles change
      - How to adjust behavior accordingly

    ]
  ]
]

#slide[
  = Stage 2: Examples

  #one-by-one[
    *Baboon dominance hierarchies:* Dynamic, continuously renegotiated
    - Know that Alex *is currently* alpha (not inherently alpha)
    - Specialized intelligence for tracking role changes

  ][
    *Lions coordinated hunting:* Two center hunters, two wings
    - Role specialization + ability to switch
    - Must understand all roles need filling

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
  = Stage 3: Generative Institutional

  #toolbox.side-by-side[
    #image("images/stage_3.png", width: 80%)
  ][
    #one-by-one[
      *The core idea:* Generative system to synthesize novel institutional structures

    ][
      Multiple institutional representations operating simultaneously:
      - Dominance hierarchies
      - Caregiving/kinship relations
      - Hunting coordination

    ][
      Must reason about how these structures combine and interact compositionally

    ]
  ]
]

#slide[
  = Stage 3: The Grammar of Institutions

  #one-by-one[
    Humans have an *intuitive Theory of Institutions* (akin to Theory of Mind)

  ][
    This enables us to:
    1. Identify normatively structured systems of interconnected roles
    2. Compositionally construct new such systems
    3. Determine which agents occupy those roles
    4. Use that knowledge to interact with others

  ][
    *The explosion of institutional diversity:*

    Reading clubs, sports teams, university committees, governments, startups, homeowner associations...

  ]
]

#new-section[Institutions as Graphs]

#slide[
  = What is an Institution?

  #one-by-one[
    An institution is a *graph of roles with normative relations*

  ][
    *Nodes = Roles*
    - Who can occupy the role
    - Powers granted by the role
    - Obligations imposed by it

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
  = The Institutional Stance as an Intuitive Theory

  #one-by-one[
    To take an institutional stance is to use knowledge of graph structure as a *causal model* to interpret behavior

  ][
    Like Theory of Mind, it supports prediction, interpretation, and explanation

  ][
    But *how do we know* the institutional stance is a proper intuitive theory?

  ][
    Answer: It satisfies the four *Gopnik-Meltzoff structural features* of intuitive theories

  ]
]

#slide[
  = Four Structural Features of Intuitive Theories

  #text(size: 0.9em)[
  #one-by-one[
    *1. Abstract:* Representations used to interpret behavior (roles, norms) differ from observable data (actions)

  ][
    *2. Coherent:* Theoretical constructs work together as a single system—multiple components needed to interpret behavior

  ][
    *3. Causal:* Roles have causal and explanatory power in the counterfactual sense

  ][
    "The behavior would not have occurred had the agent not been occupying this role"

  ][
    *4. Ontological commitments:* We use the system to make counterfactual claims and predictions

  ]
  ]
]

#slide[
  = Why Graph Structure Matters

  #one-by-one[
    *Not just a collection of isolated norms*

  ][
    The rental car example revisited:
    - Paul and Alex occupy the same *node* (service rep)
    - This node has relations to the *customer* node
    - When Alex replaces Paul, he inherits these relational norms

  ][
    *Contrast with personal relationships:*
    - Friend arguing with you: not part of formal institutional graph
    - No "friend → friend" edge norm for argument-continuation
    - Substitution violates expectations

  ]
]

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
