import 'package:bell_delivery_hub/components/Button.dart';
import 'package:bell_delivery_hub/components/settings_ui/settings_section.dart';
import 'package:bell_delivery_hub/globals/exveptions/login_error_modal.dart';
import 'package:bell_delivery_hub/modal/order/order.dart';
import 'package:bell_delivery_hub/order_bloc/order.dart';
import 'package:bell_delivery_hub/utils/dependency_injection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bell_delivery_hub/extensions/context_extension.dart';
import 'package:bell_delivery_hub/extensions/number_extensions.dart';
import 'package:bell_delivery_hub/extensions/flash_util.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderDetailsScreens extends StatefulWidget {
  final int orderId;
  final Order data;

  const OrderDetailsScreens({Key key, this.orderId, this.data})
      : super(key: key);

  @override
  _OrderDetailsScreensState createState() => _OrderDetailsScreensState();
}

class _OrderDetailsScreensState extends State<OrderDetailsScreens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text("Order Id: " + widget.orderId.toString()),
        actions: [],
      ),
      bottomNavigationBar: widget.data.status != "completed"
          ? Container(
              height: 90.flexibleHeight,
              color: context.theme.surface,
              child: BlocConsumer<OrderBloc, OrderState>(
                cubit: inject<OrderBloc>(),
                listener: (context, state) {
                  if (state is OderUpdatingSuccess) {
                    inject<OrderBloc>().add(GetAllOrders());

                    // context.showMessage("Order status has been updated", false);
                    ConnectStoreErrorModal.showErrorModal(
                        title: "Successful",
                        context: context,
                        isCustom: true,
                        message: "Order status has been updated");
                  }

                  if (state is OrderFailure) {
                    context.showMessage("${state.error}", true);
                  }
                },
                builder: (context, state) {
                  return Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Button(
                        color: context.theme.corePalatte.seaGreenColor,
                        message: "Complete Task",
                        onPressed: () {
                          inject<OrderBloc>().add(UpdateOrders(widget.orderId));
                        }),
                  );
                },
              ),
            )
          : SizedBox(),
      body: Container(
        child: ListView(
          children: <Widget>[
            20.verticalSpace,
            productDetails(context),
            20.verticalSpace,
            billindetails(context),
            20.verticalSpace,
            shippingDetails(context),
          ],
        ),
      ),
    );
  }

  SettingsSection productDetails(BuildContext context) {
    return SettingsSection(
      titlePadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      title: 'Products'.toUpperCase(),
      tiles: widget.data.line_items
          .map((e) => Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          e.name,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.headline6.copyWith(
                              fontSize: 15.flexibleFontSize,
                              fontWeight: FontWeight.w500),
                        ),
                        e.sku.isNotEmpty
                            ? Row(
                                children: [
                                  Text(
                                    "SKU: ",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline6
                                        .copyWith(
                                            fontSize: 14.flexibleFontSize,
                                            fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    e.sku,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline6
                                        .copyWith(
                                            fontSize: 14.flexibleFontSize,
                                            color: context
                                                .theme.corePalatte.greyColor,
                                            fontWeight: FontWeight.w500),
                                  ),
                                ],
                              )
                            : SizedBox(),
                        4.verticalSpace,
                        Text(
                          "${widget.data.currency_symbol} ${e.total}",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.headline6.copyWith(
                              fontSize: 14.flexibleFontSize,
                              color: context.theme.corePalatte.seaGreenColor,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    e.quantity > 0
                        ? Text(
                            "QTY:  " + e.quantity.toString(),
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                .copyWith(
                                    fontSize: 14.flexibleFontSize,
                                    color: context.theme.corePalatte.greyColor,
                                    fontWeight: FontWeight.w500),
                          )
                        : SizedBox()
                  ],
                ),
              ))
          .toList(),
    );
  }

  SettingsSection summary(BuildContext context) {
    return SettingsSection(
        titlePadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        title: 'Summary'.toUpperCase(),
        tiles: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Product total:",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.headline6.copyWith(
                          fontSize: 15.flexibleFontSize,
                          color: context.theme.corePalatte.greyColor,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "${widget.data.currency_symbol} ${widget.data.total}",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.headline6.copyWith(
                          fontSize: 15.flexibleFontSize,
                          color: context.theme.corePalatte.greyColor,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                4.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Delivery fee:",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.headline6.copyWith(
                          fontSize: 15.flexibleFontSize,
                          color: context.theme.corePalatte.greyColor,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "${widget.data.currency_symbol} ${widget.data.shipping_total}",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.headline6.copyWith(
                          fontSize: 15.flexibleFontSize,
                          color: context.theme.corePalatte.greyColor,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                4.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "taxes:",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.headline6.copyWith(
                          fontSize: 15.flexibleFontSize,
                          color: context.theme.corePalatte.greyColor,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "${widget.data.currency_symbol} ${widget.data.total_tax}",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.headline6.copyWith(
                          fontSize: 15.flexibleFontSize,
                          color: context.theme.corePalatte.greyColor,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                4.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Delivery fee:",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.headline6.copyWith(
                          fontSize: 15.flexibleFontSize,
                          color: context.theme.corePalatte.greyColor,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "${widget.data.currency_symbol} ${widget.data.shipping_total}",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.headline6.copyWith(
                          fontSize: 15.flexibleFontSize,
                          color: context.theme.corePalatte.greyColor,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                4.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Subtotal:",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyText1.copyWith(
                          fontSize: 15.flexibleFontSize,
                          color: context.theme.textColor,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "${widget.data.currency_symbol} ${widget.data.total}",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyText1.copyWith(
                          fontSize: 15.flexibleFontSize,
                          color: context.theme.corePalatte.greyColor,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                4.verticalSpace,
                Divider(),
                4.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Total:",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyText1.copyWith(
                          fontSize: 15.flexibleFontSize,
                          color: context.theme.textColor,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "${widget.data.currency_symbol} ${widget.data.total}",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyText1.copyWith(
                          fontSize: 15.flexibleFontSize,
                          color: context.theme.corePalatte.seaGreenColor,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                widget.data.payment_method != null &&
                        widget.data.payment_method.isNotEmpty
                    ? 20.verticalSpace
                    : SizedBox(),
                widget.data.payment_method != null &&
                        widget.data.payment_method.isNotEmpty
                    ? Button(
                        color: context.theme.textColor,
                        message: widget.data.payment_method_title,
                        onPressed: () {},
                      )
                    : SizedBox()
              ],
            ),
          )
        ]);
  }

  SettingsSection billindetails(BuildContext context) {
    return SettingsSection(
        titlePadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        title: 'Billing address'.toUpperCase(),
        tiles: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "${widget.data.billing.first_name} ${widget.data.billing.last_name}",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.headline6.copyWith(
                      fontSize: 15.flexibleFontSize,
                      color: context.theme.textColor,
                      fontWeight: FontWeight.normal),
                ),
                widget.data.billing.address_1.isNotEmpty
                    ? 4.verticalSpace
                    : SizedBox(),
                widget.data.billing.address_1.isNotEmpty
                    ? Text(
                        widget.data.billing.address_1,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.headline6.copyWith(
                            fontSize: 15.flexibleFontSize,
                            color: context.theme.corePalatte.greyColor,
                            fontWeight: FontWeight.normal),
                      )
                    : SizedBox(),
                widget.data.billing.address_2.isNotEmpty
                    ? 4.verticalSpace
                    : SizedBox(),
                widget.data.billing.address_2.isNotEmpty
                    ? Text(
                        widget.data.billing.address_2,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.headline6.copyWith(
                            fontSize: 15.flexibleFontSize,
                            color: context.theme.corePalatte.greyColor,
                            fontWeight: FontWeight.normal),
                      )
                    : SizedBox(),
                widget.data.billing.city.isNotEmpty
                    ? 4.verticalSpace
                    : SizedBox(),
                widget.data.billing.city.isNotEmpty
                    ? Text(
                        widget.data.billing.city,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.headline6.copyWith(
                            fontSize: 15.flexibleFontSize,
                            color: context.theme.corePalatte.greyColor,
                            fontWeight: FontWeight.normal),
                      )
                    : SizedBox(),
                widget.data.billing.state.isNotEmpty
                    ? 4.verticalSpace
                    : SizedBox(),
                widget.data.billing.state.isNotEmpty
                    ? Text(
                        widget.data.billing.state,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.headline6.copyWith(
                            fontSize: 15.flexibleFontSize,
                            color: context.theme.corePalatte.greyColor,
                            fontWeight: FontWeight.normal),
                      )
                    : SizedBox(),
                widget.data.billing.postcode.isNotEmpty
                    ? 4.verticalSpace
                    : SizedBox(),
                widget.data.billing.postcode.isNotEmpty
                    ? Text(
                        widget.data.billing.postcode,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.headline6.copyWith(
                            fontSize: 15.flexibleFontSize,
                            color: context.theme.corePalatte.greyColor,
                            fontWeight: FontWeight.normal),
                      )
                    : SizedBox(),
                widget.data.billing.country.isNotEmpty
                    ? 4.verticalSpace
                    : SizedBox(),
                widget.data.billing.country.isNotEmpty
                    ? Text(
                        widget.data.billing.country,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.headline6.copyWith(
                            fontSize: 15.flexibleFontSize,
                            color: context.theme.corePalatte.greyColor,
                            fontWeight: FontWeight.normal),
                      )
                    : SizedBox(),
                widget.data.billing.phone.isNotEmpty
                    ? Column(
                        children: [
                          8.verticalSpace,
                          Row(
                            children: [
                              Icon(Icons.call,
                                  color:
                                      context.theme.corePalatte.seaGreenColor),
                              10.horizontalSpace,
                              Text(
                                widget.data.billing.phone,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    .copyWith(
                                        fontSize: 15.flexibleFontSize,
                                        color: context
                                            .theme.corePalatte.seaGreenColor,
                                        fontWeight: FontWeight.normal),
                              )
                            ],
                          ),
                        ],
                      )
                    : SizedBox(),
                widget.data.billing.email.isNotEmpty
                    ? Column(
                        children: [
                          8.verticalSpace,
                          Row(
                            children: [
                              Icon(Icons.mail,
                                  color:
                                      context.theme.corePalatte.seaGreenColor),
                              10.horizontalSpace,
                              Text(
                                widget.data.billing.email,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    .copyWith(
                                        fontSize: 15.flexibleFontSize,
                                        color: context
                                            .theme.corePalatte.seaGreenColor,
                                        fontWeight: FontWeight.normal),
                              )
                            ],
                          ),
                        ],
                      )
                    : SizedBox()
              ],
            ),
          )
        ]);
  }

  SettingsSection shippingDetails(BuildContext context) {
    return SettingsSection(
        titlePadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        title: 'Shipping address'.toUpperCase(),
        tiles: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "${widget.data.shipping.first_name} ${widget.data.shipping.last_name}",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.headline6.copyWith(
                      fontSize: 15.flexibleFontSize,
                      color: context.theme.textColor,
                      fontWeight: FontWeight.normal),
                ),
                widget.data.shipping.address_1.isNotEmpty
                    ? 4.verticalSpace
                    : SizedBox(),
                widget.data.shipping.address_1.isNotEmpty
                    ? Text(
                        widget.data.shipping.address_1,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.headline6.copyWith(
                            fontSize: 15.flexibleFontSize,
                            color: context.theme.corePalatte.greyColor,
                            fontWeight: FontWeight.normal),
                      )
                    : SizedBox(),
                widget.data.shipping.address_2.isNotEmpty
                    ? 4.verticalSpace
                    : SizedBox(),
                widget.data.shipping.address_2.isNotEmpty
                    ? Text(
                        widget.data.shipping.address_2,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.headline6.copyWith(
                            fontSize: 15.flexibleFontSize,
                            color: context.theme.corePalatte.greyColor,
                            fontWeight: FontWeight.normal),
                      )
                    : SizedBox(),
                widget.data.shipping.city.isNotEmpty
                    ? 4.verticalSpace
                    : SizedBox(),
                widget.data.shipping.city.isNotEmpty
                    ? Text(
                        widget.data.shipping.city,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.headline6.copyWith(
                            fontSize: 15.flexibleFontSize,
                            color: context.theme.corePalatte.greyColor,
                            fontWeight: FontWeight.normal),
                      )
                    : SizedBox(),
                widget.data.shipping.state.isNotEmpty
                    ? 4.verticalSpace
                    : SizedBox(),
                widget.data.shipping.state.isNotEmpty
                    ? Text(
                        widget.data.shipping.state,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.headline6.copyWith(
                            fontSize: 15.flexibleFontSize,
                            color: context.theme.corePalatte.greyColor,
                            fontWeight: FontWeight.normal),
                      )
                    : SizedBox(),
                widget.data.shipping.postcode.isNotEmpty
                    ? 4.verticalSpace
                    : SizedBox(),
                widget.data.shipping.postcode.isNotEmpty
                    ? Text(
                        widget.data.shipping.postcode,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.headline6.copyWith(
                            fontSize: 15.flexibleFontSize,
                            color: context.theme.corePalatte.greyColor,
                            fontWeight: FontWeight.normal),
                      )
                    : SizedBox(),
                widget.data.shipping.country.isNotEmpty
                    ? 4.verticalSpace
                    : SizedBox(),
                widget.data.shipping.country.isNotEmpty
                    ? Text(
                        widget.data.shipping.country,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.headline6.copyWith(
                            fontSize: 15.flexibleFontSize,
                            color: context.theme.corePalatte.greyColor,
                            fontWeight: FontWeight.normal),
                      )
                    : SizedBox(),
                widget.data.billing.phone.isNotEmpty
                    ? Column(
                        children: [
                          8.verticalSpace,
                          Row(
                            children: [
                              Icon(Icons.call,
                                  color:
                                      context.theme.corePalatte.seaGreenColor),
                              10.horizontalSpace,
                              Text(
                                widget.data.billing.phone,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    .copyWith(
                                        fontSize: 15.flexibleFontSize,
                                        color: context
                                            .theme.corePalatte.seaGreenColor,
                                        fontWeight: FontWeight.normal),
                              )
                            ],
                          ),
                        ],
                      )
                    : SizedBox(),
                widget.data.billing.email.isNotEmpty
                    ? Column(
                        children: [
                          8.verticalSpace,
                          Row(
                            children: [
                              Icon(Icons.mail,
                                  color:
                                      context.theme.corePalatte.seaGreenColor),
                              10.horizontalSpace,
                              Text(
                                widget.data.billing.email,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    .copyWith(
                                        fontSize: 15.flexibleFontSize,
                                        color: context
                                            .theme.corePalatte.seaGreenColor,
                                        fontWeight: FontWeight.normal),
                              )
                            ],
                          ),
                        ],
                      )
                    : SizedBox()
              ],
            ),
          )
        ]);
  }
}
