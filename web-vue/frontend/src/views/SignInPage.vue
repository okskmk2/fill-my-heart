<template>
  <div>
    <AppBar />
    <div class="container">
      <h1 style="font-size:26px; margin-bottom:31px">로그인</h1>
      <div class="col" style="gap: 48px;">
        <div class="input_group">
          <label for="user_id">아이디</label>
          <input type="text" id="user_id" placeholder="아이디를 입력해주세요" v-model="email" required>
        </div>
        <div class="input_group">
          <label for="user_password">비밀번호</label>
          <input type="password" id="user_password" placeholder="비밀번호를 입력해주세요" v-model="password" required>
        </div>
      </div>
      <div style="margin-top:80px">
        <button class="elevated_button primary_button" @click="signIn">로그인</button>
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
      email: '',
      password: ''
    }
  },
  methods: {
    signIn() {
      this.$store.dispatch('signIn', {
        email: this.email,
        password: this.password
      }).then(() => {
        this.$router.push('/onboarding');
      })
    }
  }
}
</script>

<style>
</style>