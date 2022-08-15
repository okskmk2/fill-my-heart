<template>
    <div>
        <AppBar />
        <div class="container">
            <h1>누구에게 감사화분을<br />보낼까요?</h1>
            <div class="input_group">
                <input type="text" id="user_id" placeholder="닉네임을 검색해주세요" v-model="searchName"
                    @keydown.enter="searchUser" class="search_input">
            </div>
            <div style="margin-top:32px">
                <div v-if="userList === null"></div>
                <div v-else>
                    <div v-if="userList.length < 1" class="vase_form_user_card">
                        <svg width="36" height="36" viewBox="0 0 36 36" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <path fill-rule="evenodd" clip-rule="evenodd"
                                d="M18 33C15.0333 33 12.1332 32.1203 9.66645 30.472C7.19972 28.8238 5.27713 26.4811 4.14181 23.7403C3.0065 20.9994 2.70945 17.9834 3.28823 15.0736C3.86701 12.1639 5.29562 9.49119 7.39341 7.3934C9.49119 5.29561 12.1639 3.867 15.0737 3.28822C17.9834 2.70944 20.9994 3.00649 23.7403 4.1418C26.4812 5.27712 28.8238 7.19971 30.4721 9.66645C32.1203 12.1332 33 15.0333 33 18C33 19.9698 32.612 21.9204 31.8582 23.7403C31.1044 25.5601 29.9995 27.2137 28.6066 28.6066C27.2137 29.9995 25.5601 31.1044 23.7403 31.8582C21.9204 32.612 19.9698 33 18 33ZM18 6C15.6266 6 13.3066 6.70379 11.3332 8.02237C9.35977 9.34094 7.8217 11.2151 6.91345 13.4078C6.0052 15.6005 5.76756 18.0133 6.23058 20.3411C6.69361 22.6689 7.8365 24.8071 9.51473 26.4853C11.193 28.1635 13.3312 29.3064 15.6589 29.7694C17.9867 30.2324 20.3995 29.9948 22.5922 29.0866C24.7849 28.1783 26.6591 26.6402 27.9776 24.6668C29.2962 22.6935 30 20.3734 30 18C30 14.8174 28.7357 11.7652 26.4853 9.51472C24.2349 7.26428 21.1826 6 18 6ZM18 22.5C18.8284 22.5 19.5 23.1716 19.5 24C19.5 24.8284 18.8284 25.5 18 25.5C17.1716 25.5 16.5 24.8284 16.5 24C16.5 23.1716 17.1716 22.5 18 22.5ZM16.9393 20.5607C17.2206 20.842 17.6022 21 18 21C18.3978 21 18.7794 20.842 19.0607 20.5607C19.342 20.2794 19.5 19.8978 19.5 19.5V12C19.5 11.6022 19.342 11.2206 19.0607 10.9393C18.7794 10.658 18.3978 10.5 18 10.5C17.6022 10.5 17.2206 10.658 16.9393 10.9393C16.658 11.2206 16.5 11.6022 16.5 12V19.5C16.5 19.8978 16.658 20.2794 16.9393 20.5607Z"
                                fill="#A7A49E" />
                        </svg>
                        <div>
                            받는 사람이 없나요?<br />괜찮아요. 링크로 전달할 수 있어요
                        </div>
                        <button class="elevated_button primary_button" @click="$router.push('/vase-form-title')"
                            style="margin-top:20px">다음
                            단계로</button>
                    </div>
                    <div v-else>
                        <div v-for="user in userList" class="vase_form_user_card">
                            <div style="font-size:20px;font-weight:bold;color:#000">
                                {{ user.displayName }}
                            </div>
                            <div style="font-size:12px;font-weight:bold;color:#747474;margin-top: 6px;">
                                {{ user.email }}
                            </div>
                            <button class="elevated_button primary_button" style="margin-top:16px"
                                @click="$router.push('/vase-form-title')">선택</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>
<script>
import AppBar from '@/components/AppBar.vue';
import firebase from "firebase";
export default {
    components: { AppBar },
    data() {
        return {
            searchName: '',
            userList: null
        }
    },
    methods: {
        searchUser() {
            this.userList = null;
            firebase.firestore().collection('users').where("displayName", "==", this.searchName).get().then((qs) => {
                if (qs.size < 1) {
                    this.userList = [];
                } else {
                    this.userList = [];
                    qs.forEach((doc) => {
                        this.userList.push(doc.data());
                    })
                }
            }).catch((error) => {
                console.log(error);
            });
        }
    }
}
</script>