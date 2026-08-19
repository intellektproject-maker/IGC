import 'package:flutter/material.dart';

import '../../../../core/design_system/app_colors.dart';
import '../models/idea_model.dart';

class IdeaDetailsDialog extends StatelessWidget {
  final IdeaModel idea;

  const IdeaDetailsDialog({
    super.key,
    required this.idea,
  });

  String _statusText() {
    switch (idea.status) {
      case 'submitted':
        return 'Submitted';

      case 'under_review':
        return 'Under Review';

      case 'approved':
        return 'Approved';

      case 'rejected':
        return 'Rejected';

      default:
        return idea.status;
    }
  }

  Color _statusColor() {
    switch (idea.status) {
      case 'approved':
        return Colors.green;

      case 'rejected':
        return Colors.red;

      case 'under_review':
        return Colors.orange;

      default:
        return AppColors.primary;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      title: Text(
        idea.title,
        style: const TextStyle(
          color: AppColors.primary,
          fontWeight: FontWeight.bold,
        ),
      ),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment:
          CrossAxisAlignment.start,
          children: [
            const Text(
              'Challenge',
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 4),

            Text(
              idea.challengeTitle,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: AppColors.primary,
              ),
            ),

            const SizedBox(height: 16),

            const Text(
              'Description',
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 4),

            Text(
              idea.description,
              style: const TextStyle(
                fontSize: 14,
              ),
            ),

            const SizedBox(height: 16),

            const Text(
              'Domain',
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 4),

            Text(
              idea.domain,
              style: const TextStyle(
                fontSize: 14,
              ),
            ),

            const SizedBox(height: 16),

            const Text(
              'Status',
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 6),

            Container(
              padding:
              const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 7,
              ),
              decoration: BoxDecoration(
                color: _statusColor()
                    .withValues(alpha: 0.10),
                borderRadius:
                BorderRadius.circular(20),
              ),
              child: Text(
                _statusText(),
                style: TextStyle(
                  color: _statusColor(),
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
            ),

            const SizedBox(height: 16),

            const Text(
              'Submitted On',
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 4),

            Text(
              '${idea.submittedDate.day.toString().padLeft(2, '0')}/'
                  '${idea.submittedDate.month.toString().padLeft(2, '0')}/'
                  '${idea.submittedDate.year}',
            ),

            const SizedBox(height: 16),

            if (idea.movedToBuild)
              Container(
                width: double.infinity,
                padding:
                const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.green
                      .withValues(alpha: 0.10),
                  borderRadius:
                  BorderRadius.circular(12),
                ),
                child: const Row(
                  children: [
                    Icon(
                      Icons.rocket_launch,
                      color: Colors.green,
                      size: 18,
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'This idea has been moved to Build.',
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight:
                          FontWeight.w600,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Close'),
        ),
      ],
    );
  }
}