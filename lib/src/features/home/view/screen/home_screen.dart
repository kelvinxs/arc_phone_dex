import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  static const routeName = "home";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return _ScreenPage();
  }
}

class _ScreenPage extends ConsumerStatefulWidget {
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ScreenPageState();
}

class _ScreenPageState extends ConsumerState<_ScreenPage> {
  @override
  Widget build(BuildContext context) {
    return PlatformScaffold();
  }
}
