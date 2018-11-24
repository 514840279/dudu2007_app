import Vue from 'vue'
import Router from 'vue-router'
import MainMainpage from '@/components/MainMainpage'
import MainMainpageList from '@/components/MainMainpageList'
import MainMainpageDetial from '@/components/MainMainpageDetial'



Vue.use(Router)

export default new Router({
  routes: [
    
    {
      path: '/list',
      name: 'MainMainpageList',
      component: MainMainpageList,
    },{
      path: '/detial/:uuid',
      name: 'MainMainpageDetial',
      component: MainMainpageDetial,
    }

  ]
  
})
