<template>
    <div>
        <AppBar />
        <div class="container">
            <h1>감사화분 제목을<br />지어주세요</h1>
            <input type="text">
            <button @click="$router.push('/vase-form-duedate')" class="elevated_button primary_button">다음(테스트)</button>
        </div>
    </div>
</template>
<script>
import AppBar from '@/components/AppBar.vue';
export default {
    components: { AppBar }
}
</script>