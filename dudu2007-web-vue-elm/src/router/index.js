import Vue from 'vue'
import Router from 'vue-router'
import MainMainpage from '@/components/MainMainpage'
import MainIfram from '@/components/MainIfram'
import MainMainpageList from '@/components/MainMainpageList'
import MainMainpageDetial from '@/components/MainMainpageDetial'



Vue.use(Router)

export default new Router({
  routes: [
    
    {
      path: '/mainIfram',
      name: 'MainIfram',
      component: MainIfram,
    }, {
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
