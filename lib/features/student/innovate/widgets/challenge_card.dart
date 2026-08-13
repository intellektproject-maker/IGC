import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/design_system/app_colors.dart';

import '../models/challenge_model.dart';
import '../providers/innovate_provider.dart';

class ChallengeCard extends ConsumerWidget {
  final ChallengeModel challenge;

  /// Student name already registered in IGC.
  final String studentName;

  const ChallengeCard({
    super.key,
    required this.challenge,
    required this.studentName,
  });

  @override
  Widget build(
      BuildContext context,
      WidgetRef ref,
      ) {
    return GestureDetector(
      onTap: () {
        _showChallengeDetails(
          context,
          ref,
        );
      },
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(
          bottom: 14,
        ),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(
                alpha: 0.08,
              ),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment:
          CrossAxisAlignment.start,
          children: [
            // ==========================================================
            // TITLE + CATEGORY
            // ==========================================================

            Row(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    challenge.title,
                    style: const TextStyle(
                      color: Colors.black87,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                const SizedBox(width: 8),

                _categoryBadge(
                  challenge.category,
                ),
              ],
            ),

            const SizedBox(height: 10),

            // ==========================================================
            // DESCRIPTION
            // ==========================================================

            Text(
              challenge.description,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 13,
                height: 1.4,
              ),
            ),

            const SizedBox(height: 14),

            // ==========================================================
            // XP / DIFFICULTY / PARTICIPANTS
            // ==========================================================

            Row(
              children: [
                const Icon(
                  Icons.emoji_events_outlined,
                  color: Colors.amber,
                  size: 19,
                ),

                const SizedBox(width: 6),

                Text(
                  '${challenge.xp} XP',
                  style: const TextStyle(
                    color: Colors.black87,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(width: 18),

                Icon(
                  Icons.speed_outlined,
                  color: Colors.grey.shade600,
                  size: 18,
                ),

                const SizedBox(width: 5),

                Expanded(
                  child: Text(
                    challenge.difficulty,
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 12,
                    ),
                  ),
                ),

                Icon(
                  Icons.groups_outlined,
                  color: Colors.grey.shade500,
                  size: 18,
                ),

                const SizedBox(width: 5),

                Text(
                  '${challenge.participants}',
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 12,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 14),

            // ==========================================================
            // DATES
            // ==========================================================

            Row(
              children: [
                Icon(
                  Icons.calendar_month_outlined,
                  size: 17,
                  color: Colors.grey.shade600,
                ),

                const SizedBox(width: 6),

                Expanded(
                  child: Text(
                    '${_formatDate(challenge.startDate)}'
                        ' - '
                        '${_formatDate(challenge.endDate)}',
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // ==========================================================
            // ACTION BUTTON
            // ==========================================================

            SizedBox(
              width: double.infinity,
              height: 46,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                  challenge.joined
                      ? Colors.green
                      : AppColors.primary,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.circular(24),
                  ),
                ),
                onPressed: () {
                  _showChallengeDetails(
                    context,
                    ref,
                  );
                },
                child: Row(
                  mainAxisAlignment:
                  MainAxisAlignment.center,
                  children: [
                    Icon(
                      challenge.joined
                          ? Icons.check_circle_outline
                          : Icons.rocket_launch_outlined,
                      size: 18,
                    ),

                    const SizedBox(width: 8),

                    Text(
                      challenge.joined
                          ? 'Joined'
                          : 'Participate',
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ==================================================================
  // CATEGORY BADGE
  // ==================================================================

  Widget _categoryBadge(
      String category,
      ) {
    return Container(
      padding:
      const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      decoration: BoxDecoration(
        color: AppColors.primary.withValues(
          alpha: 0.08,
        ),
        borderRadius:
        BorderRadius.circular(20),
      ),
      child: Text(
        category,
        style: const TextStyle(
          color: AppColors.primary,
          fontSize: 10,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  // ==================================================================
  // CHALLENGE DETAILS
  // ==================================================================

  void _showChallengeDetails(
      BuildContext context,
      WidgetRef ref,
      ) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) {
        return _ChallengeDetailsSheet(
          challenge: challenge,
          studentName: studentName,
          ref: ref,
        );
      },
    );
  }

  // ==================================================================
  // DATE
  // ==================================================================

  String _formatDate(
      DateTime date,
      ) {
    return '${date.day.toString().padLeft(2, '0')}/'
        '${date.month.toString().padLeft(2, '0')}/'
        '${date.year}';
  }
}

// ======================================================================
// CHALLENGE DETAILS SHEET
// ======================================================================

class _ChallengeDetailsSheet
    extends StatelessWidget {
  final ChallengeModel challenge;
  final String studentName;
  final WidgetRef ref;

  const _ChallengeDetailsSheet({
    required this.challenge,
    required this.studentName,
    required this.ref,
  });

  @override
  Widget build(
      BuildContext context,
      ) {
    return Container(
      height:
      MediaQuery.of(context).size.height * 0.82,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(28),
        ),
      ),
      child: Column(
        children: [
          // ==========================================================
          // HANDLE
          // ==========================================================

          const SizedBox(height: 10),

          Container(
            width: 45,
            height: 5,
            decoration: BoxDecoration(
              color: Color(0xFFD6D6D6),
              borderRadius:
              BorderRadius.circular(10),
            ),
          ),

          // ==========================================================
          // HEADER
          // ==========================================================

          Padding(
            padding: const EdgeInsets.fromLTRB(
              20,
              18,
              12,
              10,
            ),
            child: Row(
              children: [
                const Expanded(
                  child: Text(
                    'Challenge Details',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.close,
                  ),
                ),
              ],
            ),
          ),

          const Divider(
            height: 1,
          ),

          // ==========================================================
          // CONTENT
          // ==========================================================

          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  // ==================================================
                  // TITLE
                  // ==================================================

                  Text(
                    challenge.title,
                    style: const TextStyle(
                      color: Colors.black87,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  // ==================================================
                  // BADGES
                  // ==================================================

                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      _detailBadge(
                        challenge.category,
                      ),

                      if (challenge.joined)
                        _joinedBadge(),
                    ],
                  ),

                  const SizedBox(height: 22),

                  // ==================================================
                  // ABOUT
                  // ==================================================

                  const Text(
                    'About the Challenge',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    challenge.description,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                      height: 1.5,
                    ),
                  ),

                  const SizedBox(height: 24),

                  // ==================================================
                  // INFORMATION
                  // ==================================================

                  const Text(
                    'Challenge Information',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 14),

                  _infoRow(
                    Icons.emoji_events_outlined,
                    'Reward',
                    '${challenge.xp} XP',
                    Colors.amber,
                  ),

                  _infoRow(
                    Icons.speed_outlined,
                    'Difficulty',
                    challenge.difficulty,
                    Colors.blue,
                  ),

                  _infoRow(
                    Icons.groups_outlined,
                    'Participants',
                    '${challenge.participants}',
                    Colors.grey,
                  ),

                  _infoRow(
                    Icons.calendar_today_outlined,
                    'Start Date',
                    _formatDate(
                      challenge.startDate,
                    ),
                    Colors.green,
                  ),

                  _infoRow(
                    Icons.event_outlined,
                    'End Date',
                    _formatDate(
                      challenge.endDate,
                    ),
                    Colors.red,
                  ),

                  _infoRow(
                    Icons.info_outline,
                    'Status',
                    _formatStatus(
                      challenge.status,
                    ),
                    AppColors.primary,
                  ),

                  const SizedBox(height: 24),

                  // ==================================================
                  // JOIN STATUS
                  // ==================================================

                  Container(
                    width: double.infinity,
                    padding:
                    const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: challenge.joined
                          ? Colors.green.withValues(
                        alpha: 0.08,
                      )
                          : AppColors.primary
                          .withValues(
                        alpha: 0.06,
                      ),
                      borderRadius:
                      BorderRadius.circular(16),
                      border: Border.all(
                        color: challenge.joined
                            ? Colors.green
                            : AppColors.primary,
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          challenge.joined
                              ? Icons.check_circle
                              : Icons.info_outline,
                          color: challenge.joined
                              ? Colors.green
                              : AppColors.primary,
                        ),

                        const SizedBox(width: 12),

                        Expanded(
                          child: Text(
                            challenge.joined
                                ? 'You have joined this challenge.'
                                : 'You have not joined this challenge yet.',
                            style: TextStyle(
                              color: challenge.joined
                                  ? Colors.green
                                  : AppColors.primary,
                              fontSize: 13,
                              fontWeight:
                              FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  // ==================================================
                  // ACTION
                  // ==================================================

                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style:
                      ElevatedButton.styleFrom(
                        backgroundColor:
                        challenge.joined
                            ? Colors.green
                            : AppColors.primary,
                        foregroundColor:
                        Colors.white,
                        elevation: 0,
                        shape:
                        RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.circular(
                            14,
                          ),
                        ),
                      ),
                      onPressed: challenge.joined
                          ? null
                          : () {
                        Navigator.pop(
                          context,
                        );

                        _openParticipation(
                          context,
                        );
                      },
                      child: Row(
                        mainAxisAlignment:
                        MainAxisAlignment.center,
                        children: [
                          Icon(
                            challenge.joined
                                ? Icons.check_circle
                                : Icons
                                .rocket_launch_outlined,
                            size: 18,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            challenge.joined
                                ? 'Joined'
                                : 'Participate',
                            style:
                            const TextStyle(
                              fontSize: 14,
                              fontWeight:
                              FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ==================================================================
  // BADGE
  // ==================================================================

  Widget _detailBadge(
      String text,
      ) {
    return Container(
      padding:
      const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 6,
      ),
      decoration: BoxDecoration(
        color: AppColors.primary.withValues(
          alpha: 0.08,
        ),
        borderRadius:
        BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: AppColors.primary,
          fontSize: 11,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  // ==================================================================
  // JOINED BADGE
  // ==================================================================

  Widget _joinedBadge() {
    return Container(
      padding:
      const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 6,
      ),
      decoration: BoxDecoration(
        color: Colors.green.withValues(
          alpha: 0.1,
        ),
        borderRadius:
        BorderRadius.circular(20),
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.check_circle,
            size: 14,
            color: Colors.green,
          ),
          SizedBox(width: 5),
          Text(
            'Joined',
            style: TextStyle(
              color: Colors.green,
              fontSize: 11,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  // ==================================================================
  // INFORMATION ROW
  // ==================================================================

  Widget _infoRow(
      IconData icon,
      String title,
      String value,
      Color iconColor,
      ) {
    return Padding(
      padding:
      const EdgeInsets.only(
        bottom: 14,
      ),
      child: Row(
        children: [
          Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              color: iconColor.withValues(
                alpha: 0.1,
              ),
              borderRadius:
              BorderRadius.circular(10),
            ),
            child: Icon(
              icon,
              color: iconColor,
              size: 20,
            ),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 13,
              ),
            ),
          ),

          Text(
            value,
            style: const TextStyle(
              color: Colors.black87,
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  // ==================================================================
  // STATUS
  // ==================================================================

  String _formatStatus(
      String status,
      ) {
    if (status.isEmpty) {
      return 'Unknown';
    }

    return status
        .replaceAll('_', ' ')
        .split(' ')
        .map(
          (word) {
        if (word.isEmpty) {
          return word;
        }

        return '${word[0].toUpperCase()}'
            '${word.substring(1)}';
      },
    )
        .join(' ');
  }

  // ==================================================================
  // DATE
  // ==================================================================

  String _formatDate(
      DateTime date,
      ) {
    return '${date.day.toString().padLeft(2, '0')}/'
        '${date.month.toString().padLeft(2, '0')}/'
        '${date.year}';
  }

  // ==================================================================
  // OPEN PARTICIPATION
  // ==================================================================

  void _openParticipation(
      BuildContext context,
      ) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return _ParticipationDialog(
          challenge: challenge,
          studentName: studentName,
          ref: ref,
        );
      },
    );
  }
}

// ======================================================================
// PARTICIPATION DIALOG
// ======================================================================

class _ParticipationDialog
    extends StatefulWidget {
  final ChallengeModel challenge;

  final String studentName;

  final WidgetRef ref;

  const _ParticipationDialog({
    required this.challenge,
    required this.studentName,
    required this.ref,
  });

  @override
  State<_ParticipationDialog> createState() =>
      _ParticipationDialogState();
}

// ======================================================================
// PARTICIPATION STATE
// ======================================================================

class _ParticipationDialogState
    extends State<_ParticipationDialog> {
  final GlobalKey<FormState> _formKey =
  GlobalKey<FormState>();

  late final TextEditingController
  _fullNameController;

  final TextEditingController
  _studentIdController =
  TextEditingController();

  final TextEditingController
  _institutionController =
  TextEditingController();

  final TextEditingController
  _courseController =
  TextEditingController();

  final TextEditingController
  _emailController =
  TextEditingController();

  final TextEditingController
  _phoneController =
  TextEditingController();

  String? _selectedYear;

  bool _isSubmitting = false;

  static const List<String> _years = [
    '1st Year',
    '2nd Year',
    '3rd Year',
    '4th Year',
    '5th Year',
  ];

  // ==================================================================
  // INIT
  // ==================================================================

  @override
  void initState() {
    super.initState();

    _fullNameController =
        TextEditingController(
          text: widget.studentName,
        );
  }

  // ==================================================================
  // DISPOSE
  // ==================================================================

  @override
  void dispose() {
    _fullNameController.dispose();
    _studentIdController.dispose();
    _institutionController.dispose();
    _courseController.dispose();
    _emailController.dispose();
    _phoneController.dispose();

    super.dispose();
  }

  // ==================================================================
  // BUILD
  // ==================================================================

  @override
  Widget build(
      BuildContext context,
      ) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding:
      const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 18,
      ),
      child: Container(
        width: double.infinity,
        constraints:
        const BoxConstraints(
          maxWidth: 500,
          maxHeight: 760,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius:
          BorderRadius.circular(24),
        ),
        child: Column(
          children: [
            // ========================================================
            // HEADER
            // ========================================================

            Padding(
              padding:
              const EdgeInsets.fromLTRB(
                20,
                18,
                12,
                8,
              ),
              child: Row(
                children: [
                  const Expanded(
                    child: Text(
                      'Join Challenge',
                      style: TextStyle(
                        color:
                        AppColors.primary,
                        fontSize: 19,
                        fontWeight:
                        FontWeight.bold,
                      ),
                    ),
                  ),

                  IconButton(
                    onPressed: _isSubmitting
                        ? null
                        : () {
                      Navigator.of(
                        context,
                      ).pop();
                    },
                    icon: const Icon(
                      Icons.close,
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding:
              const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Align(
                alignment:
                Alignment.centerLeft,
                child: Text(
                  widget.challenge.title,
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 12,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 8),

            // ========================================================
            // FORM
            // ========================================================

            Expanded(
              child: SingleChildScrollView(
                padding:
                const EdgeInsets.fromLTRB(
                  20,
                  4,
                  20,
                  20,
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      // ==================================================
                      // FULL NAME
                      // ==================================================

                      _buildTextField(
                        controller:
                        _fullNameController,
                        label: 'Full Name',
                        icon:
                        Icons.person_outline,
                        keyboardType:
                        TextInputType.name,
                        textCapitalization:
                        TextCapitalization.words,
                        inputFormatters: [
                          FilteringTextInputFormatter
                              .allow(
                            RegExp(
                              r'[a-zA-Z ]',
                            ),
                          ),
                        ],
                        validator: (value) {
                          final enteredName =
                              value?.trim() ??
                                  '';

                          final registeredName =
                          widget.studentName
                              .trim();

                          if (enteredName
                              .isEmpty) {
                            return 'Full name is required';
                          }

                          if (!RegExp(
                            r'^[a-zA-Z ]+$',
                          ).hasMatch(
                            enteredName,
                          )) {
                            return 'Name must contain letters only';
                          }

                          if (enteredName
                              .toLowerCase() !=
                              registeredName
                                  .toLowerCase()) {
                            return 'Name must match your IGC registered name';
                          }

                          return null;
                        },
                      ),

                      const SizedBox(
                        height: 12,
                      ),

                      // ==================================================
                      // STUDENT ID
                      // ==================================================

                      _buildTextField(
                        controller:
                        _studentIdController,
                        label: 'Student ID',
                        icon:
                        Icons.badge_outlined,
                        keyboardType:
                        TextInputType.text,
                        textCapitalization:
                        TextCapitalization.characters,
                        inputFormatters: [
                          FilteringTextInputFormatter
                              .allow(
                            RegExp(
                              r'[a-zA-Z0-9]',
                            ),
                          ),
                        ],
                        validator: (value) {
                          final studentId =
                              value?.trim() ??
                                  '';

                          if (studentId.isEmpty) {
                            return 'Student ID is required';
                          }

                          if (!RegExp(
                            r'^[a-zA-Z0-9]+$',
                          ).hasMatch(
                            studentId,
                          )) {
                            return 'Use letters and numbers only';
                          }

                          return null;
                        },
                      ),

                      const SizedBox(
                        height: 12,
                      ),

                      // ==================================================
                      // COLLEGE / INSTITUTION
                      // ==================================================

                      _buildTextField(
                        controller:
                        _institutionController,
                        label:
                        'College / Institution',
                        icon:
                        Icons.school_outlined,
                        keyboardType:
                        TextInputType.name,
                        textCapitalization:
                        TextCapitalization.words,
                        inputFormatters: [
                          FilteringTextInputFormatter
                              .allow(
                            RegExp(
                              r'[a-zA-Z ]',
                            ),
                          ),
                        ],
                        validator: (value) {
                          final institution =
                              value?.trim() ??
                                  '';

                          if (institution
                              .isEmpty) {
                            return 'College / Institution is required';
                          }

                          if (!RegExp(
                            r'^[a-zA-Z ]+$',
                          ).hasMatch(
                            institution,
                          )) {
                            return 'Use letters and spaces only';
                          }

                          return null;
                        },
                      ),

                      const SizedBox(
                        height: 12,
                      ),

                      // ==================================================
                      // COURSE / DEPARTMENT
                      // ==================================================

                      _buildTextField(
                        controller:
                        _courseController,
                        label:
                        'Course / Department',
                        icon:
                        Icons.menu_book_outlined,
                        keyboardType:
                        TextInputType.name,
                        textCapitalization:
                        TextCapitalization.words,
                        inputFormatters: [
                          FilteringTextInputFormatter
                              .allow(
                            RegExp(
                              r'[a-zA-Z ]',
                            ),
                          ),
                        ],
                        validator: (value) {
                          final course =
                              value?.trim() ??
                                  '';

                          if (course.isEmpty) {
                            return 'Course / Department is required';
                          }

                          if (!RegExp(
                            r'^[a-zA-Z ]+$',
                          ).hasMatch(course)) {
                            return 'Use letters and spaces only';
                          }

                          return null;
                        },
                      ),

                      const SizedBox(
                        height: 12,
                      ),

                      // ==================================================
                      // YEAR
                      // ==================================================

                      DropdownButtonFormField<String>(
                        initialValue:
                        _selectedYear,
                        decoration:
                        _inputDecoration(
                          'Year of Study',
                          Icons
                              .calendar_today_outlined,
                        ),
                        items: _years
                            .map(
                              (year) =>
                              DropdownMenuItem<
                                  String>(
                                value: year,
                                child:
                                Text(year),
                              ),
                        )
                            .toList(),
                        onChanged: _isSubmitting
                            ? null
                            : (value) {
                          setState(() {
                            _selectedYear =
                                value;
                          });
                        },
                        validator: (value) {
                          if (value == null) {
                            return 'Select year of study';
                          }

                          return null;
                        },
                      ),

                      const SizedBox(
                        height: 12,
                      ),

                      // ==================================================
                      // EMAIL
                      // ==================================================

                      _buildTextField(
                        controller:
                        _emailController,
                        label: 'Email',
                        icon:
                        Icons.email_outlined,
                        keyboardType:
                        TextInputType
                            .emailAddress,
                        validator: (value) {
                          final email =
                              value?.trim() ??
                                  '';

                          if (email.isEmpty) {
                            return 'Email is required';
                          }

                          final emailRegex =
                          RegExp(
                            r'^[^@\s]+@[^@\s]+\.[^@\s]+$',
                          );

                          if (!emailRegex
                              .hasMatch(
                            email,
                          )) {
                            return 'Enter a valid email address';
                          }

                          return null;
                        },
                      ),

                      const SizedBox(
                        height: 12,
                      ),

                      // ==================================================
                      // PHONE
                      // ==================================================

                      _buildTextField(
                        controller:
                        _phoneController,
                        label:
                        'Phone Number',
                        icon:
                        Icons.phone_outlined,
                        keyboardType:
                        TextInputType.phone,
                        inputFormatters: [
                          FilteringTextInputFormatter
                              .digitsOnly,
                          LengthLimitingTextInputFormatter(
                            10,
                          ),
                        ],
                        validator: (value) {
                          final phone =
                              value?.trim() ??
                                  '';

                          if (phone.isEmpty) {
                            return 'Phone number is required';
                          }

                          if (!RegExp(
                            r'^[6-9][0-9]{9}$',
                          ).hasMatch(phone)) {
                            return 'Enter a valid 10-digit phone number';
                          }

                          return null;
                        },
                      ),

                      const SizedBox(
                        height: 12,
                      ),

                      // ==================================================
                      // PARTICIPATION TYPE
                      // ==================================================

                      DropdownButtonFormField<String>(
                        initialValue:
                        'Individual',
                        decoration:
                        _inputDecoration(
                          'Participation Type',
                          Icons.person_outline,
                        ),
                        items: const [
                          DropdownMenuItem(
                            value: 'Individual',
                            child:
                            Text('Individual'),
                          ),
                        ],
                        onChanged: null,
                      ),

                      const SizedBox(
                        height: 20,
                      ),

                      // ==================================================
                      // SUBMIT
                      // ==================================================

                      SizedBox(
                        width: double.infinity,
                        height: 48,
                        child:
                        ElevatedButton(
                          style:
                          ElevatedButton
                              .styleFrom(
                            backgroundColor:
                            AppColors.primary,
                            foregroundColor:
                            Colors.white,
                            elevation: 0,
                            shape:
                            RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.circular(
                                12,
                              ),
                            ),
                          ),
                          onPressed:
                          _isSubmitting
                              ? null
                              : _submit,
                          child:
                          _isSubmitting
                              ? const SizedBox(
                            width: 22,
                            height: 22,
                            child:
                            CircularProgressIndicator(
                              strokeWidth:
                              2,
                              color: Colors.white,
                            ),
                          )
                              : const Text(
                            'Confirm Participation',
                            style:
                            TextStyle(
                              fontSize: 13,
                              fontWeight:
                              FontWeight.w600,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 10),

                      const Text(
                        'Your participation details will be registered with IGC.',
                        textAlign:
                        TextAlign.center,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ==================================================================
  // SUBMIT
  // ==================================================================

  Future<void> _submit() async {
    final formState =
        _formKey.currentState;

    if (formState == null) {
      return;
    }

    if (!formState.validate()) {
      return;
    }

    if (_selectedYear == null) {
      return;
    }

    setState(() {
      _isSubmitting = true;
    });

    try {
      final success =
      await widget.ref
          .read(
        innovateRepositoryProvider,
      )
          .participateInChallenge(
        challengeId:
        widget.challenge.id,
        fullName:
        _fullNameController.text
            .trim(),
        studentId:
        _studentIdController.text
            .trim(),
        institution:
        _institutionController
            .text
            .trim(),
        course:
        _courseController.text
            .trim(),
        year: _selectedYear!,
        email:
        _emailController.text
            .trim(),
        phone:
        _phoneController.text
            .trim(),
      );

      if (!mounted) {
        return;
      }

      if (!success) {
        setState(() {
          _isSubmitting = false;
        });

        ScaffoldMessenger.of(context)
            .showSnackBar(
          const SnackBar(
            content: Text(
              'You have already joined this challenge.',
            ),
          ),
        );

        return;
      }

      // Close participation dialog.
      Navigator.of(context).pop();

      // Refresh challenge list.
      widget.ref.invalidate(
        challengesProvider,
      );

      widget.ref.invalidate(
        featuredChallengeProvider,
      );

      if (!mounted) {
        return;
      }

      ScaffoldMessenger.of(context)
          .showSnackBar(
        const SnackBar(
          backgroundColor: Colors.green,
          content: Text(
            'You have successfully joined the challenge.',
          ),
        ),
      );
    } catch (error) {
      if (!mounted) {
        return;
      }

      setState(() {
        _isSubmitting = false;
      });

      ScaffoldMessenger.of(context)
          .showSnackBar(
        SnackBar(
          content: Text(
            'Unable to join challenge: $error',
          ),
        ),
      );
    }
  }

  // ==================================================================
  // TEXT FIELD
  // ==================================================================

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    TextInputType? keyboardType,
    TextCapitalization textCapitalization =
        TextCapitalization.none,
    List<TextInputFormatter>? inputFormatters,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      textCapitalization: textCapitalization,
      inputFormatters: inputFormatters,
      validator: validator,
      enabled: !_isSubmitting,
      decoration: _inputDecoration(
        label,
        icon,
      ),
    );
  }

  // ==================================================================
  // INPUT DECORATION
  // ==================================================================

  InputDecoration _inputDecoration(
      String label,
      IconData icon,
      ) {
    return InputDecoration(
      labelText: label,
      prefixIcon: Icon(
        icon,
        color: AppColors.primary,
        size: 20,
      ),
      contentPadding:
      const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 14,
      ),
      border: OutlineInputBorder(
        borderRadius:
        BorderRadius.circular(12),
        borderSide: const BorderSide(
          color: Color(0xFFDADADA),
        ),
      ),
      enabledBorder:
      OutlineInputBorder(
        borderRadius:
        BorderRadius.circular(12),
        borderSide: const BorderSide(
          color: Color(0xFFDADADA),
        ),
      ),
      focusedBorder:
      OutlineInputBorder(
        borderRadius:
        BorderRadius.circular(12),
        borderSide: const BorderSide(
          color: AppColors.primary,
          width: 1.5,
        ),
      ),
      errorBorder:
      OutlineInputBorder(
        borderRadius:
        BorderRadius.circular(12),
        borderSide: const BorderSide(
          color: Colors.red,
        ),
      ),
      focusedErrorBorder:
      OutlineInputBorder(
        borderRadius:
        BorderRadius.circular(12),
        borderSide: const BorderSide(
          color: Colors.red,
          width: 1.5,
        ),
      ),
    );
  }
}