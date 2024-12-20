import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../routing/routes.dart';
import '../../../state/connectivity/connectivity_store.dart';
import '../../../state/connectivity/widgets/connectivity_builder.dart';
import '../../../styles/styles.dart';

class ConectionFailureScreen extends StatelessWidget {
  const ConectionFailureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Styles(:colors, :text) = context.styles;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.wifi_off, size: 100),
              Text(
                'Something went wrong!',
                style: text.bodyLarge.copyWith(
                  color: colors.bodyLight,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 100,
        child: Center(
          child: ConnectivityBuilder(
            builder: (context, status, child) {
              if (status == ConnectivityStatuses.connected) {
                return TextButton(
                  onPressed: () {
                    context.go(Routes.products);
                  },
                  child: Text('Go Home'),
                );
              }
              return Text(
                'Checking connection...',
                style: text.bodyMedium.copyWith(
                  color: colors.bodyLight,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
