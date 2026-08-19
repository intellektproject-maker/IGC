import 'package:flutter/material.dart';

import '../../../../core/design_system/app_colors.dart';
import '../../../../core/design_system/app_radius.dart';
import '../../../../core/design_system/app_spacing.dart';
import '../../../../core/design_system/app_typography.dart';

import '../models/build_event_model.dart';

class EventRegistrationScreen extends StatelessWidget {
  final BuildEventModel event;

  const EventRegistrationScreen({
    super.key,
    required this.event,
  });

  @override
  Widget build(BuildContext context) {
    final members = event.teamMembers;

    return Scaffold(
      backgroundColor: AppColors.primary,

      appBar: AppBar(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        elevation: 0,

        title: Text(
          'Event Registration',
          style: AppTypography.titleLarge.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(
            AppSpacing.screenPadding,
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // =================================================
              // EVENT HEADER
              // =================================================

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(
                    AppRadius.card,
                  ),
                ),

                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,

                  children: [
                    Row(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,

                      children: [
                        Expanded(
                          child: Text(
                            event.title,
                            style: AppTypography.headlineMedium
                                .copyWith(
                              color: AppColors.primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),

                        const SizedBox(width: 10),

                        Container(
                          padding:
                          const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 5,
                          ),

                          decoration: BoxDecoration(
                            color: AppColors.primary
                                .withValues(alpha: 0.10),

                            borderRadius:
                            BorderRadius.circular(
                              AppRadius.pill,
                            ),
                          ),

                          child: Text(
                            event.type,
                            style:
                            AppTypography.bodySmall
                                .copyWith(
                              color: AppColors.primary,
                              fontWeight:
                              FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 14),

                    Text(
                      event.description,
                      style:
                      AppTypography.bodyMedium.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: AppSpacing.md,
              ),

              // =================================================
              // EVENT DETAILS
              // =================================================

              _SectionCard(
                title: 'Event Details',
                icon: Icons.event_outlined,

                child: Column(
                  children: [
                    _DetailRow(
                      icon: Icons.calendar_month_outlined,
                      title: 'Date',
                      value:
                      '${event.eventDate.day}/${event.eventDate.month}/${event.eventDate.year}',
                    ),

                    const SizedBox(height: 16),

                    _DetailRow(
                      icon: Icons.location_on_outlined,
                      title: 'Venue',
                      value: event.venue,
                    ),

                    const SizedBox(height: 16),

                    _DetailRow(
                      icon: Icons.business_outlined,
                      title: 'Organizer',
                      value: event.organizer,
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: AppSpacing.md,
              ),

              // =================================================
              // TEAM DETAILS
              // =================================================

              _SectionCard(
                title: 'Team Details',
                icon: Icons.groups_outlined,

                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,

                  children: [
                    Text(
                      'Team Members',
                      style:
                      AppTypography.titleMedium.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 14),

                    if (members.isEmpty)
                      Text(
                        'No team members assigned.',
                        style:
                        AppTypography.bodyMedium.copyWith(
                          color:
                          AppColors.textSecondary,
                        ),
                      )
                    else
                      ...List.generate(
                        members.length,
                            (index) {
                          final member =
                          members[index];

                          return Padding(
                            padding:
                            const EdgeInsets.only(
                              bottom: 12,
                            ),

                            child: Row(
                              children: [
                                Container(
                                  width: 40,
                                  height: 40,

                                  decoration:
                                  BoxDecoration(
                                    color: AppColors.primary
                                        .withValues(
                                      alpha: 0.10,
                                    ),

                                    shape:
                                    BoxShape.circle,
                                  ),

                                  alignment:
                                  Alignment.center,

                                  child: Text(
                                    _initials(member),
                                    style:
                                    AppTypography
                                        .bodyMedium
                                        .copyWith(
                                      color:
                                      AppColors.primary,
                                      fontWeight:
                                      FontWeight.bold,
                                    ),
                                  ),
                                ),

                                const SizedBox(
                                  width: 12,
                                ),

                                Expanded(
                                  child: Text(
                                    member,
                                    style:
                                    AppTypography
                                        .bodyMedium
                                        .copyWith(
                                      fontWeight:
                                      FontWeight.w600,
                                    ),
                                  ),
                                ),

                                if (index == 0)
                                  Container(
                                    padding:
                                    const EdgeInsets
                                        .symmetric(
                                      horizontal: 9,
                                      vertical: 4,
                                    ),

                                    decoration:
                                    BoxDecoration(
                                      color:
                                      Colors.green
                                          .withValues(
                                        alpha: 0.10,
                                      ),

                                      borderRadius:
                                      BorderRadius
                                          .circular(
                                        AppRadius.pill,
                                      ),
                                    ),

                                    child: Text(
                                      'Leader',
                                      style:
                                      AppTypography
                                          .bodySmall
                                          .copyWith(
                                        color:
                                        Colors.green,
                                        fontWeight:
                                        FontWeight.bold,
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          );
                        },
                      ),

                    const SizedBox(height: 4),

                    Text(
                      '${members.length} team member${members.length == 1 ? '' : 's'}',
                      style:
                      AppTypography.bodySmall.copyWith(
                        color:
                        AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: AppSpacing.md,
              ),

              // =================================================
              // REGISTRATION INFORMATION
              // =================================================

              _SectionCard(
                title: 'Registration',
                icon: Icons.assignment_outlined,

                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,

                  children: [
                    Text(
                      'You are registering for:',
                      style:
                      AppTypography.bodyMedium.copyWith(
                        color:
                        AppColors.textSecondary,
                      ),
                    ),

                    const SizedBox(height: 6),

                    Text(
                      event.title,
                      style:
                      AppTypography.titleMedium.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                      ),
                    ),

                    const SizedBox(height: 16),

                    Container(
                      width: double.infinity,
                      padding:
                      const EdgeInsets.all(14),

                      decoration: BoxDecoration(
                        color: AppColors.primary
                            .withValues(alpha: 0.06),

                        borderRadius:
                        BorderRadius.circular(
                          AppRadius.card,
                        ),
                      ),

                      child: Row(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,

                        children: [
                          const Icon(
                            Icons.info_outline,
                            color:
                            AppColors.primary,
                          ),

                          const SizedBox(width: 10),

                          Expanded(
                            child: Text(
                              'Please verify the event and team details before confirming your registration.',
                              style:
                              AppTypography
                                  .bodySmall
                                  .copyWith(
                                color: AppColors
                                    .textSecondary,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: AppSpacing.xl,
              ),

              // =================================================
              // CONFIRM BUTTON
              // =================================================

              SizedBox(
                width: double.infinity,
                height: 52,

                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },

                  style:
                  ElevatedButton.styleFrom(
                    backgroundColor:
                    AppColors.primary,
                    foregroundColor:
                    Colors.white,

                    elevation: 0,

                    shape:
                    RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.circular(
                        AppRadius.button,
                      ),
                    ),
                  ),

                  child: const Text(
                    'Confirm Registration',
                  ),
                ),
              ),

              const SizedBox(height: 12),

              // =================================================
              // CANCEL
              // =================================================

              SizedBox(
                width: double.infinity,
                height: 48,

                child: OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },

                  style:
                  OutlinedButton.styleFrom(
                    foregroundColor:
                    AppColors.primary,

                    side: const BorderSide(
                      color: AppColors.primary,
                    ),

                    shape:
                    RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.circular(
                        AppRadius.button,
                      ),
                    ),
                  ),

                  child: const Text(
                    'Cancel',
                  ),
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  static String _initials(String name) {
    final parts = name
        .trim()
        .split(RegExp(r'\s+'));

    if (parts.isEmpty) {
      return '?';
    }

    if (parts.length == 1) {
      return parts.first
          .substring(
        0,
        1,
      )
          .toUpperCase();
    }

    return '${parts.first.substring(0, 1)}${parts.last.substring(0, 1)}'
        .toUpperCase();
  }
}

// ============================================================
// SECTION CARD
// ============================================================

class _SectionCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Widget child;

  const _SectionCard({
    required this.title,
    required this.icon,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,

      padding: const EdgeInsets.all(20),

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.circular(
          AppRadius.card,
        ),
      ),

      child: Column(
        crossAxisAlignment:
        CrossAxisAlignment.start,

        children: [
          Row(
            children: [
              Icon(
                icon,
                color: AppColors.primary,
                size: 22,
              ),

              const SizedBox(width: 8),

              Text(
                title,
                style:
                AppTypography.titleMedium.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          const SizedBox(height: 18),

          child,
        ],
      ),
    );
  }
}

// ============================================================
// DETAIL ROW
// ============================================================

class _DetailRow extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const _DetailRow({
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment:
      CrossAxisAlignment.start,

      children: [
        Icon(
          icon,
          size: 20,
          color: AppColors.primary,
        ),

        const SizedBox(width: 12),

        Expanded(
          child: Column(
            crossAxisAlignment:
            CrossAxisAlignment.start,

            children: [
              Text(
                title,
                style:
                AppTypography.bodySmall.copyWith(
                  color:
                  AppColors.textSecondary,
                ),
              ),

              const SizedBox(height: 3),

              Text(
                value,
                style:
                AppTypography.bodyMedium.copyWith(
                  fontWeight:
                  FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}