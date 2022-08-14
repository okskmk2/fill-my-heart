import Vue from 'vue'
import VueRouter from 'vue-router'
import StartPage from '../views/StartPage.vue'
import HomePage from '../views/HomePage.vue'
import SignUpPage from '../views/SignUpPage.vue'
import SignInPage from '../views/SignInPage.vue'
import OnBoarding from '../views/OnBoarding.vue'
import LeafFormLobbyPage from '../views/leaf/LeafFormLobbyPage.vue'
import VaseGardenPage from '../views/VaseGardenPage.vue'
import VasePostOfficePage from '../views/VasePostOfficePage.vue'
import BottomNavLayout from '../layouts/BottomNavLayout.vue'

Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    component: StartPage
  },
  {
    path: '/sign-up',
    component: SignUpPage
  },
  {
    path: '/sign-in',
    component: SignInPage
  },
  {
    path: '/onboarding',
    component: OnBoarding
  },
  {
    path: '',
    component: BottomNavLayout,
    children: [
      {
        path: 'home',
        component: HomePage
      },
      {
        path: 'leaf-form-lobby',
        component: LeafFormLobbyPage
      },
      {
        path: 'vase-garden',
        component: VaseGardenPage
      },
      {
        path: 'vase-post-office',
        component: VasePostOfficePage
      }
    ]
  },

]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router
