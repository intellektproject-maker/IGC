import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/design_system/app_colors.dart';
import '../../../../core/design_system/app_spacing.dart';
import '../../../../core/design_system/app_typography.dart';

import '../../dashboard/providers/dashboard_provider.dart';

import '../providers/innovate_provider.dart';

import '../widgets/add_idea_card.dart';
import '../widgets/challenge_card.dart';
import '../widgets/featured_challenge_card.dart';
import '../widgets/idea_card.dart';
import '../widgets/innovation_stat_card.dart';

class InnovateScreen extends ConsumerWidget {
  const InnovateScreen({
    super.key,
  });

  @override
  Widget build(
      BuildContext context,
      WidgetRef ref,
      ) {
    // ==========================================================
    // LOGGED-IN STUDENT
    // ==========================================================

    final studentAsync =
    ref.watch(dashboardProvider);

    // ==========================================================
    // INNOVATE DATA
    // ==========================================================

    final featuredChallenge =
    ref.watch(featuredChallengeProvider);

    final statistics =
    ref.watch(innovateStatisticsProvider);

    final ideas =
    ref.watch(ideasProvider);

    final challenges =
    ref.watch(challengesProvider);

    return Scaffold(
      backgroundColor: AppColors.primary,

      // ========================================================
      // APP BAR
      // ========================================================

      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        centerTitle: false,
        title: Text(
          'Innovate',
          style: AppTypography.titleLarge.copyWith(
            color: Colors.white,
          ),
        ),
      ),

      // ========================================================
      // STUDENT PROFILE
      // ========================================================

      body: studentAsync.when(
        // ------------------------------------------------------
        // LOADING
        // ------------------------------------------------------

        loading: () {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          );
        },

        // ------------------------------------------------------
        // ERROR
        // ------------------------------------------------------

        error: (error, stackTrace) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Text(
                'Unable to load student profile.\n\n$error',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          );
        },

        // ------------------------------------------------------
        // STUDENT LOADED
        // ------------------------------------------------------

        data: (studentData) {
          return SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(
                AppSpacing.screenPadding,
              ),

              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [

                  // ==================================================
                  // 1. FEATURED CHALLENGE
                  // ==================================================

                  featuredChallenge.when(
                    loading: () {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      );
                    },

                    error: (error, stackTrace) {
                      return const SizedBox();
                    },

                    data: (challenge) {
                      if (challenge == null) {
                        return const SizedBox();
                      }

                      return FeaturedChallengeCard(
                        challenge: challenge,

                        // Actual logged-in student
                        studentName: studentData.name,
                      );
                    },
                  ),

                  const SizedBox(
                    height: AppSpacing.xl,
                  ),

                  // ==================================================
                  // 2. OVERVIEW
                  // ==================================================

                  Text(
                    'Overview',
                    style:
                    AppTypography.headlineMedium.copyWith(
                      color: Colors.white,
                    ),
                  ),

                  const SizedBox(
                    height: AppSpacing.md,
                  ),

                  statistics.when(
                    loading: () {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      );
                    },

                    error: (error, stackTrace) {
                      return const SizedBox();
                    },

                    data: (data) {
                      return GridView.count(
                        shrinkWrap: true,
                        physics:
                        const NeverScrollableScrollPhysics(),
                        crossAxisCount: 2,
                        crossAxisSpacing:
                        AppSpacing.md,
                        mainAxisSpacing:
                        AppSpacing.md,
                        childAspectRatio: 1.15,

                        children: [
                          InnovationStatCard(
                            title: 'Ideas',
                            value:
                            data['ideas'].toString(),
                            icon: Icons.lightbulb,
                            iconColor: Colors.amber,
                          ),

                          InnovationStatCard(
                            title: 'Challenges',
                            value:
                            data['joined'].toString(),
                            icon: Icons.rocket_launch,
                            iconColor: Colors.blue,
                          ),

                          InnovationStatCard(
                            title: 'XP Earned',
                            value:
                            data['xp'].toString(),
                            icon: Icons.stars,
                            iconColor: Colors.orange,
                          ),

                          InnovationStatCard(
                            title: 'Points',
                            value:
                            data['points'].toString(),
                            icon:
                            Icons.workspace_premium,
                            iconColor: Colors.green,
                          ),
                        ],
                      );
                    },
                  ),

