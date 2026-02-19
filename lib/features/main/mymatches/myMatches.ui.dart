import 'package:cherry/core/color.theme.dart';
import 'package:cherry/features/main/MatchDetail/matchDetail.ui.dart';
import 'package:cherry/features/main/mymatches/createMatches.ui.dart';
import 'package:cherry/utils/navigation.utils.dart';
import 'package:flutter/material.dart';

class MyMatchesScreen extends StatelessWidget {
  const MyMatchesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          "CHERRY",
          style: TextTheme.of(context).headlineMedium?.copyWith(
            color: AppColors.primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        actionsPadding: EdgeInsets.all(8),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.settings, color: AppColors.primaryColor),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: AppColors.primaryColor,
        label: Text("Matches", style: TextStyle(color: Colors.white)),

        icon: const Icon(Icons.add, color: Colors.white),

        onPressed: () {
          PageNavigator(ctx: context).nextPage(page: CreateMatches());
        },
      ),

      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(12),
          children: [
            GestureDetector(
              onTap: () {
                PageNavigator(ctx: context).nextPage(
                  page: MatchDetailPage(matchTitle: 'Blue House vs Red House'),
                );
              },
              child: _matchCard(
                title: "Blue House vs Red House",
                score: "100/2",
                over: "5/10",
                date: "12-02-2026",
                numberOfPlayer: "5"
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _matchCard({
  required String title,
  required String score,
  required String over,
  required String date,
  required String numberOfPlayer,
}) {
  return Card(
    elevation: 0,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    margin: const EdgeInsets.symmetric(vertical: 10),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.accentColor.withAlpha(20),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// HEADER
          Row(
            children: [
              const Icon(Icons.sports_cricket, color: AppColors.primaryColor),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          /// SCORE
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            decoration: BoxDecoration(
              color: AppColors.accentColor.withAlpha(50),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      "Score: ",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Text(
                      score,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Over: ",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      over,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          /// FOOTER
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Match Date: $date",
                style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                "$numberOfPlayer Palyers Each Team",
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
