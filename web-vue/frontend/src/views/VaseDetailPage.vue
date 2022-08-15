<template>
    <div>
        <AppBar />
        <div>
            <div class="vase_detail_top">
                <h1 style="text-align:center">화분상세</h1>
                <div>2022.07.12~진행중</div>
                <div class="vase_circle">
                    <img :src="vase.img_url" alt="">
                </div>
                <div>
                    {{ vase.owner }}님에게 보낸 편지
                </div>
            </div>
            <div class="vase_detail_card_container">
                <div v-for="card in cardList" class="card">
                    <img :src="card.img_url" alt="">
                    <div class="content_container">
                        <div class="content">{{ card.content }}</div>
                        <div class="from">{{ card.from }}</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>
<script>
import AppBar from "@/components/AppBar.vue";

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
            cardList: [
                {
                    content: '1212121',
                    from: 'asd',
                    img_url: '/img/leaf/잎사귀1.png'
                },
                {
                    content: '1212121',
                    from: 'asd',
                    img_url: '/img/leaf/잎사귀2.png'
                },
                {
                    content: '1212121',
                    from: 'asd',
                    img_url: '/img/leaf/잎사귀3.png'
                },
                {
                    content: '1212121',
                    from: 'asd',
                    img_url: '/img/leaf/잎사귀4.png'
                },
                {
                    content: '1212121',
                    from: 'asd',
                    img_url: '/img/leaf/잎사귀5.png'
                }
            ]
        }
    }
}
</script>