import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/design_system/app_colors.dart';
import '../../../../core/design_system/app_radius.dart';
import '../../../../core/design_system/app_spacing.dart';
import '../../../../core/design_system/app_typography.dart';

import '../models/challenge_model.dart';
import '../providers/innovate_provider.dart';

class AddIdeaSheet extends ConsumerStatefulWidget {
  final List<ChallengeModel> challenges;

  const AddIdeaSheet({
    super.key,
    required this.challenges,
  });

  @override
  ConsumerState<AddIdeaSheet> createState() => _AddIdeaSheetState();
}

class _AddIdeaSheetState extends ConsumerState<AddIdeaSheet> {
  final _formKey = GlobalKey<FormState>();

  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _domainController = TextEditingController();

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
    if (!_formKey.currentState!.validate()) {
      return;
    }

    if (_selectedChallengeId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select a challenge'),
        ),
      );

      return;
    }

    setState(() {
      _isSubmitting = true;
    });

    try {
      final idea = await ref
          .read(ideasProvider.notifier)
          .submitIdea(
        challengeId: _selectedChallengeId!,
        title: _titleController.text.trim(),
        description: _descriptionController.text.trim(),
        domain: _domainController.text.trim(),
      );

      if (!mounted) return;

      if (idea != null) {
        Navigator.of(context).pop(true);

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Innovation idea submitted successfully',
            ),
            backgroundColor: Colors.green,
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Unable to submit idea. Please try again.',
            ),
          ),
        );
      }
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Something went wrong: $e',
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
          bottom: MediaQuery.of(context).viewInsets.bottom +
              AppSpacing.screenPadding,
        ),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // -------------------------------------------------
                // HEADER
                // -------------------------------------------------

                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Submit Innovation Idea',
                        style: AppTypography.titleLarge.copyWith(
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    IconButton(
                      onPressed: _isSubmitting
                          ? null
                          : () => Navigator.of(context).pop(),
                      icon: const Icon(Icons.close),
                    ),
                  ],
                ),

                const SizedBox(
                  height: AppSpacing.xs,
                ),

                Text(
                  'Share your idea and turn it into an innovation.',
                  style: AppTypography.bodyMedium.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),

                const SizedBox(
                  height: AppSpacing.lg,
                ),

                // -------------------------------------------------
                // CHALLENGE
                // -------------------------------------------------

                Text(
                  'Innovation Challenge',
                  style: AppTypography.titleMedium.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(
                  height: AppSpacing.sm,
                ),

                DropdownButtonFormField<String>(
                  initialValue: _selectedChallengeId,
                  isExpanded: true,
                  decoration: InputDecoration(
                    hintText: 'Select a challenge',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        AppRadius.input,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        AppRadius.input,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        AppRadius.input,
                      ),
                      borderSide: const BorderSide(
                        color: AppColors.primary,
                        width: 2,
                      ),
                    ),
                  ),
                  items: widget.challenges.map((challenge) {
                    return DropdownMenuItem<String>(
                      value: challenge.id,
                      child: Text(
                        challenge.title,
                        overflow: TextOverflow.ellipsis,
                      ),
                    );
                  }).toList(),
                  onChanged: _isSubmitting
                      ? null
                      : (value) {
                    setState(() {
                      _selectedChallengeId = value;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select a challenge';
                    }

                    return null;
                  },
                ),

                const SizedBox(
                  height: AppSpacing.lg,
                ),

                // -------------------------------------------------
                // TITLE
                // -------------------------------------------------

                Text(
                  'Idea Title',
                  style: AppTypography.titleMedium.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(
                  height: AppSpacing.sm,
                ),

                TextFormField(
                  controller: _titleController,
                  enabled: !_isSubmitting,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    hintText: 'Enter your idea title',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        AppRadius.input,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        AppRadius.input,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        AppRadius.input,
                      ),
                      borderSide: const BorderSide(
                        color: AppColors.primary,
                        width: 2,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter an idea title';
                    }

                    if (value.trim().length < 5) {
                      return 'Title should be at least 5 characters';
                    }

                    return null;
                  },
                ),

                const SizedBox(
                  height: AppSpacing.lg,
                ),

                // -------------------------------------------------
                // DESCRIPTION
                // -------------------------------------------------

                Text(
                  'Description',
                  style: AppTypography.titleMedium.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(
                  height: AppSpacing.sm,
                ),

                TextFormField(
                  controller: _descriptionController,
                  enabled: !_isSubmitting,
                  minLines: 4,
                  maxLines: 6,
                  textInputAction: TextInputAction.newline,
                  decoration: InputDecoration(
                    hintText:
                    'Explain your innovation idea...',
                    alignLabelWithHint: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        AppRadius.input,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        AppRadius.input,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        AppRadius.input,
                      ),
                      borderSide: const BorderSide(
                        color: AppColors.primary,
                        width: 2,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please describe your idea';
                    }

                    if (value.trim().length < 20) {
                      return 'Please provide a little more detail';
                    }

                    return null;
                  },
                ),

                const SizedBox(
                  height: AppSpacing.lg,
                ),

                // -------------------------------------------------
                // DOMAIN
                // -------------------------------------------------

                Text(
                  'Domain',
                  style: AppTypography.titleMedium.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(
                  height: AppSpacing.sm,
                ),

                TextFormField(
                  controller: _domainController,
                  enabled: !_isSubmitting,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    hintText:
                    'Example: AI, IoT, Healthcare, Education',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        AppRadius.input,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        AppRadius.input,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        AppRadius.input,
                      ),
                      borderSide: const BorderSide(
                        color: AppColors.primary,
                        width: 2,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter the domain';
                    }

                    return null;
                  },
                ),

                const SizedBox(
                  height: AppSpacing.xl,
                ),

                // -------------------------------------------------
                // SUBMIT BUTTON
                // -------------------------------------------------

                SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton(
                    onPressed:
                    _isSubmitting ? null : _submitIdea,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: Colors.white,
                      disabledBackgroundColor:
                      AppColors.primary.withValues(
                        alpha: 0.5,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          AppRadius.button,
                        ),
                      ),
                    ),
                    child: _isSubmitting
                        ? const SizedBox(
                      width: 22,
                      height: 22,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.white,
                      ),
                    )
                        : const Text(
                      'Submit Idea',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
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
}