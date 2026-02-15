import 'package:cherry/core/color.theme.dart';
import 'package:flutter/material.dart';

class CreateMatches extends StatefulWidget {
  const CreateMatches({super.key});

  @override
  State<CreateMatches> createState() => _CreateMatchesState();
}

class _CreateMatchesState extends State<CreateMatches> {
  final _teamNameKey = GlobalKey<FormState>();
  final TextEditingController teamATextController = TextEditingController();
  final TextEditingController teamBTextController = TextEditingController();

  int playersA = 11;
  int playersB = 11;
  int overs = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          "Create A Match",
          style: TextTheme.of(
            context,
          ).headlineSmall?.copyWith(fontWeight: FontWeight.bold),
        ),
        actionsPadding: EdgeInsets.all(10),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.settings))],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Container(
              decoration: BoxDecoration(border: Border.all()),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10,
                ),
                child: Form(
                  key: _teamNameKey,
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 40,
                            backgroundColor: AppColors.primaryColor,
                            child: Text(
                              "A",
                              style: TextTheme.of(context).headlineLarge!
                                  .copyWith(
                                    color: AppColors.backgroundColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                          Text(teamATextController.text),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.remove),
                              ),
                              SizedBox(
                                width: 90,
                                child: TextFormField(
                                  textAlign: TextAlign.center,
                                  decoration: const InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                      vertical: 8,
                                      horizontal: 4,
                                    ),
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.add),
                              ),
                            ],
                          ),
                        ],
                      ),

                      //For B
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 40,
                            backgroundColor: AppColors.primaryColor,
                            child: Text(
                              "B",
                              style: TextTheme.of(context).headlineLarge!
                                  .copyWith(
                                    color: AppColors.backgroundColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                          Text(teamATextController.text),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.remove),
                              ),
                              SizedBox(
                                width: 90,
                                child: TextFormField(
                                  textAlign: TextAlign.center,
                                  decoration: const InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                      vertical: 8,
                                      horizontal: 4,
                                    ),
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.add),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
