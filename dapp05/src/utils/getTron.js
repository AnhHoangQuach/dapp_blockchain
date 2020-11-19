const TronWeb = require('tronweb')
const HttpProvider = TronWeb.providers.HttpProvider;
const fullNode = new HttpProvider("https://api.shasta.trongrid.io");
const solidityNode = new HttpProvider("https://api.shasta.trongrid.io");
const eventServer = new HttpProvider("https://api.shasta.trongrid.io");
const privateKey = process.env.VUE_APP_SHASTA_PRIVATE_KEY;

const tronWeb = new TronWeb(fullNode,solidityNode,eventServer,privateKey);