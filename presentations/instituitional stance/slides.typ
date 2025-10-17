#import "@preview/polylux:0.4.0": *
#import "@preview/metropolis-polylux:0.1.0" as metropolis
#import metropolis: new-section, focus

#show: metropolis.setup.with(
  text-font: "Helvetica Neue",
  math-font: "New Computer Modern Math",
  code-font: "Monaco",
)

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

  #metropolis.outline
]

#new-section[The Core Argument]

#slide[
  = The Standard View: It's All About Mentalizing

  *Dominant explanation of human social cognition:*
  - We understand behavior through Theory of Mind
  - Attribute mental states: beliefs, desires, intentions
  - This mentalistic stance is uniquely human
  - Emerges early, supported by specialized neural circuitry

  #v(1em)

  *But is this the whole story?*
]

#slide[
  = Kate & Eric: The Puzzle

  *At the office (Monday):*

  Kate steps out of her glass office, waves at Eric at his desk:

  _"Can you feed my parking meter, pick up lunch, print the documents I emailed you, and push my next appointment by 30 minutes?"_

  Eric jots it down and rushes out.

  #v(1em)

  *At the movies (Saturday):*

  Kate spots Eric a few rows behind her (on a date).

  She waves him over: _"Get me some popcorn and a fountain drink."_

  #v(0.5em)

  #text(fill: red)[*Why does this feel so wrong?*]
]

#slide[
  = The Mentalistic Analysis Falls Short

  *Mentalistic interpretation (Monday):*
  - Kate wants lunch, believes Eric can fulfill this
  - Eric wants to fulfill Kate's desires, believes he can

  #v(0.5em)

  *Mentalistic interpretation (Saturday):*
  - Same desires! Same beliefs!
  - Why is Eric surprised? Why is Kate's behavior inappropriate?

  #v(1em)

  *Missing piece: Roles*
  - Monday: Eric is Kate's assistant (institutional role active)
  - Saturday: They're acquaintances (different role context)
  - The role determines what's appropriate, not just mental states
]

#slide[
  = The Central Claim

  #text(size: 1.1em)[
    *Human social intelligence requires TWO co-equal systems:*
  ]

  #v(1em)

  1. *Mentalistic Stance*
     - Predict behavior via mental states
     - Flexible across novel contexts
     - Computationally demanding

  #v(0.5em)

  2. *Institutional Stance*
     - Interpret behavior via roles and norms
     - Efficient in structured contexts
     - Makes behavior predictable without mind-reading

  #v(1em)

  Neither reduces to the other. Both are evolutionarily ancient.
  Human uniqueness lies in their *generative* institutional stance.
]

#new-section[What Is an Institution?]

#slide[
  = Formal Definition

  An institution is a *network of roles with normative entailments*

  #v(1em)

  *Components:*
  - *Roles* (R): Positions agents can occupy
  - *Norms* (φ): Rules that grant, obligate, or restrict behavior
    - Node norms: Internal to a role
    - Edge norms: Between roles
  - *Structure*: How roles relate to each other

  #v(1em)

  *Key insight:* Roles are not isolated—they're understood as part of a broader institutional structure
]

#slide[
  = Institutional Stance as Intuitive Theory

  Satisfies Gopnik & Meltzoff criteria:

  #v(0.5em)

  1. *Abstract*: Roles/norms ≠ observable actions
  2. *Coherent*: Components work as a system
  3. *Causal*: Roles causally explain behavior
     - "She did that *because* she's the manager"
  4. *Ontological commitment*: We believe institutions are real

  #v(1em)

  *Example:* Seeing someone in an apron stocking shelves
  - Not just "likes organizing"
  - Occupying the role of "stock person"
  - Expectations flow from the role, not personality
]

#slide[
  = The Rental Car Example

  Laurie arrives at rental car agency.

  Paul helps with paperwork. Fee is higher than expected → argument starts.

  Paul excuses himself. Alex appears and continues exactly where Paul left off.

  #v(1em)

  *Mentalistic stance:* Transfer of Paul's beliefs/desires to Alex is bizarre!

  *Institutional stance:* Unsurprising. Same role = same goals/behaviors.

  #v(1em)

  Compare: During a personal argument with a friend, imagine if they left and a casual acquaintance stepped in to continue arguing...
]

#new-section[Evolutionary Origins]

