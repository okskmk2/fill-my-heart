<template>
  <div>
    <AppBar />
    <div class="container">
      <div>
        <div @touchstart="touchstart" @touchend="touchend">
          <div class="onboarding_slide" v-if="selectedIndex === 0">
            <div class="title">롤링페이퍼를<br />만들어 볼까요?</div>
            <img src="@/assets/images/온보딩화분.png" alt="">
          </div>
          <div class="onboarding_slide" v-if="selectedIndex === 1">
            <div class="title">화분만들기</div>
            <div>화분은 작성된 잎편지들을<br />모아서 전달하는 역할을 해요</div>
            <img src="@/assets/images/온보딩화분.png" alt="">
          </div>
          <div class="onboarding_slide" v-if="selectedIndex === 2">
            <div class="title">잎편지 쓰기</div>
            <div>잎편지에 전하고 싶은<br />감사의 말을 작성하세요</div>
            <img src="@/assets/images/온보딩화분.png" alt="">
          </div>
        </div>
        <div class="slider_dot_container">
          <div class="slider_dot" :class="{ 'active': selectedIndex === 0 }"></div>
          <div class="slider_dot" :class="{ 'active': selectedIndex === 1 }"></div>
          <div class="slider_dot" :class="{ 'active': selectedIndex === 2 }"></div>
        </div>
      </div>
      <div style="margin-top:38px">
        <button class="elevated_button primary_button" @click="$router.push('/home')">시작하기</button>
      </div>
    </div>
  </div>
</template>

<script>
import AppBar from '@/components/AppBar.vue';
export default {
  data() {
    return {
      selectedIndex: 0,
      lastIndex: 2,
      touchstartX: 0,
      touchendX: 0
    }
  },
  components: { AppBar },
  methods: {
    checkDirection() {
      if (this.touchendX < this.touchstartX) {
        if (this.selectedIndex < this.lastIndex) {
          this.selectedIndex += 1;
        }
      }
      else if (this.touchendX > this.touchstartX) {
        if (0 < this.selectedIndex) {
          this.selectedIndex -= 1;
        }
      }
    },
    touchstart(e) {
      this.touchstartX = e.changedTouches[0].screenX;
    },
    touchend(e) {
      this.touchendX = e.changedTouches[0].screenX;
      this.checkDirection();
    }
  },
  created() {
    const onboarding = localStorage.getItem('onboarding');
    if (onboarding) {
      this.$router.push('/home');
    } else {
      localStorage.setItem('onboarding', 'true');
    }
  }
}
</script>

<style>
</style>