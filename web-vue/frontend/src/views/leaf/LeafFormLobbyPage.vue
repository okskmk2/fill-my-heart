<template>
    <div class="leaf_form_lobby col">
        <h1 style="margin: 50px 20px 18px;">잎편지 쓰기</h1>
        <div class="col jc-between expand">
            <div class="leaf_lobby_top_card">
                <div class="vase_to">To. 동그라미</div>
                <div class="vase_title">생일추카추카추</div>
                <div class="row jc-around">
                    <div class="col ai-center">
                        <div class="meta_name">남은시간</div>
                        <div class="meta_value">5시 20분</div>
                    </div>
                    <div class="col ai-center">
                        <div class="meta_name">참여인원</div>
                        <div class="meta_value">5명</div>
                    </div>
                </div>
            </div>
            <div class="col ai-center">
                <div>여기에<br />잎편지를 써주세요!</div>
                <img src="/img/동글뱅이화살표.png" alt="">
                <button class="none_style_button" @click="$router.push('/leaf-form')">
                    <img src="/img/leaf/잎사귀.png" alt="" style="width:114px">
                </button>
                <img src="/img/잎편지쓰기의화분.png" alt="">
            </div>
        </div>
    </div>
</template>
<script>

export default {

}
</script>