<template>
    <div>
        <AppBar />
        <div class="container">
            <h1>편지쓰기 마감시간을<br />설정해주세요</h1>
            <button @click="$router.push('/vase-form-final-invite')"
                class="elevated_button primary_button">화분만들기</button>
        </div>
    </div>
</template>
<script>
import AppBar from '@/components/AppBar.vue';
export default {
    components: { AppBar }
}
</script>