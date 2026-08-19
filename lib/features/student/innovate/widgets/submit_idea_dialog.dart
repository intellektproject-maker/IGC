import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/design_system/app_colors.dart';
import '../providers/innovate_provider.dart';

class SubmitIdeaDialog extends ConsumerStatefulWidget {
  final String challengeId;
  final String challengeTitle;

  const SubmitIdeaDialog({
    super.key,
    required this.challengeId,
    required this.challengeTitle,
  });

  @override
  ConsumerState<SubmitIdeaDialog> createState() =>
      _SubmitIdeaDialogState();
}

class _SubmitIdeaDialogState
    extends ConsumerState<SubmitIdeaDialog> {
  final _formKey = GlobalKey<FormState>();

  final _titleController =
  TextEditingController();

  final _descriptionController =
  TextEditingController();

  final _domainController =
  TextEditingController();

  bool _submitting = false;

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _domainController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _submitting = true;
    });

    final repository =
    ref.read(innovateRepositoryProvider);

    // Check again immediately before submitting.
    // This prevents submission after the deadline.
    if (!repository.canSubmitToChallenge(
      widget.challengeId,
    )) {
      if (mounted) {
        setState(() {
          _submitting = false;
        });

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Idea submission is closed for this challenge.',
            ),
          ),
        );
      }

      return;
    }

    final idea =
    await ref
        .read(ideasProvider.notifier)
        .submitIdea(
      challengeId:
      widget.challengeId,
      title:
      _titleController.text,
      description:
      _descriptionController.text,
      domain:
      _domainController.text,
    );

    if (!mounted) {
      return;
    }

    setState(() {
      _submitting = false;
    });

    if (idea == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Unable to submit idea. Please check the challenge status.',
          ),
        ),
      );

      return;
    }

    Navigator.of(context).pop(true);
  }

  InputDecoration _decoration(
      String label,
      ) {
    return InputDecoration(
      labelText: label,
      border: OutlineInputBorder(
        borderRadius:
        BorderRadius.circular(12),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius:
        BorderRadius.circular(12),
        borderSide: BorderSide(
          color: Colors.grey.shade300,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius:
        BorderRadius.circular(12),
        borderSide: const BorderSide(
          color: AppColors.primary,
          width: 1.5,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      title: const Text(
        'Submit Your Idea',
        style: TextStyle(
          color: AppColors.primary,
          fontWeight: FontWeight.bold,
        ),
      ),
      content: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment:
                Alignment.centerLeft,
                child: Text(
                  widget.challengeTitle,
                  style: TextStyle(
                    color:
                    Colors.grey.shade700,
                    fontSize: 13,
                  ),
                ),
              ),

              const SizedBox(height: 16),

              TextFormField(
                controller:
                _titleController,
                decoration:
                _decoration(
                  'Idea Title',
                ),
                validator: (value) {
                  if (value == null ||
                      value.trim().isEmpty) {
                    return 'Enter idea title';
                  }

                  return null;
                },
              ),

              const SizedBox(height: 12),

              TextFormField(
                controller:
                _descriptionController,
                maxLines: 4,
                decoration:
                _decoration(
                  'Description',
                ),
                validator: (value) {
                  if (value == null ||
                      value.trim().isEmpty) {
                    return 'Enter description';
                  }

                  return null;
                },
              ),

              const SizedBox(height: 12),

              TextFormField(
                controller:
                _domainController,
                decoration:
                _decoration(
                  'Domain',
                ),
                validator: (value) {
                  if (value == null ||
                      value.trim().isEmpty) {
                    return 'Enter domain';
                  }

                  return null;
                },
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: _submitting
              ? null
              : () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed:
          _submitting ? null : _submit,
          style:
          ElevatedButton.styleFrom(
            backgroundColor:
            AppColors.primary,
            foregroundColor:
            Colors.white,
          ),
          child: _submitting
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
            'Submit Idea',
          ),
        ),
      ],
    );
  }
}