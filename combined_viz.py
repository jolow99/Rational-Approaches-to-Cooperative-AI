# Panel 2: Win rate by prior × stat (faceted by difficulty)
for idx, difficulty in enumerate(['easy', 'normal', 'hard']):
    ax = fig.add_subplot(gs[1, idx])
    subset = experiment_results[experiment_results['difficulty'] == difficulty]
    
    sns.barplot(
        data=subset,
        x='stat_profile',
        y='win',
        hue='prior_type',
        ax=ax,
        errwidth=1.5,
        capsize=0.1
    )
    
    ax.set_title(f'{difficulty.upper()} Difficulty', fontsize=12, fontweight='bold')
    ax.set_xlabel('Stat Profile')
    ax.set_ylabel('Win Rate')
    if idx == 2:
        ax.legend(title='Prior Type', frameon=False, loc='lower right')
    else:
        ax.get_legend().remove()
    ax.set_ylim([0, 1.05])

# Heat map
fig, axes = plt.subplots(1, 3, figsize=(19, 6.5))
fig.suptitle('Performance Matrix: All 27 Experimental Conditions', 
             fontsize=16, fontweight=700, y=0.98)

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

    # Create professional heatmap
    sns.heatmap(heatmap_data, annot=True, fmt='.1%', cmap=HEATMAP_CMAP,
                vmin=0, vmax=1, ax=ax, cbar=(diff_idx == 2),
                linewidths=2.5, linecolor='white',
                annot_kws={'fontsize': 12, 'fontweight': 600},
                cbar_kws={'label': 'Win Rate', 'shrink': 0.82, 
                         'aspect': 20, 'pad': 0.02} if diff_idx == 2 else None)

    # Enhanced labels
    ax.set_xticks(onp.arange(len(prior_types_ordered)) + 0.5)
    ax.set_xticklabels([p.capitalize() for p in prior_types_ordered], 
                       rotation=0, ha='center', fontweight=500)
    ax.set_yticks(onp.arange(len(stat_profiles_ordered)) + 0.5)
    ax.set_yticklabels([s.capitalize() for s in stat_profiles_ordered], 
                       rotation=0, va='center', fontweight=500)
    ax.set_title(f'{difficulty.capitalize()} Difficulty', 
                fontsize=13, fontweight=600, pad=15,
                bbox=dict(facecolor=COLORS_DIFFICULTY[difficulty], alpha=0.2,
                         edgecolor='#2C3E50', linewidth=2, boxstyle='round,pad=0.6'))

    if diff_idx == 0:
        ax.set_ylabel('Stat Profile', fontsize=12, fontweight=600)
    else:
        ax.set_ylabel('')

    # Professional colorbar styling
    if diff_idx == 2:
        cbar = ax.collections[0].colorbar
        cbar.ax.tick_params(labelsize=10)
        cbar.set_label('Win Rate', fontsize=11, fontweight=600, labelpad=10)

# Add x-axis label
fig.text(0.5, 0.01, 'Prior Type', ha='center', fontsize=12, fontweight=600)