#slide[
  = Three Stages of Development

  *Stage 1: Proto-institutional*
  - Rigid role-based systems
  - No role-filler independence
  - Examples: ant castes, kinship bonds

  #v(0.5em)

  *Stage 2: Fixed institutional*
  - Role-filler independence emerges
  - Can swap roles, but limited set
  - Examples: primate dominance hierarchies, lion hunting roles

  #v(0.5em)

  *Stage 3: Generative institutional* (humans)
  - Create arbitrary new institutions
  - "Grammar" for institutional structures
  - Examples: soccer teams, universities, book clubs
]

#slide[
  = Stage 1: Proto-Institutional

  *Social insects: Ants*
  - Workers vs. soldiers (biologically determined)
  - Each "role" has different affordances
  - Dulosis: Captured worker ants continue their role in service of captors

  #v(0.5em)

  *Key limitation:* No abstract representation of role vs. occupier
  - Agent IS the role
  - No swapping possible
  - Still enables coordination without mentalizing

  #v(0.5em)

  Found across: kinship recognition, simple dominance, coordinated hunting (falcons)
]

#slide[
  = Stage 2: Fixed Institutional

  *Primates: Baboon dominance hierarchies*
  - Dynamic, continuously renegotiated
  - Specialized intelligence for tracking role changes
  - Role-filler independence: know that Alex *is currently* alpha

  #v(0.5em)

  *Lions: Coordinated hunting*
  - Two center hunters, two wings
  - Role specialization + ability to switch
  - Must understand all roles need filling

  #v(0.5em)

  *Honey bees: Forager/receiver*
  - Tremble dance signals need for role switching
  - Some foragers switch to receivers dynamically
]

#slide[
  = Stage 3: Generative (Humans Only)

  *The explosion of institutional diversity:*
  - Reading clubs
  - Neighborhood associations
  - University committees
  - Governments
  - Startups
  - Sports teams

  #v(1em)

  *Key: Grammar of institutions*
  - Compositional system
  - Create unbounded new structures
  - Rapid synthesis and inference
  - Cultural evolution of institutions

  #v(0.5em)

  This is the uniquely human capacity.
]

#new-section[Development & Acquisition]

#slide[
  = Early Role-Based Reasoning

  *Infants (prelinguistic):*
  - Understand dominance relations (who defers to whom)
  - Distinguish dominance by fear vs. dominance by social grant
  - Make transitive inferences in hierarchies
  - Understand caring relations (shaped by own attachment)

  #v(0.5em)

  *Surprising role sensitivity:*
  - Object transfer → representation of "giving"
  - Improved memory for objects in giving context
  - Detect agent/patient role reversals

  #v(0.5em)

  *Tseltal infants (Mexico):* Learn honorifics through passive exposure → tracking social categories/roles early
]

#slide[
  = Toddlers & Young Children

  *3-year-olds:*
  - Fail false belief tasks (mentalistic)
  - But succeed when framed as rule-following (institutional)
  - _"Dolls always go in the toy box"_ → predict search there

  #v(0.5em)

  *Role-based memory:*
  - Better at remembering role-based events than specific events
  - Make strong inferences from schemas

  #v(0.5em)

  *Sociodramatic role play:*
  - Pretend to be caregivers, shopkeepers, doctors
  - Not fantastical—mundane real-life roles
  - Practice for institutional stance?
]

#slide[
  = Learning Mechanisms

  1. *Statistical learning*
     - Covariation between behavior and context
     - Person always greets at building → role inference

  #v(0.5em)

  2. *Norm scope inference*
     - Which group/role does this norm apply to?
     - Rational inference from behavioral patterns

  #v(0.5em)

  3. *Implausibility detection*
     - Unlikely mental states signal roles
     - Doorman rushing to open door → role, not personality

  #v(0.5em)

  4. *Bayesian structure learning*
     - Adults can infer latent social structures
     - Reconstruct org charts from sparse interactions
]

#new-section[Institutional Stance in Action]

#slide[
  = When Do We Deploy It?

  *Status indicators:*
  - Uniforms (police, doctors, baristas)
  - Verbal disclosure: "I'm writing in my capacity as Chair..."
  - Linguistic markers: Honorifics, formal pronouns (usted, -san)
  - Historical surnames (Smith, Baker, Cook)

  #v(1em)

  *Context inference:*
  - Knowledge of typical institutional settings
  - Coffee shop → person asking for order is likely employee
  - May be pervasively active in background
]

