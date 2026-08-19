import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/design_system/app_colors.dart';
import '../../../../core/design_system/app_radius.dart';
import '../../../../core/design_system/app_spacing.dart';
import '../../../../core/design_system/app_typography.dart';

import '../models/challenge_model.dart';
import '../models/idea_model.dart';
import '../providers/innovate_provider.dart';

class InnovateScreen extends ConsumerWidget {
  const InnovateScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final featuredChallenge =
    ref.watch(featuredChallengeProvider);

    final challenges =
    ref.watch(challengesProvider);

    final ideas =
    ref.watch(ideasProvider);

    final statistics =
    ref.watch(innovateStatisticsProvider);

    return Scaffold(
      backgroundColor: AppColors.primary,

      appBar: AppBar(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Innovation',
          style: AppTypography.titleLarge.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            ref.invalidate(ideasProvider);
            ref.invalidate(challengesProvider);
            ref.invalidate(featuredChallengeProvider);
            ref.invalidate(innovateStatisticsProvider);

            await ref.read(ideasProvider.future);
          },

          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),

            padding: const EdgeInsets.all(
              AppSpacing.screenPadding,
            ),

            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,

              children: [

                // ==================================================
                // FEATURED CHALLENGE
                // ==================================================

                featuredChallenge.when(
                  loading: () => const Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  ),

                  error: (_, __) =>
                  const SizedBox(),

                  data: (challenge) {
                    if (challenge == null) {
                      return const SizedBox();
                    }

                    return _FeaturedChallengeCard(
                      challenge: challenge,
                    );
                  },
                ),

                const SizedBox(
                  height: AppSpacing.xl,
                ),

                // ==================================================
                // STATISTICS
                // ==================================================

                statistics.when(
                  loading: () => const SizedBox(),

                  error: (_, __) =>
                  const SizedBox(),

                  data: (data) {
                    return _InnovationStatistics(
                      statistics: data,
                    );
                  },
                ),

                const SizedBox(
                  height: AppSpacing.xl,
                ),

                // ==================================================
                // MY IDEAS HEADER
                // ==================================================

