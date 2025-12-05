# ============================================================================
# COMPREHENSIVE VISUALIZATION OF EXPERIMENTAL RESULTS
# ============================================================================

import pandas as pd
import numpy as onp
import matplotlib.pyplot as plt
import matplotlib.patches as mpatches
import seaborn as sns

# Set seaborn style for consistent, beautiful plots
sns.set_style("whitegrid")
sns.set_context("notebook", font_scale=1.1)
plt.rcParams['figure.facecolor'] = 'white'
plt.rcParams['axes.facecolor'] = 'white'

# Define consistent color palettes
COLORS_PRIOR = {
    'uniform': '#3498db',      # Blue
    'unconstrained': '#2ecc71', # Green
    'constrained': '#e74c3c'    # Red
}

COLORS_STAT = {
    'random': '#9b59b6',        # Purple
    'balanced': '#f39c12',      # Orange
    'specialist': '#1abc9c'     # Teal
}

COLORS_DIFFICULTY = {
    'easy': '#2ecc71',          # Green
    'normal': '#f39c12',        # Orange
    'hard': '#e74c3c'           # Red
}

# ============================================================================
# 1. COMPUTE SUMMARY STATISTICS
# ============================================================================

summary = experiment_results.groupby(['prior_type', 'stat_profile', 'difficulty']).agg({
    'win': ['mean', 'std', 'sem'],
    'duration': ['mean', 'std'],
    'convergence_time': ['mean', 'std'],
    'stat_alignment': ['mean', 'std'],
    'final_entropy': ['mean', 'std']
}).reset_index()

# Flatten column names
summary.columns = ['_'.join(col).strip('_') for col in summary.columns.values]

# Display top conditions by win rate
print("Top 5 Conditions by Win Rate:")
print("=" * 80)
top_5 = summary.nlargest(5, 'win_mean')[['prior_type', 'stat_profile', 'difficulty', 'win_mean', 'win_std']]
for idx, row in top_5.iterrows():
    print(f"{row['prior_type']:15s} | {row['stat_profile']:10s} | {row['difficulty']:8s} | Win: {row['win_mean']:.1%} ± {row['win_std']:.2f}")

print("\nBottom 5 Conditions by Win Rate:")
print("=" * 80)
bottom_5 = summary.nsmallest(5, 'win_mean')[['prior_type', 'stat_profile', 'difficulty', 'win_mean', 'win_std']]
for idx, row in bottom_5.iterrows():
    print(f"{row['prior_type']:15s} | {row['stat_profile']:10s} | {row['difficulty']:8s} | Win: {row['win_mean']:.1%} ± {row['win_std']:.2f}")

# ============================================================================
# 2. MAIN EFFECTS VISUALIZATION
# ============================================================================

fig, axes = plt.subplots(1, 3, figsize=(18, 5))

# Effect of prior type
prior_types_ordered = ['uniform', 'unconstrained', 'constrained']
prior_means = experiment_results.groupby('prior_type')['win'].mean()
prior_sems = experiment_results.groupby('prior_type')['win'].sem()
colors_prior_list = [COLORS_PRIOR[p] for p in prior_types_ordered]

axes[0].bar(range(len(prior_types_ordered)),
            [prior_means[p] for p in prior_types_ordered],
            yerr=[prior_sems[p] for p in prior_types_ordered],
            capsize=5, color=colors_prior_list, alpha=0.8, edgecolor='black', linewidth=1.5)
axes[0].set_xticks(range(len(prior_types_ordered)))
axes[0].set_xticklabels([x.title() for x in prior_types_ordered], rotation=15, ha='right')
axes[0].set_ylabel('Win Rate', fontsize=12, fontweight='bold')
axes[0].set_title('Research Question 1:\nEffect of Prior Type', fontsize=12, fontweight='bold')
axes[0].set_ylim([0, 1.0])
axes[0].grid(True, alpha=0.3, axis='y')
for i, p in enumerate(prior_types_ordered):
    v = prior_means[p]
    axes[0].text(i, v + 0.03, f'{v:.1%}', ha='center', fontweight='bold')

# Effect of stat profile
stat_profiles_ordered = ['random', 'balanced', 'specialist']
stat_means = experiment_results.groupby('stat_profile')['win'].mean()
stat_sems = experiment_results.groupby('stat_profile')['win'].sem()
colors_stat_list = [COLORS_STAT[s] for s in stat_profiles_ordered]

