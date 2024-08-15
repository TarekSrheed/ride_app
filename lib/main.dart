import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rideshare_app/core/bloc_manager/app_manager_bloc.dart';
import 'package:rideshare_app/core/config/service_locater.dart';
import 'package:rideshare_app/features/view/bloc/auth_bloc/auth_bloc.dart';
import 'package:rideshare_app/features/view/pages/onboarding_view.dart';
import 'package:rideshare_app/features/view/pages/welcome_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        
        BlocProvider(
          create: (context) => core.get<AuthBloc>(),
        ),
        BlocProvider(
          create: (context) => AppManagerBloc()..add(CheckAuthorized()),
        )
      ],
      child: MaterialApp(
        home: BlocBuilder<AppManagerBloc, AppManagerState>(
          builder: (context, state) {
            switch (state) {
              case NavigateToMainPage():
                return WelcomView();
              case NavigateToOffline():
                return oflinePage();

              default:
                return LoginPage();
            }
          },
        ),
        // home: const ResponiveLayout(
        //   mobileBody: ModileBody(),
        //   desktopBody: DesktopBody(),
        // ),
      ),
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
