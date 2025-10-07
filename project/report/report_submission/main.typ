#import "@preview/arkheion:0.1.0": arkheion, arkheion-appendices

#show: arkheion.with(
  title: "Collective Convergence on Institutional Structures: Progress Report",
  authors: (
    (name: "Joseph Low", email: "jolow999@gmail.com", affiliation: "Metagov"),
    (name: "Emiel Robben", email: "placeholder@gmail.com", affiliation: "Metagov"),
  ),
  abstract: [This progress report documents our work investigating how agents with uncertain beliefs about collective structure converge on shared institutional understanding through Bayesian inference. We report on our implementation of baseline coordination models and outline remaining work to incorporate asymmetry and inverse planning approaches.],
  date: "Oct 10, 2025",
)
#set cite(style: "chicago-author-date")
#show link: underline

= Progress to Date

== Learning MeMo Framework
We have completed hands-on tutorials with the MeMo probabilistic programming framework, which enables recursive Bayesian modeling of multi-agent systems. This provides the computational foundation for modeling agents who reason about each other's beliefs about institutional roles.

== Baseline Symmetrical Model
We implemented a baseline two-agent coordination model in the MeMo framework exploring different levels of strategic reasoning:

- *Random baseline*: Agents choose actions uniformly at random
- *Naive game*: Agents have random role assignments and act according to roles
- *Hierarchical game*: Agents have asymmetric role preferences (leader vs. follower)
- *One-sided rational*: One agent models the other's behavior
- *Mutual rational*: Both agents model each other as naive
- *Recursive reasoning*: Agents model each other at varying depths of mutual reasoning

*Preliminary finding*: All models converge to similar collective payoffs (~1.0) because the current setup is perfectly symmetrical. Without asymmetry-breaking mechanisms, agents cannot stably differentiate into complementary roles.

= Remaining Work

== Phase 1: Breaking Symmetry (Deadline: Oct 24)
*Joseph*: Implement asymmetric role priors where agents have slight biases toward different roles (e.g., Alice 55% leader preference, Bob 55% follower preference). Test whether recursive reasoning amplifies these small differences into stable role differentiation.

*Emiel*: Add observation-based learning where agents update role beliefs based on interaction outcomes over multiple rounds. Measure convergence speed to stable role assignments.

== Phase 2: Inverse Planning Implementation (Deadline: Nov 7)
*Joseph*: Reformulate the current game-theoretic approach using inverse planning where agents infer others' roles from observed actions rather than best-responding to predicted actions. Compare convergence properties of both approaches.

*Emiel*: Extend the model to N agents (3-5) to test whether hierarchical structures emerge in larger groups and how inference scales with group size.

== Phase 3: Theoretical Integration (Deadline: Nov 21)
*Joseph*: Revisit @jara2024institutional and formalize connections between our computational model and the institutional stance framework, specifically how role-based normative expectations constrain the inference process.

*Emiel*: Integrate insights from @davis2022inferring on social structure inference, particularly their "intuitive sociologies" likelihood function P(D|S), to ground our model in established theory.

== Phase 4: Notebook Finalization (Deadline: Dec 1)
Both team members: Complete interactive Jupyter notebook with visualizations and analysis (see outline below).

#pagebreak()

= Notebook Outline

== Introduction and Motivation
Overview of institutional convergence problem with simple illustrative example. Contrast with traditional multi-agent coordination approaches.

== MeMo Framework Basics
Brief tutorial on key MeMo primitives (chooses, thinks, E, wpp) with minimal working examples to make notebook self-contained.




== Baseline Models: Symmetric Case
Progressively build from random agents through naive, one-sided rational, mutual rational, to recursive reasoning models at varying depths. Show that symmetry prevents stable role differentiation. Include visualization of action probabilities and expected payoffs across all model variants.

== Breaking Symmetry: Asymmetric Priors
Introduce slight role biases and demonstrate how recursive reasoning amplifies differences. Visualize belief trajectories over reasoning depth.

== Breaking Symmetry: Observational Learning
Multi-round interaction where agents update beliefs based on observed outcomes. Plot convergence dynamics and final role assignments across different initial conditions.

== Game-Theoretic vs. Inverse Planning
Compare the two approaches side-by-side on the same coordination problems. Analyze computational costs and convergence properties.

=== Game-Theoretic Approach
Best-response dynamics and equilibrium analysis.

=== Inverse Planning Approach
Bayesian role inference from observed actions.

=== Comparative Analysis
Which approach converges faster? More reliably? Under what conditions does each excel?

== Scaling to N Agents
Extend models to 3-5 agents. Visualize emergent hierarchical structures using network diagrams. Analyze how inference complexity scales.

== Theoretical Connections
Discuss connections to institutional stance (@jara2024institutional) and social structure inference (@davis2022inferring). Interpret computational results through these theoretical lenses.

== Discussion and Future Directions
Summarize findings, limitations, and promising directions for future work.

#bibliography("bibliography.bib")
