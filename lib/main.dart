import 'package:flutter/material.dart';
import 'package:rideshare_app/core/config/service_locater.dart';
import 'package:rideshare_app/core/responive/desktop_body.dart';
import 'package:rideshare_app/core/responive/modile_body.dart';
import 'package:rideshare_app/core/responive/responive_layout.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ResponiveLayout(
        mobileBody: ModileBody(),
        desktopBody: DesktopBody(),
      ),
      // return MultiBlocProvider(
      //   providers: [
      //     BlocProvider(
      //       create: (context) => core.get<AuthBloc>(),
      //     ),
      //     BlocProvider(
      //       create: (context) => AppManagerBloc()..add(CheckAuthorized()),
      //     )
      //   ],
      //   child: MaterialApp(
      //     home: BlocBuilder<AppManagerBloc, AppManagerState>(
      //       builder: (context, state) {
      //         switch (state) {
      //           case NavigateToMainPage():
      //             return const WelcomView();
      //           case NavigateToOffline():
      //             return const oflinePage();

      //           default:
      //             return const LoginPage();
      //         }
      //       },
      //     ),
    );
  }
}

class homepage extends StatelessWidget {
  const homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Home page'),
      ),
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Home page'),
      ),
    );
  }
}

class oflinePage extends StatelessWidget {
  const oflinePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
