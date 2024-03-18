const functions = require("firebase-functions");
const admin = require("firebase-admin");
// To avoid deployment errors, do not call admin.initializeApp() in your code

exports.getServerTimestamp = functions
  .region("asia-southeast1")
  .https.onCall((data, context) => {
    // Write your code below!

    // Write your code above!
    return admin.firestore.Timestamp.now().toString();
  });