axes[1].bar(range(len(stat_profiles_ordered)),
            [stat_means[s] for s in stat_profiles_ordered],
            yerr=[stat_sems[s] for s in stat_profiles_ordered],
            capsize=5, color=colors_stat_list, alpha=0.8, edgecolor='black', linewidth=1.5)
axes[1].set_xticks(range(len(stat_profiles_ordered)))
axes[1].set_xticklabels([x.title() for x in stat_profiles_ordered], rotation=15, ha='right')
axes[1].set_ylabel('Win Rate', fontsize=12, fontweight='bold')
axes[1].set_title('Research Question 2:\nEffect of Stat Distribution', fontsize=12, fontweight='bold')
axes[1].set_ylim([0, 1.0])
axes[1].grid(True, alpha=0.3, axis='y')
for i, s in enumerate(stat_profiles_ordered):
    v = stat_means[s]
    axes[1].text(i, v + 0.03, f'{v:.1%}', ha='center', fontweight='bold')

# Effect of difficulty
difficulties_ordered = ['easy', 'normal', 'hard']
diff_means = experiment_results.groupby('difficulty')['win'].mean()
diff_sems = experiment_results.groupby('difficulty')['win'].sem()
colors_diff_list = [COLORS_DIFFICULTY[d] for d in difficulties_ordered]

axes[2].bar(range(len(difficulties_ordered)),
            [diff_means[d] for d in difficulties_ordered],
            yerr=[diff_sems[d] for d in difficulties_ordered],
            capsize=5, color=colors_diff_list, alpha=0.8, edgecolor='black', linewidth=1.5)
axes[2].set_xticks(range(len(difficulties_ordered)))
axes[2].set_xticklabels([x.title() for x in difficulties_ordered], rotation=15, ha='right')
axes[2].set_ylabel('Win Rate', fontsize=12, fontweight='bold')
axes[2].set_title('Research Question 3:\nEffect of Difficulty', fontsize=12, fontweight='bold')
axes[2].set_ylim([0, 1.0])
axes[2].grid(True, alpha=0.3, axis='y')
for i, d in enumerate(difficulties_ordered):
    v = diff_means[d]
    axes[2].text(i, v + 0.03, f'{v:.1%}', ha='center', fontweight='bold')

plt.tight_layout()
plt.show()

# ============================================================================
# 3. INTERACTION EFFECTS
# ============================================================================

fig, axes = plt.subplots(1, 2, figsize=(16, 5))

# Prior × Difficulty interaction
ax = axes[0]
x = onp.arange(len(difficulties_ordered))
width = 0.25

for i, prior in enumerate(prior_types_ordered):
    win_rates = []
    win_sems = []
    for diff in difficulties_ordered:
        data = experiment_results[(experiment_results['prior_type'] == prior) &
                                 (experiment_results['difficulty'] == diff)]
        win_rates.append(data['win'].mean())
        win_sems.append(data['win'].sem())
    ax.bar(x + i * width, win_rates, width, label=prior.title(),
           color=COLORS_PRIOR[prior], alpha=0.8, yerr=win_sems, capsize=4,
           edgecolor='black', linewidth=1.5)

ax.set_xlabel('Difficulty', fontsize=12, fontweight='bold')
ax.set_ylabel('Win Rate', fontsize=12, fontweight='bold')
ax.set_title('Prior × Difficulty Interaction', fontsize=12, fontweight='bold')
ax.set_xticks(x + width)
ax.set_xticklabels([d.title() for d in difficulties_ordered])
ax.legend(title='Prior Type', frameon=True, fancybox=True, shadow=True)
ax.grid(True, alpha=0.3, axis='y')
ax.set_ylim([0, 1.0])

# Prior × Stat Profile interaction
ax = axes[1]
x = onp.arange(len(stat_profiles_ordered))

for i, prior in enumerate(prior_types_ordered):
    win_rates = []
    win_sems = []
    for stat in stat_profiles_ordered:
        data = experiment_results[(experiment_results['prior_type'] == prior) &
                                 (experiment_results['stat_profile'] == stat)]
        win_rates.append(data['win'].mean())
        win_sems.append(data['win'].sem())
    ax.bar(x + i * width, win_rates, width, label=prior.title(),
           color=COLORS_PRIOR[prior], alpha=0.8, yerr=win_sems, capsize=4,
           edgecolor='black', linewidth=1.5)

