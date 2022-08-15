import Vue from "vue";
import Vuex from "vuex";
import firebase from "firebase";
import router from "@/router";

Vue.use(Vuex);
// {{$store.state.currentTitle}}
export default new Vuex.Store({
  state: {
    modalInnerComponent: null,
    snackbarText: "",
    isSnackbarUp: false,
    currentUser: null,
  },
  getters: {
    group: state => ({ ...state.group }),
    department: state => ({ ...state.department })
  },
  mutations: {
    setUser(state, user) {
      state.currentUser = user;
    },
    openModal(state, component) {
      state.modalInnerComponent = component;
      state.isTurnOff = true;
    },
    closeModal(state) {
      state.isTurnOff = false;
      state.modalInnerComponent = null;
    },
    showSnackbar(state) {
      state.isSnackbarUp = true;
    },
    setSnackbarText(state, text) {
      state.snackbarText = text;
    },
    hideSnackbar(state) {
      state.isSnackbarUp = false;
    }
  },
  actions: {
    async signIn(context, inputData) {
      const userCredential = await firebase.auth().signInWithEmailAndPassword(inputData.email, inputData.password);
      context.commit("setUser", userCredential.user.toJSON());
    },
    signOut(context) {
      firebase
        .auth()
        .signOut()
        .then(() => {
          context.commit("setUser", null);
          router.push({ path: "/" });
        })
        .catch(err => {
          alert(err.message);
        });
    },
    async signUp(context, inputData) {
      try {
        const userCredential = await firebase.auth().createUserWithEmailAndPassword(inputData.email, inputData.password);
        await userCredential.user.updateProfile({ displayName: inputData.name });
        context.dispatch("signIn", inputData);
        await firebase.firestore().collection('users').doc().set({
          displayName: inputData.name,
          email: inputData.email
        });
        return Promise.resolve();
      } catch (error) {
        return Promise.reject(error.message);
      }
    },
    setUser(context, inputData) {
      firebase
        .firestore()
        .collection("users")
        .doc()
        .set(inputData);
    },
    snackbar(context, text) {
      context.commit("setSnackbarText", text);
      context.commit("showSnackbar");
      setTimeout(() => {
        context.commit("hideSnackbar");
      }, 3000);
      setTimeout(() => {
        context.commit("setSnackbarText", "");
      }, 4000);
    }
  }
});
