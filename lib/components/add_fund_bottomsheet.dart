import 'package:bell_delivery_hub/blocs/add_fund_bloc/bloc/add_fund_bloc.dart';
import 'package:bell_delivery_hub/blocs/wallet_bloc/wallet_bloc.dart';
import 'package:bell_delivery_hub/components/button.dart';
import 'package:bell_delivery_hub/components/in_app_webview_screen.dart';
import 'package:bell_delivery_hub/modal/wallet/request/add_refund_request.dart';
import 'package:bell_delivery_hub/utils/dependency_injection.dart';
import 'package:bell_delivery_hub/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:bell_delivery_hub/extensions/string_extension.dart';
import 'package:bell_delivery_hub/extensions/number_extensions.dart';
import 'package:bell_delivery_hub/extensions/context_extension.dart';
import 'package:bell_delivery_hub/extensions/flash_util.dart';

import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddFundBottomSheet {
  static void showSheet({BuildContext context}) {
    TextEditingController amountController = TextEditingController();
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: context.theme.surface,
      enableDrag: false,
      builder: (context) {
        return SafeArea(
          bottom: true,
          child: SingleChildScrollView(
            child: StatefulBuilder(
              builder: (context, setState) {
                return BlocConsumer<AddFundBloc, AddFundState>(
                  cubit: inject<AddFundBloc>(),
                  listener: (context, state) {
                    if (state is AddFundSuccess) {
                      if (state.postAddFundResponse.url != null) {
                        Navigator.pop(context);

                        return InAppViewBottomSheet().showSheet(
                            context: context,
                            url: state.postAddFundResponse.url);
                      }
                    }
                  },
                  builder: (context, state) {
                    return Form(
                      key: _formKey,
                      child: Padding(
                        padding: MediaQuery.of(context).viewInsets,
                        child: Wrap(
                          children: [
                            Container(
                              padding: EdgeInsets.only(
                                  bottom:
                                      MediaQuery.of(context).viewInsets.bottom),
                              decoration: BoxDecoration(
                                borderRadius: new BorderRadius.only(
                                    topLeft: const Radius.circular(20.0),
                                    topRight: const Radius.circular(20.0)),
                                color: context.theme.surface,
                              ),
                              child: Wrap(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 16),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          "Add Fund",
                                          style: AppTextTheme.appBarTitle
                                              .copyWith(
                                                  color:
                                                      context.theme.textColor,
                                                  fontSize:
                                                      18.flexibleFontSize),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Divider(
                                    color:
                                        AppColors.primaryColor.withOpacity(0.1),
                                    thickness: 1.0,
                                    indent: 15,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20.flexibleWidth),
                                    child: TextFormField(
                                      controller: amountController,
                                      keyboardType: TextInputType.number,
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return "amount cannot be empty";
                                        } else
                                          return null;
                                      },
                                      decoration: InputDecoration(
                                        hintText: "Add an amount",
                                        hintStyle: Theme.of(context)
                                            .textTheme
                                            .subtitle1
                                            .copyWith(
                                                color: context.theme.textColor,
                                                fontSize: 16.flexibleFontSize),
                                        labelStyle: Theme.of(context)
                                            .textTheme
                                            .subtitle1
                                            .copyWith(
                                                color: context.theme.textColor,
                                                fontSize: 16.flexibleFontSize),
                                      ),
                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly,
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 15),
                                    child: Button(
                                      height: 50,
                                      isLoading: state is AddFundLoading,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      message: "Confirm",
                                      onPressed: () {
                                        if (_formKey.currentState.validate()) {
                                          final request = AddFundRequest(
                                              amount: int.parse(
                                                  amountController.text));

                                          inject<AddFundBloc>()
                                              .add(AddFundToAccount(request));
                                        } else {
                                          if (state is AddFundFailure) {
                                            context.showMessage(
                                                state.error.toString(), true);
                                          }

                                          return Navigator.pop(context);
                                        }
                                      },
                                    ),
                                  ),
                                  SizedBox(height: 16),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }
}