ax.set_xlabel('Stat Profile', fontsize=12, fontweight='bold')
ax.set_ylabel('Win Rate', fontsize=12, fontweight='bold')
ax.set_title('Prior × Stat Profile Interaction', fontsize=12, fontweight='bold')
ax.set_xticks(x + width)
ax.set_xticklabels([s.title() for s in stat_profiles_ordered])
ax.legend(title='Prior Type', frameon=True, fancybox=True, shadow=True)
ax.grid(True, alpha=0.3, axis='y')
ax.set_ylim([0, 1.0])

plt.tight_layout()
plt.show()

# ============================================================================
# 4. COORDINATION QUALITY METRICS
# ============================================================================

fig, axes = plt.subplots(2, 2, figsize=(16, 12))

# Convergence time by prior type
ax = axes[0, 0]
prior_conv = experiment_results.groupby('prior_type')['convergence_time'].mean()
prior_conv_sem = experiment_results.groupby('prior_type')['convergence_time'].sem()
colors_prior_list = [COLORS_PRIOR[p] for p in prior_types_ordered]

ax.bar(range(len(prior_types_ordered)),
       [prior_conv[p] for p in prior_types_ordered],
       yerr=[prior_conv_sem[p] for p in prior_types_ordered],
       capsize=5, color=colors_prior_list, alpha=0.8, edgecolor='black', linewidth=1.5)
ax.set_xticks(range(len(prior_types_ordered)))
ax.set_xticklabels([x.title() for x in prior_types_ordered], rotation=15, ha='right')
ax.set_ylabel('Timesteps to Converge', fontsize=11, fontweight='bold')
ax.set_title('Convergence Speed by Prior', fontsize=11, fontweight='bold')
ax.grid(True, alpha=0.3, axis='y')
for i, p in enumerate(prior_types_ordered):
    v = prior_conv[p]
    ax.text(i, v + prior_conv.max() * 0.02, f'{v:.1f}', ha='center', fontweight='bold')

# Final entropy by prior type
ax = axes[0, 1]
prior_entropy = experiment_results.groupby('prior_type')['final_entropy'].mean()
prior_entropy_sem = experiment_results.groupby('prior_type')['final_entropy'].sem()

ax.bar(range(len(prior_types_ordered)),
       [prior_entropy[p] for p in prior_types_ordered],
       yerr=[prior_entropy_sem[p] for p in prior_types_ordered],
       capsize=5, color=colors_prior_list, alpha=0.8, edgecolor='black', linewidth=1.5)
ax.set_xticks(range(len(prior_types_ordered)))
ax.set_xticklabels([x.title() for x in prior_types_ordered], rotation=15, ha='right')
ax.set_ylabel('Final Entropy (nats)', fontsize=11, fontweight='bold')
ax.set_title('Role Uncertainty by Prior (Lower = More Certain)', fontsize=11, fontweight='bold')
ax.grid(True, alpha=0.3, axis='y')
for i, p in enumerate(prior_types_ordered):
    v = prior_entropy[p]
    ax.text(i, v + prior_entropy.max() * 0.02, f'{v:.3f}', ha='center', fontweight='bold')

# Stat alignment by stat profile
ax = axes[1, 0]
stat_align = experiment_results.groupby('stat_profile')['stat_alignment'].mean()
stat_align_sem = experiment_results.groupby('stat_profile')['stat_alignment'].sem()
colors_stat_list = [COLORS_STAT[s] for s in stat_profiles_ordered]

ax.bar(range(len(stat_profiles_ordered)),
       [stat_align[s] for s in stat_profiles_ordered],
       yerr=[stat_align_sem[s] for s in stat_profiles_ordered],
       capsize=5, color=colors_stat_list, alpha=0.8, edgecolor='black', linewidth=1.5)
