<template>
  <div>
    <AppBar />
    <div class="container">
      <div>
        <div style="overflow:auto">
          <div class="row">
            <div class="onboarding_slide">
              <div class="title">롤링페이퍼를<br />만들어 볼까요?</div>
              <img src="@/assets/images/온보딩화분.png" alt="">
            </div>
            <div class="onboarding_slide">
              <div class="title">화분만들기</div>
              <div>화분은 작성된 잎편지들을<br />모아서 전달하는 역할을 해요</div>
              <img src="@/assets/images/온보딩화분.png" alt="">
            </div>
            <div class="onboarding_slide">
              <div class="title">잎편지 쓰기</div>
              <div>잎편지에 전하고 싶은<br />감사의 말을 작성하세요</div>
              <img src="@/assets/images/온보딩화분.png" alt="">
            </div>
          </div>
        </div>
        <div class="slider_dot_container">
          <div class="slider_dot"></div>
          <div class="slider_dot"></div>
          <div class="slider_dot"></div>
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
  components: { AppBar }
}
</script>

<style>
</style>