import 'package:cherry/core/color.theme.dart';
import 'package:flutter/material.dart';

class MatchDetailPage extends StatefulWidget {
  final String matchTitle;
  const MatchDetailPage({super.key, required this.matchTitle});

  @override
  State<MatchDetailPage> createState() => _MatchDetailPageState();
}

class _MatchDetailPageState extends State<MatchDetailPage> {
  String inningName = "1st inning";
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          actionsPadding: EdgeInsets.all(8),
          actions: [
            TextButton(
              onPressed: () {
                if (inningName == "1st inning") {
                  setState(() {
                    inningName = "2nd inning";
                  });
                } else if (inningName == "2nd inning") {
                  setState(() {
                    inningName = "1st inning";
                  });
                }
              },
              child: Text(
                inningName,
                style: Theme.of(
                  context,
                ).textTheme.labelMedium?.copyWith(color: AppColors.success),
              ),
            ),
          ],
          centerTitle: false,
          title: Text(
            widget.matchTitle,
            style: TextTheme.of(context).headlineSmall?.copyWith(
              color: AppColors.primaryColor,
              fontSize: 20,
            ),
          ),
          bottom: TabBar(
            tabs: [
              Tab(child: Text("Batting")),
              Tab(child: Text("Bowling")),
              Tab(child: Text("Summary")),
            ],
          ),
        ),
      ),
    );
  }
}
