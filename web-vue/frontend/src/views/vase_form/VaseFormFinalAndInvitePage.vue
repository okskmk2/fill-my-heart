<template>
    <div>
        <AppBar />
        <div class="container">
            <h1>감사화분이 완성되었어요!<br />함께할 맴버를 초대해주세요</h1>
            <button @click="$router.push('/leaf-form-lobby')" class="elevated_button primary_button">잎편지 쓰기</button>
        </div>
    </div>
</template>
<script>
import AppBar from '@/components/AppBar.vue';
export default {
    components: { AppBar }
}
</script>