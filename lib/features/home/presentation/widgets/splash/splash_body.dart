import 'package:buon_appetito/core/router/routes.dart';
import 'package:buon_appetito/features/cart/presentation/bloc/cart_bloc.dart' as cart_bloc;
import 'package:buon_appetito/features/home/presentation/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:buon_appetito/core/utils/variables.dart';

class SplashBody extends StatefulWidget {
  const SplashBody({Key? key}) : super(key: key);

  @override
  State<SplashBody> createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody> {
  bool shouldAdvance = false;

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 500), () {
      BlocProvider.of<HomeBloc>(context).add(LoadPizzasEvent());
    });
    Future.delayed(const Duration(seconds: 2), () {
      if (shouldAdvance) Navigator.of(context).pushReplacementNamed(homePageRoute);
      shouldAdvance = true;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state is Loading) {
        } else if (state is LoadPizzasSuccess) {
          BlocProvider.of<cart_bloc.CartBloc>(context).add(cart_bloc.LoadCartEvent());
        }
      },
      builder: (context, state) {
        return BlocConsumer<cart_bloc.CartBloc, cart_bloc.CartState>(
          listener: (context, state) {
            if (state is cart_bloc.LoadCartSuccess) {
              if (shouldAdvance) Navigator.of(context).pushReplacementNamed(homePageRoute);
              shouldAdvance = true;
            }
          },
          builder: (context, state) {
            return SafeArea(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      appName,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 32.0,
                      ),
                    ),
                    Image.asset(
                      'assets/images/splash_pizza.jpg',
                      height: MediaQuery.of(context).size.height * .4,
                    ),
                    Text(
                      AppLocalizations.of(context)!.splashMessage,
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontStyle: FontStyle.italic,
                        fontSize: 20.0,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
