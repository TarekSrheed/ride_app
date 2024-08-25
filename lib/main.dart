import 'package:flutter/material.dart';
import 'package:rideshare_app/core/config/service_locater.dart';
<<<<<<< HEAD
import 'package:rideshare_app/core/responive/desktop_body.dart';
import 'package:rideshare_app/core/responive/modile_body.dart';
import 'package:rideshare_app/core/responive/responive_layout.dart';
=======
import 'package:rideshare_app/features/view/bloc/auth_bloc/auth_bloc.dart';
import 'package:rideshare_app/features/view/pages/Transport/select_transport.dart';
import 'package:rideshare_app/features/view/pages/authentication/sign_in.dart';
import 'package:rideshare_app/features/view/pages/authentication/sing_up_view.dart';
import 'package:rideshare_app/features/view/pages/onboarding/onboarding_view.dart';
import 'package:rideshare_app/features/view/pages/authentication/welcome_view.dart';
>>>>>>> 754d5ae7bccc02137f2eb8df2fa5bc6f5d950513

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return const MaterialApp(
      home: ResponiveLayout(
        mobileBody: ModileBody(),
        desktopBody: DesktopBody(),
=======
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
                return SelectTransport();
              case NavigateToOffline():
                return oflinePage();
              default:
                return SingInView();
            }
          },
        ),
        // home: const ResponiveLayout(
        //   mobileBody: ModileBody(),
        //   desktopBody: DesktopBody(),
        // ),
>>>>>>> 754d5ae7bccc02137f2eb8df2fa5bc6f5d950513
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

class oflinePage extends StatelessWidget {
  const oflinePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
