<template>
  <div id="app">
    <img src="./assets/logo.png">
    <h1>{{ msg }}</h1>
    A Token: <input type="text" v-model.number="tokenValue" placeholder="Enter number of token">
    C Address To: <input type="text" v-model="addressTo" placeholder="Enter address">
    B Address Receive <input type="text" v-model="addressReceive" placeholder="Enter address between">
    <button v-on:click="sendToken()">Send</button>
  </div>
</template>

<script>
export default {
  name: 'app',
  data () {
    return {
      msg: 'Welcome to Your Vue.js App',
      tokenValue: ' ',
      addressTo: " ",
      addressReceive: " ",
    }
  },
  methods: {
    async sendToken() {
      const privateKey = "10543ae2779e2bdc73478ca8a7cebc639dcd962268a3ce5923ea227956789813";
      const trc20ContractAddress = "TLTbkjAQSks94Sj1tRXX1yBTeRT4Qc7w2c"
      var address = "TZ6u76fTzpGaE2MwcwzCVGbmxvmPLbSaHv";
      let contract = await tronWeb.contract().at(trc20ContractAddress);
      //Use watch to listen for events emitted by a smart contract method. You can define functions to be executed when certain events are caught.
      contract.approve(this.addressTo, this.tokenValue).send().then(output => {console.log('- Output:', output, '\n');});
      let check = contract.transferFrom(address, this.addressReceive, this.tokenValue);
      if(check) {
        contract.allowance(address, this.addressTo);
      }
      //contract.eventname.watch(callback)
      await contract && contract.Transfer().watch((err, event) => {
        if(err)
            return console.error('Error with "Message" event:', err);
      
            console.group('New event received');
            console.log('- Contract Address:', event.contract);
            console.log('- Event Name:', event.name);
            console.log('- Transaction:', event.transaction);
            console.log('- Block number:', event.block);
            console.log('- Result:', event.result, '\n');
            console.groupEnd();
      });
    },
  }
}
</script>

<style>
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}

h1, h2 {
  font-weight: normal;
}

ul {
  list-style-type: none;
  padding: 0;
}

li {
  display: inline-block;
  margin: 0 10px;
}

a {
  color: #42b983;
}
</style>
