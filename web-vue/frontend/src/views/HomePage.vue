<template>
  <div class="homepage">
    <div class="rel" style="margin-top:50px">
      <div class="container">
        <div style="margin-bottom:8px;color:var(--input_line)">2022.07.22 ~ 진행중</div>
        <h1 class="home_top_title">
          <span class="primary">{{ $store.state.currentUser.displayName }}</span>님의 감사화분<br />편지 <span
            class="primary">10</span>개
        </h1>
        <div class="home_top_shortcut">
          <div style="font-weight:800;font-size:14px;color:var(--text);margin-bottom:16px">편지쓰기 순서</div>
          <div class="col ai-start">
            <!-- <input type="text" v-model="userDisplayName">
            <button @click="setDisplayName">테스트</button> -->
            <button class="home_top_button" @click="$router.push('/vase-form-to')">
              <div class="dot"></div>
              화분 만들기
              <img src="@/assets/images/icons/우측화살표.svg" alt="">
            </button>
            <button class="home_top_button" style="margin-top:10px" @click="$router.push('/leaf-form-lobby')">
              <div class="dot"></div>잎편지 쓰기
              <img src="@/assets/images/icons/우측화살표.svg" alt="" />
            </button>
          </div>
        </div>
      </div>
      <div class="abs" style="bottom:0; right:0; line-height: 0;">
        <img src="@/assets/images/홈화분.png" alt="">
      </div>
    </div>
    <div class="home_bottom">
      <div style="overflow:auto">
        <div class="row">
          <div class="home_card"></div>
          <div class="home_card"></div>
        </div>
      </div>
      <div class="slider_dot_container">
        <div class="slider_dot"></div>
        <div class="slider_dot"></div>
        <div class="slider_dot"></div>
      </div>
    </div>
  </div>
</template>

<script>
import firebase from 'firebase';
export default {
  data() {
    return {
      userDisplayName: ''
    }
  },
  methods: {
    setDisplayName() {
      const user = firebase.auth().currentUser;
      user.updateProfile({
        displayName: this.userDisplayName
      }).then(() => {
        console.log("성공");
      }).catch(() => {
        console.log("실패")
      });
    }
  },
  created() {
    if (this.$store.state.currentUser == null) {
      this.$router.push('/sign-in');
    }
  }
}
</script>
