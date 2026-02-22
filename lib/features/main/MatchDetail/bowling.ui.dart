import 'package:cherry/core/color.theme.dart';
import 'package:flutter/material.dart';

class Bowling extends StatelessWidget {
  const Bowling({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildCurrentBowlerCard(context),

            const SizedBox(height: 24),

            const Text(
              "Bowling Squad",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 12),
            _buildBowlerList(),
          ],
        ),
      ),
    );
  }

  Widget _buildCurrentBowlerCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.containerColor,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "CURRENT BOWLER",
                    style: TextStyle(
                      color: AppColors.accentColor,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    "Ramesh Rahul",
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const CircleAvatar(
                radius: 25,
                backgroundColor: Colors.blueAccent,
                child: Icon(Icons.sports_cricket, color: Colors.white),
              ),
            ],
          ),
          Divider(color: AppColors.bodyTextColor, height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _statItem("Overs", "3.4"),
              _statItem("Maidens", "1"),
              _statItem("Runs", "24"),
              _statItem("Wickets", "2", isHighlight: true),
            ],
          ),
          const SizedBox(height: 20),
          // Progress bar for the current over
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(child: Text("1")),
              CircleAvatar(child: Text("W")),
              CircleAvatar(child: Text("3")),
              CircleAvatar(child: Text("0")),
              CircleAvatar(child: Text("0")),
              CircleAvatar(child: Text("6")),
            ],
          ),
        ],
      ),
    );
  }

  Widget _statItem(String label, String value, {bool isHighlight = false}) {
    return Column(
      children: [
        Text(label, style: const TextStyle(color: Colors.black, fontSize: 12)),
        const SizedBox(height: 6),
        Text(
          value,
          style: TextStyle(
            color: isHighlight ? Colors.redAccent : Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildBowlerList() {
    final List<Map<String, dynamic>> bowlers = [
      {
        "name": "Mohammed Shami",
        "overs": "4.0",
        "runs": "32",
        "wickets": "1",
        "econ": "8.0",
      },
      {
        "name": "Hardik Pandya",
        "overs": "2.0",
        "runs": "15",
        "wickets": "0",
        "econ": "7.5",
      },
      {
        "name": "Ravindra Jadeja",
        "overs": "4.0",
        "runs": "20",
        "wickets": "3",
        "econ": "5.0",
      },
    ];

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: bowlers.length,
      separatorBuilder: (context, index) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final bowler = bowlers[index];
        return Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.primaryColor.withAlpha(20),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      bowler['name'],
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "Econ: ${bowler['econ']}",
                      style: const TextStyle(
                        color: Colors.black54,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(child: _listStat("O", bowler['overs'])),
              Expanded(child: _listStat("R", bowler['runs'])),
              Expanded(
                child: _listStat(
                  "W",
                  bowler['wickets'],
                  color: Colors.redAccent,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _listStat(String label, String value, {Color color = Colors.black}) {
    return Column(
      children: [
        Text(label, style: const TextStyle(color: Colors.black, fontSize: 10)),
        Text(
          value,
          style: TextStyle(color: color, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
