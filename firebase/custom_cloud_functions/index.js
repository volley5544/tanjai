const admin = require("firebase-admin/app");
admin.initializeApp();

const getServerTimestamp = require("./get_server_timestamp.js");
exports.getServerTimestamp = getServerTimestamp.getServerTimestamp;