#slide[
  = The Apron Effect

  Two identical people, identical actions, identical context.

  #v(0.5em)

  *Person A (no apron):* Picks up olive oil bottle
  - Inference: Likes olive oil, will cook with it

  *Person B (wearing apron):* Picks up olive oil bottle
  - Inference: Checking sell-by date, stocking shelves
  - Says nothing about personal preferences

  #v(1em)

  A single marker completely changes our interpretive stance.
]

#slide[
  = Interplay with Mentalizing

  *Three modes of interaction:*

  #v(0.5em)

  1. *Institutional without mentalizing*
     - Like vending machine: input → output
     - Reduces cognitive load
     - Barista example: assume coffee will arrive

  #v(0.5em)

  2. *Competition between stances*
     - Institutional failure → trigger mentalistic
     - Coffee delay → observe barista's mental state
     - Unexpected formality → check if role is active

  #v(0.5em)

  3. *Rich combination*
     - Roles can require mental states
     - Stock person should "know" where items are
     - But mental states are role-tagged, not personal
]

#new-section[Key Distinctions]

#slide[
  = Not Just Scripts

  *Schemas/scripts (Schank & Abelson):*
  - General knowledge organization
  - Can apply to non-social domains (building a campfire)
  - Pragmatically useful

  #v(0.5em)

  *Institutional stance:*
  - Specialized intuitive theory
  - Evolutionarily ancient
  - Social-specific
  - *Generative* in humans

  #v(1em)

  Scripts may share structure, but institutional stance is a dedicated system for social coordination.
]

#slide[
  = Not Just Folk Sociology

  *Folk sociology:*
  - Focus on groups and categories
  - Often essentialized (race, gender)
  - Relatively undifferentiated members

  #v(0.5em)

  *Institutional stance:*
  - Focus on *structured relations* between roles
  - Within-group differentiation (junior vs. senior faculty)
  - Between-group relations (hierarchies)

  #v(1em)

  Structural perspective can actually *challenge* essentialism:
  - Gender/race as structural positions
  - Not biological kinds but social roles in hierarchies
]

#slide[
  = Not Just Shared Intentionality

  *Shared intentionality (Tomasello):*
  - Represents shared goals collaboratively
  - "We intend to open this box together"
  - Unique to humans, thoroughly mentalistic

  #v(0.5em)

  *Institutional stance:*
  - Can operate *without* shared intentions
  - "Minimal cooperation": just play your role
  - Works if everyone knows their role
  - No recursive mind-reading needed

  #v(1em)

  Shared intentionality crucial for *creating* new institutions

  But existing institutions can structure behavior without it
]

#new-section[Social Constitution]

#slide[
  = Institutions Create New Realities

  *Socially constituted kinds:*
  - Ballot, voting, citizen
  - Teacher, money, property

  #v(0.5em)

  *Not merely socially constructed*
  - Hammers are constructed (need people to make them)
  - But hammers remain hammers independent of social beliefs

  #v(0.5em)

  *Socially constituted:*
  - Existence sustained by institutional structures
  - Ballot can cease to be ballot by institutional change
  - No change in physical properties

  #v(0.5em)

  *Empirical evidence:* Children distinguish these by age 5-7
]

#slide[
  = Taking an Institutional Stance

  The stance is both:
  - *Deployed*: Interpreting others' behavior through roles
  - *Applied as analysis*: Revealing hidden institutional structures

  #v(1em)

  *Examples of application:*
  - Analyzing race/gender/caste as structural positions
  - Not essences, but roles in hierarchies
  - Revealing systems of subordination
  - Enables critique and transformation

  #v(1em)

  The institutional stance gives us tools to question and redesign social reality.
]

#new-section[Discussion Questions]

#slide[
  = Discussion 1: Empirical Evidence

  *Questions to consider:*

  - How convincing is the Kate & Eric example?
  - Are there alternative mentalistic explanations?
  - What empirical tests would distinguish the stances?

  #v(0.5em)

  *Development claims:*
  - Does infant dominance understanding require institutional stance?
  - Or could it be explained by simpler mechanisms?

  #v(0.5em)

  *Neural evidence:*
  - If institutional stance is ancient and specialized, where's the dedicated circuitry?
  - Could it overlap with ToM network?
]

