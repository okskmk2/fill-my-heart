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
            <div class="container" style="padding-top:22px">
                <div v-if="selectedIndex === 0" class="post_office_vard_card_container">
                    <div v-for="vase in progressVases" class="post_office_vase_card"
                        @click="$router.push(`/vase/${vase.id}`)">
                        <div class="vase_card_circle">
                            <img :src="vase.img_url" alt="">
                        </div>
                        <div>{{ vase.to }}</div>
                        <div>{{ vase.due_date }}</div>
                    </div>
                </div>
                <div v-if="selectedIndex === 1" class="post_office_vard_card_container">
                    <div v-for="vase in sentVases" class="post_office_vase_card"
                        @click="$router.push(`/vase/${vase.id}`)">
                        <div class="vase_card_circle">
                            <img :src="vase.img_url" alt="">
                        </div>
                        <div>{{ vase.to }}</div>
                        <div>{{ vase.due_date }}</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>
<script>
export default {
    data() {
        return {
            selectedIndex: 0,
            progressVases: [
                {
                    id: 1,
                    img_url: '/img/화분1.png',
                    to: '홍길동',
                    due_date: '2022-10-10',
                },
                {
                    id: 2,
                    img_url: '/img/화분3.png',
                    to: '홍길동',
                    due_date: '2022-10-10',
                },
                {
                    id: 3,
                    img_url: '/img/화분1.png',
                    to: '홍길동',
                    due_date: '2022-10-10',
                },
                {
                    id: 4,
                    img_url: '/img/화분3.png',
                    to: '홍길동',
                    due_date: '2022-10-10',
                }
            ],
            sentVases: [
                {
                    id: 5,
                    img_url: '/img/화분2.png',
                    to: '홍길동2',
                    due_date: 'due_date',
                }
            ]
        }
    }
}
</script>