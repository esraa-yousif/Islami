import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/provides/settings_provider.dart';
import 'package:provider/provider.dart';

class SuraContentScreen extends StatefulWidget {
  static const String routeName = '/sura_content';

  const SuraContentScreen({super.key});

  @override
  State<SuraContentScreen> createState() => _SuraContentScreenState();
}

class _SuraContentScreenState extends State<SuraContentScreen> {
  List<String> ayat = [];

  late SuraContentArgs args;

  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);

    args = ModalRoute.of(context)!.settings.arguments as SuraContentArgs;
    loadSuraFile();

    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                  'assets/images/${Provider.of<SettingsProvider>(context).backGroundImageName}.png'))),
      child: Scaffold(
        appBar: AppBar(
          title: Text(args.suraName),
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
              itemCount: ayat.length,
              itemBuilder: (_, index) => Text(
                    ayat[index],
                    style: Theme.of(context).textTheme.titleLarge,
                    textAlign: TextAlign.center,
                  )),
        ),
      ),
    );
  }

  Future<void> loadSuraFile() async {
    String sura =
        await rootBundle.loadString('assets/text/${args.index + 1}.txt');
    ayat = sura.split('\r\n');
    setState(() {});
  }
}

class SuraContentArgs {
  String suraName;
  int index;

  SuraContentArgs({required this.suraName, required this.index});
}
