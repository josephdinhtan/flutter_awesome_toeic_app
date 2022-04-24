import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_toeic_quiz2/view_model/home_screen_cubit/home_screen_cubit.dart';

import '../../../../main.dart';
import '../../widgets/neumorphism_button.dart';

class SettingScreen extends StatefulWidget {
  SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool darkModeEnable = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 4.0),
            const SizedBox(height: 4.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: NeumorphismButton(child: Text('A. this is a correct answer'),),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: NeumorphismButton(child: Text('B. this is a correct answer'),),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: NeumorphismButton(child: Text('C. this is a correct answer'),),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: NeumorphismButton(child: Text('D. this is a correct answer'),),
            ),
            const SizedBox(height: 4.0),
            SettingCard(
              children: [
                Text(
                  'Account',
                  //style: kTextStyleTestItemH2,
                ),
                const SizedBox(height: 15.0),
                Row(
                  children: [
                    Container(
                      width: 70.0,
                      height: 70.0,
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(50.0)),
                          border: Border.all(color: Colors.yellow)),
                    ),
                    const SizedBox(width: 20.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Littlepea'),
                        const Text('View your profile')
                      ],
                    )
                  ],
                ),
                TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.shopping_cart_outlined),
                    label: Text('Purchase' /*, style: kTextStyleSettingsH2*/)),
              ],
            ),
            SettingCard(
              children: [
                Text('User interface' /*, style: kTextStyleSettingsH1*/),
                const SizedBox(height: 8.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Dark mode' /*, style: kTextStyleSettingsH2*/),
                        const Text('Enable dark mode'),
                      ],
                    ),
                    Switch(
                      value: darkModeEnable,
                      onChanged: (value) {
                        setState(() {
                          darkModeEnable = value;
                          if (darkModeEnable) {
                            //MyApp.of(context).changeTheme(ThemeMode.dark);
                            BlocProvider.of<HomeScreenCubit>(context).changeTheme(ThemeMode.dark);
                          } else {

                            BlocProvider.of<HomeScreenCubit>(context).changeTheme(ThemeMode.light);
                          }
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 8.0),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      alignment: Alignment.centerLeft),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                          'Application language' /*, style: kTextStyleSettingsH2*/),
                      Text('English'),
                    ],
                  ),
                ),
                const SizedBox(height: 8.0),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      alignment: Alignment.centerLeft),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('Native language' /*, style: kTextStyleSettingsH2*/),
                      Text('English'),
                    ],
                  ),
                ),
              ],
            ),
            SettingCard(
              children: [
                Text(
                  'Setting notification',
                  /* style: kTextStyleSettingsH2,*/
                ),
                const SizedBox(height: 20.0),
                const Text('Setting daily notification'),
                const SizedBox(height: 10.0),
                const Text('08:15 PM'),
              ],
            ),
            SettingCard(
              children: [
                Text(
                  'Community',
                  /*style: kTextStyleSettingsH1,*/
                ),
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.star_rate_outlined),
                  label: Text(
                    'Rate us 5 star', /* style: kTextStyleSettingsH1*/
                  ),
                ),
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.speaker_notes_rounded),
                  label: Text(
                    'Feedback', /*style: kTextStyleSettingsH1*/
                  ),
                ),
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.share_rounded),
                  label: Text(
                    'Share', /* style: kTextStyleSettingsH1*/
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // Navigator.push(
                      //     context,
                      //     CupertinoPageRoute(
                      //       builder: (context) => FirebaseScreen(),
                      //     ));
                    },
                    icon: const Icon(Icons.data_saver_off),
                    label: const Text(
                      'Check firebase Storage (Admin only)',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4.0),
          ],
        ),
      ),
    );
  }
}

class SettingCard extends StatelessWidget {
  SettingCard({
    Key? key,
    required this.children,
  }) : super(key: key);

  List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 0.0, top: 2.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: children,
          ),
        ),
      ),
    );
  }
}
