<template>
    <div>
        <div class="post_office_top rel">
            <h1>화분 우체국</h1>
            <div class="post_office_top_desc">
                화분은 작성된 잎편지들을<br />모아서 전달하는 역할을 해요
            </div>
            <button @click="$router.push('/vase-form-to')">화분 만들기</button>
            <img src="@/assets/images/화분우체국커버.png" alt="" class="abs">
        </div>
        <div>
            <div class="tabbar">
                <button class="tabbar_button" @click="selectedIndex = 0" :class="{ 'active': selectedIndex === 0 }">진행 중
                    12</button>
                <button class="tabbar_button" @click="selectedIndex = 1" :class="{ 'active': selectedIndex === 1 }">보내기
                    완료
                    10</button>
            </div>
            <div class="container" style="padding-top:22px;padding-bottom: 96px;">
                <div v-if="selectedIndex === 0" class="post_office_vard_card_container">
                    <div v-for="vase in progressVases" class="post_office_vase_card"
                        @click="$router.push(`/vase/${vase.id}`)">
                        <div class="vase_card_circle">
                            <img :src="vase.imgUrl" alt="">
                        </div>
                        <div>
                            <div>To. {{ vase.toDisplayName }}</div>
                            <div>{{ vase.dueDateTime }}</div>
                        </div>
                    </div>
                </div>
                <div v-if="selectedIndex === 1" class="post_office_vard_card_container">
                    <div v-for="vase in sentVases" class="post_office_vase_card"
                        @click="$router.push(`/vase/${vase.id}`)">
                        <div class="vase_card_circle">
                            <img :src="vase.imgUrl" alt="">
                        </div>
                        <div>
                            <div>To. {{ vase.toDisplayName }}</div>
                            <div>{{ vase.dueDateTime }}</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>
<script>
import firebase from 'firebase';
export default {
    data() {
        return {
            selectedIndex: 0,
            progressVases: [],
            sentVases: []
        }
    },
    methods: {
        async getVases() {
            console.log(this.$store.state.currentUser.email);
            const vases = await firebase.firestore().collection('vase').where('members', 'array-contains', this.$store.state.currentUser.email).get();
            vases.forEach((doc) => {
                let o = {};
                o['id'] = doc.id;
                o['fromEmail'] = doc.get('fromEmail');
                o['toEmail'] = doc.get('toEmail');
                o['toDisplayName'] = doc.get('toDisplayName');
                o['dueDateTime'] = doc.get('dueDateTime');
                o['status'] = doc.get('status');
                o['title'] = doc.get('title');
                o['imgUrl'] = doc.get('imgUrl');
                if (o['status'] == 'before-send') {
                    this.progressVases.push(o);
                } else if (o['status'] == 'sent') {
                    this.sentVases.push(o);
                }
            });
        }
    },
    created() {
        this.getVases();
    }
}
</script>