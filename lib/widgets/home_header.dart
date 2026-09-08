import 'package:flowee_app/theme/app_theme.dart';
import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key, required this.onProfileTap});

    final VoidCallback onProfileTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Halo, Demo User',
              style: TextStyle(
                fontSize: 13,
                color: AppTheme.textSecondary
              ),
            ),
            SizedBox(height: 3),
            Text(
              'Bunga apa hari ini?',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w800,
                color: AppTheme.textPrimary
              ),
            )
          ],
        ),
        InkWell(
          onTap: onProfileTap,
          customBorder: CircleBorder(),
          child: Container(
            width: 46,
            height: 46,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [AppTheme.primary, AppTheme.primaryDark]
                ),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: AppTheme.primary.withValues(alpha: 0.35),
                    blurRadius: 12,
                    offset: Offset(0, 4)
                  )
                ]
            ),
            child: Icon(Icons.person_rounded, color: Colors.white)
          ),
        )
      ],
    );
  }
}