<template>
  <div class="hello">
   
    
    <div class="main">
        <div class="mainpage">
            <div class="breadcrumb">
                
                <a >{{this.detialData.group}}</a>
                &gt;
                
                <a >{{this.detialData.type}}</a>
                &gt;
                <a >{{this.detialData.name}}</a>
            </div>

            <div class="AppBox">
                <div class="app-details">
                            <img class="app-details-icon" height="51px" width="51px" :alt="this.detialData.name" :title="this.detialData.name" :src="this.detialData.logo_url">

                            <div class="app-details-det">
                                <div class="app-details-appname"><h1>{{this.detialData.name}}</h1></div>

                                <div class="app-details-appdes"><h3>{{this.detialData.intro}}</h3></div>
                                <div class="app-details-appinfo">
                                    <div><span>浏览数：{{this.detialData.click_num}}</span></div>
                                    <div><span>点赞数：{{this.detialData.praise_num}}</span></div>
                                </div>
                            </div>
                        </div>
                        <div class="app-display-a">
                                <div class="download_btn_col">
                                    <a class="normal-down-btn">  </a>
                                    <a class="high-speed-down-btn"  @click="parise()">点赞</a>
                                </div>
                              <div class="b-text">
                                  <span class="span">{{this.detialData.keyword}}</span>
                              </div>
                      </div>


              <div class="App_Img">
                  <div class="App_ImgBox" style="width: 727px;">
                      <img :alt="this.detialData.name" :src="this.detialData.snapshot_img_url" id="img_0">
                   </div>
              </div>

              <div class="App_Category">

                  <div class="App_SpreadBox">

                      <div class="App_SpreadTitle">
                          <span>详细信息</span>
                          <div class="icon"></div>
                      </div>

                      <ul class="App_SpreadContent">
                          <li>
                              <span class="fl">网站名:</span>
                              <span class="fl">{{this.detialData.name}}</span>
                          </li>
                          <li>
                              <span class="fl">网站地址:</span>
                              <span class="fl"><a :href="this.detialData.url">官网</a></span>
                          </li>
                          <li>
                              <span class="fl">收录时间:</span>
                              <span class="fl">{{this.detialData.create_time}}</span>
                          </li>
                          <li>
                              <span class="fl">更新时间:</span>
                              <span class="fl">{{this.detialData.create_time}}</span>
                          </li>
                          <li>
                              <span class="fl">网站简介:</span>
                              <span class="fl">{{this.detialData.intro}}</span>
                          </li>
                          <li>
                              <span class="fl">网站关键词:</span>
                              <span class="fl">{{this.detialData.keyword}}</span>
                          </li>
                          
                              <li>
                                  <span class="fl">网站类型:</span>
                                  <span class="fl">{{this.detialData.type}}</span>
                              </li>
                              <li>
                                  <span class="fl">网站种类:</span>
                                  <span class="fl">{{this.detialData.group}}</span>
                              </li>                          
                      </ul>
                  </div>

                  
              </div>
          </div>
      </div>

    </div>
  </div>
</template>

<script>
export default {
  name: 'detial',
  data () {
    return {
        detialData:{},
        uuid : this.$route.params.uuid,
    }
  },
  mounted:function(){
        this.$http.post('http://localhost:3000/navigation/findOne',{"uuid":this.uuid}).then(function(res){
            this.detialData = res.data;
            console.log(this.detialData)
        },function(res){
            console.log('失败')
        })
  },
  methods:{
      parise:function(){
          this.$http.post('http://localhost:3000/navigation/updatePraise',{"uuid":this.uuid}).then(function(res){
            this.detialData.praise_num=this.detialData.praise_num+1;
            console.log(this.detialData)
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
