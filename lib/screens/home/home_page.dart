import 'package:bots_demo/components/add_fund_bottomsheet.dart';
import 'package:bots_demo/components/custom_drawer.dart';
import 'package:bots_demo/components/custom_shimmer.dart';
import 'package:bots_demo/blocs/authentication_bloc/authentication.dart';
import 'package:bots_demo/blocs/transaction_bloc/transaction_bloc.dart';
import 'package:bots_demo/blocs/wallet_bloc/wallet_bloc.dart';
import 'package:bots_demo/components/title_widget.dart';
import 'package:bots_demo/components/transfer_money_bottomsheet.dart';
import 'package:bots_demo/modal/transaction/transaction.dart';
import 'package:bots_demo/screens/chart/simple_line_chart.dart';
import 'package:bots_demo/utils/dependency_injection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bots_demo/extensions/string_extension.dart';
import 'package:bots_demo/extensions/number_extensions.dart';
import 'package:bots_demo/extensions/context_extension.dart';
import 'package:bots_demo/extensions/flash_util.dart';

import 'package:charts_flutter/flutter.dart' as charts;

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    getWalletData();
    getTransactionHistory();
    super.initState();
  }

  getWalletData() {
    inject<WalletBloc>().add(GetWalletBalance());
  }

  getTransactionHistory() {
    inject<TransactionBloc>().add(TransactionEvent.fetchHistory());
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
                drawer: CustomDrawer(screenWidth: screenWidth),
                appBar: AppBar(
                  automaticallyImplyLeading: false,
                  centerTitle: false,
                  elevation: 0,
                  title: Text(
                    "Hello ${state.user.name}, ",
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ),
                floatingActionButton: FloatingActionButton(
                  backgroundColor: context.theme.corePalatte.primaryColor,
                  onPressed: () {
                    return TransferMoneyBottomSheet.showSheet(context: context);
                  },
                  child: Text(
                    "Pay",
                    style: Theme.of(context).textTheme.subtitle1.copyWith(
                        color: context.theme.themeType
                            ? context.theme.textColor
                            : context.theme.success),
                  ),
                ),
                body: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      walletView(screenWidth, screenHeight),
                      TitleWidget(
                        title: "Add money to wallet",
                        titleAlignment: Alignment.centerRight,
                        onTap: () {
                          AddFundBottomSheet.showSheet(context: context);
                        },
                      ),
                      30.verticalSpace,
                      TitleWidget(
                        title: "Transactions this week",
                      ),
                      30.verticalSpace,
                      simpleLineChart(screenHeight, screenWidth),
                    ],
                  ),
                ),
              )
            : CircularProgressIndicator();
      },
    );
  }

  simpleLineChart(double screenHeight, double screenWidth) {
    return BlocConsumer<TransactionBloc, TransactionState>(
      cubit: inject<TransactionBloc>(),
      listener: (context, state) {},
      builder: (context, state) {
        return state.map(
            initial: (value) => SizedBox(),
            loading: (value) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: CustomShimmer(
                    height: screenHeight / 2,
                    width: screenWidth,
                  ),
                ),
            success: (value) => Container(
                height: screenHeight / 2,
                child: GestureDetector(
                  onTap: () {
                    context.showMessage(value.toString(), false);
                  },
                  child: SimpleLineChart(
                    lineChartData(value.history),
                    animate: true,
                  ),
                )),
            failure: (value) => Text(value.message));
      },
    );
  }

  static List<charts.Series<LinearSales, int>> lineChartData(
      List<TransactionHistory> transactionData) {
    final data = transactionData
        .map((e) => LinearSales(e.createdAt.returnMonth(), e.walletBalance))
        .toList();

    return [
      new charts.Series<LinearSales, int>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (LinearSales sales, _) => int.parse(sales.year),
        measureFn: (LinearSales sales, _) => sales.sales,
        data: data,
      )
    ];
  }

  walletView(double screenWidth, double screenHeight) {
    return BlocConsumer<WalletBloc, WalletState>(
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
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                margin: EdgeInsets.all(15),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 15.flexibleWidth,
                      vertical: 10.flexibleHeight),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Your Wallet balance",
                          style: Theme.of(context).textTheme.subtitle1.copyWith(
                              color: context.theme.textColor,
                              fontSize: 16.flexibleFontSize)),
                      Text(
                          "USD " +
                              "${state.walletData.balance.toString()}"
                                  .moneyFormat(),
                          style: Theme.of(context).textTheme.headline2.copyWith(
                              color: context.theme.textColor,
                              fontSize: 26.flexibleFontSize)),
                      Text(
                          "LAST UPDATED : " +
                              "${state.walletData.updatedAt.toString()}"
                                  .convertTimeStamp(),
                          style: Theme.of(context).textTheme.subtitle1.copyWith(
                              color: context.theme.corePalatte.greyColor,
                              fontSize: 11.flexibleFontSize)),
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
    );
  }
}
