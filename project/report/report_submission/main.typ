#import "@preview/arkheion:0.1.0": arkheion, arkheion-appendices

#show: arkheion.with(
  title: "Collective Convergence on Institutional Structures: Progress Report",
  authors: (
    (name: "Joseph Low", email: "jolow999@gmail.com", affiliation: "Metagov"),
    (name: "Emiel Robben", email: "e1518367@u.nus.edu", affiliation: "NUS, Chalmers"),
  ),
  abstract: [His progress report documents our work investigating how agents with uncertain beliefs about how a group is best organized converge on a shared understanding of their role in the group. We report on our implementation of baseline coordination models and outline remaining work to incorporate asymmetry and inverse planning approaches.],
  date: "Oct 10, 2025",
)
#set cite(style: "chicago-author-date")
#show link: underline

= Progress to Date

== Learning MeMo Framework
The bulk of our time has been spent completing hands-on tutorials with the MeMo probabilistic programming framework, which enables recursive Bayesian modeling of multi-agent systems. This provides the computational foundation for modeling agents who reason about each other's beliefs about their roles.

== Progress on Computational Framework

We implemented a simplified two-agent coordination model using a game-theoretic approach to familiarize ourselves with the MeMo framework (#link("https://github.com/jolow99/Rational-Approaches-to-Cooperative-AI/blob/main/project/report/instituitional_convergence_v1.ipynb")[See notebook]). The model consists of:

*Actions*: Each agent can choose between two actions: ASSERT (take initiative) or DEFER (yield to the other).

*Roles*: Agents have latent role types: LEADER or FOLLOWER, which influence their action preferences.

*Payoff Structure*: We defined a coordination game with the following payoff matrix for individual rewards:
- If I ASSERT and other ASSERTS: 0.0 (conflict, both trying to lead)
- If I ASSERT and other DEFERS: 1.0 (successful coordination)
- If I DEFER: 0.5 regardless (safe but suboptimal)

The collective payoff is the sum of both agents' individual payoffs, incentivizing complementary role-taking rather than symmetric behavior.

We explored different levels of strategic reasoning in this baseline model:

- *Random baseline*: Agents choose actions uniformly at random
- *Naive game*: Agents have random role assignments and act according to roles
- *Hierarchical game*: Agents have asymmetric role preferences (leader vs. follower)
- *One-sided rational*: One agent models the other's behavior
- *Mutual rational*: Both agents model each other as naive
- *Recursive reasoning*: Agents model each other at varying depths of mutual reasoning

*Preliminary finding*: All models converge to similar collective payoffs (~1.0) because the current setup is perfectly symmetrical. Without asymmetry-breaking mechanisms, agents cannot stably differentiate into complementary roles. This game-theoretic formulation provides a foundation for exploring how strategic reasoning and belief updating might lead to role differentiation, though additional asymmetry-breaking mechanisms are needed.

== Attempt at Inverse Planning Computational Framework

We began exploring an alternative inverse planning approach with three agents working on a project together (#link("https://github.com/jolow99/Rational-Approaches-to-Cooperative-AI/blob/main/project/report/instituitional_convergence_v2.ipynb")[See notebook]). This formulation attempts to model how agents infer each other's role preferences from observed actions and converge on complementary roles.

*Setup*: Three agents, each with latent role preferences (CODER, WRITER, DESIGNER). Agents can choose from three corresponding actions (CODE, WRITE, DESIGN).

*Reward Structure*:
- *Individual reward*: Agents receive satisfaction (1.0) when their action matches their preferred role, 0.0 otherwise
- *Collective reward*: The team succeeds when all three roles are covered (each agent doing a different task)

*Key Components*:
1. *Forward Model (Q-function)*: Given role preferences, compute optimal actions that maximize individual satisfaction plus collective success
2. *Inverse Model*: Given observed actions, infer role preferences (to be implemented)
3. *Convergence*: As beliefs about roles sharpen, stable role differentiation should emerge (to be demonstrated)

*Current status*: We have implemented a basic Q-function that computes expected rewards over time horizons. The Q-values show that when action matches role, agents receive maximum cumulative reward (5.0 over time horizon of 3). However, the inverse inference component and learning dynamics remain to be implemented.

== Refining Our Intuition About the Problem
During a discussion on Oct 8, Emiel provided a concrete example from his experience during intro week, where he and a group of strangers competed against other groups to solve challenges in sequence. This scenario illustrates the natural emergence of leadership. Our core question is: How do leadership hierarchies spontaneously emerge when a random group of strangers needs to solve a problem together?

*Intuitive explanation for emergence*: Agent A observes how the team solves problems and recognizes they may have insights others lack. They demonstrate this competence by being more proactive in solving the next challenge, communicating their insights in ways others will understand (similar to pragmatic speakers in communication models). If this leads to better outcomes, other agents notice the difference and attribute it to Agent A. Over time, others model Agent A as more competent and pay closer attention when they act or communicate.

*Types of hierarchies*: Joseph Henrich in "The Secret of Our Success" distinguishes between two types of hierarchies:
- *Dominance hierarchies*: Based on physical dominance and potentially violence
- *Prestige hierarchies*: Based on competence, susceptible to imitation and sympathy

For our model of collaborative group tasks, we could model this as prestige hierarchies—how competence signals and observational learning lead to stable role differentiation without coercion.

= Remaining Work

== Phase 1: Clarifying Game-Theoretic vs. Inverse Planning Approaches (Deadline: Oct 15)
*Goal*: Resolve conceptual confusion between the two approaches and determine the best path forward for modeling institutional convergence.

*Key tasks*:
- Clarify theoretical distinctions: game-theoretic best-response dynamics vs. Bayesian inverse inference from observed actions
- Resolve whether there should be explicit roles that agents choose (which then determine their actions), or whether there is no explicit concept of role but we infer a role when an agent converges to consistently performing the same action
- Consult with Karthik on MeMo implementation challenges, particularly encoding state histories and observation sequences
- Decide on primary modeling approach based on theoretical fit and technical feasibility

*Current blocker*: Difficulty encoding state histories in MeMo for the inverse planning approach.

== Phase 2: Inverse Planning Implementation (Deadline: Oct 29)
*Joseph*: Implement inverse planning model where agents maintain beliefs about others' role preferences and update these beliefs based on observed action sequences. Focus on getting the inference mechanism working correctly.

*Emiel*: Develop observation and learning dynamics—how agents accumulate evidence from repeated interactions and how beliefs converge over time.

== Phase 3: Analysis and Visualization (Deadline: Nov 5)
*Joseph*: Create visualizations showing belief trajectories, convergence dynamics, and final role assignments across different initial conditions and parameter settings.

*Emiel*: Analyze how prestige hierarchies emerge through competence signaling—connect computational results to the refined intuition about leadership emergence.

== Phase 4: Final Notebook and Writeup (Deadline: Nov 12)
Both team members: Complete interactive Jupyter notebook with full implementation, analysis, and connections to theoretical frameworks (@jara2024institutional, @davis2022inferring). Finalize project submission.

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
