import 'dart:convert';

import 'package:bell_delivery_hub/components/Button.dart';
import 'package:bell_delivery_hub/components/permissions/permission_checker.dart';
import 'package:bell_delivery_hub/components/settings_ui/settings_section.dart';
import 'package:bell_delivery_hub/globals/exveptions/login_error_modal.dart';
import 'package:bell_delivery_hub/modal/order/order.dart';
import 'package:bell_delivery_hub/modal/qr_scanned_response.dart';
import 'package:bell_delivery_hub/order_bloc/order.dart';
import 'package:bell_delivery_hub/routes/router.gr.dart';
import 'package:bell_delivery_hub/theme/theme.dart';
import 'package:bell_delivery_hub/utils/dependency_injection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bell_delivery_hub/extensions/context_extension.dart';
import 'package:bell_delivery_hub/extensions/number_extensions.dart';
import 'package:bell_delivery_hub/extensions/flash_util.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:auto_route/auto_route.dart';
import 'package:websafe_svg/websafe_svg.dart';

class OrderDetailsScreens extends StatefulWidget {
  final int orderId;
  final Order data;

  const OrderDetailsScreens({Key key, this.orderId, this.data})
      : super(key: key);

  @override
  _OrderDetailsScreensState createState() => _OrderDetailsScreensState();
}

class _OrderDetailsScreensState extends State<OrderDetailsScreens> {
  List<String> listOfBardcodes;
  SharedPreferences pref;
  bool isSuccess;

  QRScannedResponse jsonData;

  @override
  void initState() {
    clearSharedPreference();
    getSharedPreference();
    super.initState();
  }

  getSharedPreference() async {
    pref = await SharedPreferences.getInstance();
    return pref;
  }

  clearSharedPreference() async {
    pref = await SharedPreferences.getInstance();
    pref.clear();
  }

