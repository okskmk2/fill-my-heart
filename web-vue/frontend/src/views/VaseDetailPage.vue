<template>
    <div>
        <AppBar />
        <div style="padding-bottom:100px">
            <div class="vase_detail_top">
                <h1 style="text-align:center">{{ vase.title }}</h1>
                <div>{{ vase.startDate }} ~ {{ vase.status }}</div>
                <div class="vase_circle" style="margin-top: 8px;">
                    <img :src="vase.imgUrl" alt="">
                </div>
                <div style="margin-top: 8px;">
                    {{ vase.toDisplayName }}님에게 보낸 편지
                </div>
            </div>
            <div class="vase_detail_card_container">
                <div v-for="card in cardList" class="card">
                    <img :src="card.imgUrl" alt="">
                    <div class="content_container">
                        <div class="content">{{ card.content }}</div>
                        <div class="from">{{ card.fromDisplayName }}</div>
                    </div>
                </div>
            </div>
        </div>
        <div class="bottom_fab" v-if="!isMine">
            <button class="elevated_button small primary_button" @click="$router.push(`/leaf-form/${vase.id}`)">편지쓰기</button>
        </div>
    </div>
</template>
<script>
import AppBar from "@/components/AppBar.vue";
import firebase from "firebase";
import moment from "moment";

export default {
    components: {
        AppBar
    },
    data() {
        return {
            vase: {
                owner: '햇살',
                img_url: '/img/화분1.png'
            },
            isMine: false,
            cardList: []
        }
    },
    mounted() {
        const email = this.$store.state.currentUser.email;
        const vaseDoc = firebase.firestore().doc(`vase/${this.$route.params.id}`);
        vaseDoc.get().then((doc) => {
            const o = {};

            o['id'] = doc.id;
            o['title'] = doc.get('title');
            o['imgUrl'] = doc.get('imgUrl');
            o['fromEmail'] = doc.get('fromEmail');
            o['toEmail'] = doc.get('toEmail');
            this.isMine = o['toEmail'] === email;
            o['toDisplayName'] = doc.get('toDisplayName');
            o['dueDateTime'] = doc.get('dueDateTime');
            o['startDate'] = moment(moment(doc.get('createdAt'), 'YYYY-MM-DD HH:mm')).format('YYYY.MM.DD');
            o['status'] = doc.get('status') == 'before-send' ? '진행중' : '';
            this.vase = o;

            console.log(this.vase);


            let members = doc.get('members');

            if (email) {
                if (members instanceof Array) {
                    console.log("맴버가 어레이다");
                    if (!members.includes(email)) {
                        console.log("내 이메일이 없다.", email, members);
                        members.push(email);
                        vaseDoc.update({
                            members
                        });
                    }
                }
                else {
                    console.log("맴버가 어레이가 아니라서 어레이로 만들었다.");
                    members = [];
                    members.push(email);
                    vaseDoc.update({
                        members
                    });
                }
            }
        });
        firebase.firestore().collection(`vase/${this.$route.params.id}/leaf`).get().then(qs => {
            qs.forEach(doc => {
                const o = {};
                o['id'] = doc.id;
                o['imgUrl'] = doc.get('imgUrl');
                o['fromEmail'] = doc.get('fromEmail');
                o['fromDisplayName'] = doc.get('fromDisplayName');
                o['sendAt'] = doc.get('sendAt');
                o['content'] = doc.get('content');
                this.cardList.push(o);
            });
        });
        firebase.firestore().collection('vase').where('members', 'in', ['a@a.com']).get().then((qs) => {
            qs.forEach(doc => {
                console.log(doc.id);
            })
        })
    }
}
</script>