import 'package:bots_demo/blocs/authentication_bloc/authentication.dart';
import 'package:bots_demo/blocs/wallet_bloc/wallet_bloc.dart';
import 'package:bots_demo/components/add_fund_bottomsheet.dart';
import 'package:bots_demo/components/custom_shimmer.dart';
import 'package:bots_demo/utils/dependency_injection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bots_demo/extensions/string_extension.dart';
import 'package:bots_demo/extensions/number_extensions.dart';
import 'package:bots_demo/extensions/context_extension.dart';
import 'package:shimmer/shimmer.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    getWalletData();
    super.initState();
  }

  getWalletData() {
    inject<WalletBloc>().add(GetWalletBalance());
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return BlocConsumer<AuthenticationBloc, AuthenticationState>(
      cubit: inject<AuthenticationBloc>(),
      listener: (context, state) {},
      builder: (context, state) {
        return state is AuthenticationAuthenticated
            ? Scaffold(
                appBar: AppBar(
                  automaticallyImplyLeading: false,
                  centerTitle: false,
                  elevation: 0,
                  title: Text(
                    "Hello ${state.user.name}, ",
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ),
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      BlocConsumer<WalletBloc, WalletState>(
                        cubit: inject<WalletBloc>(),
                        listener: (context, state) {},
                        builder: (context, state) {
                          return state is WalletSuccess
                              ? Container(
                                  width: screenWidth,
                                  height: screenHeight / 8,
                                  decoration: BoxDecoration(
                                    color: context.theme.surface,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: context.theme.themeType
                                            ? Colors.transparent
                                            : Colors.grey[300].withOpacity(0.5),
                                        spreadRadius: 2,
                                        blurRadius: 20,
                                        offset: Offset(
                                            0, 3), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  margin: EdgeInsets.all(15),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 15.flexibleWidth,
                                        vertical: 10.flexibleHeight),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("Your Wallet balance",
                                            style: Theme.of(context)
                                                .textTheme
                                                .subtitle1
                                                .copyWith(
                                                    color:
                                                        context.theme.textColor,
                                                    fontSize:
                                                        16.flexibleFontSize)),
                                        Text(
                                            "USD " +
                                                "${state.walletData.balance.toString()}"
                                                    .moneyFormat(),
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline2
                                                .copyWith(
                                                    color:
                                                        context.theme.textColor,
                                                    fontSize:
                                                        26.flexibleFontSize)),
                                        Text(
                                            "LAST UPDATED : " +
                                                "${state.walletData.updatedAt.toString()}"
                                                    .convertTimeStamp(),
                                            style: Theme.of(context)
                                                .textTheme
                                                .subtitle1
                                                .copyWith(
                                                    color: context.theme
                                                        .corePalatte.greyColor,
                                                    fontSize:
                                                        11.flexibleFontSize)),
                                      ],
                                    ),
                                  ),
                                )
                              : Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: CustomShimmer(
                                    width: screenWidth,
                                    height: screenHeight / 8,
                                  ),
                                );
                        },
                      ),
                      GestureDetector(
                        onTap: () {
                          AddFundBottomSheet.showSheet(context: context);
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 15.flexibleWidth),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text("Add money to wallet",
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1
                                    .copyWith(
                                        color: context.theme.themeType
                                            ? context.theme.textColor
                                            : context
                                                .theme.corePalatte.greyColor,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16.flexibleFontSize)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : CircularProgressIndicator();
      },
    );
  }
}