                Row(
                  children: [

                    Expanded(
                      child: Text(
                        'My Ideas',
                        style: AppTypography.headlineMedium
                            .copyWith(
                          color: Colors.white,
                          fontWeight:
                          FontWeight.bold,
                        ),
                      ),
                    ),

                    // ============================================
                    // ADD IDEA BUTTON
                    // ============================================

                    Material(
                      color: Colors.white,
                      shape: const CircleBorder(),

                      child: InkWell(
                        customBorder:
                        const CircleBorder(),

                        onTap: () async {
                          final challengeList =
                          await ref.read(
                            challengesProvider.future,
                          );

                          if (!context.mounted) {
                            return;
                          }

                          await showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            backgroundColor:
                            Colors.white,

                            shape:
                            const RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.vertical(
                                top: Radius.circular(
                                  28,
                                ),
                              ),
                            ),

                            builder: (context) {
                              return _AddIdeaSheet(
                                challenges:
                                challengeList,
                              );
                            },
                          );
                        },

                        child: const SizedBox(
                          width: 42,
                          height: 42,

                          child: Icon(
                            Icons.add,
                            color:
                            AppColors.primary,
                            size: 27,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(
                  height: AppSpacing.md,
                ),

                // ==================================================
                // IDEAS
                // ==================================================

                ideas.when(
                  loading: () => const Center(
                    child: Padding(
                      padding:
                      EdgeInsets.all(30),
                      child:
                      CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    ),
                  ),

                  error: (error, _) => Container(
                    width: double.infinity,
                    padding:
                    const EdgeInsets.all(20),

                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                      BorderRadius.circular(
                        AppRadius.card,
                      ),
                    ),

                    child: Text(
                      'Unable to load ideas.\n$error',
                      style:
                      AppTypography.bodyMedium,
                    ),
                  ),

                  data: (ideaList) {
                    if (ideaList.isEmpty) {
                      return _EmptyIdeasCard(
                        onAdd: () async {
                          final challengeList =
                          await ref.read(
                            challengesProvider.future,
                          );

                          if (!context.mounted) {
                            return;
                          }

                          await showModalBottomSheet(
                            context: context,
                            isScrollControlled:
                            true,
                            backgroundColor:
                            Colors.white,

                            shape:
                            const RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.vertical(
                                top: Radius.circular(
                                  28,
                                ),
                              ),
                            ),

                            builder: (context) {
                              return _AddIdeaSheet(
                                challenges:
                                challengeList,
                              );
                            },
                          );
                        },
                      );
                    }

                    return Column(
                      children: ideaList
                          .map(
                            (idea) =>
                            _IdeaCard(
                              idea: idea,
                            ),
                      )
                          .toList(),
                    );
                  },
                ),

                const SizedBox(
                  height: AppSpacing.xxl,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ================================================================
// FEATURED CHALLENGE CARD
// ================================================================

class _FeaturedChallengeCard extends StatelessWidget {
  final ChallengeModel challenge;

  const _FeaturedChallengeCard({
    required this.challenge,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,

      padding: const EdgeInsets.all(
        AppSpacing.cardPadding,
      ),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
        BorderRadius.circular(
          AppRadius.card,
        ),
      ),

      child: Column(
        crossAxisAlignment:
        CrossAxisAlignment.start,

        children: [

          Row(
            children: [

              Container(
                width: 44,
                height: 44,

                decoration: BoxDecoration(
                  color: Colors.orange
                      .withValues(alpha: 0.12),
                  shape: BoxShape.circle,
                ),

                child: const Icon(
                  Icons.lightbulb_rounded,
                  color: Colors.orange,
                ),
              ),

              const SizedBox(
                width: 12,
              ),

              Text(
                'Featured Challenge',
                style:
                AppTypography.titleMedium
                    .copyWith(
                  color:
                  AppColors.primary,
                  fontWeight:
                  FontWeight.bold,
                ),
              ),
            ],
          ),

          const SizedBox(
            height: AppSpacing.lg,
          ),

          Text(
            challenge.title,
            style:
            AppTypography.titleLarge
                .copyWith(
              color:
              AppColors.primary,
              fontWeight:
              FontWeight.bold,
            ),
          ),

          const SizedBox(
            height: AppSpacing.md,
          ),

          Text(
            'Create an innovative solution and showcase your idea.',
            style:
            AppTypography.bodyMedium
                .copyWith(
              color:
              AppColors.textSecondary,
            ),
          ),

          const SizedBox(
            height: AppSpacing.lg,
          ),

          Container(
            padding:
            const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 8,
            ),

            decoration: BoxDecoration(
              color:
              AppColors.primary.withValues(
                alpha: 0.08,
              ),
              borderRadius:
              BorderRadius.circular(
                AppRadius.pill,
              ),
            ),

            child: Text(
              'Challenge ID: ${challenge.id}',
              style:
              AppTypography.bodySmall
                  .copyWith(
                color:
                AppColors.primary,
                fontWeight:
                FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ================================================================
// STATISTICS
// ================================================================

class _InnovationStatistics extends StatelessWidget {
  final Map<String, dynamic> statistics;

  const _InnovationStatistics({
    required this.statistics,
  });

  @override
  Widget build(BuildContext context) {
    final ideas =
        statistics['ideas'] ?? 0;

    final shortlisted =
        statistics['shortlisted'] ?? 0;

    final points =
        statistics['points'] ?? 0;

    final challenges =
        statistics['challenges'] ?? 0;

    return Column(
      crossAxisAlignment:
      CrossAxisAlignment.start,

      children: [

        Text(
          'Innovation Progress',
          style:
          AppTypography.headlineMedium
              .copyWith(
            color: Colors.white,
            fontWeight:
            FontWeight.bold,
          ),
        ),

        const SizedBox(
          height: AppSpacing.md,
        ),

        Row(
          children: [

            Expanded(
              child: _StatCard(
                icon:
                Icons.lightbulb_outline,
                value:
                ideas.toString(),
                label:
                'Ideas',
                iconColor:
                Colors.orange,
              ),
            ),

            const SizedBox(
              width: AppSpacing.md,
            ),

            Expanded(
              child: _StatCard(
                icon:
                Icons.star_outline,
                value:
                points.toString(),
                label:
                'Points',
                iconColor:
                Colors.amber,
              ),
            ),
          ],
        ),

        const SizedBox(
          height: AppSpacing.md,
        ),

        Row(
          children: [

            Expanded(
              child: _StatCard(
                icon:
                Icons.emoji_events_outlined,
                value:
                shortlisted.toString(),
                label:
                'Shortlisted',
                iconColor:
                Colors.green,
              ),
            ),

            const SizedBox(
              width: AppSpacing.md,
            ),

            Expanded(
              child: _StatCard(
                icon:
                Icons.flag_outlined,
                value:
                challenges.toString(),
                label:
                'Challenges',
                iconColor:
                Colors.blue,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;
  final Color iconColor;

  const _StatCard({
    required this.icon,
    required this.value,
    required this.label,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
      const EdgeInsets.symmetric(
        vertical: 18,
        horizontal: 10,
      ),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
        BorderRadius.circular(
          AppRadius.card,
        ),
      ),

      child: Column(
        children: [

          Container(
            width: 40,
            height: 40,

            decoration: BoxDecoration(
              color: iconColor.withValues(
                alpha: 0.10,
              ),
              shape: BoxShape.circle,
            ),

            child: Icon(
              icon,
              color: iconColor,
            ),
          ),

          const SizedBox(
            height: 10,
          ),

          Text(
            value,
            style:
            AppTypography.titleLarge
                .copyWith(
              color:
              AppColors.primary,
              fontWeight:
              FontWeight.bold,
            ),
          ),

          const SizedBox(
            height: 3,
          ),

          Text(
            label,
            textAlign: TextAlign.center,
            style:
            AppTypography.bodySmall
                .copyWith(
              color:
              AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}

// ================================================================
// EMPTY IDEAS
// ================================================================

class _EmptyIdeasCard extends StatelessWidget {
  final VoidCallback onAdd;

  const _EmptyIdeasCard({
    required this.onAdd,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,

      padding:
      const EdgeInsets.all(28),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
        BorderRadius.circular(
          AppRadius.card,
        ),
      ),

      child: Column(
        children: [

          Container(
            width: 60,
            height: 60,

            decoration: BoxDecoration(
              color:
              AppColors.primary.withValues(
                alpha: 0.08,
              ),
              shape: BoxShape.circle,
            ),

            child: const Icon(
              Icons.lightbulb_outline,
              color:
              AppColors.primary,
              size: 30,
            ),
          ),

          const SizedBox(
            height: 16,
          ),

          Text(
            'No ideas yet',
            style:
            AppTypography.titleMedium
                .copyWith(
              color:
              AppColors.primary,
              fontWeight:
              FontWeight.bold,
            ),
          ),

          const SizedBox(
            height: 8,
          ),

          Text(
            'Have an innovative idea? Submit it and start your innovation journey.',
            textAlign:
            TextAlign.center,
            style:
            AppTypography.bodyMedium
                .copyWith(
              color:
              AppColors.textSecondary,
            ),
          ),

          const SizedBox(
            height: 20,
          ),

          SizedBox(
            width: double.infinity,

            child: ElevatedButton.icon(
              onPressed: onAdd,

              icon: const Icon(
                Icons.add,
              ),

              label: const Text(
                'Submit Your First Idea',
              ),

              style:
              ElevatedButton.styleFrom(
                backgroundColor:
                AppColors.primary,
                foregroundColor:
                Colors.white,

                minimumSize:
                const Size(
                  double.infinity,
                  50,
                ),

                shape:
                RoundedRectangleBorder(
                  borderRadius:
                  BorderRadius.circular(
                    AppRadius.button,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ================================================================
// IDEA CARD
// ================================================================

class _IdeaCard extends StatelessWidget {
  final IdeaModel idea;

  const _IdeaCard({
    required this.idea,
  });

  Color _statusColor() {
    switch (idea.status.toLowerCase()) {
      case 'approved':
      case 'shortlisted':
        return Colors.green;

      case 'rejected':
        return Colors.red;

      case 'under review':
      case 'review':
        return Colors.orange;

      default:
        return Colors.blue;
    }
  }

  @override
  Widget build(BuildContext context) {
    final statusColor =
    _statusColor();

    return Container(
      width: double.infinity,

      margin:
      const EdgeInsets.only(
        bottom: AppSpacing.md,
      ),

      padding:
      const EdgeInsets.all(
        AppSpacing.cardPadding,
      ),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
        BorderRadius.circular(
          AppRadius.card,
        ),
      ),

      child: Column(
        crossAxisAlignment:
        CrossAxisAlignment.start,

        children: [

          // ------------------------------------------------------
          // TITLE + STATUS
          // ------------------------------------------------------

          Row(
            crossAxisAlignment:
            CrossAxisAlignment.start,

            children: [

              Expanded(
                child: Text(
                  idea.title,
                  style:
                  AppTypography.titleMedium
                      .copyWith(
                    color:
                    AppColors.primary,
                    fontWeight:
                    FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(
                width: 8,
              ),

              Container(
                padding:
                const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),

                decoration: BoxDecoration(
                  color:
                  statusColor.withValues(
                    alpha: 0.10,
                  ),
                  borderRadius:
                  BorderRadius.circular(
                    AppRadius.pill,
                  ),
                ),

                child: Text(
                  idea.status,
                  style:
                  AppTypography.bodySmall
                      .copyWith(
                    color:
                    statusColor,
                    fontWeight:
                    FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(
            height: AppSpacing.sm,
          ),

          // ------------------------------------------------------
          // DESCRIPTION
          // ------------------------------------------------------

          Text(
            idea.description,
            maxLines: 3,
            overflow:
            TextOverflow.ellipsis,

            style:
            AppTypography.bodyMedium
                .copyWith(
              color:
              AppColors.textSecondary,
            ),
          ),

          const SizedBox(
            height: AppSpacing.md,
          ),

          // ------------------------------------------------------
          // DOMAIN
          // ------------------------------------------------------

          Row(
            children: [

              const Icon(
                Icons.category_outlined,
                size: 18,
                color:
                AppColors.primary,
              ),

              const SizedBox(
                width: 6,
              ),

              Text(
                idea.domain,
                style:
                AppTypography.bodySmall
                    .copyWith(
                  fontWeight:
                  FontWeight.w600,
                ),
              ),

              const Spacer(),

              // POINTS

              const Icon(
                Icons.star,
                size: 18,
                color:
                Colors.amber,
              ),

              const SizedBox(
                width: 4,
              ),

              Text(
                '${idea.points} XP',
                style:
                AppTypography.bodySmall
                    .copyWith(
                  fontWeight:
                  FontWeight.bold,
                ),
              ),
            ],
          ),

          const SizedBox(
            height: AppSpacing.sm,
          ),

          // ------------------------------------------------------
          // CHALLENGE
          // ------------------------------------------------------

          Text(
            'Challenge: ${idea.challengeTitle}',
            maxLines: 1,
            overflow:
            TextOverflow.ellipsis,

            style:
            AppTypography.bodySmall
                .copyWith(
              color:
              AppColors.textSecondary,
            ),
          ),

          const SizedBox(
            height: AppSpacing.md,
          ),

          // ------------------------------------------------------
          // SHORTLISTED / BUILD STATUS
          // ------------------------------------------------------

          Row(
            children: [

              if (idea.shortlisted)
                _SmallStatus(
                  icon:
                  Icons.verified,
                  label:
                  'Shortlisted',
                  color:
                  Colors.green,
                ),

              if (idea.shortlisted &&
                  idea.movedToBuild)
                const SizedBox(
                  width: 8,
                ),

              if (idea.movedToBuild)
                _SmallStatus(
                  icon:
                  Icons.rocket_launch,
                  label:
                  'Moved to Build',
                  color:
                  AppColors.primary,
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SmallStatus extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;

  const _SmallStatus({
    required this.icon,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
      const EdgeInsets.symmetric(
        horizontal: 9,
        vertical: 5,
      ),

      decoration: BoxDecoration(
        color: color.withValues(
          alpha: 0.10,
        ),
        borderRadius:
        BorderRadius.circular(
          AppRadius.pill,
        ),
      ),

      child: Row(
        mainAxisSize:
        MainAxisSize.min,

        children: [

          Icon(
            icon,
            size: 14,
            color: color,
          ),

          const SizedBox(
            width: 4,
          ),

          Text(
            label,
            style:
            AppTypography.bodySmall
                .copyWith(
              color: color,
              fontWeight:
              FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

// ================================================================
// ADD IDEA SHEET
// ================================================================

class _AddIdeaSheet extends ConsumerStatefulWidget {
  final List<ChallengeModel> challenges;

  const _AddIdeaSheet({
    required this.challenges,
  });

  @override
  ConsumerState<_AddIdeaSheet> createState() =>
      _AddIdeaSheetState();
}

class _AddIdeaSheetState
    extends ConsumerState<_AddIdeaSheet> {

  final _formKey =
  GlobalKey<FormState>();

  final _titleController =
  TextEditingController();

  final _descriptionController =
  TextEditingController();

  final _domainController =
  TextEditingController();

  String? _selectedChallengeId;

  bool _isSubmitting = false;

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _domainController.dispose();

    super.dispose();
  }

  Future<void> _submitIdea() async {
    if (!_formKey.currentState!
        .validate()) {
      return;
    }

    if (_selectedChallengeId ==
        null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(
        const SnackBar(
          content: Text(
            'Please select a challenge',
          ),
        ),
      );

      return;
    }

    setState(() {
      _isSubmitting = true;
    });

    try {
      final idea =
      await ref
          .read(
        ideasProvider.notifier,
      )
          .submitIdea(
        challengeId:
        _selectedChallengeId!,
        title:
        _titleController.text
            .trim(),
        description:
        _descriptionController
            .text
            .trim(),
        domain:
        _domainController.text
            .trim(),
      );

      if (!mounted) {
        return;
      }

      if (idea != null) {
        Navigator.of(context).pop();

        ScaffoldMessenger.of(context)
            .showSnackBar(
          const SnackBar(
            content: Text(
              'Innovation idea submitted successfully',
            ),
            backgroundColor:
            Colors.green,
          ),
        );
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(
          const SnackBar(
            content: Text(
              'Unable to submit idea. Please try again.',
            ),
          ),
        );
      }
    } catch (error) {
      if (!mounted) {
        return;
      }

      ScaffoldMessenger.of(context)
          .showSnackBar(
        SnackBar(
          content: Text(
            'Failed to submit idea: $error',
          ),
        ),
      );
    } finally {
      if (mounted) {
        setState(() {
          _isSubmitting = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(
          left: AppSpacing.screenPadding,
          right: AppSpacing.screenPadding,
          top: AppSpacing.screenPadding,
          bottom:
          MediaQuery.of(context)
              .viewInsets
              .bottom +
              AppSpacing.screenPadding,
        ),

        child: Form(
          key: _formKey,

          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,

              children: [

                // ------------------------------------------------
                // HEADER
                // ------------------------------------------------

                Row(
                  children: [

                    Expanded(
                      child: Text(
                        'Submit Innovation Idea',
                        style:
                        AppTypography
                            .titleLarge
                            .copyWith(
                          color:
                          AppColors.primary,
                          fontWeight:
                          FontWeight.bold,
                        ),
                      ),
                    ),

                    IconButton(
                      onPressed:
                      _isSubmitting
                          ? null
                          : () =>
                          Navigator.of(
                            context,
                          ).pop(),

                      icon:
                      const Icon(
                        Icons.close,
                      ),
                    ),
                  ],
                ),

                Text(
                  'Share your idea and turn it into an innovation.',
                  style:
                  AppTypography.bodyMedium
                      .copyWith(
                    color:
                    AppColors.textSecondary,
                  ),
                ),

                const SizedBox(
                  height: AppSpacing.lg,
                ),

                // ------------------------------------------------
                // CHALLENGE
                // ------------------------------------------------

                Text(
                  'Innovation Challenge',
                  style:
                  AppTypography.titleMedium
                      .copyWith(
                    fontWeight:
                    FontWeight.bold,
                  ),
                ),

                const SizedBox(
                  height: AppSpacing.sm,
                ),

                DropdownButtonFormField<String>(
                  initialValue:
                  _selectedChallengeId,

                  isExpanded: true,

                  decoration:
                  _inputDecoration(
                    'Select a challenge',
                  ),

                  items: widget.challenges
                      .map(
                        (
                        challenge,
                        ) {
                      return DropdownMenuItem<
                          String>(
                        value:
                        challenge.id,

                        child: Text(
                          challenge.title,
                          overflow:
                          TextOverflow
                              .ellipsis,
                        ),
                      );
                    },
                  )
                      .toList(),

                  onChanged:
                  _isSubmitting
                      ? null
                      : (value) {
                    setState(() {
                      _selectedChallengeId =
                          value;
                    });
                  },

                  validator: (value) {
                    if (value == null ||
                        value.isEmpty) {
                      return 'Please select a challenge';
                    }

                    return null;
                  },
                ),

                const SizedBox(
                  height: AppSpacing.lg,
                ),

                // ------------------------------------------------
                // TITLE
                // ------------------------------------------------

                Text(
                  'Idea Title',
                  style:
                  AppTypography.titleMedium
                      .copyWith(
                    fontWeight:
                    FontWeight.bold,
                  ),
                ),

                const SizedBox(
                  height: AppSpacing.sm,
                ),

                TextFormField(
                  controller:
                  _titleController,

                  enabled:
                  !_isSubmitting,

                  decoration:
                  _inputDecoration(
                    'Enter your idea title',
                  ),

                  validator: (value) {
                    if (value == null ||
                        value
                            .trim()
                            .isEmpty) {
                      return 'Please enter an idea title';
                    }

                    if (value
                        .trim()
                        .length <
                        5) {
                      return 'Title should be at least 5 characters';
                    }

                    return null;
                  },
                ),

                const SizedBox(
                  height: AppSpacing.lg,
                ),

                // ------------------------------------------------
                // DESCRIPTION
                // ------------------------------------------------

                Text(
                  'Description',
                  style:
                  AppTypography.titleMedium
                      .copyWith(
                    fontWeight:
                    FontWeight.bold,
                  ),
                ),

                const SizedBox(
                  height: AppSpacing.sm,
                ),

                TextFormField(
                  controller:
                  _descriptionController,

                  enabled:
                  !_isSubmitting,

                  minLines: 4,
                  maxLines: 6,

                  decoration:
                  _inputDecoration(
                    'Explain your innovation idea...',
                  ).copyWith(
                    alignLabelWithHint:
                    true,
                  ),

                  validator: (value) {
                    if (value == null ||
                        value
                            .trim()
                            .isEmpty) {
                      return 'Please describe your idea';
                    }

                    if (value
                        .trim()
                        .length <
                        20) {
                      return 'Please provide more detail';
                    }

                    return null;
                  },
                ),

                const SizedBox(
                  height: AppSpacing.lg,
                ),

                // ------------------------------------------------
                // DOMAIN
                // ------------------------------------------------

                Text(
                  'Domain',
                  style:
                  AppTypography.titleMedium
                      .copyWith(
                    fontWeight:
                    FontWeight.bold,
                  ),
                ),

                const SizedBox(
                  height: AppSpacing.sm,
                ),

                TextFormField(
                  controller:
                  _domainController,

                  enabled:
                  !_isSubmitting,

                  decoration:
                  _inputDecoration(
                    'Example: AI, IoT, Healthcare, Education',
                  ),

                  validator: (value) {
                    if (value == null ||
                        value
                            .trim()
                            .isEmpty) {
                      return 'Please enter the domain';
                    }

                    return null;
                  },
                ),

                const SizedBox(
                  height: AppSpacing.xl,
                ),

                // ------------------------------------------------
                // SUBMIT
                // ------------------------------------------------

                SizedBox(
                  width: double.infinity,
                  height: 52,

                  child:
                  ElevatedButton(
                    onPressed:
                    _isSubmitting
                        ? null
                        : _submitIdea,

                    style:
                    ElevatedButton
                        .styleFrom(
                      backgroundColor:
                      AppColors.primary,

                      foregroundColor:
                      Colors.white,

                      disabledBackgroundColor:
                      AppColors.primary
                          .withValues(
                        alpha: 0.5,
                      ),

                      shape:
                      RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.circular(
                          AppRadius.button,
                        ),
                      ),
                    ),

                    child: _isSubmitting
                        ? const SizedBox(
                      width: 22,
                      height: 22,

                      child:
                      CircularProgressIndicator(
                        strokeWidth: 2,
                        color:
                        Colors.white,
                      ),
                    )
                        : const Text(
                      'Submit Idea',
                      style: TextStyle(
                        fontWeight:
                        FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration _inputDecoration(
      String hint,
      ) {
    return InputDecoration(
      hintText: hint,

      border:
      OutlineInputBorder(
        borderRadius:
        BorderRadius.circular(
          AppRadius.input,
        ),
      ),

      enabledBorder:
      OutlineInputBorder(
        borderRadius:
        BorderRadius.circular(
          AppRadius.input,
        ),
      ),

      focusedBorder:
      OutlineInputBorder(
        borderRadius:
        BorderRadius.circular(
          AppRadius.input,
        ),

        borderSide:
        const BorderSide(
          color:
          AppColors.primary,
          width: 2,
        ),
      ),
    );
  }
}