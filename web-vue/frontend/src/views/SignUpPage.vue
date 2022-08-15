<template>
  <div>
    <AppBar />
    <div class="container">
      <h1 style="font-size:26px; margin-bottom:31px">회원가입</h1>
      <div class="col" style="gap: 48px;">
        <div class="input_group">
          <label for="user_id">이메일</label>
          <input type="text" id="user_id" placeholder="이메일을 입력해주세요" v-model="email">
        </div>
        <div class="input_group">
          <label for="user_password">비밀번호</label>
          <input type="password" id="user_password" placeholder="비밀번호를 입력해주세요" v-model="password">
          <input type="password" placeholder="비밀번호를 확인해주세요" style="margin-top: 8px;">
        </div>
        <div class="input_group">
          <label for="user_nickname">닉네임</label>
          <input type="text" id="user_nickname" placeholder="닉네임을 입력해주세요" v-model="name">
        </div>
      </div>
      <div style="margin-top:80px">
        <button class="elevated_button primary_button" @click="signUp">다음</button>
      </div>
    </div>
  </div>
</template>

<script>
import AppBar from '@/components/AppBar.vue';
export default {
  components: { AppBar },
  data() {
    return {
      name: "",
      email: "",
      password: ""
    };
  },
  methods: {
    signUp() {
      this.$store.dispatch("signUp", {
        name: this.name,
        email: this.email,
        password: this.password
      }).then(()=>{
        this.$router.push('/onboarding');
      }).catch((error)=>{
        console.log(error);
      })
    }
  }
}
</script>

<style>
</style>