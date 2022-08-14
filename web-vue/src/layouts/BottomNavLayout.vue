<template>
    <div class="bottom_nav_layout">
        <router-view></router-view>
        <BottomNav />
    </div>
</template>
<script>
import BottomNav from "@/components/BottomNav.vue";
export default {
    components: {
        BottomNav
    }
}
</script>