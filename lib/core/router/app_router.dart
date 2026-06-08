import 'package:apex/features/auth/presentation/pages/home_page.dart';
import 'package:apex/features/auth/presentation/pages/login_with_google.dart';
import 'package:apex/features/auth/presentation/pages/wrapper.dart';
import 'package:apex/pages/signup_page.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: "/",
  // redirect: (context, state) {
  //   final authBloc = context.read<AuthBloc>().state;

  //   if(authBloc is AuthAuthenticatedState){
  //     return "/homePage";
  //   }
  //   if(authBloc is AuthUnauthenticatedState){
  //     return "/";
  //   }
  //   if(authBloc is AuthCheckConnectionState){
  //     return "/CheckConnectionS";
  //   }
  //   return "/";
  // },

  routes: [
    GoRoute(path: "/" , builder: (context, state) => Wrapper()),
    GoRoute(path: "/loginWithGoogle" , builder: (context, state) => LoginWithGoogle()),
    GoRoute(path: "/homePage" , builder: (context, state) => HomePage()),
    GoRoute(path: "/signUpPage" , builder: (context, state) => SignupPage()),
  ]
  );