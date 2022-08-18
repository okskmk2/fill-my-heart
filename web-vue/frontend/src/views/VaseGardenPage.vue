<template>
    <div class="vase_garden">
        <h1 style="margin:50px 20px 9px;">
            화분 보관함 <span class="primary">15</span>
        </h1>
        <div v-for="group in groupedVaseList" class="vase_group">
            <div v-for="vase in group" @click="$router.push(`/vase/${vase.id}`)">
                <img :src="vase.imgUrl" alt="">
            </div>
        </div>
    </div>
</template>
<script>
import firebase from "firebase";
import { groupArr } from "@/common/utils";
export default {
    data() {
        return {
            vaseList: []
        }
    },
    computed: {
        groupedVaseList() {
            return groupArr(this.vaseList, 3);
        }
    },
    mounted() {
        // 나에게 보낸 화분들
        firebase.firestore().collection('vase').where('toEmail', '==', firebase.auth().currentUser.email).get().then((qs) => {
            qs.forEach(doc => {
                this.vaseList.push({
                    id: doc.id,
                    imgUrl: doc.get('imgUrl')
                })
            })
        })
    }
}
</script>