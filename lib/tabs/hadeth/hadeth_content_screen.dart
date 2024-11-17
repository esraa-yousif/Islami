import 'package:flutter/material.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/tabs/hadeth/hadeth_model.dart';
import 'package:islami/provides/settings_provider.dart';
import 'package:provider/provider.dart';

class HadethContentScreen extends StatefulWidget {
  static const String routeName = '/hadeth_content';

  const HadethContentScreen({super.key});

  @override
  State<HadethContentScreen> createState() => _SuraContentScreenState();
}

class _SuraContentScreenState extends State<HadethContentScreen> {
  List<String> ayat = [];

  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);

    Hadeth hadeth = ModalRoute.of(context)!.settings.arguments as Hadeth;

    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                  'assets/images/${Provider.of<SettingsProvider>(context).backGroundImageName}.png'))),
      child: Scaffold(
        appBar: AppBar(
          title: Text(hadeth.title),
        ),
        body: Container(
          decoration: BoxDecoration(
              color: settingsProvider.isDark
                  ? AppTheme.darkPrimary
                  : AppTheme.white,
              borderRadius: const BorderRadius.all(Radius.circular(25))),
          padding: const EdgeInsets.all(24),
          margin: EdgeInsets.symmetric(
            vertical: MediaQuery.sizeOf(context).height * 0.07,
            horizontal: 30,
          ),
          child: ListView.builder(
              itemCount: hadeth.content.length,
              itemBuilder: (_, index) => Text(
                    hadeth.content[index],
                    style: Theme.of(context).textTheme.titleLarge,
                    textAlign: TextAlign.center,
                  )),
        ),
      ),
    );
  }
}
