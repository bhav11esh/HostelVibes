const functions = require("firebase-functions");
const admin = require("firebase-admin");
admin.initializeApp();

const apiManager = require("./api_manager");
exports.ffPrivateApiCall = functions
  .region("asia-south1")
  .runWith({ minInstances: 1, timeoutSeconds: 120 })
  .https.onCall(async (data, context) => {
    try {
      console.log(`Making API call for ${data["callName"]}`);
      var response = await apiManager.makeApiCall(context, data);
      console.log(`Done making API Call! Status: ${response.statusCode}`);
      return response;
    } catch (err) {
      console.error(`Error performing API call: ${err}`);
      return {
        statusCode: 400,
        error: `${err}`,
      };
    }
  });
const Razorpay = require("razorpay");
const crypto = require("crypto");

// Test credentials
const kTestKeyId = "rzp_live_lLpJlu4Xk24oWo";
const kTestKeySecret = "Yspwkby4Ych3QUbFqg5UmEkI";

// Prod credentials
const kProdKeyId = "rzp_live_lLpJlu4Xk24oWo";
const kProdKeySecret = "Yspwkby4Ych3QUbFqg5UmEkI";

const keyId = (isProd) => (isProd ? kProdKeyId : kTestKeyId);
const keySecret = (isProd) => (isProd ? kProdKeySecret : kTestKeySecret);

/**
 *
 */
exports.createOrder = functions
  .region("asia-south1")
  .https.onCall(async (data, context) => {
    if (!context.auth) {
      return "Unauthenticated calls are not allowed.";
    }
    return await generateOrder(data, true);
  });

/**
 *
 */
exports.testCreateOrder = functions
  .region("asia-south1")
  .https.onCall(async (data, context) => {
    if (!context.auth) {
      return "Unauthenticated calls are not allowed.";
    }
    return await generateOrder(data, false);
  });

/**
 *
 */
async function generateOrder(data, isProd) {
  const razorpay = new Razorpay({
    key_id: keyId(isProd),
    key_secret: keySecret(isProd),
  });

  try {
    const order = await razorpay.orders.create({
      amount: data.amount,
      currency: data.currency,
      receipt: data.receipt,
    });

    return order;
  } catch (err) {
    console.error(`${err}`);
    throw new functions.https.HttpsError(
      "aborted",
      "Could not create the order",
    );
  }
}

/**
 *
 */
exports.verifySignature = functions
  .region("asia-south1")
  .https.onCall(async (data, context) => {
    if (!context.auth) {
      return "Unauthenticated calls are not allowed.";
    }
    return isValidSignature(data, true);
  });

/**
 *
 */
exports.testVerifySignature = functions
  .region("asia-south1")
  .https.onCall(async (data, context) => {
    if (!context.auth) {
      return "Unauthenticated calls are not allowed.";
    }
    return isValidSignature(data, false);
  });

/**
 *
 */
function isValidSignature(data, isProd) {
  const hmac = crypto.createHmac("sha256", keySecret(isProd));
  hmac.update(data.orderId + "|" + data.paymentId);
  const generatedSignature = hmac.digest("hex");
  const isSignatureValid = generatedSignature === data.signature;
  return { isValid: isSignatureValid };
}
exports.onUserDeleted = functions
  .region("asia-south1")
  .auth.user()
  .onDelete(async (user) => {
    let firestore = admin.firestore();
    let userRef = firestore.doc("users/" + user.uid);
  });
