import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/design_system/app_colors.dart';

import '../models/challenge_model.dart';
import '../providers/innovate_provider.dart';

class FeaturedChallengeCard
    extends ConsumerWidget {
  final ChallengeModel challenge;

  final String studentName;

  const FeaturedChallengeCard({
    super.key,
    required this.challenge,
    required this.studentName,
  });

  @override
  Widget build(
      BuildContext context,
      WidgetRef ref,
      ) {
    return Container(
      width: double.infinity,
      padding:
      const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
        BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment:
        CrossAxisAlignment.start,
        children: [
          // ==================================================
          // FEATURED
          // ==================================================

          Row(
            children: [
              const Icon(
                Icons.rocket_launch_outlined,
                color:
                AppColors.primary,
              ),

              const SizedBox(width: 8),

              const Text(
                'Featured Challenge',
                style: TextStyle(
                  color:
                  AppColors.primary,
                  fontSize: 16,
                  fontWeight:
                  FontWeight.bold,
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          // ==================================================
          // TITLE
          // ==================================================

          Text(
            challenge.title,
            style: const TextStyle(
              color:
              AppColors.primary,
              fontSize: 28,
              fontWeight:
              FontWeight.bold,
              height: 1.2,
            ),
          ),

          const SizedBox(height: 12),

          // ==================================================
          // DESCRIPTION
          // ==================================================

          Text(
            challenge.description,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 13,
              height: 1.5,
            ),
          ),

          const SizedBox(height: 18),

          // ==================================================
          // INFO
          // ==================================================

          Row(
            children: [
              const Icon(
                Icons.emoji_events_outlined,
                color: Colors.amber,
                size: 20,
              ),

              const SizedBox(width: 6),

              Text(
                '${challenge.xp} XP',
                style:
                const TextStyle(
                  fontWeight:
                  FontWeight.w600,
                ),
              ),

              const Spacer(),

              const Icon(
                Icons.groups_outlined,
                color: Colors.grey,
                size: 19,
              ),

              const SizedBox(width: 5),

              Text(
                '${challenge.participants}',
                style:
                const TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          // ==================================================
          // PARTICIPATE / JOINED
          // ==================================================

          SizedBox(
            width: double.infinity,
            height: 46,
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
              onPressed: () {
                if (challenge.joined) {
                  _showChallengeDetails(
                    context,
                  );
                } else {
                  _showJoinDialog(
                    context,
                    ref,
                  );
                }
              },
              child: Row(
                mainAxisAlignment:
                MainAxisAlignment.center,
                children: [
                  Icon(
                    challenge.joined
                        ? Icons
                        .check_circle_outline
                        : Icons
                        .rocket_launch_outlined,
                    size: 18,
                  ),

                  const SizedBox(
                    width: 8,
                  ),

                  Text(
                    challenge.joined
                        ? 'Joined'
                        : 'Participate',
                    style:
                    const TextStyle(
                      fontWeight:
                      FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ================================================================
  // JOIN DIALOG
  // ================================================================

  void _showJoinDialog(
      BuildContext context,
      WidgetRef ref,
      ) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return _JoinChallengeDialog(
          challenge: challenge,
          studentName: studentName,
          ref: ref,
        );
      },
    );
  }

  // ================================================================
  // DETAILS
  // ================================================================

  void _showChallengeDetails(
      BuildContext context,
      ) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor:
      Colors.transparent,
      builder: (_) {
        return Container(
          height:
          MediaQuery.of(context)
              .size
              .height *
              0.72,
          padding:
          const EdgeInsets.all(24),
          decoration:
          const BoxDecoration(
            color: Colors.white,
            borderRadius:
            BorderRadius.vertical(
              top: Radius.circular(26),
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Expanded(
                      child: Text(
                        'Challenge Details',
                        style:
                        TextStyle(
                          color:
                          AppColors.primary,
                          fontSize: 21,
                          fontWeight:
                          FontWeight.bold,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.pop(
                          context,
                        );
                      },
                      icon:
                      const Icon(
                        Icons.close,
                      ),
                    ),
                  ],
                ),

                const SizedBox(
                  height: 15,
                ),

                Text(
                  challenge.title,
                  style:
                  const TextStyle(
                    color:
                    AppColors.primary,
                    fontSize: 25,
                    fontWeight:
                    FontWeight.bold,
                  ),
                ),

                const SizedBox(
                  height: 12,
                ),

                Text(
                  challenge.description,
                  style:
                  const TextStyle(
                    color: Colors.grey,
                    height: 1.5,
                  ),
                ),

                const SizedBox(
                  height: 24,
                ),

                _detailRow(
                  Icons
                      .emoji_events_outlined,
                  'Reward',
                  '${challenge.xp} XP',
                ),

                _detailRow(
                  Icons.speed_outlined,
                  'Difficulty',
                  challenge.difficulty,
                ),

                _detailRow(
                  Icons.groups_outlined,
                  'Participants',
                  '${challenge.participants}',
                ),

                _detailRow(
                  Icons.calendar_today_outlined,
                  'Start',
                  _formatDate(
                    challenge.startDate,
                  ),
                ),

                _detailRow(
                  Icons.event_outlined,
                  'End',
                  _formatDate(
                    challenge.endDate,
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),

                Container(
                  width: double.infinity,
                  padding:
                  const EdgeInsets.all(
                    16,
                  ),
                  decoration:
                  BoxDecoration(
                    color:
                    Colors.green.withValues(
                      alpha: 0.08,
                    ),
                    borderRadius:
                    BorderRadius.circular(
                      14,
                    ),
                  ),
                  child: const Row(
                    children: [
                      Icon(
                        Icons.check_circle,
                        color:
                        Colors.green,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Text(
                          'You have joined this challenge.',
                          style:
                          TextStyle(
                            color:
                            Colors.green,
                            fontWeight:
                            FontWeight
                                .w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _detailRow(
      IconData icon,
      String label,
      String value,
      ) {
    return Padding(
      padding:
      const EdgeInsets.only(
        bottom: 14,
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color:
            AppColors.primary,
            size: 20,
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Text(
              label,
              style:
              const TextStyle(
                color: Colors.grey,
              ),
            ),
          ),

          Text(
            value,
            style:
            const TextStyle(
              fontWeight:
              FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  String _formatDate(
      DateTime date,
      ) {
    return '${date.day.toString().padLeft(2, '0')}/'
        '${date.month.toString().padLeft(2, '0')}/'
        '${date.year}';
  }
}

// ======================================================================
// JOIN FORM
// ======================================================================

class _JoinChallengeDialog
    extends StatefulWidget {
  final ChallengeModel challenge;

  final String studentName;

  final WidgetRef ref;

  const _JoinChallengeDialog({
    required this.challenge,
    required this.studentName,
    required this.ref,
  });

  @override
  State<_JoinChallengeDialog>
  createState() =>
      _JoinChallengeDialogState();
}

class _JoinChallengeDialogState
    extends State<
        _JoinChallengeDialog> {
  final _formKey =
  GlobalKey<FormState>();

  late final TextEditingController
  _nameController;

  final _studentIdController =
  TextEditingController();

  final _institutionController =
  TextEditingController();

  final _courseController =
  TextEditingController();

  final _emailController =
  TextEditingController();

  final _phoneController =
  TextEditingController();

  String? _year;

  bool _submitting = false;

  final List<String> _years = [
    '1st Year',
    '2nd Year',
    '3rd Year',
    '4th Year',
    '5th Year',
  ];

  @override
  void initState() {
    super.initState();

    _nameController =
        TextEditingController(
          text: widget.studentName,
        );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _studentIdController.dispose();
    _institutionController.dispose();
    _courseController.dispose();
    _emailController.dispose();
    _phoneController.dispose();

    super.dispose();
  }

  @override
  Widget build(
      BuildContext context,
      ) {
    return Dialog(
      insetPadding:
      const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 20,
      ),
      shape:
      RoundedRectangleBorder(
        borderRadius:
        BorderRadius.circular(24),
      ),
      child: ConstrainedBox(
        constraints:
        const BoxConstraints(
          maxHeight: 760,
        ),
        child: Column(
          children: [
            // ==================================================
            // HEADER
            // ==================================================

            Padding(
              padding:
              const EdgeInsets.fromLTRB(
                20,
                16,
                10,
                8,
              ),
              child: Row(
                children: [
                  const Expanded(
                    child: Text(
                      'Join Challenge',
                      style:
                      TextStyle(
                        color:
                        AppColors.primary,
                        fontSize: 19,
                        fontWeight:
                        FontWeight.bold,
                      ),
                    ),
                  ),

                  IconButton(
                    onPressed:
                    _submitting
                        ? null
                        : () {
                      Navigator.pop(
                        context,
                      );
                    },
                    icon:
                    const Icon(
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
                  style:
                  const TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
              ),
            ),

            const SizedBox(
              height: 8,
            ),

            // ==================================================
            // FORM
            // ==================================================

            Expanded(
              child:
              SingleChildScrollView(
                padding:
                const EdgeInsets.fromLTRB(
                  20,
                  5,
                  20,
                  20,
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      _textField(
                        controller:
                        _nameController,
                        label:
                        'Full Name',
                        icon:
                        Icons
                            .person_outline,
                        keyboardType:
                        TextInputType
                            .name,
                        formatters: [
                          FilteringTextInputFormatter
                              .allow(
                            RegExp(
                              r'[a-zA-Z ]',
                            ),
                          ),
                        ],
                        validator:
                        _validateName,
                      ),

                      const SizedBox(
                        height: 12,
                      ),

                      _textField(
                        controller:
                        _studentIdController,
                        label:
                        'Student ID',
                        icon:
                        Icons
                            .badge_outlined,
                        keyboardType:
                        TextInputType
                            .text,
                        formatters: [
                          FilteringTextInputFormatter
                              .allow(
                            RegExp(
                              r'[a-zA-Z0-9]',
                            ),
                          ),
                        ],
                        validator:
                        _validateStudentId,
                      ),

                      const SizedBox(
                        height: 12,
                      ),

                      _textField(
                        controller:
                        _institutionController,
                        label:
                        'College / Institution',
                        icon:
                        Icons
                            .school_outlined,
                        keyboardType:
                        TextInputType
                            .name,
                        formatters: [
                          FilteringTextInputFormatter
                              .allow(
                            RegExp(
                              r'[a-zA-Z ]',
                            ),
                          ),
                        ],
                        validator:
                        _validateLettersOnly,
                      ),

                      const SizedBox(
                        height: 12,
                      ),

                      _textField(
                        controller:
                        _courseController,
                        label:
                        'Course / Department',
                        icon:
                        Icons
                            .menu_book_outlined,
                        keyboardType:
                        TextInputType
                            .name,
                        formatters: [
                          FilteringTextInputFormatter
                              .allow(
                            RegExp(
                              r'[a-zA-Z ]',
                            ),
                          ),
                        ],
                        validator:
                        _validateLettersOnly,
                      ),

                      const SizedBox(
                        height: 12,
                      ),

                      DropdownButtonFormField<
                          String>(
                        initialValue:
                        _year,
                        decoration:
                        _decoration(
                          'Year of Study',
                          Icons
                              .calendar_today_outlined,
                        ),
                        items: _years
                            .map(
                              (
                              year,
                              ) {
                            return DropdownMenuItem<
                                String>(
                              value:
                              year,
                              child:
                              Text(
                                year,
                              ),
                            );
                          },
                        )
                            .toList(),
                        onChanged:
                        _submitting
                            ? null
                            : (
                            value,
                            ) {
                          setState(
                                () {
                              _year =
                                  value;
                            },
                          );
                        },
                        validator:
                            (
                            value,
                            ) {
                          if (value ==
                              null) {
                            return 'Select year of study';
                          }

                          return null;
                        },
                      ),

                      const SizedBox(
                        height: 12,
                      ),

                      _textField(
                        controller:
                        _emailController,
                        label:
                        'Email',
                        icon:
                        Icons
                            .email_outlined,
                        keyboardType:
                        TextInputType
                            .emailAddress,
                        validator:
                        _validateEmail,
                      ),

                      const SizedBox(
                        height: 12,
                      ),

                      _textField(
                        controller:
                        _phoneController,
                        label:
                        'Phone Number',
                        icon:
                        Icons
                            .phone_outlined,
                        keyboardType:
                        TextInputType
                            .phone,
                        formatters: [
                          FilteringTextInputFormatter
                              .digitsOnly,
                          LengthLimitingTextInputFormatter(
                            10,
                          ),
                        ],
                        validator:
                        _validatePhone,
                      ),

                      const SizedBox(
                        height: 12,
                      ),

                      // ONLY INDIVIDUAL
                      DropdownButtonFormField<
                          String>(
                        initialValue:
                        'Individual',
                        decoration:
                        _decoration(
                          'Participation Type',
                          Icons
                              .person_outline,
                        ),
                        items: const [
                          DropdownMenuItem(
                            value:
                            'Individual',
                            child: Text(
                              'Individual',
                            ),
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
                        width:
                        double.infinity,
                        height: 48,
                        child:
                        ElevatedButton(
                          style:
                          ElevatedButton.styleFrom(
                            backgroundColor:
                            AppColors
                                .primary,
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
                          _submitting
                              ? null
                              : _submit,
                          child:
                          _submitting
                              ? const SizedBox(
                            width:
                            20,
                            height:
                            20,
                            child:
                            CircularProgressIndicator(
                              strokeWidth:
                              2,
                              color:
                              Colors.white,
                            ),
                          )
                              : const Text(
                            'Confirm Participation',
                            style:
                            TextStyle(
                              fontWeight:
                              FontWeight.w600,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(
                        height: 10,
                      ),

                      const Text(
                        'Your participation details will be registered with IGC.',
                        textAlign:
                        TextAlign.center,
                        style:
                        TextStyle(
                          color:
                          Colors.grey,
                          fontSize:
                          10,
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

  // ================================================================
  // NAME VALIDATION
  // ================================================================

  String? _validateName(
      String? value,
      ) {
    final entered =
        value?.trim() ?? '';

    final registered =
    widget.studentName
        .trim();

    if (entered.isEmpty) {
      return 'Full name is required';
    }

    if (!RegExp(
      r'^[a-zA-Z ]+$',
    ).hasMatch(entered)) {
      return 'Name must contain letters only';
    }

    if (entered.toLowerCase() !=
        registered.toLowerCase()) {
      return 'Name must match your IGC registered name';
    }

    return null;
  }

  // ================================================================
  // STUDENT ID
  // ================================================================

  String? _validateStudentId(
      String? value,
      ) {
    final id =
        value?.trim() ?? '';

    if (id.isEmpty) {
      return 'Student ID is required';
    }

    if (!RegExp(
      r'^[a-zA-Z0-9]+$',
    ).hasMatch(id)) {
      return 'Use letters and numbers only';
    }

    return null;
  }

  // ================================================================
  // LETTERS ONLY
  // ================================================================

  String? _validateLettersOnly(
      String? value,
      ) {
    final text =
        value?.trim() ?? '';

    if (text.isEmpty) {
      return 'This field is required';
    }

    if (!RegExp(
      r'^[a-zA-Z ]+$',
    ).hasMatch(text)) {
      return 'Use letters and spaces only';
    }

    return null;
  }

  // ================================================================
  // EMAIL
  // ================================================================

  String? _validateEmail(
      String? value,
      ) {
    final email =
        value?.trim() ?? '';

    if (email.isEmpty) {
      return 'Email is required';
    }

    if (!RegExp(
      r'^[^@\s]+@[^@\s]+\.[^@\s]+$',
    ).hasMatch(email)) {
      return 'Enter a valid email address';
    }

    return null;
  }

  // ================================================================
  // PHONE
  // ================================================================

  String? _validatePhone(
      String? value,
      ) {
    final phone =
        value?.trim() ?? '';

    if (phone.isEmpty) {
      return 'Phone number is required';
    }

    if (!RegExp(
      r'^[6-9][0-9]{9}$',
    ).hasMatch(phone)) {
      return 'Enter a valid 10-digit phone number';
    }

    return null;
  }

  // ================================================================
  // TEXT FIELD
  // ================================================================

  Widget _textField({
    required TextEditingController
    controller,
    required String label,
    required IconData icon,
    TextInputType? keyboardType,
    List<TextInputFormatter>?
    formatters,
    String? Function(String?)?
    validator,
  }) {
    return TextFormField(
      controller:
      controller,
      keyboardType:
      keyboardType,
      inputFormatters:
      formatters,
      validator:
      validator,
      enabled:
      !_submitting,
      decoration:
      _decoration(
        label,
        icon,
      ),
    );
  }

  // ================================================================
  // DECORATION
  // ================================================================

  InputDecoration _decoration(
      String label,
      IconData icon,
      ) {
    return InputDecoration(
      labelText:
      label,
      prefixIcon:
      Icon(
        icon,
        color:
        AppColors.primary,
        size: 20,
      ),
      contentPadding:
      const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 14,
      ),
      border:
      OutlineInputBorder(
        borderRadius:
        BorderRadius.circular(
          12,
        ),
      ),
      enabledBorder:
      OutlineInputBorder(
        borderRadius:
        BorderRadius.circular(
          12,
        ),
        borderSide:
        const BorderSide(
          color:
          Color(0xFFDADADA),
        ),
      ),
      focusedBorder:
      OutlineInputBorder(
        borderRadius:
        BorderRadius.circular(
          12,
        ),
        borderSide:
        const BorderSide(
          color:
          AppColors.primary,
          width: 1.5,
        ),
      ),
      errorBorder:
      OutlineInputBorder(
        borderRadius:
        BorderRadius.circular(
          12,
        ),
        borderSide:
        const BorderSide(
          color:
          Colors.red,
        ),
      ),
    );
  }

  // ================================================================
  // SUBMIT
  // ================================================================

  Future<void> _submit() async {
    if (!_formKey.currentState!
        .validate()) {
      return;
    }

    if (_year == null) {
      return;
    }

    setState(() {
      _submitting = true;
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
        _nameController.text
            .trim(),
        studentId:
        _studentIdController
            .text
            .trim(),
        institution:
        _institutionController
            .text
            .trim(),
        course:
        _courseController.text
            .trim(),
        year: _year!,
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
          _submitting = false;
        });

        ScaffoldMessenger.of(
          context,
        ).showSnackBar(
          const SnackBar(
            content: Text(
              'Unable to join. Please verify your details or check if you already joined.',
            ),
          ),
        );

        return;
      }

      Navigator.pop(
        context,
      );

      widget.ref.invalidate(
        challengesProvider,
      );

      widget.ref.invalidate(
        featuredChallengeProvider,
      );

      if (!mounted) {
        return;
      }

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(
        const SnackBar(
          backgroundColor:
          Colors.green,
          content: Text(
            'Successfully joined the challenge.',
          ),
        ),
      );
    } catch (error) {
      if (!mounted) {
        return;
      }

      setState(() {
        _submitting = false;
      });

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(
        SnackBar(
          content: Text(
            'Unable to join challenge: $error',
          ),
        ),
      );
    }
  }
}