import 'package:flutter/material.dart';

class ReusablePageCard extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final Widget? child;

  const ReusablePageCard({
    super.key,
    this.title,
    this.subtitle,
    this.child,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // Subtle gradient background for a modern look
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.white,
            Colors.grey.shade50,
          ],
        ),
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(color: Colors.grey.shade300, width: 1),
        // Subtle shadow for depth
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min, // The card will fit its content's height
          children: [
            // Conditionally display the title if it's provided
            if (title != null)
              Text(
                title!,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF333333),
                ),
              ),

            // Conditionally display the subtitle if it's provided
            if (subtitle != null) ...[
              // Add space only if there's a title above it
              if (title != null) const SizedBox(height: 4),
              Text(
                subtitle!,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[700],
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],

            // Add spacing between the header and the main content,
            // but only if a header (title or subtitle) exists.
            if (title != null || subtitle != null) const SizedBox(height: 24),

            // Conditionally display the child widget if it's provided
            if (child != null) child!,
          ],
        ),
      ),
    );
  }
}
