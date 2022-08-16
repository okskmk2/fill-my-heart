<template>
    <div>
        <AppBar />
        <div class="container">
            <h1>감사화분 제목을<br />지어주세요</h1>
            <div class="input_group rel">
                <input type="text" id="user_id" placeholder="예) 선생님 감사해요" v-model="vaseTitle"
                    @keydown.enter="searchUser">
                <img v-if="hasInput" src="@/assets/images/icons/icon_close.svg" style="width: 28px; top:8px; right:0"
                    class='abs' @click="vaseTitle = ''" />
            </div>
            <button @click="onNext()" class="elevated_button primary_button" style="margin-top: 32px;"
                :disabled="!hasInput">다음</button>
        </div>
    </div>
</template>
<script>
import AppBar from '@/components/AppBar.vue';
export default {
    components: { AppBar },
    data() {
        return {
            vaseTitle: '',
        }
    },
    computed: {
        hasInput() {
            return this.vaseTitle.length > 0;
        }
    },
    methods: {
        onNext() {
            localStorage.setItem('vase_name', this.vaseTitle);
            this.$router.push('/vase-form-duedate');
        }
    }
}
</script>