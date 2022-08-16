<template>
    <div>
        <AppBar />
        <div class="container">
            <h1>편지쓰기 마감시간을<br />설정해주세요</h1>
            <div class="input_group">
                <label for="end_dt">날짜</label>
                <input type="date" id="end_dt" placeholder="ㅇ" v-model="end_dt">
            </div>
            <div class="input_group" style="margin-top: 36px;">
                <label for="end_dttm">시간</label>
                <input type="time" id="end_dttm" placeholder="시간선택" v-model="end_dttm">
            </div>
            <div class="info">
                <div class="d-brown" style="font-weight:900"><span class="dot"></span> 왜 마감시간을 설정해야하나요?</div>
                <div style="color:#36332E;font-weight: bold;margin-left: 7px;margin-top: 6px;">마감시간이 되면 자동으로 편지를
                    발송해드려요.<br />
                    마감시간내에 편지 작성을 잊지마세요!
                </div>
            </div>
            <button @click="onNext" class="elevated_button primary_button" style="margin-top: 32px;">화분만들기</button>
        </div>
    </div>
</template>
<script>
import AppBar from '@/components/AppBar.vue';
import firebase from 'firebase';
import { randomNumber, getNow } from "@/common/utils";
export default {
    components: { AppBar },
    data() {
        return {
            end_dt: null,
            end_dttm: null
        }
    },
    methods: {
        onNext() {
            if (this.end_dt && this.end_dttm) {
                const dueDateTime = `${this.end_dt} ${this.end_dttm}`;
                const createdAt = getNow();
                const title = localStorage.getItem('vase_name');
                const toEmail = localStorage.getItem('vase_to_email');
                const toDisplayName = localStorage.getItem('vase_to_name');
                const fromEmail = this.$store.state.currentUser.email;
                const fromDisplayName = this.$store.state.currentUser.displayName;
                const status = 'before-send';
                const imgUrl = `/img/화분${randomNumber(1, 8)}.png`;
                const doc = firebase.firestore().collection('vase').doc();
                doc.set({
                    dueDateTime, title, toEmail, toDisplayName, fromEmail, fromDisplayName, status, imgUrl, createdAt
                }).then(() => {
                    localStorage.setItem('vase_id', doc.id);
                    this.$router.push('/vase-form-final-invite');
                }).catch((error) => {
                    console.log(error);
                })
            } else {
                alert('날짜와 시간을 선택해주세요.');
            }
        }
    }
}
</script>
<style scoped>
.dot {
    display: inline-block;
    vertical-align: middle;
    width: 3px;
    height: 3px;
    border-radius: 50%;
    background-color: var(--input_line);
    margin-right: 2px;
}

.info {
    background: rgba(233, 225, 211, 0.8);
    border-radius: 12px;
    padding: 16px 12px;
    font-size: 12px;
    margin-top: 60px;
}
</style>