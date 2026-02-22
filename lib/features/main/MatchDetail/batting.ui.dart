// batting.dart
import 'package:cherry/core/color.theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Batting extends StatefulWidget {
  final String teamName;
  final int numberOfPlayer;
  const Batting({
    super.key,
    required this.teamName,
    required this.numberOfPlayer,
  });

  @override
  State<Batting> createState() => _BattingState();
}

class _BattingState extends State<Batting> {
  String firstBall = "4";
  String secondBall = "2";
  String thirdBall = "6";
  String forthBall = "1";
  String fifthBall = "W";
  String sixthBall = "4";
  TextEditingController stickerController = TextEditingController();
  TextEditingController nonStickerController = TextEditingController();
  TextEditingController runController = TextEditingController();

  final List<TextEditingController> _controllers = [];

  @override
  void initState() {
    super.initState();
    // Initialize controllers based on the number of players
    for (int i = 0; i < widget.numberOfPlayer; i++) {
      _controllers.add(TextEditingController());
    }
  }

  @override
  void dispose() {
    stickerController.dispose();
    nonStickerController.dispose();
    runController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              //Player Name add Player Name and Batter Status
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 15,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          widget.teamName,
                          style: TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 20),
                        CircleAvatar(
                          child: IconButton(
                            onPressed: () {
                              //here shoing the dialogbox in the enter the player name
                            },
                            icon: Icon(Icons.add),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    /// Striker
                    GestureDetector(
                      onTap: () {
                        //when i click to show player list
                      },
                      child: _textFormFiledWidget(
                        context,
                        "Batter One",
                        "Select Sticker",
                        false,
                        stickerController,
                      ),
                    ),
                    const SizedBox(height: 10),
                    GestureDetector(
                      onTap: () {
                        //when i click to show player list
                      },
                      child: _textFormFiledWidget(
                        context,
                        "Batter Two ",
                        "Select Sticker",
                        false,
                        nonStickerController,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 15),

              //this is the score part
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(color: Colors.black12, blurRadius: 10),
                  ],
                ),
                child: Column(
                  children: [
                    /// Score Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Column(
                          children: [
                            Text(
                              "120/3",
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text("Runs", style: TextStyle(color: Colors.grey)),
                          ],
                        ),
                        Column(
                          children: [
                            Text("15.2"),
                            Text("Overs", style: TextStyle(color: Colors.grey)),
                          ],
                        ),
                        Column(
                          children: [
                            Text("7.83"),
                            Text("CRR", style: TextStyle(color: Colors.grey)),
                          ],
                        ),
                        Column(
                          children: [
                            Text("8.50"),
                            Text("RRR", style: TextStyle(color: Colors.grey)),
                          ],
                        ),
                        Column(
                          children: [
                            Text("160"),
                            Text(
                              "Target",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ],
                    ),

                    const Divider(height: 30),

                    /// Bottom Stats
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text("4s: 8"),
                        Text("6s: 5"),
                        Text("Extras: 12"),
                        Text(
                          "Need 40 (28 balls)",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 15),
              // Cuttent over part
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 16),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(color: Colors.black12, blurRadius: 10),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Current Overs",
                      style: TextTheme.of(context).displaySmall!.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(child: Text(firstBall)),
                        CircleAvatar(child: Text(secondBall)),
                        CircleAvatar(child: Text(thirdBall)),
                        CircleAvatar(child: Text(forthBall)),
                        CircleAvatar(child: Text(fifthBall)),
                        CircleAvatar(child: Text(sixthBall)),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 15),

              // Run Buttons shortcuts like custimes 1, 2, 3
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 16),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(color: Colors.black12, blurRadius: 10),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Runs",
                      style: TextTheme.of(context).displaySmall!.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Wrap(
                      spacing: 3.0,
                      children: [
                        _chipWidget(
                          context,
                          "0",
                          AppColors.bodyTextColor,
                          () {},
                        ),
                        _chipWidget(
                          context,
                          "1",
                          AppColors.bodyTextColor,
                          () {},
                        ),
                        _chipWidget(
                          context,
                          "2",
                          AppColors.bodyTextColor,
                          () {},
                        ),
                        _chipWidget(
                          context,
                          "3",
                          AppColors.bodyTextColor,
                          () {},
                        ),
                        _chipWidget(context, "4", AppColors.success, () {}),
                        _chipWidget(context, "6", AppColors.success, () {}),

                        //this will be the chip with dialog box
                        InkWell(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text('Enter Run'),
                                  content: Form(
                                    child: TextFormField(
                                      controller: runController,
                                      keyboardType: TextInputType.number,
                                      decoration: const InputDecoration(
                                        hintText: 'Run',
                                        border: OutlineInputBorder(),
                                      ),
                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly,
                                      ],
                                    ),
                                  ),
                                  actions: [
                                    //This will close the dialog box
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text('Cancel'),
                                    ),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        elevation: 0,
                                        backgroundColor: AppColors.primaryColor,
                                        foregroundColor:
                                            AppColors.containerColor,
                                      ),
                                      onPressed: () {
                                        String value = runController.text;

                                        if (value.isNotEmpty) {
                                          Navigator.pop(
                                            context,
                                          ); // Close dialog
                                        }
                                      },
                                      child: const Text('Add'),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          child: Chip(
                            label: Text(
                              '... Run',
                              style: Theme.of(context).textTheme.labelLarge
                                  ?.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                            backgroundColor: AppColors.primaryColor,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 8,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        //TO this is dialog box
                        _chipWidget(context, "Wicket", AppColors.error, () {}),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),

              //Extras Section wher the wide wickt sand other extra things
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 16),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(color: Colors.black12, blurRadius: 10),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Extra",
                      style: TextTheme.of(context).displaySmall!.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Wrap(
                      spacing: 5,
                      children: [
                        _chipWidget(context, "W", AppColors.teal, () {}),
                        _chipWidget(context, "NB", AppColors.warning, () {}),
                        _chipWidget(context, "B", AppColors.amber, () {}),
                        _chipWidget(context, "LB", AppColors.brown, () {}),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _textFormFiledWidget(
  BuildContext context,
  String inputLabel,
  String hintText,
  bool isEnable,
  TextEditingController controller,
) {
  return TextFormField(
    controller: controller,
    enabled: isEnable,
    decoration: InputDecoration(
      labelText: inputLabel,
      labelStyle: TextTheme.of(
        context,
      ).labelMedium?.copyWith(fontWeight: FontWeight.w600),
      hintText: hintText,
      hintStyle: TextStyle(color: Colors.grey[500]),
      filled: true,
      fillColor: Colors.grey[100],
      contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: AppColors.primaryColor),
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
  );
}

Widget _chipWidget(
  BuildContext context,
  String runText,
  Color? backgroundColor,
  void Function()? onTap,
) {
  return InkWell(
    onTap: onTap,
    child: Chip(
      label: Text(
        '$runText Run',
        style: Theme.of(context).textTheme.labelLarge?.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
      backgroundColor: backgroundColor,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    ),
  );
}
