<template>
  <div class="hello">
    <header class="Header sticky_head">
        <div class="Top">
            <a href="/" class="logo"><img alt="">知识导航</a>
            <div class="SearchBox">
           
                    <div class="Search_Input">
                        <input type="text" v-model="keyword" class="s_input" value="">
                    </div>
                    <input type="image"   @click="search();" class="i-input" src="http://static.yingyonghui.com/resource/msite/static/images/searchbox_action.png">
           
            </div>
        </div>
        <nav class="nav">
            <li class="navi-index " v-bind:class="{'Navigation_Check':item.group===group}" v-for="(item,index) in groups" :key="index"  @click="changeGroup(item.group)">
                <a>{{item.group}}</a>
            </li>
        </nav>
    </header>

    <div class="main">
        <div class="mainpage mbt_27">
            <section class="ClassifyBox">
                <ul>
                    <li v-bind:class="{'Classify_Checked':item.type===type}" class="" v-for="(item,index) in types" :key="index"  @click="changeType(item.type)"><a>{{item.type}}</a></li>
                </ul>
            </section>
        
            <ul class="list_con" >
                <li class="app-list-con" v-for="item in showData" :key="item.uuid" >
                    <a v-on:click="getDiscription(item.uuid)" >
                        <img class="app-list-img" alt="item.name" title="item.name"  :src="item.logo_url">
                    </a>
                    
                    <div class="app-list-details">
                        <div class="app-list-name">
                            <h2>
                                <a v-on:click="getDiscription(item.uuid)">{{item.name}}</a>
                            </h2>
                        </div>
                        <div class="app-list-des">
                            <h3>{{item.intro}}</h3>
                        </div>

                        <div class="app-list-info">
                            <div>浏览量：{{item.click_num}}</div>
                            <div>点赞量：{{item.praise_num}}</div>
                        </div>
                    </div>
                    
                    
                    <div class="app-list-download">
                        <!--<a v-on:click="getDiscription(item.uuid)">详细</a>-->
                        <router-link tag="a" target="_blank" :to="{item}">详细</router-link>
                    </div>
                </li>
               
            </ul>

            <div class="get_more" v-show="loading" value="app">
                <a onclick="return false;" style="display:block;" value="/ajax/cat/30/2">查看更多</a>
                <div class="get_more_load">
                    <img alt="加载中" src="http://static.yingyonghui.com/resource/msite/static/images/loading1.gif">
                    <span>加载中，请稍等...</span>
                </div>
            </div>      
        </div>


        <div class="Footer">
            <div class="Footer-line"></div>
            <span class="Footer-com">北京掌汇天下科技有限公司 版权所有</span>
            <span class="fs10">AppChina <a href="http://m.appchina.com/" title="应用汇">应用汇</a> -安卓手机网上最贴心的Android软件应用平台!</span>
            <span class="fs10">网游联运：838323140&nbsp;|&nbsp;单机游戏：2440642105</span>
        </div>

        <div id="none_display" style="display:none;">
        </div>


    </div>   

  </div>
</template>

<script>
export default {
  name: 'list',
  data () {
    return {
      showData:[],
      loading:false,
      group:'大数据',
      groups:[],
      type:'行业资讯',
      types:[],
      keyword:""
    }
  },
  mounted (){
    // 加载组
    this.loadGroup();
    // 加载类别
    //this.loadType();
    // 加载 
    //this.loadDate();
  },
  methods:{
    changeType:function(param){
        this.type=param;
        this.loadDate();
    },
    changeGroup:function(param){
        this.group=param;
        this.loadType();
    },
    loadGroup:function(){
        this.$http.post('http://localhost:3000/navigation/findGroupList',{}).then(function(res){
            this.groups = res.data;
            this.group= this.groups[0].group;
            this.loadType();
        },function(res){
            console.log('失败')
        })
    },
    loadType:function(){
        this.$http.post('http://localhost:3000/navigation/findTypeList',{"group":this.group}).then(function(res){
            this.types = res.data;
            this.type=this.types[0].type;
            this.loadDate();
        },function(res){
            console.log('失败')
        })
    },
    loadDate:function(){
        this.loading = true;
        // get请求 需要向后台传参数 语法：{params:{a:10,b:2}}
        // post 语法：params
        // this.$http.get('get.php',{params:{a:10,b:2}}).then(function(res){}
        this.$http.post('http://localhost:3000/navigation/findAll',{"type":this.type,"group":this.group}).then(function(res){
            this.showData = res.data;
        },function(res){
            console.log('失败')
        })
        this.loading = false;
    },
    getDiscription:function(uuid){
        this.$router.push({ name: 'MainMainpageDetial', params: { 'uuid':uuid }})
    },
    search:function(){
        console.log(this.keyword)
         this.$http.post('http://localhost:3000/navigation/findAllByName',{"name":this.keyword}).then(function(res){
            this.showData = res.data;
        },function(res){
            console.log('失败')
        })
    }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>

</style>
