import 'package:flutter/material.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/provides/sebha_provider.dart';
import 'package:islami/provides/settings_provider.dart';
import 'package:provider/provider.dart';

class SebhaTab extends StatelessWidget {
  const SebhaTab({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return ChangeNotifierProvider(
      create: (_) => SebhaProvider(),
      child: Consumer2<SebhaProvider, SettingsProvider>(
        builder: (context, sebhaProvider, settingsProvider, child) {
          return Center(
            child: Column(
              children: [
                Stack(
                  children: [
                    Center(
                        child: Padding(
                      padding: EdgeInsets.only(left: width * 0.12),
                      child: Image(
                        image: AssetImage(
                            'assets/images/${sebhaProvider.headSebhaName}.png'),
                      ),
                    )),
                    Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: height * 0.09),
                        child: GestureDetector(
                          onTap: sebhaProvider.increment,
                          child: Transform.rotate(
                            angle: sebhaProvider.angle,
                            child: Image(
                              image: AssetImage(
                                  'assets/images/${sebhaProvider.bodySebhaName}.png'),
                              height: height * 0.27,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.07,
                ),
                Text('عدد التسبيحات',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(fontSize: 25, fontWeight: FontWeight.bold)),
                SizedBox(
                  height: height * 0.05,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: settingsProvider.isDark
                          ? AppTheme.darkPrimary
                          : AppTheme.lightPrimary.withOpacity(0.57),
                      borderRadius: BorderRadius.circular(20)),
                  height: height * 0.1,
                  width: width * 0.15,
                  child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        sebhaProvider.count.toString(),
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      )),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                SizedBox(
                  height: height * 0.07,
                  width: width * 0.5,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: settingsProvider.isDark
                              ? AppTheme.gold
                              : AppTheme.lightPrimary,
                          foregroundColor: Colors.white),
                      onPressed: () {
                        sebhaProvider.increment();
                      },
                      child: Text(
                        sebhaProvider.azkar[sebhaProvider.index],
                        style: const TextStyle(fontSize: 25),
                      )),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
