const String baseUrl = "https://e-wallet-app.herokuapp.com/";

const String authUrl = "api/v1/auth/";

const String loginEndpoint = "$authUrl/login";
const String signup = "$authUrl/signup";
const String changePassword = "$authUrl/change-password";

//
const String transactionUrl = "api/v1/transactions";

const String tranferMoney = "$transactionUrl/transfer";
const String transactionHistory = "$transactionUrl/history?sort=-date";

//
const String walletUrl = "api/v1/wallet";

const String fundWalletUrl = "$walletUrl/fund-wallet";
const String getWalletUrl = "$walletUrl";

//

const String verifyPaymentUrl =
    "$walletUrl/paystack/redirect?trxref=qhrnedgawp&reference=qhrnedgawp";
