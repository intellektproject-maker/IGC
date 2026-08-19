import 'package:flutter/material.dart';

import '../../../../core/design_system/app_colors.dart';
import '../../../../core/design_system/app_radius.dart';
import '../../../../core/design_system/app_shadows.dart';
import '../../../../core/design_system/app_spacing.dart';
import '../../../../core/design_system/app_typography.dart';

import '../models/build_event_model.dart';

class BuildEventCard extends StatefulWidget {
  final BuildEventModel event;

  const BuildEventCard({
    super.key,
    required this.event,
  });

  @override
  State<BuildEventCard> createState() => _BuildEventCardState();
}

class _BuildEventCardState extends State<BuildEventCard> {
  late BuildEventModel _event;

  @override
  void initState() {
    super.initState();
    _event = widget.event;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: AppSpacing.md,
      ),
      padding: const EdgeInsets.all(
        AppSpacing.cardPadding,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          AppRadius.card,
        ),
        boxShadow: const [
          AppShadows.small,
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ==================================================
          // TITLE + TYPE
          // ==================================================

          Row(
            children: [
              Expanded(
                child: Text(
                  _event.title,
                  style: AppTypography.titleMedium.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(width: 8),

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(
                    alpha: 0.10,
                  ),
                  borderRadius: BorderRadius.circular(
                    AppRadius.pill,
                  ),
                ),
                child: Text(
                  _event.type,
                  style: AppTypography.bodySmall.copyWith(
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(
            height: AppSpacing.sm,
          ),

          // ==================================================
          // DESCRIPTION
          // ==================================================

          Text(
            _event.description,
            style: AppTypography.bodyMedium.copyWith(
              color: AppColors.textSecondary,
            ),
          ),

          const SizedBox(
            height: AppSpacing.md,
          ),

          // ==================================================
          // DATE + VENUE
          // ==================================================

          Row(
            children: [
              const Icon(
                Icons.calendar_month,
                size: 18,
                color: Colors.grey,
              ),

              const SizedBox(width: 6),

              Expanded(
                child: Text(
                  '${_event.eventDate.day}/'
                      '${_event.eventDate.month}/'
                      '${_event.eventDate.year}',
                  style: AppTypography.bodySmall,
                ),
              ),

              const Icon(
                Icons.location_on,
                size: 18,
                color: Colors.red,
              ),

              const SizedBox(width: 4),

              Flexible(
                child: Text(
                  _event.venue,
                  overflow: TextOverflow.ellipsis,
                  style: AppTypography.bodySmall,
                ),
              ),
            ],
          ),

          const SizedBox(
            height: AppSpacing.md,
          ),

          // ==================================================
          // REGISTERED DETAILS
          // ==================================================

          if (_event.registered) ...[
            _RegisteredTeamDetails(
              event: _event,
            ),

            const SizedBox(
              height: AppSpacing.md,
            ),
          ],

          // ==================================================
          // REGISTER BUTTON
          // ==================================================

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _event.registered
                  ? null
                  : () => _openRegistration(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: _event.registered
                    ? Colors.green
                    : AppColors.primary,
                foregroundColor: Colors.white,
                disabledBackgroundColor: Colors.green,
                disabledForegroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  vertical: 14,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    AppRadius.button,
                  ),
                ),
              ),
              child: Text(
                _event.registered
                    ? 'Registered'
                    : 'Register',
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ==========================================================
  // OPEN REGISTRATION
  // ==========================================================

  Future<void> _openRegistration(
      BuildContext context,
      ) async {
    final result =
    await showDialog<RegistrationResult>(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return EventRegistrationDialog(
          event: _event,
        );
      },
    );

    if (!mounted || result == null) {
      return;
    }

    setState(() {
      _event = _event.copyWith(
        registered: true,
        teamName: result.teamName,
        teamMembers: result.teamMembers,
      );
    });

    if (!context.mounted) {
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Successfully registered for the event.',
        ),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}

// ============================================================
// REGISTERED TEAM DETAILS
// ============================================================

class _RegisteredTeamDetails extends StatelessWidget {
  final BuildEventModel event;

  const _RegisteredTeamDetails({
    required this.event,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.green.withValues(
          alpha: 0.08,
        ),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.green.withValues(
            alpha: 0.25,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.check_circle,
                size: 20,
                color: Colors.green,
              ),

              const SizedBox(width: 8),

              Text(
                'Registration Details',
                style: AppTypography.bodyMedium.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.green.shade800,
                ),
              ),
            ],
          ),

          if (event.teamName.isNotEmpty) ...[
            const SizedBox(height: 10),

            Text(
              'Team: ${event.teamName}',
              style: AppTypography.bodySmall.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ],

          if (event.teamMembers.isNotEmpty) ...[
            const SizedBox(height: 10),

            Text(
              'Team Members (${event.teamMembers.length}/6)',
              style: AppTypography.bodySmall.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 4),

            ...event.teamMembers.map(
                  (member) {
                return Padding(
                  padding: const EdgeInsets.only(
                    top: 4,
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.person_outline,
                        size: 16,
                        color: Colors.grey,
                      ),

                      const SizedBox(width: 6),

                      Expanded(
                        child: Text(
                          member,
                          style:
                          AppTypography.bodySmall,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ],
      ),
    );
  }
}

// ============================================================
// REGISTRATION RESULT
// ============================================================

class RegistrationResult {
  final String teamName;
  final List<String> teamMembers;

  const RegistrationResult({
    required this.teamName,
    required this.teamMembers,
  });
}

// ============================================================
// REGISTRATION DIALOG
// ============================================================

class EventRegistrationDialog extends StatefulWidget {
  final BuildEventModel event;

  const EventRegistrationDialog({
    super.key,
    required this.event,
  });

  @override
  State<EventRegistrationDialog> createState() =>
      _EventRegistrationDialogState();
}

class _EventRegistrationDialogState
    extends State<EventRegistrationDialog> {
  final TextEditingController _teamNameController =
  TextEditingController();

  final List<TextEditingController> _memberControllers =
  <TextEditingController>[
    TextEditingController(),
  ];

  static const int maxMembers = 6;

  @override
  void dispose() {
    _teamNameController.dispose();

    for (final controller in _memberControllers) {
      controller.dispose();
    }

    super.dispose();
  }

  // ==========================================================
  // ADD MEMBER
  // ==========================================================

  void _addMember() {
    if (_memberControllers.length >= maxMembers) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Maximum 6 team members are allowed.',
          ),
          behavior: SnackBarBehavior.floating,
        ),
      );

      return;
    }

    setState(() {
      _memberControllers.add(
        TextEditingController(),
      );
    });
  }

  // ==========================================================
  // REMOVE MEMBER
  // ==========================================================

  void _removeMember(int index) {
    if (_memberControllers.length <= 1) {
      return;
    }

    final controller = _memberControllers[index];

    setState(() {
      _memberControllers.removeAt(index);
    });

    controller.dispose();
  }

  // ==========================================================
  // REGISTER
  // ==========================================================

  void _register() {
    final teamName =
    _teamNameController.text.trim();

    final members = _memberControllers
        .map(
          (controller) => controller.text.trim(),
    )
        .where(
          (name) => name.isNotEmpty,
    )
        .toList();

    if (teamName.isEmpty) {
      _showError(
        'Please enter a team name.',
      );
      return;
    }

    if (members.isEmpty) {
      _showError(
        'Please add at least one team member.',
      );
      return;
    }

    if (members.length > maxMembers) {
      _showError(
        'Maximum 6 team members are allowed.',
      );
      return;
    }

    Navigator.of(context).pop(
      RegistrationResult(
        teamName: teamName,
        teamMembers: members,
      ),
    );
  }

  // ==========================================================
  // ERROR MESSAGE
  // ==========================================================

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Event Registration',
        style: AppTypography.titleLarge.copyWith(
          fontWeight: FontWeight.bold,
          color: AppColors.primary,
        ),
      ),

      content: SizedBox(
        width: MediaQuery.sizeOf(context).width * 0.82,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment:
            CrossAxisAlignment.start,
            children: [
              // ==============================================
              // EVENT NAME
              // ==============================================

              Text(
                widget.event.title,
                style: AppTypography.bodyMedium.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(
                height: 18,
              ),

              // ==============================================
              // TEAM NAME
              // ==============================================

              TextField(
                controller: _teamNameController,
                textCapitalization:
                TextCapitalization.words,
                decoration: InputDecoration(
                  labelText: 'Team Name',
                  hintText: 'Enter team name',
                  prefixIcon: const Icon(
                    Icons.groups,
                  ),
                  border: OutlineInputBorder(
                    borderRadius:
                    BorderRadius.circular(12),
                  ),
                ),
              ),

              const SizedBox(
                height: 22,
              ),

              // ==============================================
              // TEAM MEMBERS HEADER
              // ==============================================

              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Team Members',
                      style: AppTypography.titleMedium
                          .copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  Container(
                    padding:
                    const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color:
                      AppColors.primary.withValues(
                        alpha: 0.08,
                      ),
                      borderRadius:
                      BorderRadius.circular(20),
                    ),
                    child: Text(
                      '${_memberControllers.length}/$maxMembers',
                      style: AppTypography.bodySmall
                          .copyWith(
                        color:
                        AppColors.primary,
                        fontWeight:
                        FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(
                height: 10,
              ),

              // ==============================================
              // MEMBER FIELDS
              // ==============================================

              ...List.generate(
                _memberControllers.length,
                    (index) {
                  return Padding(
                    padding:
                    const EdgeInsets.only(
                      bottom: 10,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller:
                            _memberControllers[
                            index],
                            textCapitalization:
                            TextCapitalization.words,
                            decoration:
                            InputDecoration(
                              labelText:
                              'Member ${index + 1}',
                              hintText:
                              'Enter member name',
                              prefixIcon:
                              const Icon(
                                Icons
                                    .person_outline,
                              ),
                              border:
                              OutlineInputBorder(
                                borderRadius:
                                BorderRadius
                                    .circular(
                                  12,
                                ),
                              ),
                            ),
                          ),
                        ),

                        if (_memberControllers
                            .length >
                            1)
                          IconButton(
                            tooltip:
                            'Remove member',
                            onPressed: () =>
                                _removeMember(
                                  index,
                                ),
                            icon:
                            const Icon(
                              Icons
                                  .remove_circle_outline,
                              color: Colors.red,
                            ),
                          ),
                      ],
                    ),
                  );
                },
              ),

              // ==============================================
              // ADD MEMBER BUTTON
              // ==============================================

              SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  onPressed:
                  _memberControllers.length <
                      maxMembers
                      ? _addMember
                      : null,
                  icon: const Icon(
                    Icons.person_add_alt_1,
                  ),
                  label: Text(
                    _memberControllers.length <
                        maxMembers
                        ? 'Add Team Member'
                        : 'Maximum 6 Members',
                  ),
                ),
              ),

              const SizedBox(
                height: 8,
              ),

              Text(
                'You can add up to 6 team members.',
                style:
                AppTypography.bodySmall.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ),
      ),

      // ========================================================
      // ACTIONS
      // ========================================================

      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text(
            'Cancel',
          ),
        ),

        ElevatedButton(
          onPressed: _register,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            foregroundColor: Colors.white,
          ),
          child: const Text(
            'Register',
          ),
        ),
      ],
    );
  }
}