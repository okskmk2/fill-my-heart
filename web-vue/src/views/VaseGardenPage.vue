<template>
    <div class="vase_garden">
        <h1 style="margin:50px 20px 9px;">
            화분 보관함 <span class="primary">15</span>
        </h1>
        <div v-for="group in groupedVaseList" class="vase_group">
            <div v-for="vase in group">
                <img :src="vase.img_url" alt="">
            </div>
        </div>
    </div>
</template>
<script>
import { groupArr } from "@/common/utils";
export default {
    data() {
        return {
            vaseList: [
                {
                    id: 1,
                    img_url: '/img/화분1.png'
                },
                {
                    id: 2,
                    img_url: '/img/화분2.png'
                },
                {
                    id: 3,
                    img_url: '/img/화분3.png'
                },
                {
                    id: 4,
                    img_url: '/img/화분4.png'
                },
                {
                    id: 5,
                    img_url: '/img/화분5.png'
                },
                {
                    id: 6,
                    img_url: '/img/화분6.png'
                },
                {
                    id: 7,
                    img_url: '/img/화분7.png'
                },
                {
                    id: 8,
                    img_url: '/img/화분8.png'
                },
            ]
        }
    },
    computed: {
        groupedVaseList() {
            return groupArr(this.vaseList, 3);
        }
    }
}
</script>