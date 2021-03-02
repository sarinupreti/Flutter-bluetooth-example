import 'package:bots_demo/blocs/transaction_bloc/transaction_bloc.dart';
import 'package:bots_demo/blocs/wallet_bloc/wallet_bloc.dart';
import 'package:bots_demo/blocs/pay_fund_bloc/pay_fund_bloc.dart';
import 'package:bots_demo/components/button.dart';
import 'package:bots_demo/modal/transaction/request/payment_request.dart';
import 'package:bots_demo/utils/dependency_injection.dart';
import 'package:bots_demo/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:bots_demo/extensions/number_extensions.dart';
import 'package:bots_demo/extensions/context_extension.dart';
import 'package:bots_demo/extensions/flash_util.dart';

import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransferMoneyBottomSheet {
  static void showSheet({BuildContext context}) {
    TextEditingController amountController = TextEditingController();
    TextEditingController nameController = TextEditingController();

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
                return BlocConsumer<PayFundBloc, PayFundState>(
                  cubit: inject<PayFundBloc>(),
                  listener: (context, state) {
                    if (state is AddFundSuccess &&
                        state.transactionHistory != null &&
                        state.transactionHistory.createdAt != null) {
                      inject<WalletBloc>().add(GetWalletBalance());
                      inject<TransactionBloc>()
                          .add(TransactionEvent.fetchHistory());

                      Navigator.pop(context);

                      context.showMessage(
                          "Payment sucessful to merchant. Response: ${state.transactionHistory.toJson()} ",
                          false);
                    }

                    if (state is AddFundFailure) {
                      context.showMessage(state.error.toString(), true);
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
                                          "Pay Merchant",
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
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20.flexibleWidth),
                                    child: TextFormField(
                                      controller: nameController,
                                      keyboardType: TextInputType.text,
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return "name cannot be empty";
                                        } else
                                          return null;
                                      },
                                      decoration: InputDecoration(
                                        hintText: "Item name",
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
                                      inputFormatters: [],
                                    ),
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
                                          final request = PaymentRequest(
                                              narration:
                                                  nameController.text.trim(),
                                              recipient: 1593962036483,
                                              amount: int.parse(
                                                  amountController.text));

                                          inject<PayFundBloc>()
                                              .add(PayFundToAccount(request));
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
