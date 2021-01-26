import 'dart:io';

import 'package:bell_delivery_hub/authentication_bloc/authentication.dart';
import 'package:bell_delivery_hub/components/order_item.dart';
import 'package:bell_delivery_hub/modal/website_data.dart';
import 'package:bell_delivery_hub/order_bloc/order_bloc.dart';
import 'package:bell_delivery_hub/order_bloc/order_event.dart';
import 'package:bell_delivery_hub/order_bloc/order_state.dart';
import 'package:bell_delivery_hub/utils/dependency_injection.dart';
import 'package:cached_network_image/cached_network_image.dart';
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
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Container(
                          child: Container(
                        height: 150.flexibleHeight,
                        width: screenWidth,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                alignment: Alignment.topCenter,
                                image: NetworkImage(
                                  "https://coursemology.sg/wp-content/uploads/2020/04/learn-makeup.jpg",
                                ))),
                        // child:
                      )),
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
                  Center(
                    child: Text("Welcome to BelaOryx",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline6.copyWith(
                            color: context.theme.textColor,
                            fontSize: 16.flexibleFontSize,
                            fontWeight: FontWeight.w600)),
                  ),
                  Center(
                    child: Text("www.belaoryx.com",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline6.copyWith(
                            color: context.theme.corePalatte.primaryColor,
                            fontSize: 14.flexibleFontSize,
                            fontWeight: FontWeight.normal)),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Text(
                  "Sign out",
                  textAlign: TextAlign.left,
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1
                      .copyWith(color: context.theme.corePalatte.errorColor),
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
      body: RefreshIndicator(
        onRefresh: () async {
          await getAllOrders();
        },
        child: BlocConsumer<OrderBloc, OrderState>(
          cubit: inject<OrderBloc>(),
          listener: (context, state) {},
          builder: (context, state) {
            if (state is OrderSuccess) {
              return state.orders != null && state.orders.length == 0
                  ? Container(
                      child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(
                            child: WebsafeSvg.asset(
                          "assets/images/empty_cart.svg",
                          height: screenHeight / 4,
                          width: screenWidth / 2,
                        )),
                        20.verticalSpace,
                        Text("No orders at the moment.",
                            style: Theme.of(context).textTheme.headline6)
                      ],
                    ))
                  : ListView.builder(
                      itemCount: state.orders.length,
                      itemBuilder: (BuildContext context, int index) {
                        final orderData = state.orders[index];

                        return OrderItem(
                          data: orderData,
                          amount: "${orderData.total} ${orderData.currency}.",
                          date: (orderData.date_created).toString(),
                          imageUrl:
                              "https://images.unsplash.com/photo-1512436991641-6745cdb1723f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80",
                          orderId: "Order Id : ${orderData.id}",
                        );
                      },
                    );
            } else {
              return Center(
                  child: Platform.isAndroid
                      ? CircularProgressIndicator()
                      : CupertinoActivityIndicator());
            }
          },
        ),
      ),
    );
  }
}
