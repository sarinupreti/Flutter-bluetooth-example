import 'package:bell_delivery_hub/authentication_bloc/authentication.dart';
import 'package:bell_delivery_hub/components/order_item.dart';
import 'package:bell_delivery_hub/modal/website_data.dart';
import 'package:bell_delivery_hub/order_bloc/order_bloc.dart';
import 'package:bell_delivery_hub/order_bloc/order_event.dart';
import 'package:bell_delivery_hub/order_bloc/order_state.dart';
import 'package:bell_delivery_hub/utils/dependency_injection.dart';
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
    // final screenHeight = MediaQuery.of(context).size.height;
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
                      Hero(
                        tag: "icon",
                        child: Container(
                            child: Container(
                          height: 200.flexibleHeight,
                          width: screenWidth,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.contain,
                                  alignment: Alignment.topCenter,
                                  image: NetworkImage(
                                    "https://coursemology.sg/wp-content/uploads/2020/04/learn-makeup.jpg",
                                  ))),
                          // child:
                        )),
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
                  30.verticalSpace,
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
                padding: const EdgeInsets.all(20.0),
                child: FloatingActionButton.extended(
                  isExtended: true,
                  elevation: 2,
                  backgroundColor: context.theme.corePalatte.primaryColor,
                  icon: Center(
                    child: Row(
                      children: [
                        Icon(
                          Icons.logout,
                          color: context.theme.corePalatte.white,
                          size: 20.flexibleFontSize,
                        ),
                      ],
                    ),
                  ),
                  onPressed: () {
                    inject<AuthenticationBloc>().add(UserLoggedOut());
                  },
                  label: Text(
                    "Sign out",
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1
                        .copyWith(color: context.theme.corePalatte.white),
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
        title: Hero(
            tag: "icon",
            child: WebsafeSvg.asset("assets/images/logo_app_bar.svg")),
      ),
      body: BlocConsumer<OrderBloc, OrderState>(
        cubit: inject<OrderBloc>(),
        listener: (context, state) {},
        builder: (context, state) {
          if (state is OrderSuccess) {
            return ListView.builder(
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
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