  @override
  void dispose() {
    clearSharedPreference();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          // AppBar(
          //   elevation: 0,
          //   centerTitle: true,
          //   actions: [],
          // ),
          AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Order ID : " + widget.orderId.toString(),
          style: AppTextTheme.appBarTitle.copyWith(
              fontSize: 17.flexibleFontSize, color: context.theme.textColor),
        ),
        actions: [],
      ),
      bottomNavigationBar: widget.data.status != "completed"
          ? Container(
              color: context.theme.surface,
              child: SafeArea(
                child: SizedBox(
                  height: ScreenUtil.defaultSize.height / 25,
                  child: Center(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      color: context.theme.surface,
                      child: Center(
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
                            return Button(
                                color: context.theme.corePalatte.primaryColor,
                                message: "Complete Task",
                                onPressed: () {
                                  inject<OrderBloc>()
                                      .add(UpdateOrders(widget.orderId));
                                });
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          : SizedBox(),
      body: Container(
        child: ListView(
          children: <Widget>[
            20.verticalSpace,
            productDetails(context),
            20.verticalSpace,
            summary(context),
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
      tiles: widget.data.line_items.map((e) {
        final barcodeData = e.meta_data
            .firstWhere((metaData) => metaData.key == "Barcode", orElse: () {
          return null;
        });

        if (pref != null &&
            barcodeData != null &&
            pref.containsKey(barcodeData.value)) {
          final data = pref.get(barcodeData.value);

          final a = json.decode(data[0]);
          //
          jsonData = QRScannedResponse.fromJson(a);
        }

        return Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 1.5,
                    child: Text(
                      e.name.toUpperCase(),
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.headline6.copyWith(
                          fontSize: 15.flexibleFontSize,
                          fontWeight: FontWeight.w500),
                    ),
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
                                      color:
                                          context.theme.corePalatte.greyColor,
                                      fontWeight: FontWeight.w500),
                            ),
                          ],
                        )
                      : SizedBox(),
                  barcodeData != null
                      ? Row(
                          children: [
                            Text(
                              "BARCODE: ",
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
                              barcodeData.value.toUpperCase().toString().trim(),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  .copyWith(
                                      fontSize: 14.flexibleFontSize,
                                      color:
                                          context.theme.corePalatte.greyColor,
                                      fontWeight: FontWeight.w500),
                            ),
                          ],
                        )
                      : SizedBox(),
                  4.verticalSpace,
                  Text(
                    "${widget.data.currency_symbol} ${e.price * e.quantity}",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.headline6.copyWith(
                        fontSize: 14.flexibleFontSize,
                        color: context.theme.corePalatte.primaryColor,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              Column(
                children: [
                  (pref != null &&
                          barcodeData != null &&
                          pref.containsKey(barcodeData.value))
                      ? SizedBox(
                          height: 20.flexibleFontSize,
                          width: 20.flexibleFontSize,
                          child: jsonData.id.trim() == barcodeData.value &&
                                  jsonData.value
                              ? WebsafeSvg.asset("assets/images/check.svg")
                              : WebsafeSvg.asset("assets/images/wrong.svg"),
                        )
                      : barcodeData != null
                          ? IconButton(
                              icon:
                                  WebsafeSvg.asset("assets/images/barcode.svg"),
                              onPressed: () async {
                                final hasCameraPermission =
                                    await PermissionChecker.hasCameraPermission(
                                        context);

                                if (hasCameraPermission) {
                                  final result =
                                      await ExtendedNavigator.of(context).push(
                                          Routes.userQRScannerPage,
                                          arguments: UserQRScannerPageArguments(
                                              barcodeValue: barcodeData.value));

                                  setState(() {
                                    pref = result;
                                  });
                                }
                              })
                          : SizedBox(),
                  e.quantity > 0
                      ? Text(
                          "QTY:  " + e.quantity.toString(),
                          style: Theme.of(context).textTheme.headline6.copyWith(
                              fontSize: 14.flexibleFontSize,
                              color: context.theme.corePalatte.greyColor,
                              fontWeight: FontWeight.w500),
                        )
                      : SizedBox()
                ],
              )
            ],
          ),
        );
      }).toList(),
    );
  }

  SettingsSection summary(BuildContext context) {
    final sumofPrice = widget.data.line_items
        .map((expense) => expense.price)
        .fold(0, (prev, amount) => prev + amount);

    print(sumofPrice);

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
                      "${widget.data.currency_symbol} $sumofPrice",
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
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   crossAxisAlignment: CrossAxisAlignment.center,
                //   children: [
                //     Text(
                //       "taxes:",
                //       maxLines: 1,
                //       overflow: TextOverflow.ellipsis,
                //       style: Theme.of(context).textTheme.headline6.copyWith(
                //           fontSize: 15.flexibleFontSize,
                //           color: context.theme.corePalatte.greyColor,
                //           fontWeight: FontWeight.w500),
                //     ),
                //     Text(
                //       "${widget.data.currency_symbol} ${widget.data.total_tax}",
                //       maxLines: 1,
                //       overflow: TextOverflow.ellipsis,
                //       style: Theme.of(context).textTheme.headline6.copyWith(
                //           fontSize: 15.flexibleFontSize,
                //           color: context.theme.corePalatte.greyColor,
                //           fontWeight: FontWeight.w500),
                //     ),
                //   ],
                // ),
                // 4.verticalSpace,
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
                          color: context.theme.corePalatte.primaryColor,
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
                        color: context.theme.themeType
                            ? context.theme.background
                            : context.theme.textColor,
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
                  maxLines: 2,
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
                        maxLines: 2,
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
                        maxLines: 2,
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
                          InkWell(
                            onTap: () => openPhone(widget.data.billing.phone),
                            child: Row(
                              children: [
                                Icon(Icons.call,
                                    color:
                                        context.theme.corePalatte.primaryColor),
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
                                              .theme.corePalatte.primaryColor,
                                          fontWeight: FontWeight.normal),
                                )
                              ],
                            ),
                          ),
                        ],
                      )
                    : SizedBox(),
                widget.data.billing.email.isNotEmpty
                    ? Column(
                        children: [
                          8.verticalSpace,
                          InkWell(
                            onTap: () => openMail(
                              widget.data.billing.email,
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.mail,
                                    color:
                                        context.theme.corePalatte.primaryColor),
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
                                              .theme.corePalatte.primaryColor,
                                          fontWeight: FontWeight.normal),
                                )
                              ],
                            ),
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
                  maxLines: 2,
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
                        maxLines: 2,
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
                        maxLines: 2,
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
                        maxLines: 2,
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
                          InkWell(
                            onTap: () => openPhone(widget.data.billing.phone),
                            child: Row(
                              children: [
                                Icon(Icons.call,
                                    color:
                                        context.theme.corePalatte.primaryColor),
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
                                              .theme.corePalatte.primaryColor,
                                          fontWeight: FontWeight.normal),
                                )
                              ],
                            ),
                          ),
                        ],
                      )
                    : SizedBox(),
                widget.data.billing.email.isNotEmpty
                    ? Column(
                        children: [
                          8.verticalSpace,
                          InkWell(
                            onTap: () => openMail(widget.data.billing.email),
                            child: Row(
                              children: [
                                Icon(Icons.mail,
                                    color:
                                        context.theme.corePalatte.primaryColor),
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
                                              .theme.corePalatte.primaryColor,
                                          fontWeight: FontWeight.normal),
                                )
                              ],
                            ),
                          ),
                        ],
                      )
                    : SizedBox()
              ],
            ),
          )
        ]);
  }

  openMail(String email) {
    final Uri _emailLaunchUri = Uri(
        scheme: 'mailto',
        path: email,
        queryParameters: {'subject': 'Bell Delivery'});

    launch(_emailLaunchUri.toString());
  }

  openPhone(String number) async {
    final url = "tel:$number";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
