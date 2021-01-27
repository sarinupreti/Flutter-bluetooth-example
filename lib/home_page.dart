import 'package:bell_delivery_hub/authentication_bloc/authentication.dart';
import 'package:bell_delivery_hub/components/order_item.dart';
import 'package:bell_delivery_hub/modal/order/order.dart';
import 'package:bell_delivery_hub/modal/website_data.dart';
import 'package:bell_delivery_hub/order_bloc/order_bloc.dart';
import 'package:bell_delivery_hub/order_bloc/order_event.dart';
import 'package:bell_delivery_hub/order_bloc/order_state.dart';
import 'package:bell_delivery_hub/utils/dependency_injection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:websafe_svg/websafe_svg.dart';
import 'package:bell_delivery_hub/extensions/context_extension.dart';
import 'package:bell_delivery_hub/extensions/number_extensions.dart';

class HomePage extends StatefulWidget {
  final WebsiteData websiteData;
  final BuildContext context;

  const HomePage({Key key, this.websiteData, this.context}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Order> _orders = [];
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    getAllOrders();
    super.initState();
  }

  getAllOrders() {
    inject<OrderBloc>().add(GetAllOrders());
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      drawer: Drawer(
        child: Container(
          color: context.theme.background,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 150.flexibleHeight,
                        width: screenWidth,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                scale: 0.5,
                                alignment: Alignment.topCenter,
                                image: AssetImage(
                                  "assets/images/drawer.png",
                                ))),
                        // child:
                      ),
                      Positioned(
                        left: 20.flexibleHeight,
                        bottom: 10,
                        child: Container(
                          height: 100.flexibleHeight,
                          alignment: Alignment(0.0, 2.5),
                          child: CircleAvatar(
                            backgroundImage: AssetImage("assets/images/l.png"),
                            radius: 30.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                  50.verticalSpace,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 28.0),
                    child: Text("Welcome to BelaOryx",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline6.copyWith(
                            color: context.theme.textColor,
                            fontSize: 16.flexibleFontSize,
                            fontWeight: FontWeight.w600)),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 28.0),
                    child: Text("www.belaoryx.com",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline6.copyWith(
                            color: context.theme.corePalatte.primaryColor,
                            fontSize: 14.flexibleFontSize,
                            fontWeight: FontWeight.normal)),
                  ),
                ],
              ),
              InkWell(
                onTap: () {
                  return inject<AuthenticationBloc>().add(UserLoggedOut());
                },
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Text(
                    "Sign out",
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1
                        .copyWith(color: context.theme.corePalatte.errorColor),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: WebsafeSvg.asset("assets/images/logo_app_bar.svg"),
      ),
      body: BlocConsumer<OrderBloc, OrderState>(
        cubit: inject<OrderBloc>(),
        listener: (context, state) {
          if (state is OrderLoading) {
            Scaffold.of(context)
                .showSnackBar(SnackBar(content: CupertinoActivityIndicator()));
          } else if (state is OrderSuccess && state.orders.isEmpty) {
            Scaffold.of(context)
                .showSnackBar(SnackBar(content: Text('No more orders')));
          } else if (state is OrderFailure) {
            Scaffold.of(context)
                .showSnackBar(SnackBar(content: Text(state.error)));
            context.bloc<OrderBloc>().isFetching = false;
          }
        },
        builder: (context, state) {
          if (state is OrderInitial ||
              state is OrderLoading && _orders.isEmpty) {
            return CircularProgressIndicator();
          } else if (state is OrderSuccess) {
            _orders.addAll(state.orders);
            context.bloc<OrderBloc>().isFetching = false;
            Scaffold.of(context).hideCurrentSnackBar();
          } else if (state is OrderFailure && _orders.isEmpty) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    context.bloc<OrderBloc>()
                      ..isFetching = true
                      ..add(GetAllOrders());
                  },
                  icon: Icon(Icons.refresh),
                ),
                const SizedBox(height: 15),
                Text(state.error, textAlign: TextAlign.center),
              ],
            );
          }
          return ListView.builder(
            controller: _scrollController
              ..addListener(() {
                if (_scrollController.offset ==
                        _scrollController.position.maxScrollExtent &&
                    !context.bloc<OrderBloc>().isFetching) {
                  context.bloc<OrderBloc>()
                    ..isFetching = true
                    ..add(GetAllOrders());
                }
              }),
            itemCount: _orders.length,
            itemBuilder: (BuildContext context, int index) {
              final orderData = _orders[index];

              return OrderItem(
                data: orderData,
                amount: "${orderData.total} ${orderData.currency}.",
                date: (orderData.date_created).toString(),
                orderId: "Order Id : ${orderData.id}",
              );
            },
          );
        },
      ),
    );
  }
}
