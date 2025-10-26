# Section 1: The Online Movement Coordination Game

## Objective

Demonstrate how a group of agents can collectively converge on an institutional structure (roles and norms) through repeated interaction, even without initial knowledge of what that structure should be.

## Game Setting

A group of *N* agents (e.g., 4-6 people) coordinates an online advocacy movement over *T* rounds. Each round represents a period of collaborative activity (e.g., a week). Agents must coordinate without explicit communication about roles or responsibilities.

**Key feature**: No predetermined role assignments or institutional structure. The institution must emerge organically through repeated interaction.

---

## Role Structure

### Explicit Roles

Roles are **generative structures** that specify:
1. **Obligations**: Which actions should be taken and how frequently
2. **Permissions**: Which actions are allowed
3. **Relational constraints**: Who can interact with whom and how

**Available Roles**: $\mathcal{R} = \{$Organizer, Communicator, Supporter, Moderator$\}$

#### Role Definitions

**Organizer** ($\rho_{\text{org}}$):
- **Obligations**: Coordinate group activity (60-80% of time), occasionally recruit
- **Permissions**: Can perform any action except moderate
- **Relations**: Can direct Supporters and Communicators
- **Function**: Structures collective action, delegates tasks

**Communicator** ($\rho_{\text{comm}}$):
- **Obligations**: Post public content (70-90% of time), occasionally engage with external audiences
- **Permissions**: Post, engage, defer
- **Relations**: Receives direction from Organizer, can be amplified by Supporters
- **Function**: Creates and disseminates messaging

**Supporter** ($\rho_{\text{supp}}$):
- **Obligations**: Contribute resources (40%+) or amplify content (40%+)
- **Permissions**: Contribute, amplify, defer
- **Relations**: Receives coordination from Organizer, supports Communicator
- **Function**: Provides resources and amplification

**Moderator** ($\rho_{\text{mod}}$):
- **Obligations**: Monitor community (40%+), intervene when needed (20%+)
- **Permissions**: Monitor, intervene, defer
- **Relations**: Can intervene on any agent's actions, reports to Organizer
- **Function**: Maintains community standards, resolves conflicts

**Important**: Agents do not initially know these role definitions. They must infer what roles exist, what they entail, and who occupies them through observation.

---

## Action Space

Each agent chooses an action $a_i = (a_{\text{ind}}, \{a_{\text{rel}}^1, ..., a_{\text{rel}}^k\})$ consisting of:

### Individual Actions: $A_{\text{ind}}$

- **coordinate**: Structure group activity, set agenda (cost: 3)
- **post**: Create and share public content (cost: 2)
- **contribute**: Provide resources, effort, or materials (cost: 2)
- **amplify**: Boost visibility of others' content (cost: 1)
- **monitor**: Observe community interactions (cost: 1)
- **defer**: Take no individual action (cost: 0)

### Relational Actions: $A_{\text{rel}}$

Actions that target specific other agents:

- **direct(j)**: Instruct agent *j* on what to do (cost: 1)
  - Permitted for: Organizer → {Supporter, Communicator}
  
- **support(j)**: Amplify or assist agent *j*'s actions (cost: 1)
  - Permitted for: Supporter → {Communicator, Organizer}
  
- **intervene(j)**: Moderate or redirect agent *j*'s behavior (cost: 2)
  - Permitted for: Moderator → anyone

**Simultaneous action**: All agents choose actions simultaneously each round.

**Action combination**: An agent can take one individual action plus zero or more relational actions (e.g., coordinate + direct(3) + direct(5)).

---

## Observations

After all agents act simultaneously, each agent $i$ observes:

$$o_i = \langle \vec{a} = (a_1, ..., a_N), \text{outcome} \rangle$$

