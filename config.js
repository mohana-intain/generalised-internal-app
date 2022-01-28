var util = require("util");
var path = require("path");
var hfc = require("fabric-client");

var file = "network-config%s.yaml";

var env = process.env.TARGET_NETWORK;
if (env) file = util.format(file, "-" + env);
else file = util.format(file, "");
// indicate to the application where the setup file is located so it able
// to have the hfc load it to initalize the fabric client instance
// hfc.setConfigSetting(
//   "network_connection_profile_path",
//   path.join(__dirname, "artifacts", file)
// );
// hfc.setConfigSetting(
//   "wsfstrustee_connection_profile_path",
//   path.join(__dirname, "artifacts", "wsfstrustee.yaml")
// );
// hfc.setConfigSetting(
//   "limaoneinv_connection_profile_path",
//   path.join(__dirname, "artifacts", "limaoneinv.yaml")
// );
// hfc.setConfigSetting(
//   "limaoneserv_connection_profile_path",
//   path.join(__dirname, "artifacts", "limaoneserv.yaml")
// );
// some other settings the application might need to know
hfc.addConfigFile(process.env.ConfigJsonPath);
