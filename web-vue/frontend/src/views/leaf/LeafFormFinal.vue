<template>
    <div>
        <AppBar />
        <div class="container">
            <h1>{{ $store.state.leafToDisplayName }}님에게~ 전달완료</h1>
            <button @click="$router.push('/vase-post-office')" class="elevated_button primary_button">확인</button>
        </div>
    </div>
</template>
<script>
import AppBar from '@/components/AppBar.vue';
export default {
    components: { AppBar }
}
</script>