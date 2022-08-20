<template>
  <div class="homepage">
    <div class="rel" style="margin-top:50px">
      <div class="container">
        <div style="margin-bottom:8px;color:var(--input_line)">2022.07.22 ~ 진행중</div>
        <h1 class="home_top_title">
          <span class="primary">{{ $store.state.currentUser.displayName }}</span>님의 감사화분<br />편지 <span
            class="primary">{{leaves.length}}</span>개
        </h1>
        <div class="home_top_shortcut">
          <div style="font-weight:800;font-size:14px;color:var(--text);margin-bottom:16px">편지쓰기 순서</div>
          <div class="col ai-start">
            <button class="home_top_button" @click="$router.push('/vase-form-to')">
              <div class="dot"></div>
              화분 만들기
              <img src="@/assets/images/icons/우측화살표.svg" alt="">
            </button>
            <button class="home_top_button" style="margin-top:2px" @click="$router.push('/leaf-form-lobby')">
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
        <div class="vase_home_card_container">
          <div v-for="card in leaves" class="card" @click="$router.push(`/vase/${card.vaseId}`)">
            <img :src="card.imgUrl" alt="">
            <div class="content_container">
              <div class="content">{{ card.content }}</div>
              <div class="from">{{ card.fromDisplayName }}</div>
            </div>
          </div>
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
import moment from 'moment';
export default {
  data() {
    return {
      userDisplayName: '',
      vaseName: '',
      leaves: []
    }
  },
  methods: {
    async getAllVase() {
      const email = this.$store.state.currentUser.email;
      // 내가 속한 화분목록
      const vases = (await firebase.firestore().collection('vase').where('toEmail', '==', email).get()).docs.map(v => ({
        id: v.id,
        createdAt: moment(v.get('createdAt')).toDate(),
        title: v.get('title')
      }));
      if (vases.length > 0) {
        vases.sort((pre, next) => {
          if (pre['createdAt'] < next['createdAt']) {
            return 1;
          }
          else {
            return -1;
          }
        });
        for (let index = 0; index < vases.length; index++) {
          const vase = vases[index];
          firebase.firestore().collection(`vase/${vase.id}/leaf`).get().then(qs => {
            qs.forEach(doc => {
              const o = {};
              o['vaseTitle'] = vase.title;
              o['vaseId'] = vase.id;
              o['content'] = doc.get('content');
              o['imgUrl'] = doc.get('imgUrl');
              o['fromDisplayName'] = doc.get('fromDisplayName');
              this.leaves.push(o);
            });
          });
        }
      } else {
        this.vaseName = '화분이 없습니다.'
      }
    }
  },
  mounted() {
    this.getAllVase();
  }
}
</script>
