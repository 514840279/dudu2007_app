<template>
  <div class="hello">
    <header class="Header sticky_head">
        <div class="Top">
            <a href="/" class="logo"><img alt="" class="logo_img" src="http://static.yingyonghui.com/resource/msite/static/images/logo2.png"></a>
            <div class="SearchBox">

                

                <form action="/search/" method="GET" onsubmit="return search();">
                    <div class="Search_Input">
                        <input type="text" id="keyword" class="s_input" value="">
                    </div>
                    <input type="image" class="i-input" src="http://static.yingyonghui.com/resource/msite/static/images/searchbox_action.png">
                </form>
            </div>
        </div>
        <nav class="nav">
            <li class="navi-index " v-bind:class="{'Navigation_Check':item.group===group}" v-for="(item,index) in groups" :key="index"  @click="changeGroup(item.group)">
                <a>{{item.group}}</a>
            </li>
        </nav>
    </header>
    
    <router-view/>

  </div>
</template>

<script>

export default {
  name: 'main',
  data () {
    return {
      group:'大数据',
      groups:[]
    }
  },
  mounted:function(){
    this.loadGroup();
  },
  methods:{
    changeGroup:function(param){
        this.group=param;
        this.$router.push({ path: '/main/list', query: { 'group': this.group }})
        //this.loadType();
    },
    loadGroup:function(){
        this.$http.post('http://localhost:3000/navigation/findGroupList',{}).then(function(res){
            this.groups = res.data;
            this.group= this.groups[0].group;
            this.$router.push({ path: '/main/list', query: { 'group': this.group }})
            // this.loadType();
        },function(res){
            console.log('失败')
        })
    },
  }
}

</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>

</style>