#slide[
  = Discussion 2: The Grammar Claim

  *Claim:* Humans have a "grammar of institutions"

  #v(0.5em)

  *Questions:*
  - What are the primitive operations?
  - What's the compositional structure?
  - Is it domain-specific or general intelligence?

  #v(0.5em)

  *Compare to language:*
  - Language: Recursive syntax, universal grammar
  - Institutions: Roles combine... how?

  #v(0.5em)

  *Challenge:* Institutions vary enormously across cultures
  - More like cultural evolution than grammar?
  - Or is there underlying universal structure?
]

#slide[
  = Discussion 3: When Stances Conflict

  *Scenarios:*

  1. Bureaucrat follows rule you find unjust
     - Institutional: "Just doing my job"
     - Mentalistic: "They chose this"

  #v(0.5em)

  2. Friend acts distant and formal
     - Changed roles?
     - Or changed mental states?

  #v(0.5em)

  *Questions:*
  - Which stance do we privilege?
  - When is "just following orders" legitimate?
  - How do cultural values affect this?
]

#slide[
  = Discussion 4: Dehumanization

  *The dark side:*

  Strong institutional stance might reduce mentalizing
  - See role-player, not person
  - Reduce empathy
  - "Banality of evil" (Eichmann defense)

  #v(1em)

  *Questions:*
  - Is dehumanization linked to institutional stance?
  - Service workers treated instrumentally?
  - How to balance efficiency and humanity?
  - Can institutional stance be liberating instead?
]

#slide[
  = Discussion 5: AI and Institutions

  *Implications for AI systems:*

  #v(0.5em)

  1. *Human-AI interaction*
     - Should AI act through institutional roles?
     - Does it reduce need for AI "alignment"?

  #v(0.5em)

  2. *Multi-agent AI*
     - Design through institutional structures?
     - Coordination without full mentalizing

  #v(0.5em)

  3. *AI governance*
     - Institutions for AI systems
     - Who designs them? How?

  #v(0.5em)

  *Your thoughts:* How does this framework apply to your research?
]

#new-section[Critical Evaluation]

#slide[
  = Strengths of the Paper

  1. *Compelling examples*
     - Kate & Eric, rental car agency
     - Phenomenologically accurate

  #v(0.5em)

  2. *Evolutionary story*
     - Cross-species evidence
     - Plausible progression

  #v(0.5em)

  3. *Unifies diverse phenomena*
     - Connects development, evolution, culture
     - Links to folk sociology, scripts, shared intentionality

  #v(0.5em)

  4. *Practical implications*
     - Social change, AI, governance
]

#slide[
  = Limitations and Open Questions

  1. *Lack of formalization*
     - What exactly is the "grammar"?
     - How does inference work computationally?

  #v(0.5em)

  2. *Neural evidence sparse*
     - Where is the specialized circuitry?
     - How to test empirically?

  #v(0.5em)

  3. *Boundary cases unclear*
     - When exactly do we deploy each stance?
     - How do we decide?

  #v(0.5em)

  4. *Cultural variation*
     - How much is universal vs. learned?
     - Grammar metaphor may be oversold
]

#slide[
  = What Would Change Your Mind?

  *Evidence that would challenge the institutional stance:*

  #v(0.5em)

  - Kate & Eric scenario feels natural in some cultures?
  - Infants' dominance understanding is fully mentalistic?
  - All "institutional" predictions can be made mentalistically?
  - No distinct neural signature found?

  #v(1em)

  *Evidence that would strengthen it:*

  #v(0.5em)

  - Computational model makes novel predictions?
  - Distinct neural circuitry identified?
  - Developmental dissociations found?
  - Cross-cultural universals in institutional reasoning?
]

#new-section[Takeaways]

#slide[
  = Core Message

  *Traditional view:* Human social intelligence = Mentalizing

  *This paper:* Human social intelligence = Mentalizing + Institutional reasoning

  #v(1em)

  *The institutional stance:*
  - Evolutionarily ancient (precursors across species)
  - Early developing (infancy)
  - Uniquely generative in humans
  - Co-equal with mentalizing
  - Enables large-scale coordination
  - Creates new social realities

  #v(1em)

  Neither stance reduces to the other. Both are essential.
]

#slide[
  = For Your Research

  *Potential applications:*

  #v(0.5em)

  - Multi-agent coordination problems
  - Institutional design for AI systems
  - Understanding organizational behavior
  - Governance and collective decision-making
  - Human-AI interaction paradigms

  #v(1em)

  *Questions to ask:*
  - Where do roles structure behavior in your domain?
  - Could institutional analysis simplify the problem?
  - What institutions should we design?
]

#slide[
  #show: focus
  Questions & Discussion
]
