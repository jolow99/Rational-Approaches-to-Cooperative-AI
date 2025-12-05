#import "@preview/polylux:0.4.0": *
#import "@preview/metropolis-polylux:0.1.0" as metropolis
#import metropolis: new-section, focus

#show: metropolis.setup

// Title slide
#slide[
  #set page(header: none, footer: none, margin: 3em)

  #text(size: 1.3em)[
    *Probabilistic Role Coordination in Multi-Agent Systems*
  ]

  Using Bayesian Inference with Memo

  #metropolis.divider

  #set text(size: .8em, weight: "light")
  Prepared by Joseph Low and Emiel Robben

  12th November 2025
]

// Agenda
#slide[
  = Agenda

  #metropolis.outline
]

// INTRODUCTION SECTION

#new-section[Introduction]

#slide[
  = The Central Question

  #align(center)[
    #text(size: 22pt, weight: "bold")[
      How do agents infer their role within an institution, \
      and how does this shape their actions?
    ]
  ]

  #one-by-one[
    *The Challenge:*
    - Multiple agents must coordinate without central authority
    - Each has specialized capabilities but uncertain about their role
    - Must infer roles from observing each other's actions
  ][
    *Our Approach:*
    - Model agents using Bayesian inference over role assignments
    - Start simple, then add complexity (states, capabilities, difficulty)
    - Systematically analyze what makes coordination succeed
  ]
]

#slide[
  = Key Concepts

  #one-by-one[
    *Institutional Roles*
    - Roles define behavioral expectations (Fighter, Tank, Healer)
    - Actions are probabilistic given roles
    - Complementary roles improve team performance
  ][
    *Decentralized Inference*
    - Each agent maintains beliefs over role assignments
    - Agents observe actions and update beliefs (Bayesian)
    - Converge to shared understanding through iteration
  ][
    *The Memo Framework*
    - Probabilistic programming for Bayesian inference
    - Express generative models and perform inference
    - Natural fit for role coordination problems
  ]
]

// PART 1: BASIC GAME

#new-section[Part 1: Basic Game]

#slide[
  = Game Setup

  #toolbox.side-by-side[
    *Three Roles:*

    - *Fighter:* Specializes in attacking
    - *Tank:* Specializes in defense
    - *Healer:* Specializes in support
  ][
    *Three Actions:*

    - *Attack:* Deal damage to enemy
    - *Defend:* Protect team
    - *Heal:* Restore team health
  ]

  #show: later

  *Role Policies:* Each role has a preferred action distribution

  ```python
  ROLE_ACTION_PROBS = [
    [0.70, 0.25, 0.05],  # Fighter: mostly attacks
    [0.25, 0.70, 0.05],  # Tank: mostly defends
    [0.25, 0.05, 0.70],  # Healer: mostly heals
  ]
  ```
]

#slide[
  = Bayesian Inference with Memo

  #toolbox.side-by-side[
    *Inference Process:*
    1. Prior: Beliefs about roles
    2. Likelihood: Role → Action
    3. Evidence: Observe actions
    4. Posterior: Update beliefs
  ][
    ```python
    @memo
    def role_inference[r0, r1, r2](
      role_prior, obs_a0, obs_a1, obs_a2):
      observer: knows(r0, r1, r2)
      observer: thinks[
        team: assigned(r0, r1, r2,
          wpp=role_prior[r0,r1,r2]),
        team: chooses(a0,
          wpp=role_policy(r0, a0)),
        team: chooses(a1,
          wpp=role_policy(r1, a1)),
        team: chooses(a2,
          wpp=role_policy(r2, a2))
      ]
      observer: observes_that
        [team.a0 == obs_a0]
      observer: observes_that
        [team.a1 == obs_a1]
      observer: observes_that
        [team.a2 == obs_a2]
      return observer[Pr[...]]
    ```
  ]
]

#slide[
  = Role Convergence Over Time

  *Simulation:* Agents iteratively sample roles, act, and update beliefs

  #align(center)[
    #image("images/role_convergence_basic.png", width: 95%)
  ]

  *Key Observation:* Agents converge to complementary roles without central coordination!
]

// PART 2: STATEFUL EXTENSIONS

#new-section[Part 2: Stateful Extensions]

#slide[
  = Extended Game Mechanics

  #one-by-one[
    *Health States:*
    - Both enemy and team have health: 
      - DEAD → LOW → MEDIUM → HIGH → FULL
    - Win: enemy reaches DEAD
    - Lose: team reaches DEAD
  ][
    *State-Dependent Policies:*
    - Fighters attack more when enemy is weak
    - Tanks defend more when team is vulnerable
    - Healers respond to team health levels
  ][
    *Transition Dynamics:*
    - Actions affect health state changes
    - Probabilistic transitions based on team composition
  ]
]

