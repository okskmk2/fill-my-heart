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
                    {{ progressVases.length }}</button>
                <button class="tabbar_button" @click="selectedIndex = 1" :class="{ 'active': selectedIndex === 1 }">보내기
                    완료
                    {{ sentVases.length }}</button>
            </div>
            <div class="container" style="padding-top:22px;padding-bottom: 96px;">
                <div v-if="selectedIndex === 0" class="post_office_vard_card_container">
                    <div v-for="vase in progressVases" class="post_office_vase_card"
                        :class="{ 'im_sent': vase.im_sent }" @click="$router.push(`/vase/${vase.id}`)">
                        <div class="vase_card_circle">
                            <img :src="vase.imgUrl" alt="">
                        </div>
                        <div class="col expand jc-center">
                            <div>{{ vase.toDisplayName }}에게 전달까지</div>
                            <div class="primary">{{ vase.dueDateTime }}</div>
                        </div>
                    </div>
                </div>
                <div v-if="selectedIndex === 1" class="post_office_vard_card_container">
                    <div v-for="vase in sentVases" class="post_office_vase_card"
                        @click="$router.push(`/vase/${vase.id}`)">
                        <div class="vase_card_circle">
                            <img :src="vase.imgUrl" alt="">
                        </div>
                        <div class="col expand jc-center">
                            <div>{{ vase.toDisplayName }}에게 전달까지</div>
                            <div class="primary">{{ vase.dueDateTime }}</div>
                        </div>
                    </div>
                </div>
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
            selectedIndex: 0,
            progressVases: [],
            sentVases: []
        }
    },
    methods: {
        getLeft(date) {
            let totalMinutes = moment().diff(date, 'minutes');
            let isAfter = false;
            if (totalMinutes < 0) {
                totalMinutes *= -1;
            } else {
                isAfter = true;
            }
            const minutes = totalMinutes % 60;
            const hours = Math.floor(totalMinutes / 60);
            const days = Math.floor(totalMinutes / (60 * 24));
            return `${days}일 ${hours}시 ${minutes}분 ${isAfter ? '지났습니다' : '남았습니다'}`
        },

        async getVases() {
            const email = this.$store.state.currentUser.email
            const vases = await firebase.firestore().collection('vase').where('members', 'array-contains', email).get();
            vases.forEach(async (doc) => {
                let o = {};
                o['id'] = doc.id;
                o['fromEmail'] = doc.get('fromEmail');
                o['toEmail'] = doc.get('toEmail');
                o['toDisplayName'] = doc.get('toDisplayName');
                o['dueDateTime'] = `${this.getLeft(moment('2022-08-19 23:50'))}`;
                o['status'] = doc.get('status');
                o['title'] = doc.get('title');
                o['imgUrl'] = doc.get('imgUrl');

                const leaf = await firebase.firestore().collection(`vase/${doc.id}/leaf`).where('fromEmail', "==", email).get();
                o['im_sent'] = !leaf.empty;

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