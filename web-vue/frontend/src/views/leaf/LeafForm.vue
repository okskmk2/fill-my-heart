<template>
    <div>
        <AppBar />
        <div class="container">
            <h1>홍길동 님이게</h1>
            <textarea name="" id="" cols="30" rows="10"></textarea>
            <div>(스위치 컴포넌트)</div>
            <button @click="$router.push('/leaf-form-final')" class="elevated_button primary_button">편지 보내기 완료!</button>
        </div>
    </div>
</template>
<script>
import AppBar from '@/components/AppBar.vue';
export default {
    components: { AppBar }
}
</script>