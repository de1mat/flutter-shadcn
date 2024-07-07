import 'package:example/pages/docs/components/tabs/tabs_example_1.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';

import '../../widget_usage_example.dart';
import '../component_page.dart';

class TabsExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ComponentPage(
      name: 'tabs',
      description: 'A list of tabs for selecting a single item.',
      displayName: 'Tabs',
      children: [
        WidgetUsageExample(
          title: 'Tabs Example',
          child: TabsExample1(),
          path: 'lib/pages/docs/components/tabs/tabs_example_1.dart',
        ),
      ],
    );
  }
}
