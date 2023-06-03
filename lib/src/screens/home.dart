import 'package:bramble_project/src/states/app_state.dart';
import 'package:bramble_project/src/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/bramble_list.dart';
import '../widgets/refresh_indicator.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Consumer<ApplicationState>(
      builder: (context, appState, child) => RefreshIndicatorBramble(
        onRefresh: () async {
          await appState.addToList();
        },
        child: LoadingSpinner(
            loading: appState.loading!,
            child: BrambleList(
              brambleList: appState.brambleList,
            )),
      ),
    );
  }
}