ax.set_xticks(range(len(stat_profiles_ordered)))
ax.set_xticklabels([x.title() for x in stat_profiles_ordered], rotation=15, ha='right')
ax.set_ylabel('Stat Alignment Rate', fontsize=11, fontweight='bold')
ax.set_title('Role-Stat Match by Stat Profile', fontsize=11, fontweight='bold')
ax.set_ylim([0, 1.0])
ax.grid(True, alpha=0.3, axis='y')
for i, s in enumerate(stat_profiles_ordered):
    v = stat_align[s]
    ax.text(i, v + 0.02, f'{v:.1%}', ha='center', fontweight='bold')

# Game duration by difficulty
ax = axes[1, 1]
diff_duration = experiment_results.groupby('difficulty')['duration'].mean()
diff_duration_sem = experiment_results.groupby('difficulty')['duration'].sem()
colors_diff_list = [COLORS_DIFFICULTY[d] for d in difficulties_ordered]

ax.bar(range(len(difficulties_ordered)),
       [diff_duration[d] for d in difficulties_ordered],
       yerr=[diff_duration_sem[d] for d in difficulties_ordered],
       capsize=5, color=colors_diff_list, alpha=0.8, edgecolor='black', linewidth=1.5)
ax.set_xticks(range(len(difficulties_ordered)))
ax.set_xticklabels([x.title() for x in difficulties_ordered], rotation=15, ha='right')
ax.set_ylabel('Average Game Duration (steps)', fontsize=11, fontweight='bold')
ax.set_title('Game Length by Difficulty', fontsize=11, fontweight='bold')
ax.grid(True, alpha=0.3, axis='y')
for i, d in enumerate(difficulties_ordered):
    v = diff_duration[d]
    ax.text(i, v + diff_duration.max() * 0.02, f'{v:.1f}', ha='center', fontweight='bold')

plt.tight_layout()
plt.show()

# ============================================================================
# 5. COMPREHENSIVE HEATMAP OF ALL 27 CONDITIONS
# ============================================================================

fig, axes = plt.subplots(1, 3, figsize=(18, 6))

for diff_idx, difficulty in enumerate(difficulties_ordered):
    ax = axes[diff_idx]

    # Create matrix for heatmap
    heatmap_data = onp.zeros((len(stat_profiles_ordered), len(prior_types_ordered)))

    for i, stat in enumerate(stat_profiles_ordered):
        for j, prior in enumerate(prior_types_ordered):
            win_rate = summary[
                (summary['prior_type'] == prior) &
                (summary['stat_profile'] == stat) &
                (summary['difficulty'] == difficulty)
            ]['win_mean'].values[0]
            heatmap_data[i, j] = win_rate

    # Create heatmap using seaborn
    sns.heatmap(heatmap_data, annot=True, fmt='.1%', cmap='RdYlGn',
                vmin=0, vmax=1, ax=ax, cbar=(diff_idx == 2),
                linewidths=2, linecolor='white',
                annot_kws={'fontsize': 11, 'fontweight': 'bold'},
                cbar_kws={'label': 'Win Rate', 'shrink': 0.8} if diff_idx == 2 else None)

    # Labels
    ax.set_xticks(onp.arange(len(prior_types_ordered)) + 0.5)
    ax.set_xticklabels([p.title() for p in prior_types_ordered], rotation=45, ha='right')
    ax.set_yticks(onp.arange(len(stat_profiles_ordered)) + 0.5)
    ax.set_yticklabels([s.title() for s in stat_profiles_ordered], rotation=0)
    ax.set_title(f'{difficulty.title()} Difficulty', fontsize=12, fontweight='bold')

    if diff_idx == 0:
        ax.set_ylabel('Stat Profile', fontsize=11, fontweight='bold')
    else:
        ax.set_ylabel('')

    # Color the title background with difficulty color
    ax.title.set_bbox(dict(facecolor=COLORS_DIFFICULTY[difficulty], alpha=0.3,
                           edgecolor='black', boxstyle='round,pad=0.5'))

# Add overall title
fig.suptitle('Win Rates Across All 27 Experimental Conditions (Prior × Stats × Difficulty)',
             fontsize=14, fontweight='bold', y=1.02)

# Add x-axis label
fig.text(0.5, -0.02, 'Prior Type', ha='center', fontsize=12, fontweight='bold')

plt.tight_layout()
plt.show()

print("\n" + "="*80)
print("VISUALIZATION COMPLETE")
print("="*80)
