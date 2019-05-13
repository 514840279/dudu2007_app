<template>
  <div class="hello">
    <iframe src="http://lqab.net:1976/" frameborder=0 name="showHere" scrolling=auto  id="show-iframe" ></iframe>
  </div>
</template>

<script>

export default {
  name: 'main',
  data () {
    return {
       
    }
  },
  mounted:function(){
    const oIframe = document.getElementById('show-iframe');
    const deviceWidth = document.documentElement.clientWidth;
    const deviceHeight = document.documentElement.clientHeight;
    oIframe.style.width = deviceWidth + 'px';
    oIframe.style.height = deviceHeight + 'px';
  },
  methods:{
   
  }
}

</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>

</style>