#slide[
  = Player Stats and Prior Beliefs

  #toolbox.side-by-side[
    *Player Capabilities (Stats):*

    Each player has [STR, DEF, SUP]
    - P0: [0.7, 0.2, 0.1] → Fighter
    - P1: [0.2, 0.7, 0.1] → Tank
    - P2: [0.1, 0.2, 0.7] → Healer

    Stats determine effectiveness


    *How to initialize beliefs?*

    Three types of priors tested
  ][
    *Three Prior Types:*


    *1. Uniform*
    - All 27 assignments equal
    - Learn from scratch


    *2. Unconstrained Utility*
    - Prefer stat-matched roles
    - Allows duplicates


    *3. Constrained Utility*
    - Prefer stat-matched roles
    - *Enforces unique roles*
  ]
]

#slide[
  = Prior Comparison: Marginal Role Probabilities

  #align(center)[
    #image("images/prior_comparison.png", width: 90%)
  ]

  *Insight:* Constrained priors strongly bias toward complementary role assignments
]

#slide[
  = Full Game Dynamics Visualization

  #align(center)[
    #image("images/game_visualization.png", width: 90%)
  ]

  Shows role beliefs, enemy health, team health, action distribution, entropy, and summary stats
]

#slide[
  = Demo Game Key Observations

  From the comprehensive visualization, we observe:

  #one-by-one[
    *Rapid Convergence:* Role beliefs stabilize within 2-3 timesteps
  ][
    *Complementary Actions:* Team performs all three action types
  ][
    *Successful Outcome:* Enemy health reaches DEAD, team survives at HIGH health
  ][
    *High Confidence:* Entropy drops quickly, indicating certainty about roles
  ][
    *Stat Alignment:* Final roles match each player's best stat
  ]
]

// PART 3: EXPERIMENTS

#new-section[Part 3: Multi-Factor Experiments]

#slide[
  = Experimental Design

  *Full factorial design:* 3 × 3 × 3 = 27 conditions

  #toolbox.side-by-side[
    *Factor 1: Prior Type*
    - Uniform
    - Unconstrained utility
    - Constrained utility


    *Factor 2: Stat Profile*
    - Random (Dirichlet)
    - Balanced (0.33 each)
    - Specialist (0.8+ in one)
  ][
    *Factor 3: Difficulty*
    - Easy (0.5×)
    - Normal (1.0×)
    - Hard (1.5×)


    *Scale:*
    - 100 games per condition
    - *Total: 2,700 games*
  ]
]

#slide[
  = Main Effects: What Matters Most?

  #align(center)[
    #image("images/main_effects.png", width: 90%)
  ]

  #one-by-one[
    *Prior Type (Largest):* Constrained (83%) > Unconstrained (70%) > Uniform (55%)
  ][
    *Stat Profile (Moderate):* Specialist (73%) > Balanced (69%) > Random (66%)
  ][
    *Difficulty (Strong):* Easy (95%) > Normal (70%) > Hard (40%)
  ]
]

#slide[
  = Interaction Effects: Prior × Difficulty × Stats

  #toolbox.side-by-side[
    #align(center)[
      #image("images/interaction_heatmap.png", width: 100%)
    ]
  ][
    *Key Insights:*

    #one-by-one[
      *Prior × Difficulty:*
      - Easy: All work (~95%)
      - Hard: Gap widens
        - Constrained: 83%
        - Uniform: 40%
    ][
      *Prior × Stats:*
      - Specialists benefit most from utility priors
      - Balanced teams less sensitive
    ][
      *Takeaway:*
      Value of coordination scales with difficulty
    ]
  ]
]

// CONCLUSIONS

#new-section[Conclusions]

#slide[
  = Beyond Win Rate: Coordination Quality

  #one-by-one[
    *Convergence Speed:* Constrained priors converge fastest (fewer timesteps)
  ][
    *Role Certainty:* Lower entropy = more confident beliefs about roles
  ][
    *Stat Alignment:* Specialist teams achieve ~67% optimal role matching
  ]

  #show: later

  *Pattern:* Structured priors + specialized capabilities = superior coordination
]

#slide[
  = Implications for Cooperative AI Design

  #toolbox.side-by-side[
    *Why This Matters:*

    - Decentralized coordination is fundamental
    - Agents must infer structures from behavior
    - Bayesian inference handles uncertainty naturally


    *This work demonstrates how institutional roles emerge*
  ][
    *Design Principles:*


    *1. Structured priors*
    - Encode valid team compositions
    - Faster convergence


    *2. Complementary capabilities*
    - Heterogeneous > homogeneous
    - Clear role matching


    *3. Test under difficulty*
    - Easy tasks hide failures
    - Hard tasks reveal what works
  ]
]
