import 'package:flutter/material.dart';

import '../../../../core/design_system/app_colors.dart';

class InnovateStatCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color iconColor;

  const InnovateStatCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;

        // Responsive values
        final iconContainerSize =
        width < 140 ? 38.0 : 44.0;

        final iconSize =
        width < 140 ? 19.0 : 22.0;

        final valueFontSize =
        width < 140 ? 20.0 : 22.0;

        final titleFontSize =
        width < 140 ? 12.0 : 13.0;

        final verticalPadding =
        width < 140 ? 10.0 : 14.0;

        return Container(
          width: double.infinity,
          constraints: const BoxConstraints(
            minHeight: 110,
            maxHeight: 170,
          ),
          padding: EdgeInsets.symmetric(
            horizontal: width < 140 ? 8 : 12,
            vertical: verticalPadding,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // ==================================================
              // ICON
              // ==================================================

              Container(
                width: iconContainerSize,
                height: iconContainerSize,
                decoration: BoxDecoration(
                  color: iconColor.withValues(alpha: 0.10),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon,
                  size: iconSize,
                  color: iconColor,
                ),
              ),

              SizedBox(
                height: width < 140 ? 8 : 10,
              ),

              // ==================================================
              // VALUE
              // ==================================================

              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  value,
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: valueFontSize,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primary,
                    height: 1.0,
                  ),
                ),
              ),

              SizedBox(
                height: width < 140 ? 5 : 7,
              ),

              // ==================================================
              // TITLE
              // ==================================================

              Flexible(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    title,
                    maxLines: 1,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: titleFontSize,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF667085),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}