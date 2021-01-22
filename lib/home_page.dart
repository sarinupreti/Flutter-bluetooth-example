import 'package:bell_delivery_hub/components/order_item.dart';
import 'package:bell_delivery_hub/modal/website_data.dart';
import 'package:bell_delivery_hub/order_bloc/order_bloc.dart';
import 'package:bell_delivery_hub/order_bloc/order_event.dart';
import 'package:bell_delivery_hub/order_bloc/order_state.dart';
import 'package:bell_delivery_hub/utils/dependency_injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:websafe_svg/websafe_svg.dart';

class HomePage extends StatefulWidget {
  final WebsiteData websiteData;

  const HomePage({Key key, this.websiteData}) : super(key: key);

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
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: WebsafeSvg.asset("assets/images/logo_app_bar.svg"),
      ),
      body: BlocConsumer<OrderBloc, OrderState>(
        cubit: inject<OrderBloc>(),
        listener: (context, state) {
          // TODO: implement listener
          print("WTF:$state");
        },
        builder: (context, state) {
          if (state is OrderSuccess) {
            return ListView.builder(
              itemCount: state.orders.length,
              itemBuilder: (BuildContext context, int index) {
                final orderData = state.orders[index];

                return OrderItem(
                  data: orderData,
                  amount: "${orderData.total} ${orderData.currency}.",
                  date: (orderData.dateCompleted).toString(),
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
