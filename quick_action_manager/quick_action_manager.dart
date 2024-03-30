import 'package:flutter/material.dart';
import 'package:quick_actions/quick_actions.dart';

// WARNING : Make Sure To Add quick_actions in your pubspec.yaml file

class QuickActionManager {
  late QuickActions quickAction;

  Future<void> initQuickAction({required BuildContext context}) async {
    quickAction = const QuickActions();
    quickAction.initialize((shortcutType) {
      if (shortcutType == 'action_main') {
        // Add Your Code Here
        // Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
      } else if (shortcutType == 'action_help') {
        // Add Your Code Here
        // Navigator.push(context, MaterialPageRoute(builder: (context) => const HelpScreen()));
      }
    });
  }

  void setShortcutItems() {
    quickAction.setShortcutItems(<ShortcutItem>[
      const ShortcutItem(
          type: 'action_main', localizedTitle: 'Main view', icon: 'icon_main'),
      const ShortcutItem(
          type: 'action_help', localizedTitle: 'Help', icon: 'icon_help')
    ]);
  }
}
