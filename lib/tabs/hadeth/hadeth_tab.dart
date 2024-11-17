import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/tabs/hadeth/hadeth_content_screen.dart';
import 'package:islami/tabs/hadeth/hadeth_model.dart';

class HadethTab extends StatefulWidget {
  const HadethTab({super.key});

  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  List<Hadeth> ahadeth = [];

  @override
  Widget build(BuildContext context) {
    if (ahadeth.isEmpty) {
      loadHadethFile();
    }

    return Column(
      children: [
        Image.asset('assets/images/hadeth_logo.png'),
        Expanded(
          child: ListView.separated(
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemCount: ahadeth.length,
              itemBuilder: (_, index) => GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        HadethContentScreen.routeName,
                        arguments: ahadeth[index],
                      );
                    },
                    child: Text(
                      style: Theme.of(context).textTheme.headlineSmall,
                      ahadeth[index].title,
                      textAlign: TextAlign.center,
                    ),
                  )),
        ),
      ],
    );
  }

  Future<void> loadHadethFile() async {
    String ahadethFileContent =
        await rootBundle.loadString('assets/text/ahadeth.txt');
    List<String> ahadethStrings = ahadethFileContent.split('#');
    ahadeth = ahadethStrings.map((hadethString) {
      List<String> hadethLines = hadethString.trim().split('\n');
      String title = hadethLines[0];
      hadethLines.removeAt(0);
      List<String> content = hadethLines;
      return Hadeth(title, content);
    }).toList();
    setState(() {});
  }
}
