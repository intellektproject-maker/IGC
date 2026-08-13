import 'package:flutter/material.dart';

import '../../../../core/design_system/app_colors.dart';
import '../models/idea_model.dart';

class IdeaCard extends StatelessWidget {
  final IdeaModel idea;

  const IdeaCard({
    super.key,
    required this.idea,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(
        bottom: 14,
      ),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
        BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment:
        CrossAxisAlignment.start,
        children: [
          // ==================================================
          // TITLE + STATUS
          // ==================================================

          Row(
            crossAxisAlignment:
            CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  idea.title,
                  style:
                  const TextStyle(
                    fontSize: 17,
                    fontWeight:
                    FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),

              const SizedBox(width: 8),

              _statusBadge(
                idea.status,
              ),
            ],
          ),

          const SizedBox(height: 8),

          // ==================================================
          // DESCRIPTION
          // ==================================================

          Text(
            idea.description,
            maxLines: 2,
            overflow:
            TextOverflow.ellipsis,
            style:
            const TextStyle(
              fontSize: 13,
              color: Colors.grey,
            ),
          ),

          const SizedBox(height: 14),

          // ==================================================
          // DOMAIN + POINTS
          // ==================================================

          Row(
            children: [
              const Icon(
                Icons.lightbulb_outline,
                size: 17,
                color: Colors.amber,
              ),

              const SizedBox(width: 6),

              Expanded(
                child: Text(
                  idea.domain,
                  style:
                  const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ),

              const Icon(
                Icons.stars_outlined,
                size: 17,
                color: Colors.orange,
              ),

              const SizedBox(width: 5),

              Text(
                '+${idea.points} pts',
                style:
                const TextStyle(
                  fontSize: 12,
                  fontWeight:
                  FontWeight.w600,
                  color:
                  AppColors.primary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ================================================================
  // STATUS
  // ================================================================

  Widget _statusBadge(
      String status,
      ) {
    String text;
    Color background;
    Color foreground;

    switch (status) {
      case 'under_review':
        text = 'Under Review';
        background =
            Colors.orange.shade50;
        foreground =
            Colors.orange.shade800;
        break;

      case 'submitted':
        text = 'Submitted';
        background =
            Colors.blue.shade50;
        foreground =
            Colors.blue.shade800;
        break;

      case 'approved':
        text = 'Approved';
        background =
            Colors.green.shade50;
        foreground =
            Colors.green.shade800;
        break;

      case 'rejected':
        text = 'Rejected';
        background =
            Colors.red.shade50;
        foreground =
            Colors.red.shade800;
        break;

      default:
        text = 'Draft';
        background =
            Colors.grey.shade100;
        foreground =
            Colors.grey.shade700;
    }

    return Container(
      padding:
      const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      decoration: BoxDecoration(
        color: background,
        borderRadius:
        BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 10,
          fontWeight:
          FontWeight.w600,
          color: foreground,
        ),
      ),
    );
  }
}