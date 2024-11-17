import 'package:flutter/material.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/provides/settings_provider.dart';
import 'package:provider/provider.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/radio_image.png'),
          SizedBox(
            height: height * 0.04,
          ),
          Text('إذاعة القرآن الكريم',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontSize: 30, fontWeight: FontWeight.bold)),
          SizedBox(
            height: height * 0.07,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.skip_previous_rounded,
                size: 40,
                color: settingsProvider.isDark
                    ? AppTheme.gold
                    : AppTheme.lightPrimary,
              ),
              SizedBox(width: width * 0.15),
              Icon(
                Icons.play_arrow_rounded,
                size: 60,
                color: settingsProvider.isDark
                    ? AppTheme.gold
                    : AppTheme.lightPrimary,
              ),
              SizedBox(width: width * 0.15),
              Icon(
                Icons.skip_next_rounded,
                size: 40,
                color: settingsProvider.isDark
                    ? AppTheme.gold
                    : AppTheme.lightPrimary,
              )
            ],
          )
        ],
      ),
    );
  }
}
