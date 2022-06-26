import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core_utils/core_utils.dart';
import 'widgets/brightness_toggle.dart';
import 'widgets/color_picker.dart';

class SettingScreen extends StatefulWidget {
  SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool darkModeEnable = false;
  List<bool> isSelected = [false, false, false];

  @override
  void initState() {
    super.initState();
    final themeMode = getApplicationThemeMode();
    isSelected[themeMode.index] = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
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
                const SizedBox(height: 4.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('Theme mode'),
                    BrightnessToggle(),
                  ],
                ),
                const SizedBox(height: 4.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Color'),
                    ColorPicker(),
                  ],
                ),
                const SizedBox(height: 4.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Application language'),
                    DropdownButton<String>(
                      value: 'English',
                      items:
                          <String>['English', 'Vietnamese'].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (_) {},
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