                  const SizedBox(
                    height: AppSpacing.xl,
                  ),

                  // ==================================================
                  // 3. MY IDEAS
                  // ==================================================

                  Text(
                    'My Ideas',
                    style:
                    AppTypography.headlineMedium.copyWith(
                      color: Colors.white,
                    ),
                  ),

                  const SizedBox(
                    height: AppSpacing.md,
                  ),

                  // --------------------------------------------------
                  // ADD NEW IDEA
                  // --------------------------------------------------

                  AddIdeaCard(
                    onTap: () {
                      _showAddIdeaDialog(
                        context,
                        ref,
                      );
                    },
                  ),

                  const SizedBox(
                    height: AppSpacing.lg,
                  ),

                  // --------------------------------------------------
                  // EXISTING IDEAS
                  // --------------------------------------------------

                  ideas.when(
                    loading: () {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      );
                    },

                    error: (error, stackTrace) {
                      return const SizedBox();
                    },

                    data: (ideaList) {
                      if (ideaList.isEmpty) {
                        return const Padding(
                          padding:
                          EdgeInsets.all(20),
                          child: Center(
                            child: Text(
                              'No ideas submitted yet.',
                              style: TextStyle(
                                color:
                                Colors.white70,
                              ),
                            ),
                          ),
                        );
                      }

                      return Column(
                        children:
                        ideaList.map(
                              (idea) {
                            return Padding(
                              padding:
                              const EdgeInsets.only(
                                bottom: 12,
                              ),
                              child: IdeaCard(
                                idea: idea,
                              ),
                            );
                          },
                        ).toList(),
                      );
                    },
                  ),

                  const SizedBox(
                    height: AppSpacing.xl,
                  ),

                  // ==================================================
                  // 4. INNOVATIVE CHALLENGES
                  // ==================================================

                  Text(
                    'Innovative Challenges',
                    style:
                    AppTypography.headlineMedium.copyWith(
                      color: Colors.white,
                    ),
                  ),

                  const SizedBox(
                    height: AppSpacing.md,
                  ),

                  challenges.when(
                    loading: () {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      );
                    },

                    error: (error, stackTrace) {
                      return const SizedBox();
                    },

                    data: (challengeList) {
                      if (challengeList.isEmpty) {
                        return const Padding(
                          padding:
                          EdgeInsets.all(20),
                          child: Center(
                            child: Text(
                              'No challenges available.',
                              style: TextStyle(
                                color:
                                Colors.white70,
                              ),
                            ),
                          ),
                        );
                      }

                      return Column(
                        children:
                        challengeList.map(
                              (challenge) {
                            return Padding(
                              padding:
                              const EdgeInsets.only(
                                bottom: 14,
                              ),

                              child: ChallengeCard(
                                challenge: challenge,

                                // IMPORTANT:
                                // ChallengeCard currently
                                // accepts studentName only.
                                studentName:
                                studentData.name,
                              ),
                            );
                          },
                        ).toList(),
                      );
                    },
                  ),

                  const SizedBox(
                    height: AppSpacing.xxl,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  // ================================================================
  // ADD IDEA DIALOG
  // ================================================================

  void _showAddIdeaDialog(
      BuildContext context,
      WidgetRef ref,
      ) {
    final formKey =
    GlobalKey<FormState>();

    final titleController =
    TextEditingController();

    final descriptionController =
    TextEditingController();

    final domainController =
    TextEditingController();

    bool submitting = false;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) {
        return StatefulBuilder(
          builder: (
              context,
              setState,
              ) {
            return AlertDialog(
              title: const Text(
                'Add Your Idea',
              ),

              content: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisSize:
                    MainAxisSize.min,
                    children: [
                      // ==================================================
                      // TITLE
                      // ==================================================

                      TextFormField(
                        controller:
                        titleController,
                        textInputAction:
                        TextInputAction.next,
                        decoration:
                        const InputDecoration(
                          labelText:
                          'Idea Title',
                          prefixIcon:
                          Icon(
                            Icons
                                .lightbulb_outline,
                          ),
                        ),
                        validator: (value) {
                          if (value ==
                              null ||
                              value
                                  .trim()
                                  .isEmpty) {
                            return 'Enter an idea title';
                          }

                          return null;
                        },
                      ),

                      const SizedBox(
                        height: 14,
                      ),

                      // ==================================================
                      // DESCRIPTION
                      // ==================================================

                      TextFormField(
                        controller:
                        descriptionController,
                        maxLines: 4,
                        decoration:
                        const InputDecoration(
                          labelText:
                          'Description',
                          prefixIcon:
                          Icon(
                            Icons
                                .description_outlined,
                          ),
                        ),
                        validator: (value) {
                          if (value ==
                              null ||
                              value
                                  .trim()
                                  .isEmpty) {
                            return 'Enter a description';
                          }

                          return null;
                        },
                      ),

                      const SizedBox(
                        height: 14,
                      ),

                      // ==================================================
                      // DOMAIN
                      // ==================================================

                      TextFormField(
                        controller:
                        domainController,
                        textInputAction:
                        TextInputAction.done,
                        decoration:
                        const InputDecoration(
                          labelText:
                          'Domain',
                          prefixIcon:
                          Icon(
                            Icons
                                .category_outlined,
                          ),
                        ),
                        validator: (value) {
                          if (value ==
                              null ||
                              value
                                  .trim()
                                  .isEmpty) {
                            return 'Enter a domain';
                          }

                          return null;
                        },
                      ),
                    ],
                  ),
                ),
              ),

              actions: [
                // ==================================================
                // CANCEL
                // ==================================================

                TextButton(
                  onPressed: submitting
                      ? null
                      : () {
                    Navigator.pop(
                      dialogContext,
                    );
                  },
                  child:
                  const Text('Cancel'),
                ),

                // ==================================================
                // SUBMIT
                // ==================================================

                ElevatedButton(
                  onPressed: submitting
                      ? null
                      : () async {
                    if (!formKey
                        .currentState!
                        .validate()) {
                      return;
                    }

                    setState(() {
                      submitting = true;
                    });

                    try {
                      await ref
                          .read(
                        ideasProvider
                            .notifier,
                      )
                          .submitIdea(
                        title:
                        titleController
                            .text
                            .trim(),
                        description:
                        descriptionController
                            .text
                            .trim(),
                        domain:
                        domainController
                            .text
                            .trim(),
                      );

                      if (!context
                          .mounted) {
                        return;
                      }

                      Navigator.pop(
                        dialogContext,
                      );

                      ScaffoldMessenger
                          .of(
                        context,
                      ).showSnackBar(
                        const SnackBar(
                          backgroundColor:
                          Colors.green,
                          content: Text(
                            'Idea submitted successfully. It is now under review.',
                          ),
                        ),
                      );
                    } catch (error) {
                      if (!context
                          .mounted) {
                        return;
                      }

                      setState(() {
                        submitting =
                        false;
                      });

                      ScaffoldMessenger
                          .of(
                        context,
                      ).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Unable to submit idea: $error',
                          ),
                        ),
                      );
                    }
                  },
                  child: submitting
                      ? const SizedBox(
                    width: 18,
                    height: 18,
                    child:
                    CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.white,
                    ),
                  )
                      : const Text(
                    'Submit',
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}