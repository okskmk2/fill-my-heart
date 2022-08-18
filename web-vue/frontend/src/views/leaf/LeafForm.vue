<template>
    <div>
        <AppBar />
        <div class="container">
            <h1>{{ vase.toDisplayName }} 님에게</h1>
            <textarea name="" id="" cols="30" rows="10" v-model="content"></textarea>
            <button @click="sendLeaf" class="elevated_button primary_button">편지 보내기 완료!</button>
        </div>
    </div>
</template>
<script>
import firebase from 'firebase';
import AppBar from '@/components/AppBar.vue';
import moment from 'moment';
import { randomNumber } from '@/common/utils'
export default {
    components: { AppBar },
    data() {
        return {
            vase: {},
            content: ""
        }
    },
    methods: {
        async sendLeaf() {
            firebase.firestore().collection(`vase/${this.$route.params.id}/leaf`).doc().set({
                fromDisplayName: this.$store.state.currentUser.displayName,
                fromEmail: this.$store.state.currentUser.email,
                content: this.content,
                sentAt: moment().format('YYYY-MM-DD HH:mm'),
                imgUrl: `/img/leaf/잎사귀${randomNumber(0, 9)}.png`
            }).then(() => {
                this.$store.commit('setLeafToDisplayName', this.vase.toDisplayName);
                this.$router.push('/leaf-form-final');
            })
        }
    },
    created() {
        firebase.firestore().doc(`vase/${this.$route.params.id}`).get().then(doc => {
            const o = {};
            o['toDisplayName'] = doc.get('toDisplayName');
            this.vase = o;
        });
        this.$store.commit('setLeafToDisplayName', "");
    }
}
</script>