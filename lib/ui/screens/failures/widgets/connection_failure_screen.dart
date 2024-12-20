import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../routing/routes.dart';
import '../../../state/connectivity/connectivity_store.dart';
import '../../../state/connectivity/widgets/connectivity_builder.dart';
import '../../../styles/styles.dart';
import '../../../widgets/illustraction.dart';

class ConnectionFailureScreen extends StatelessWidget {
  const ConnectionFailureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Styles(:colors, :text) = context.styles;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Illustraction(
                name: 'connection_failed',
                width: 160.0,
                height: 160.0,
              ),
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
