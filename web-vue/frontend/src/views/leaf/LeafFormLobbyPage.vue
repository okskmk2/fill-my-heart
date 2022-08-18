<template>
    <div class="leaf_form_lobby col">
        <h1 style="margin: 50px 20px 18px;">잎편지 쓰기</h1>
        <div class="jc-between expand" v-if="vaseList.length > 0">
            <div class="leaf_form_lobby_vase" v-for="vase, index in vaseList" :class="{ 'active': (index === 0) }"
                :vaseid="vase.id">
                <div class="leaf_lobby_top_card">
                    <div class="vase_to">To. {{ vase.toDisplayName }}</div>
                    <div class="vase_title">{{ vase.title }}</div>
                    <div class="row jc-around">
                        <div class="col ai-center">
                            <div class="meta_name">남은시간</div>
                            <div class="meta_value">5시 20분</div>
                        </div>
                        <div class="col ai-center">
                            <div class="meta_name">참여인원</div>
                            <div class="meta_value">{{ vase.members.length }}</div>
                        </div>
                    </div>
                </div>
                <div class="col ai-center">
                    <div>여기에<br />잎편지를 써주세요!</div>
                    <img src="/img/동글뱅이화살표.png" alt="">
                    <button class="none_style_button" @click="$router.push(`/leaf-form/${vase.id}`)">
                        <img src="/img/leaf/잎사귀0.png" alt="" style="width:114px">
                    </button>
                    <img :src="vase.imgUrl" alt="">
                </div>
            </div>
        </div>
        <div v-else>화분이 없습니다</div>
    </div>
</template>
<script>
import moment from "moment";
import firebase from "firebase";
export default {
    data() {
        return {
            vaseList: []
        }
    },
    methods: {
        async getAllVase() {
            const email = this.$store.state.currentUser.email;
            // 내가 속한 화분목록
            const myVaseList = (await firebase.firestore().collection('vase').where('members', 'array-contains', email).get()).docs.map(doc => ({ id: doc.id, ...doc.data() }));

            for (let index = 0; index < myVaseList.length; index++) {
                const vase = myVaseList[index];
                console.log(vase.id);
                // 내가 이미 쓴 잎사귀가 있다면 화분을 추가하지 않는다.
                const leaves = (await firebase.firestore().collection(`vase/${vase.id}/leaf`).where('fromEmail', '==', email).get());
                if (leaves.empty) {
                    this.vaseList.push(vase);
                }
            }
        }
    },
    mounted() {
        this.getAllVase();
    }
}
</script>