<template>
    <div>
        <AppBar />
        <div class="container expand col">
            <div class="expand col jc-between">
                <h1>감사화분이 완성되었어요!<br />함께할 맴버를 초대해주세요</h1>
                <button class="elevated_button second_button" @click="copyToClipboard()">링크복사하기</button>
                <button @click="onNext" class="elevated_button primary_button" style="margin-top:16px">잎편지 쓰기</button>
            </div>
        </div>
    </div>
</template>
<script>
import AppBar from '@/components/AppBar.vue';
export default {
    components: { AppBar },
    data() {
        return {
            publicUrl: ''
        }
    },
    methods: {
        onNext() {
            this.$router.push('/leaf-form-lobby');
        },
        copyToClipboard() {
            navigator.clipboard.writeText(this.publicUrl);
            alert('링크를 복사하였습니다.');
        }
    },
    created() {
        this.publicUrl = ` ${location.origin}/vase/${localStorage.getItem('vase_id')}`;
    }
}
</script>