Where:
- $\vec{a}$: The complete action profile (all agents' actions, including relational actions)
- $\text{outcome} \in \{$high, medium, low$\}$: Task success level

**Full observability of actions**: Agents can see what everyone did (analogous to public social media activity).

**Partial observability of intentions**: Agents cannot directly observe others' beliefs, role interpretations, or mental models.

---

## Reward Structure

The group receives a collective task reward based on role-action fit and coordination quality:

$$R_{\text{task}}(\vec{a}) = R_{\text{base}} + R_{\text{fit}}(\vec{a}) + R_{\text{coord}}(\vec{a}) - P_{\text{violation}}(\vec{a})$$

### Components

**1. Base Reward**: $R_{\text{base}} = 2$ per agent
- Minimum reward for participation

**2. Role-Action Fit**: $R_{\text{fit}}(\vec{a}) = \sum_{i=1}^N \text{Fit}(\rho_i^*, a_i)$

Where $\rho_i^*$ is agent $i$'s "true" latent role (unknown to agents) and Fit measures alignment:

| Role | coordinate | post | contribute | amplify | monitor | defer |
|------|-----------|------|------------|---------|---------|-------|
| Organizer | +4 | +1 | +1 | 0 | 0 | -1 |
| Communicator | 0 | +4 | 0 | +1 | 0 | -1 |
| Supporter | 0 | 0 | +3 | +3 | 0 | 0 |
| Moderator | 0 | 0 | 0 | 0 | +4 | +1 |

**3. Coordination Bonus**: $R_{\text{coord}}(\vec{a})$ rewards complementary actions

Inter-role synergies (if agents in respective roles):
- Organizer coordinates + Communicator posts: +5
- Communicator posts + Supporter amplifies: +3
- Organizer coordinates + Supporter contributes: +3
- Organizer direct(Supporter) + Supporter contributes: +4
- Communicator posts + Moderator monitors: +2

**4. Violation Penalties**: $P_{\text{violation}}(\vec{a})$

- **Permission violation**: Agent takes action outside role permissions: -6
- **Wrong relational action**: Supporter tries direct(Organizer): -5
- **Role conflict**: Multiple agents taking same high-cost action inappropriately: -4
- **Coordination failure**: No coherent pattern of actions: -3

### Individual Payoffs

Agent $i$'s utility in round $t$:

$$U_i^t = R_{\text{task}}(\vec{a}^t) - C(a_i^t) + \lambda \cdot \text{Expect}(a_i^t | G_i^{t-1}, \vec{a}_{-i}^t)$$

Where:
- $R_{\text{task}}(\vec{a}^t)$: Shared task reward (all agents receive same)
- $C(a_i^t)$: Cost of agent $i$'s actions
- $\text{Expect}(a_i^t | G_i^{t-1}, \vec{a}_{-i}^t)$: Bonus if $a_i^t$ aligns with agent $i$'s own mental model $G_i$ given what others did

**Key insight**: The reward structure has latent complementarities that agents must discover. The structure incentivizes coordination and role differentiation, but does NOT specify who should occupy which role. That emerges through learning dynamics.

---

## Mental Institutional Model

Each agent $i$ maintains a hidden mental model $G_i = \langle R_i, \Psi_i, N_i \rangle$:

### 1. Role Assignment Beliefs: $R_i$

$$R_i: \{1, ..., N\} \to \Delta(\mathcal{R})$$

Agent $i$'s belief about which role each agent occupies (probability distribution).

**Example**: 
- $R_i(1) = \{$Org: 0.1, Comm: 0.1, Supp: 0.7, Mod: 0.1$\}$
- $R_i(2) = \{$Org: 0.9, Comm: 0.05, Supp: 0.03, Mod: 0.02$\}$

**Initially**: Uniform distribution (no idea who is in what role).

### 2. Role Schema Beliefs: $\Psi_i$

$$\Psi_i(\rho) = \langle \text{Obl}_\rho, \text{Perm}_\rho, \text{Rel}_\rho \rangle$$

Agent $i$'s understanding of what role $\rho$ entails.

**Obligations**: $\text{Obl}_\rho: A_{\text{ind}} \to [0, 1]$
- Expected frequency of each action type for role $\rho$
- Example: $\text{Obl}_{\text{Org}}(\text{coordinate}) = 0.7$, $\text{Obl}_{\text{Org}}(\text{post}) = 0.2$

**Permissions**: $\text{Perm}_\rho \subseteq A_{\text{ind}} \cup A_{\text{rel}}$
- Set of allowed actions for role $\rho$
- Example: $\text{Perm}_{\text{Org}} = \{$coordinate, post, contribute, amplify, defer, direct(·)$\}$

**Relations**: $\text{Rel}_\rho: \mathcal{R} \times A_{\text{rel}} \to \{0, 1\}$
- Which relational actions role $\rho$ can take toward which other roles
- Example: $\text{Rel}_{\text{Org}}(\text{Supp}, \text{direct}) = 1$ (Organizers can direct Supporters)

**Initially**: Vague, low-confidence schemas (near-uniform distributions, permissive permission sets).

### 3. Inter-role Norm Beliefs: $N_i$

$$N_i: (\mathcal{R} \times A_{\text{ind}}) \times (\mathcal{R} \times A_{\text{ind}}) \to [0, 1]$$

Agent $i$'s belief about coordination expectations between roles.

**Interpretation**: $N_i((\rho, a), (\rho', a'))$ = "When someone in role $\rho$ does action $a$, someone in role $\rho'$ should do action $a'$"

**Example**: 
- $N_i((\text{Org}, \text{coordinate}), (\text{Comm}, \text{post})) = 0.95$
- $N_i((\text{Comm}, \text{post}), (\text{Supp}, \text{amplify})) = 0.85$

**Initially**: Weak norms (low values, near-uniform).

---

## Learning Dynamics

Agents update their mental models $G_i$ after each round based on observations:

### Role Assignment Learning

If agent $j$ consistently takes actions that fit role $\rho$ according to schema $\Psi_i(\rho)$:

$$R_i^{t+1}(j)(\rho) \propto R_i^t(j)(\rho) \cdot \exp\left(\alpha \cdot \text{Match}(a_j^t, \Psi_i^t(\rho))\right)$$

Where $\text{Match}(a_j^t, \Psi_i^t(\rho))$ measures how well action $a_j^t$ fits the obligations and permissions of role $\rho$.

### Role Schema Learning

If multiple agents believed to be in role $\rho$ tend to perform action $a$:

$$\text{Obl}_\rho^{t+1}(a) = \text{Obl}_\rho^t(a) + \beta \cdot \left(\frac{\sum_{j: R_i^t(j)(\rho) > \tau} \mathbb{1}(a_j^t = a)}{\sum_{j: R_i^t(j)(\rho) > \tau} 1} - \text{Obl}_\rho^t(a)\right)$$

Where $\tau$ is a confidence threshold (e.g., 0.5).

If action $a$ taken by someone in role $\rho$ leads to violations/failures:
- Remove $a$ from $\text{Perm}_\rho$

### Inter-role Norm Learning

If task succeeds when agent in role $\rho$ does $a$ and agent in role $\rho'$ does $a'$:

$$N_i^{t+1}((\rho, a), (\rho', a')) = N_i^t((\rho, a), (\rho', a')) + \gamma \cdot (\text{outcome}^t - \bar{\text{outcome}}) \cdot \mathbb{1}(\text{pattern observed})$$

Where $\bar{\text{outcome}}$ is the average outcome.

### Convergence

**Institutional emergence** occurs when:
1. **Role assignment consensus**: $R_i(j) \approx R_k(j)$ for all agents $i, k$ (everyone agrees on who is in what role)
2. **Schema consensus**: $\Psi_i(\rho) \approx \Psi_k(\rho)$ for all agents $i, k$ (everyone agrees on what roles mean)
3. **Norm consensus**: $N_i \approx N_k$ for all agents $i, k$ (everyone agrees on coordination expectations)
4. **Behavioral stability**: Agent action choices stabilize (low variance over recent rounds)
5. **High efficiency**: Task success consistently high

---

## Example Trajectory

**Rounds 1-3: Chaos**
- All agents try different actions randomly
- No clear patterns
- Low task success
- Mental models: uniform distributions

**Rounds 4-7: Pattern Recognition**
- Agent 2 consistently coordinates
- Agent 3 often posts after Agent 2 coordinates
- Agent 5 amplifies Agent 3's posts
- Some agents notice: "This pattern works!"
- Mental models: $R_i(2)(\text{Org})$ starts increasing

**Rounds 8-12: Tentative Specialization**
- Agent 2 keeps coordinating (becoming Organizer)
- Agent 3 keeps posting (becoming Communicator)
- Agents 5 and 6 contribute/amplify (becoming Supporters)
- Agent 4 starts monitoring (becoming Moderator)
- Success improves
- Mental models: Role assignments becoming confident

**Rounds 13-20: Institutional Crystallization**
- Clear role differentiation emerges
- All agents agree on role assignments
- Role schemas converge (everyone knows what each role should do)
- Inter-role norms stabilize (everyone knows coordination expectations)
- Consistently high task success
- New agents could enter and quickly learn the structure

---

# Section 2: Interactive Partially Observable Markov Decision Processes (I-POMDPs)

## Framework Overview

An **Interactive POMDP (I-POMDP)** extends the POMDP framework to multi-agent settings by explicitly modeling other agents' beliefs, preferences, and decision-making processes as part of the state space.

In standard POMDPs, an agent reasons about an uncertain environment. In I-POMDPs, an agent reasons about an environment that includes other intentional agents who are themselves reasoning about the environment and about the agent.

---

## Formal Definition

For agent $i$ interacting with agents $j \in \{1, ..., N\} \setminus \{i\}$, an I-POMDP is defined as:

$$\text{I-POMDP}_i = \langle IS_i, A, T_i, \Omega_i, O_i, R_i \rangle$$

### Interactive State Space: $IS_i = S \times M_{-i}$

**Physical State Space** $S$: 
- Observable aspects of the environment
- Does not include other agents' internal states (beliefs, intentions)

**Model Space** $M_{-i} = M_1 \times ... \times M_{i-1} \times M_{i+1} \times ... \times M_N$:
- Models of all other agents
- Each $M_j$ represents possible models for agent $j$

**Agent Model Types**:

1. **Subintentional Models**: Simple behavioral patterns
   - **No-information model**: Random actions from uniform distribution
   - **Fictitious play**: Best response to historical action frequencies
   - **Finite state controllers**: Reactive policies based on observable states

2. **Intentional Models** (types): $\theta_j = \langle b_j, \tilde{\theta}_j \rangle$
   - $b_j$: Agent $j$'s belief over $IS_j = S \times M_{-j}$ (recursive!)
   - $\tilde{\theta}_j = \langle R_j, O_j, A_j, T_j \rangle$: Agent $j$'s frame
     - $R_j$: Reward function (preferences)
     - $O_j$: Observation function
     - $A_j$: Action space
     - $T_j$: Transition model

**Key insight**: The interactive state includes not just the physical world, but also agent $i$'s beliefs about other agents' beliefs about the world (and about agent $i$).

---

## I-POMDP Components

### Action Space: $A = A_1 \times ... \times A_N$

Joint action space of all agents. Agent $i$ controls $A_i$.

### Transition Function: $T_i : S \times A \times S \to [0, 1]$

$$T_i(s, \vec{a}, s') = P(s^{t+1} = s' \mid s^t = s, a^t = \vec{a})$$

Probability of transitioning to physical state $s'$ given current state $s$ and joint action $\vec{a} = (a_1, ..., a_N)$.

**Important**: Other agents' models are not directly changed by actions (Model Non-Manipulability).

### Observation Space: $\Omega_i$

Set of possible observations for agent $i$.

### Observation Function: $O_i : S \times A \times \Omega_i \to [0, 1]$

$$O_i(s', \vec{a}, o_i) = P(o_i^{t+1} = o_i \mid s^{t+1} = s', a^t = \vec{a})$$

Probability that agent $i$ observes $o_i$ given resulting state $s'$ and joint action $\vec{a}$.

### Reward Function: $R_i : IS_i \times A_i \times A_{-i} \to \mathbb{R}$

$$R_i(is, a_i, a_{-i}) = R_i((s, m_{-i}), a_i, a_{-i})$$

Agent $i$'s reward depends on:
- Physical state $s$
- Models of other agents $m_{-i}$ (may care about others' beliefs/intentions)
- Agent $i$'s action $a_i$
- Other agents' actions $a_{-i}$

---

## Key Properties

### Model Non-Manipulability (MNM)

Agent $i$ cannot directly change other agents' models $m_j$ through actions. 

Models can only be influenced **indirectly** by affecting the observable environment, which other agents then observe and use to update their beliefs.

**Why this matters**: Agents cannot simply "tell" others what to believe. They must demonstrate through actions.

### Model Non-Observability (MNO)

Agent $i$ cannot directly observe other agents' beliefs, preferences, or internal models.

These must be **inferred** from observations of:
- The physical environment
- Other agents' effects on the environment (their actions)
- Outcomes of interactions

**Why this matters**: Creates fundamental uncertainty about others' mental states, requiring sophisticated inference.

---

## Belief State and Belief Updates

### Belief State

Agent $i$'s belief is a probability distribution over the interactive state space:

$$b_i : IS_i \to [0, 1]$$

$$b_i(s, m_{-i}) = P(s^t = s, m_{-i}^t = m_{-i} \mid h_i^t)$$

where $h_i^t = (a_i^0, o_i^1, a_i^1, o_i^2, ..., a_i^{t-1}, o_i^t)$ is agent $i$'s history.

**Components of belief**:
1. Belief about physical state: $\sum_{m_{-i}} b_i(s, m_{-i})$
2. Belief about agent $j$'s model: $\sum_{s, m_{-j \setminus \{j\}}} b_i(s, m_j, m_{-j \setminus \{j\}})$

### Belief Update

After taking action $a_i^{t-1}$ and observing $o_i^t$, agent $i$ updates belief:

$$b_i^t(s^t, m_{-i}^t) = \frac{P(o_i^t \mid a_i^{t-1}, b_i^{t-1}) \cdot \sum_{s^{t-1}, m_{-i}^{t-1}} b_i^{t-1}(s^{t-1}, m_{-i}^{t-1}) \cdot P(a_{-i}^{t-1} \mid m_{-i}^{t-1}) \cdot T_i(s^{t-1}, \vec{a}^{t-1}, s^t) \cdot O_i(s^t, \vec{a}^{t-1}, o_i^t) \cdot P(m_{-i}^t \mid m_{-i}^{t-1}, s^{t-1}, \vec{a}^{t-1}, s^t)}{P(o_i^t \mid a_i^{t-1}, b_i^{t-1})}$$

**Step-by-step**:

1. **Predict others' actions**: $P(a_{-i}^{t-1} \mid m_{-i}^{t-1})$
   - What would agent $j$ do given model $m_j$?
   - For intentional models: Solve $j$'s decision problem

2. **Update physical state**: $T_i(s^{t-1}, \vec{a}^{t-1}, s^t)$
   - How does the world change given all actions?

3. **Observation likelihood**: $O_i(s^t, \vec{a}^{t-1}, o_i^t)$
   - How likely is my observation given the resulting state and actions?

4. **Update models of others**: $P(m_{-i}^t \mid m_{-i}^{t-1}, ...)$
   - How do other agents' models change?
   - For intentional models: Reason about what they observed and how they updated their beliefs

5. **Normalize**: Divide by $P(o_i^t \mid a_i^{t-1}, b_i^{t-1})$

### Belief Update for Intentional Models

When agent $j$ has intentional model $\theta_j = \langle b_j, \tilde{\theta}_j \rangle$:

$$P(\theta_j^t \mid \theta_j^{t-1}, s^{t-1}, \vec{a}^{t-1}, s^t) = \begin{cases}
1 & \text{if } \theta_j^t = \langle b_j^t, \tilde{\theta}_j \rangle \text{ where } b_j^t = \text{SE}_{\theta_j}(b_j^{t-1}, a_j^{t-1}, o_j^{t-1}) \\
0 & \text{otherwise}
\end{cases}$$

Where $\text{SE}_{\theta_j}$ is agent $j$'s state estimation (belief update) function.

**Agent $i$ must reason about**:
- What did agent $j$ observe? $o_j^{t-1} \sim O_j(s^t, \vec{a}^{t-1}, \cdot)$
- How would agent $j$ update beliefs given that observation?
- What is agent $j$'s new belief $b_j^t$?

---

## Value Function and Optimal Policy

### Expected Reward

Given belief $b_i$ and action $a_i$, expected immediate reward:

$$\mathbb{E}[R_i \mid b_i, a_i] = \sum_{s, m_{-i}} b_i(s, m_{-i}) \sum_{a_{-i}} P(a_{-i} \mid m_{-i}) \cdot R_i((s, m_{-i}), a_i, a_{-i})$$

Where $P(a_{-i} \mid m_{-i}) = \prod_{j \neq i} P(a_j \mid m_j)$ (assuming independence).

### Value Function

For agent $i$ with type $\theta_i = \langle b_i, \tilde{\theta}_i \rangle$, the optimal value function:

$$V^*(\theta_i) = \max_{a_i \in A_i} Q^*(\theta_i, a_i)$$

Where:

$$Q^*(\theta_i, a_i) = \mathbb{E}[R_i \mid b_i, a_i] + \gamma \sum_{o_i \in \Omega_i} P(o_i \mid a_i, b_i) \cdot V^*(\langle b_i', \tilde{\theta}_i \rangle)$$

And $b_i' = \text{SE}_{\theta_i}(b_i, a_i, o_i)$ is the updated belief after taking $a_i$ and observing $o_i$.

### Optimal Policy

$$\pi_i^*(\theta_i) = \arg\max_{a_i \in A_i} Q^*(\theta_i, a_i)$$

Agent $i$ chooses actions that maximize expected cumulative discounted reward, accounting for:
- Immediate rewards
- Information value (observations that help refine beliefs)
- Future value of updated beliefs

---

## Finite Nesting Levels

### The Infinite Recursion Problem

Intentional models create infinite recursion:
- Agent $i$ models agent $j$'s beliefs
- Agent $j$'s beliefs include beliefs about agent $i$
- Which include beliefs about agent $j$
- Which include beliefs about agent $i$...

This is not computationally tractable!

### Solution: Finitely Nested I-POMDPs

Define strategy levels:

**Level 0 I-POMDP**: 
- Agent treats others as part of environment
- Uses subintentional models (no-information, fictitious play, etc.)
- Belief space: $b_i^{(0)}: S \to [0, 1]$ (only physical states)

**Level 1 I-POMDP**:
- Agent models others as level-0 agents
- Others have beliefs only about physical states $S$, not about agent $i$
- Belief space: $b_i^{(1)}: S \times M_{-i}^{(0)} \to [0, 1]$

**Level $l$ I-POMDP**:
- Agent models others as having models up to level $l-1$
- Belief space: $b_i^{(l)}: S \times M_{-i}^{(l-1)} \to [0, 1]$

### Computational Complexity

Solving a level-$l$ I-POMDP requires solving $O(|M|^l)$ lower-level (PO)MDPs, where $|M|$ is the number of models at each level.

**Practical approach**:
- Use level-1 or level-2 I-POMDPs
- Limit model space $M$ to small set of representative models
- Use approximate solution methods (particle filtering, Monte Carlo tree search)

---

## Prediction of Others' Actions

A crucial component of I-POMDP reasoning is predicting what other agents will do.

For agent $j$ with model $m_j = \theta_j = \langle b_j, \tilde{\theta}_j \rangle$:

$$P(a_j \mid \theta_j) = \begin{cases}
1 & \text{if } a_j = \pi_j^*(\theta_j) \text{ (optimal policy)} \\
0 & \text{otherwise}
\end{cases}$$

For **bounded rational** agents, use softmax:

$$P(a_j \mid \theta_j) \propto \exp(\beta \cdot Q_j(\theta_j, a_j))$$

Where $\beta$ is a rationality parameter (higher = more rational).

**This means**: Agent $i$ must solve agent $j$'s decision problem to predict $j$'s actions!

---

## Summary: I-POMDP Reasoning Loop

For agent $i$ at each time step:

1. **Start with belief** $b_i^t$ over interactive states $(s, m_{-i})$

2. **Predict others' actions**:
   - For each model $m_j$ in support of $b_i^t$
   - Solve agent $j$'s decision problem (or use heuristic)
   - Get action distribution $P(a_j \mid m_j)$

3. **Choose action** $a_i^t$ that maximizes expected value:
   - Account for immediate reward
   - Account for information gain
   - Account for future value

4. **Take action** $a_i^t$, observe $o_i^{t+1}$

5. **Update belief** $b_i^{t+1}$:
   - Update belief about physical state
   - Update belief about others' models
   - For intentional models: reason about what others observed and how they updated

6. **Repeat**

This creates sophisticated strategic reasoning where agents reason about others reasoning about them.

---

# Section 3: Modeling the Online Movement Coordination Game as an I-POMDP

## Overview

We now formalize the Online Movement Coordination Game as an I-POMDP for agent $i$. The key challenge is that **mental institutional models** (roles, schemas, norms) are part of other agents' models in the interactive state space.

---

## I-POMDP Formulation for Agent $i$

### Interactive State Space: $IS_i = S \times M_{-i}$

#### Physical State: $s \in S$

$$s = \langle h, r^t, t \rangle$$

**Components**:

1. **History** $h = [(a_1^1, ..., a_N^1), ..., (a_1^{t-1}, ..., a_N^{t-1})]$:
   - Complete action history (who did what in each round)
   - Includes both individual and relational actions
   - Publicly observable

2. **Most recent outcome** $r^{t-1} \in \{$high, medium, low$\}$:
   - Task success level from previous round
   - Observable to all agents

3. **Current round** $t \in \{1, ..., T\}$:
   - Time index

**Physical state is fully observable**: All agents see the same history and outcomes.

#### Models of Other Agents: $m_j \in M_j$

We use **intentional models at level 1** for each agent $j \neq i$:

$$\theta_j = \langle b_j, G_j, \tilde{\theta}_j \rangle$$

**Components**:

1. **Beliefs** $b_j: S \to [0, 1]$:
   - Agent $j$'s belief over physical states
   - Since physical states are fully observable, $b_j$ is deterministic (concentrated on true $s$)
   - Simplified assumption: Agent $j$ is level-0 (doesn't recursively model agent $i$'s beliefs)

2. **Mental Institutional Model** $G_j = \langle R_j, \Psi_j, N_j \rangle$:
   - **Role Assignment Beliefs** $R_j: \{1, ..., N\} \to \Delta(\mathcal{R})$
     - Agent $j$'s beliefs about who occupies which role
   - **Role Schema Beliefs** $\Psi_j: \mathcal{R} \to \langle \text{Obl}, \text{Perm}, \text{Rel} \rangle$
     - Agent $j$'s understanding of what each role entails
   - **Inter-role Norm Beliefs** $N_j: (\mathcal{R} \times A_{\text{ind}}) \times (\mathcal{R} \times A_{\text{ind}}) \to [0, 1]$
     - Agent $j$'s beliefs about coordination expectations between roles

3. **Frame** $\tilde{\theta}_j = \langle R_j^{\text{reward}}, O_j, A_j \rangle$:
   - **Reward function** $R_j^{\text{reward}}$: Assumed known (all agents want high task success)
   - **Observation function** $O_j$: Fully observable actions and outcomes
   - **Action space** $A_j$: Known

**Agent $i$'s uncertainty**: Agent $i$ is uncertain about $G_j$ - what roles, schemas, and norms agent $j$ believes in.

**Full interactive state**:

$$is = (s, \theta_1, ..., \theta_{i-1}, \theta_{i+1}, ..., \theta_N)$$

Agent $i$ maintains beliefs $b_i$ over these interactive states.

---

### Action Space

**Agent $i$'s action space**: $A_i = A_{\text{ind}} \times 2^{A_{\text{rel}}}$

$$a_i = (a_{\text{ind}}, \{a_{\text{rel}}^1, ..., a_{\text{rel}}^k\})$$

Where:
- $a_{\text{ind}} \in \{$coordinate, post, contribute, amplify, monitor, defer$\}$
- $a_{\text{rel}}^j \in \{$direct$(k)$, support$(k)$, intervene$(k) : k \in \{1, ..., N\} \setminus \{i\}\}$

**Joint action space**: $A = A_1 \times ... \times A_N$

---

### Transition Function: $T_i : S \times A \to \Delta(S)$

Physical state transitions deterministically:

$$T_i(s, \vec{a}, s') = \begin{cases}
1 & \text{if } s' = \langle h \cup \{\vec{a}\}, \text{Outcome}(\vec{a}), t+1 \rangle \\
0 & \text{otherwise}
\end{cases}$$

**Outcome function** $\text{Outcome}(\vec{a})$: Deterministic function that evaluates action complementarity:

$$\text{Outcome}(\vec{a}) = \begin{cases}
\text{high} & \text{if } R_{\text{task}}(\vec{a}) > \tau_{\text{high}} \\
\text{medium} & \text{if } \tau_{\text{low}} < R_{\text{task}}(\vec{a}) \leq \tau_{\text{high}} \\
\text{low} & \text{if } R_{\text{task}}(\vec{a}) \leq \tau_{\text{low}}
\end{cases}$$

Where $R_{\text{task}}(\vec{a})$ is computed as defined in Section 1 (base + fit + coordination - violations).

**Model updates**: From agent $i$'s perspective, other agents' mental models $G_j$ update deterministically based on observations:

$$\theta_j^{t+1} = \langle b_j^{t+1}, G_j^{t+1}, \tilde{\theta}_j \rangle$$

Where:
- $b_j^{t+1}$: Deterministic update (physical state fully observable)
- $G_j^{t+1} = \text{Update}(G_j^t, \vec{a}^t, r^t)$: Learning update function

**Learning update function** $\text{Update}(G_j, \vec{a}, r)$:

This function models how agent $i$ believes agent $j$ updates their institutional model:

1. **Role assignment update**:
$$R_j^{t+1}(k)(\rho) \propto R_j^t(k)(\rho) \cdot \exp\left(\alpha_R \cdot \text{Match}(a_k^t, \Psi_j^t(\rho))\right)$$

Where $\text{Match}(a, \Psi(\rho))$ measures alignment between action $a$ and role schema $\Psi(\rho)$:
$$\text{Match}(a, \Psi(\rho)) = \mathbb{1}(a_{\text{ind}} \in \text{Perm}_\rho) \cdot \text{Obl}_\rho(a_{\text{ind}})$$

2. **Role schema update (obligations)**:
$$\text{Obl}_\rho^{t+1}(a) = (1 - \beta_\Psi) \cdot \text{Obl}_\rho^t(a) + \beta_\Psi \cdot \frac{\sum_{k: R_j^t(k)(\rho) > \tau} \mathbb{1}(a_k^t = a)}{\sum_{k: R_j^t(k)(\rho) > \tau} 1}$$

Moving average of action frequencies for agents in role $\rho$.

3. **Role schema update (permissions)**:
If action $a$ taken by agent in role $\rho$ leads to violation:
$$\text{Perm}_\rho^{t+1} = \text{Perm}_\rho^t \setminus \{a\}$$

4. **Inter-role norm update**:
$$N_j^{t+1}((\rho, a), (\rho', a')) = N_j^t((\rho, a), (\rho', a')) + \alpha_N \cdot \Delta r^t \cdot \mathbb{1}(\text{pattern observed})$$

Where $\Delta r^t = r^t - \bar{r}$ is deviation from average outcome, and pattern observed means some agent in role $\rho$ did action $a$ and some agent in role $\rho'$ did action $a'$.

---

### Observation Space: $\Omega_i$

$$\Omega_i = A \times \{\text{high, medium, low}\}$$

$$o_i = \langle \vec{a} = (a_1, ..., a_N), r \rangle$$

Agent $i$ observes:
- All agents' complete actions (individual + relational)
- Task outcome (success level)

---

### Observation Function: $O_i : S \times A \times \Omega_i \to [0, 1]$

Since actions and outcomes are fully observable:

$$O_i(s', \vec{a}, o_i) = \begin{cases}
1 & \text{if } o_i = \langle \vec{a}, r \rangle \text{ where } r = \text{Outcome}(\vec{a}) \\
0 & \text{otherwise}
\end{cases}$$

---

### Reward Function: $R_i : S \times A_i \times A_{-i} \to \mathbb{R}$

Agent $i$'s reward in a given round:

$$R_i(s, a_i, a_{-i}) = R_{\text{task}}(\vec{a}) - C(a_i) + \lambda \cdot \text{Expect}(a_i | G_i, a_{-i})$$

**Components**:

1. **Task reward** $R_{\text{task}}(\vec{a})$: Shared collective reward (as defined in Section 1)

2. **Action cost** $C(a_i)$:
$$C(a_i) = C_{\text{ind}}(a_{i,\text{ind}}) + \sum_{a_{\text{rel}} \in a_{i,\text{rel}}} C_{\text{rel}}(a_{\text{rel}})$$

3. **Expectation alignment** $\text{Expect}(a_i | G_i, a_{-i})$:

Bonus when agent $i$'s action aligns with $i$'s own mental model's expectations:

$$\text{Expect}(a_i | G_i, a_{-i}) = \sum_{\rho \in \mathcal{R}} R_i(i)(\rho) \cdot \left[\text{Obl}_\rho(a_{i,\text{ind}}) + \sum_{j \neq i} \sum_{\rho' \in \mathcal{R}} R_i(j)(\rho') \cdot N_i((\rho', a_j), (\rho, a_i))\right]$$

This rewards:
- Taking actions that fit agent $i$'s believed role for themselves
- Taking actions that complement what others did, according to agent $i$'s norms

---

### Belief State: $b_i : IS_i \to [0, 1]$

Agent $i$'s belief is a distribution over interactive states:

$$b_i(s, \theta_{-i}) = b_i(s, \theta_1, ..., \theta_{i-1}, \theta_{i+1}, ..., \theta_N)$$

**Factorization** (assuming conditional independence):

$$b_i(s, \theta_{-i}) = P_i(s) \cdot \prod_{j \neq i} P_i(\theta_j | s)$$

Since physical state is fully observable:
$$P_i(s) = \begin{cases}
1 & \text{if } s = s_{\text{true}} \\
0 & \text{otherwise}
\end{cases}$$

**Uncertainty is over mental models**:

$$P_i(\theta_j | s) = P_i(G_j | s) = P_i(R_j, \Psi_j, N_j | s)$$

**Further factorization** (approximate):

$$P_i(G_j | s) \approx P_i(R_j | s) \cdot P_i(\Psi_j | R_j, s) \cdot P_i(N_j | R_j, \Psi_j, s)$$

**Practical representation**: Use particle filtering with particles representing different hypotheses about $G_j$:

$$b_i \approx \{(s, G_1^{(p)}, ..., G_{i-1}^{(p)}, G_{i+1}^{(p)}, ..., G_N^{(p)}, w^{(p)})\}_{p=1}^P$$

Where $w^{(p)}$ are particle weights.

---

### Belief Update

After agent $i$ takes action $a_i^{t-1}$ and observes $o_i^t = \langle \vec{a}^{t-1}, r^{t-1} \rangle$:

$$b_i^t(s^t, \theta_{-i}^t) \propto \sum_{s^{t-1}, \theta_{-i}^{t-1}} b_i^{t-1}(s^{t-1}, \theta_{-i}^{t-1}) \cdot P(a_{-i}^{t-1} | \theta_{-i}^{t-1}) \cdot T_i(s^{t-1}, \vec{a}^{t-1}, s^t) \cdot O_i(s^t, \vec{a}^{t-1}, o_i^t) \cdot \prod_{j \neq i} P(\theta_j^t | \theta_j^{t-1}, s^{t-1}, \vec{a}^{t-1}, s^t)$$

**Step-by-step**:

**1. Predict others' actions**: $P(a_{-i}^{t-1} | \theta_{-i}^{t-1})$

For each agent $j \neq i$ with model $\theta_j = \langle b_j, G_j, \tilde{\theta}_j \rangle$:

$$P(a_j | \theta_j) = \text{Policy}(G_j, s)$$

Agent $j$ chooses actions based on their mental model $G_j$:

$$a_j^* = \arg\max_{a_j} \mathbb{E}_{\rho \sim R_j(j)}[U_j(a_j | \rho, G_j, s)]$$

Where expected utility accounts for:
- Fitting expected role: $\text{Obl}_\rho(a_{j,\text{ind}})$
- Following inter-role norms: $N_j((\rho', a'), (\rho, a_j))$ for observed actions $a'$ of others in roles $\rho'$
- Expected task success and costs

Use **bounded rationality** (softmax):
$$P(a_j | \theta_j) \propto \exp(\beta \cdot U_j(a_j | G_j, s))$$

**2. Update physical state**: Deterministic given observed actions

$$s^t = \langle h^{t-1} \cup \{\vec{a}^{t-1}\}, r^{t-1}, t \rangle$$

**3. Observation likelihood**: Deterministic (full observability)

$$O_i(s^t, \vec{a}^{t-1}, o_i^t) = 1$$

**4. Update models of others**: $P(\theta_j^t | \theta_j^{t-1}, s^{t-1}, \vec{a}^{t-1}, s^t)$

Since learning updates are deterministic:

$$\theta_j^t = \langle b_j^t, G_j^t, \tilde{\theta}_j \rangle$$

Where:
- $b_j^t = \delta_{s^t}$ (concentrated on true state)
- $G_j^t = \text{Update}(G_j^{t-1}, \vec{a}^{t-1}, r^{t-1})$ (as defined earlier)

**5. Reweight belief**:

$$b_i^t(s^t, \theta_{-i}^t) \propto b_i^{t-1}(s^{t-1}, \theta_{-i}^{t-1}) \cdot \prod_{j \neq i} P(a_j^{t-1} | \theta_j^{t-1})$$

The belief about agent $j$'s model is **upweighted** if agent $j$'s observed action was likely given that model, and **downweighted** otherwise.

**Key insight**: Agent $i$ uses agent $j$'s observed action as evidence about $j$'s mental model $G_j$.

---

### Predicting Others' Actions in Detail

This is the crucial step. Agent $i$ must predict what agent $j$ will do given a hypothesized mental model $G_j$.

**Agent $j$'s decision making** (from $i$'s perspective):

Agent $j$ believes they are in some role $\rho$ with probability $R_j(j)(\rho)$. Given role $\rho$:

1. **Role-consistent actions**: Prefer actions that fit role obligations
$$U_j^{\text{role}}(a_j | \rho) = \omega_1 \cdot \text{Obl}_\rho(a_{j,\text{ind}}) - \omega_2 \cdot \mathbb{1}(a_j \notin \text{Perm}_\rho)$$

2. **Norm-consistent actions**: Prefer actions that follow inter-role norms

Agent $j$ observes what others did and infers their roles:
$$\hat{\rho}_k = \arg\max_{\rho'} R_j(k)(\rho')$$

Then chooses action that complements according to norms:
$$U_j^{\text{norm}}(a_j | \rho) = \omega_3 \cdot \sum_{k \neq j} N_j((\hat{\rho}_k, a_k), (\rho, a_j))$$

3. **Task success**: Prefer actions that lead to high task reward
$$U_j^{\text{task}}(a_j) = \mathbb{E}[R_{\text{task}}(\vec{a}) | a_j, s]$$

4. **Action costs**:
$$U_j^{\text{cost}}(a_j) = -C(a_j)$$

**Total utility** for agent $j$:
$$U_j(a_j | G_j, s) = \sum_{\rho} R_j(j)(\rho) \cdot [U_j^{\text{role}}(a_j | \rho) + U_j^{\text{norm}}(a_j | \rho)] + U_j^{\text{task}}(a_j) + U_j^{\text{cost}}(a_j)$$

**Action distribution** (bounded rational):
$$P(a_j | \theta_j) \propto \exp(\beta \cdot U_j(a_j | G_j, s))$$

---

### Value Function and Optimal Policy

**Expected immediate reward** for agent $i$ given belief $b_i$ and action $a_i$:

$$Q_i(b_i, a_i) = \sum_{s, \theta_{-i}} b_i(s, \theta_{-i}) \sum_{a_{-i}} P(a_{-i} | \theta_{-i}) \cdot R_i(s, a_i, a_{-i}) + \gamma \sum_{o_i} P(o_i | a_i, b_i) \cdot V_i(b_i')$$

Where:
- $P(a_{-i} | \theta_{-i}) = \prod_{j \neq i} P(a_j | \theta_j)$ (independence assumption)
- $b_i'$ is the updated belief after taking $a_i$ and observing $o_i$
- $V_i(b_i')$ is the value of the updated belief

**Optimal value function**:
$$V_i^*(b_i) = \max_{a_i \in A_i} Q_i(b_i, a_i)$$

**Optimal policy**:
$$\pi_i^*(b_i) = \arg\max_{a_i \in A_i} Q_i(b_i, a_i)$$

---

### Strategic Considerations for Agent $i$

When choosing actions, agent $i$ must balance:

**1. Role exploration**: Try different actions to learn which role fits best
- Early rounds: High exploration
- Gather information about which actions lead to success

**2. Model inference**: Choose actions that help disambiguate others' mental models
- Informative actions reveal what others believe
- Example: If agent $j$ consistently defers when agent $i$ coordinates, $j$ likely believes $i$ is an Organizer

**3. Norm compliance**: Align with emerging norms to achieve coordination
- As beliefs about $G_j$ converge, coordinate by following shared expectations
- Example: If agent $i$ believes others expect $i$ to be Organizer, coordinating aligns with those expectations

**4. Norm shaping**: Take actions that influence others' mental models
- Though MNM prevents direct manipulation, actions affect what others observe
- Example: Consistently coordinating causes others to update $R_j(i)(\text{Org}) \uparrow$

**5. Efficiency**: Maximize task success and minimize costs
- Balance exploration with exploitation
- As institutional structure crystallizes, focus on efficient coordination

---

## Convergence Dynamics in I-POMDP Framework

**Phase 1: Exploration and uncertainty** (Rounds 1-5)

- Beliefs $b_i$ have high entropy over $G_j$ (many hypotheses about others' models)
- Agents try diverse actions
- Models $G_j$ have weak, diffuse structure (uniform role assignments, flat obligation distributions)

**Phase 2: Pattern recognition** (Rounds 6-12)

- Agents observe repeated action patterns
- Beliefs $b_i$ concentrate around hypotheses consistent with observations
- Models $G_j$ begin to crystallize (role assignments become confident, obligations sharpen)
- Action prediction accuracy increases

**Phase 3: Institutional crystallization** (Rounds 13-20)

- Beliefs $b_i$ converge (low entropy)
- All agents' beliefs about others' models align: $b_i(G_j) \approx b_k(G_j)$ for all $i, k$
- Mental models converge: $G_i \approx G_j$ for all $i, j$
- Common knowledge emerges: Everyone knows the roles, everyone knows everyone knows
- Behavioral stability: Actions become predictable
- High coordination: Task success consistently high

**Convergence criterion**:

Institutional emergence occurs when:

1. **Belief consensus**: $\forall i, j: \text{KL}(b_i(G_j) || b_k(G_j)) < \epsilon$ for all $k$

2. **Model consensus**: $\forall i, j: d(G_i, G_j) < \delta$ (where $d$ is a graph distance metric)

3. **Behavioral stability**: $\text{Var}(\{a_i^t\}_{t=t_0}^T) < \sigma$ for recent rounds

4. **High efficiency**: $\mathbb{E}[R_{\text{task}}] > \tau$

---

## Key Research Questions

**1. Does convergence always occur?**
- Under what conditions do beliefs and models fail to converge?
- Can groups get stuck with conflicting institutional models?

**2. Which institutional structure emerges?**
- Does it depend on initial random variation (path dependence)?
- Does it select the most efficient structure?
- Role of agent characteristics vs. early accidents

**3. Speed of convergence**
- How many rounds needed for crystallization?
- Role of exploration-exploitation tradeoff
- Impact of learning rates ($\alpha$, $\beta$, $\gamma$ parameters)

**4. Robustness**
- What happens if new agents enter after crystallization?
- Can the institution adapt to environmental changes?
- How stable is the structure to perturbations?

**5. Efficiency of emergent institutions**
- Do emergent structures match the reward function's implicit structure?
- Can suboptimal institutions persist (lock-in)?
- Welfare properties: Who benefits from the emergent structure?

**6. Computational tractability**
- Can we solve level-1 I-POMDPs with $N=5$ agents?
- Which approximations are necessary?
- Particle filtering, Monte Carlo methods, or policy gradient approaches?

---

## Practical Implementation Considerations

**State space reduction**:
- Use particle filters to represent beliefs over $G_j$
- Limit role space to 4-5 roles
- Discretize continuous parameters (edge weights, obligation probabilities)

**Action prediction**:
- Use softmax bounded rationality rather than perfectly optimal policies
- Cache action distributions for frequently encountered $G_j$ hypotheses

**Belief update**:
- Particle resampling to maintain diversity
- Importance sampling for efficient updates
- Parallel evaluation of particle weights

**Policy learning**:
- Use approximate solution methods (MCTS, policy gradients)
- Learn value function approximations
- Meta-learning across multiple episodes for faster convergence

**Metrics and visualization**:
- Track belief entropy over time
- Visualize role assignment consensus (agreement matrices)
- Plot action frequencies per agent (role specialization)
- Measure graph edit distance between mental models

---

## Summary

The Online Movement Coordination Game formalized as an I-POMDP captures:

1. **Explicit institutional structures**: Roles, schemas, norms as generative models
2. **Mental model uncertainty**: Agents uncertain about others' beliefs about institutions
3. **Recursive reasoning**: Agents model others modeling them
4. **Learning dynamics**: Models update based on observations
5. **Convergence**: Beliefs and models align over time → institutional emergence

**The key insight**: Institutions emerge when agents' mental models of roles and norms converge through repeated strategic interaction, even without explicit coordination or communication. The I-POMDP framework makes this process mathematically precise and computationally tractable (with appropriate approximations).
