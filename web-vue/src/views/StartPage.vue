<template>
  <div>
    <img src="@/assets/images/start_page_cover.png" alt="" />
    <div class="base_padding_x">
      <div class="col ai-center" style="margin-top: 47px; margin-bottom: 19px">
        <img src="@/assets/images/로고.png" alt="" />
        <div class="d-brown" style="font-size: 20; line-hight: 130%">
          프링을 시작해보세요!
        </div>
      </div>
      <div class="bottom_action_group">
        <button class="primary_button" @click="$router.push('/sign-up')">회원가입</button>
        <button class="second_button">로그인</button>
      </div>
      <div style="margin-top: 20px; text-align: center">
        <a class="grey3" href="#">비밀번호가 기억이 안나시나요?</a>
      </div>
    </div>
  </div>
</template>
