#import "@preview/arkheion:0.1.0": arkheion, arkheion-appendices

#show: arkheion.with(
  title: "Collective Convergence on Instituitional Structures",
  authors: (
    (name: "Joseph Low", email: "jolow999@gmail.com", affiliation: "Independent"),
  ),
  // Insert your abstract after the colon, wrapped in brackets.
  // Example: `abstract: [This is my abstract...]`
  abstract: [This project proposes to investigate how agents with uncertain beliefs about how a collective is structured can interactively converge on a shared understanding of an institutional structure through a process of Bayesian inference. 
],
  date: "Sep 5, 2025",
)
#set cite(style: "chicago-author-date")
#show link: underline

= Introduction
Humans exhibit a remarkable capacity to coordinate effectively in novel social situations, even without explicit communication or predefined roles. This ability is not just derived from a theory of mind, but has more recently been argued to be rooted in an "institutional stance," our ability to interpret behavior through the lens of social roles and norms. Current multi-agent coordination models have demonstrated success in coordinating based on shared tasks or collective goals. However, these frameworks often assume a pre-defined set of tasks or goals. 

We propose a different approach. In Overcooked, current methods have agents figure out specific tasks: "should I chop tomatoes or plate the salad?" Our approach asks a different question first: "what kind of kitchen are we running?" Agents start with uncertain beliefs about how their team is organized—is it a hierarchy with a head chef giving orders, or specialists where one person always chops and another always plates? They watch how others act and update their beliefs about the team structure. Once an agent figures out the structure (say, "we're specialists"), they can infer their own role ("I must be the server since my teammate is clearly the chopper") and act according to that role's expectations.

Our central research question is: *How do agents with uncertain instuitional priors collectively converge on a specific instituitional structure?*. 

= Related Work 

- *Bayesian Delegation*: @wu2021too establish the foundation for our approach through their dynamic belief updating mechanism P(ta|H). We extend their Bayesian inference framework from task allocation priors P(ta) to institutional structure priors P(S), maintaining their interactive alignment process but applying it to role inference rather than task assignment.

- *Imagined "We"*: @tang2022exploring provide the collective intentionality framework we build upon. While they focus on inferring group goals P(G_W|data), we adapt their "supraindividual agent" concept to institutional structure, where agents infer the collective's organizational form rather than specific objectives.

- *Social Structure Inference*: @davis2022inferring offer the core computational machinery for our model. We directly adopt their S = {C, E} formulation where C maps agents to roles and E defines inter-role relations, along with their Chinese Restaurant Process prior P(S) and "intuitive sociologies" likelihood P(D|S).

- *Institutional Stance*: @jara2024institutional provide theoretical grounding for why agents would prioritize structural over mental state inference. Their emphasis on role-based normative expectations directly motivates our focus on inferring institutional arrangements that constrain and enable action.


= Project Plan

*Phase 1 - Mathematical Framework*: Formalize the computational model extending Bayesian Delegation to institutional structure priors P(S). Define role mappings S = {C, E}, "intuitive sociologies" likelihood P(D|S), and convergence criteria.

*Phase 2 - Baseline Implementation*: Reproduce Bayesian Delegation results using available Python code to establish implementation foundation and understand agent observation/action cycles.

*Phase 3 - Algorithm Development*: Implement institutional inference in MeMo framework, extending agent architecture with role inference and validating belief convergence.

*Phase 4 - Experimental Validation*: Run simulations comparing traditional coordination vs. institutional inference, measuring convergence speed and coordination efficiency across different kitchen layouts.

*Risk Mitigation*: The main risk is in Phase 1 where I don't yet fully grasp the mathematical details and could get stuck. I will mitigate this by working through concrete 2-3 agent examples in simple Overcooked scenarios to build intuition before proceeding with implementation.

#bibliography("bibliography.bib")
