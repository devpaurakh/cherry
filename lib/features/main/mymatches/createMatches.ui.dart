import 'package:cherry/core/color.theme.dart';
import 'package:flutter/material.dart';

class CreateMatches extends StatefulWidget {
  const CreateMatches({super.key});

  @override
  State<CreateMatches> createState() => _CreateMatchesState();
}

class _CreateMatchesState extends State<CreateMatches> {
  int initalPlayerValue = 5;
  double initalOverValue = 10.0;
  final GlobalKey<FormState> _createFormKey = GlobalKey<FormState>();
  final TextEditingController teamAController = TextEditingController();
  final TextEditingController teamBController = TextEditingController();
  final TextEditingController playersController = TextEditingController();
  final TextEditingController oversController = TextEditingController();

  @override
  void initState() {
    super.initState();
    playersController.text = initalPlayerValue.toString();
    oversController.text = initalOverValue.toString();
  }

  @override
  void dispose() {
    teamAController.dispose();
    teamBController.dispose();
    playersController.dispose();
    oversController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          "Create a Match",
          style: TextTheme.of(context).headlineSmall?.copyWith(
            color: AppColors.primaryColor,
            fontSize: 20,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _createFormKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      // Rounded corners
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.accentColor.withAlpha(25),
                      border: Border.all(color: Colors.white70, width: 2),
                    ),

                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 30,
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              //left Side
                              _teamInfoColumn(
                                context,
                                "Team A",
                                "Enter Name",
                                "Sudurpachim Royals",
                                teamAController,
                              ),
                              SizedBox(width: 5),
                              _teamInfoColumn(
                                context,
                                "Team B",
                                "Enter Name",
                                "Kathmandu Gorkhas",
                                teamBController,
                              ), //Right side
                            ],
                          ),
                          SizedBox(height: 30),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      if (initalPlayerValue > 1) {
                                        initalPlayerValue--;
                                        playersController.text =
                                            initalPlayerValue.toString();
                                      }
                                    });
                                  },
                                  icon: Icon(Icons.remove),
                                ),

                                _numberDisabledForm(
                                  context,
                                  playersController,
                                  "Number of Player",
                                ),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      if (initalPlayerValue < 11) {
                                        initalPlayerValue++;
                                        playersController.text =
                                            initalPlayerValue.toString();
                                      }
                                    });
                                  },
                                  icon: Icon(Icons.add),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      // Rounded corners
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.accentColor.withAlpha(25),
                      border: Border.all(color: Colors.white70, width: 2),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 40,
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              //I will add this when needed
                              // IconButton(
                              //   onPressed: () {
                              //     setState(() {
                              //       if (initalOverValue > 1) {
                              //         initalOverValue -= 1;
                              //         oversController.text = initalOverValue
                              //             .toString();
                              //       }
                              //     });
                              //   },
                              //   icon: Icon(Icons.remove),
                              // ),
                              _numberDisabledForm(
                                context,
                                oversController,
                                "Number of Overs",
                              ),
                              //I will add this when needed
                              // IconButton(
                              //   onPressed: () {
                              //     setState(() {
                              //       if (initalOverValue < 50.0) {
                              //         initalOverValue++;
                              //         oversController.text = initalOverValue
                              //             .toString();
                              //       }
                              //     });
                              //   },
                              //   icon: Icon(Icons.add),
                              // ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              _overChip(context, "5", () {
                                setState(() {
                                  oversController.text = 5.0.toString();
                                });
                              }),
                              _overChip(context, "10", () {
                                setState(() {
                                  oversController.text = 10.0.toString();
                                });
                              }),
                              _overChip(context, "20", () {
                                setState(() {
                                  oversController.text = 20.0.toString();
                                });
                              }),
                              _overChip(context, "50", () {
                                setState(() {
                                  oversController.text = 50.0.toString();
                                });
                              }),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.sports_cricket, size: 22),
                    label: Text(
                      "Create a Match",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(
                        horizontal: 50,
                        vertical: 14,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      elevation: 0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget _overChip(BuildContext context, String label, void Function()? onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Chip(
      elevation: 0,
      label: Text(
        label,
        style: TextTheme.of(context).labelLarge?.copyWith(
          fontWeight: FontWeight.w600,
          color: AppColors.white,
        ),
      ),
      backgroundColor: AppColors.primaryColor,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
    ),
  );
}

Widget _numberDisabledForm(
  BuildContext context,
  TextEditingController controller,
  String label,
) {
  return SizedBox(
    width: 160,
    child: TextFormField(
      controller: controller,
      textAlign: TextAlign.center,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextTheme.of(
          context,
        ).labelMedium?.copyWith(fontWeight: FontWeight.w600),
        hintStyle: TextStyle(color: Colors.grey[500]),
        filled: true,
        fillColor: Colors.grey[100],
        contentPadding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 20,
        ),
        enabled: false,
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.primaryColor),
        ),
      ),
      style: TextStyle(
        fontSize: 20,
        color: Colors.black87,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}

Widget _teamInfoColumn(
  BuildContext context,
  String title,
  String inputLabel,
  String hintText,
  TextEditingController controller,
) {
  return Column(
    children: [
      Text(
        title,
        style: TextTheme.of(context).headlineSmall?.copyWith(
          color: AppColors.primaryColor,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(height: 10),
      SizedBox(
        width: 180,
        child: TextFormField(
          // controller: teamAController,
          decoration: InputDecoration(
            labelText: inputLabel,
            labelStyle: TextTheme.of(
              context,
            ).labelMedium?.copyWith(fontWeight: FontWeight.w600),
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey[500]),
            filled: true,
            fillColor: Colors.grey[100],
            contentPadding: const EdgeInsets.symmetric(
              vertical: 16,
              horizontal: 20,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: AppColors.primaryColor),
            ),
          ),
          style: TextStyle(
            fontSize: 16,
            color: Colors.black87,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    ],
  );
}
