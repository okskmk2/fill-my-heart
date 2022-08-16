import Vue from 'vue'
import App from './App.vue'
import './registerServiceWorker'
import router from './router'
import store from './store'
import './assets/style/main.scss'

import firebase from "firebase";

const firebaseConfig = {
  apiKey: "AIzaSyArnCVV0YwLNFEyRGiUUcgjirmIxogKsjY",
  authDomain: "baeundev-e80f2.firebaseapp.com",
  projectId: "baeundev-e80f2",
  storageBucket: "baeundev-e80f2.appspot.com",
  messagingSenderId: "1004641766437",
  appId: "1:1004641766437:web:1d49c67ff22592cda103cc"
};

firebase.initializeApp(firebaseConfig);

firebase.auth().onAuthStateChanged(user => {
  if (user) {
    console.log("onAuthStateChanged");
    store.commit("setUser", user.toJSON());
  }
});

Vue.config.productionTip = false

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
