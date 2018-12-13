<%--
  Created by IntelliJ IDEA.
  User: Slacker
  Date: 2018/10/11
  Time: 19:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="iframe/head1.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="container">
    <div id="aplayer" style="position:fixed;bottom: 0px;width:100%;"></div>
    <!-- 轮播导航-->
    <div id="myCarousel" class="carousel slide" data-ride="carousel">
        <!-- 轮播（Carousel）指标 -->
        <ol class="carousel-indicators">
            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#myCarousel" data-slide-to="1"></li>
            <li data-target="#myCarousel" data-slide-to="2"></li>
        </ol>
        <!-- 轮播（Carousel）项目 -->
        <div class="carousel-inner">
            <div class="item active">
                <a href="#"><img src="image/1.jpg" alt="First slide"></a>
                <div class="carousel-caption">
                    <h1>欢迎来到音乐客栈</h1>
                    <p>本站将为音乐爱好者提供一个优质的听歌平台</p>
                    <p><a class="btn btn-primary btn-lg" role="button">
                        了解本站>></a></p>
                </div>
            </div>
            <div class="item">
                <a href="#"><img src="image/10.jpg" alt="Second slide"></a>


            </div>
            <div class="item">
                <a href="#"><img src="image/3.jpg" alt="Third slide"></a>
            </div>
        </div>
        <!-- 轮播（Carousel）导航 -->
        <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>
</div>
<!--歌手介绍-->
<div class="container">
    <div class="hd">
        歌手站
        <a href="frontDesk/singers/singer.jsp" target="_blank" class="pull-right">更多>></a>
    </div>
    <div class="singerListTable text-center" style="margin-top: 5px;padding:5px;">

    </div>
</div>


<div class="container">
    <!-- 展示部分-->
    <div class="page_major">
        <div class="row">
            <div class="col-md-9">
                <!-- 中间边框设计-->



                <hr style="color: gray;">
                <div class="raw">
                    <div class="col-md-4 rankingBackground">
                        <img src="/image/re-ge.jpg" style="width:250px;height:70px"/>
                        <div class="list-group hotRankingList">
                        </div>
                    </div>
                    <div class="col-md-4 rankingBackground">
                        <img src="/image/chart_3.jpg" style="width:250px;height:70px"/>
                        <div class="list-group singerRankingList">
                        </div>
                    </div>
                    <div class="col-md-4 rankingBackground">
                        <img src="/image/chart_2.jpg" style="width:250px;height:70px"/>
                        <div class="list-group oldRankingList">
                        </div>
                    </div>
                </div>

                <!-- 中间结束-->
            </div>
            <div class="col-md-3">
                <!-- 右边框设计-->
                <div class="layui-tab-content">
                    <div class="layui-tab-item layui-show">
                        <div class="layui-carousel" id="test1">
                            <div carousel-item>
                                <div class="layui-bg-green demo-carousel">
                                    <img src="/image/2.jpg" style="width:100% ;">
                                </div>
                                <div class=" layui-bg-red demo-carousel">
                                    <img src="/image/7.jpg" style="width:100% ;">
                                </div>
                                <div class="layui-bg-blue demo-carousel">
                                    <img src="/image/8.jpg"style="width:100% ;" >
                                </div>
                                <div class=" layui-bg-orange demo-carousel">
                                    <img src="/image/9.jpg" style="width:100% ;" >
                                </div>
                                <div class="layui-bg-cyan demo-carousel">
                                    <img src="/image/10.jpg" style="width:100% ;">
                                </div>

                            </div>


                     </div>
                    </div>
                </div>
                <div class="news" >
                    <div class="hd">
                        推荐资讯
                        <div class="pull-right">
                            <a href="javascript:;" class="left " role="button" data-slide="prev"><</a>
                            <a href="javascript:;" class="right " role="button" data-slide="next">></a>
                        </div>
                    </div>
                    <div class="bd">
                        <ul class="animation curr" style="display:block" db="1">

                            <li class="ell"><i></i><a href="http://5sing.kugou.com/yc/3733784.html"
                                                      target="_blank"
                                                      title="THE SxPLAY与V.K克跨越海岸的合作新曲《手掌心》">THE
                                SxPLAY与V.K克跨越海岸的合作新曲《手掌心》</a></li>
                            <li class="ell"><i></i><a
                                    href="http://5sing.kugou.com/67920008/zj/5bbffebab0f5bae33716d65f.html"
                                    target="_blank" title="【推荐】动画原声专辑《侠肝义胆沈剑心》，豪情万丈！">【推荐】动画原声专辑《侠肝义胆沈剑心》，豪情万丈！</a>
                            </li>
                            <li class="ell"><i></i><a href="http://5sing.kugou.com/yc/3723070.html"
                                                      target="_blank"
                                                      title="【首发】叶洛洛萌系洗脑新歌《蛋黄蛋白》">【首发】叶洛洛萌系洗脑新歌《蛋黄蛋白》</a>
                            </li>
                            <li class="ell"><i></i><a href="http://5sing.kugou.com/fc/16729613.html"
                                                      target="_blank"
                                                      title="【推荐】30位古风大大献唱《我爱你中国》">【推荐】30位古风大大献唱《我爱你中国》</a>
                            </li>
                            <li class="ell"><i></i><a href="http://5sing.kugou.com/yc/3719864.html"
                                                      target="_blank"
                                                      title="【首发】一体机音乐人余音新歌《老地方》">【首发】一体机音乐人余音新歌《老地方》</a>
                            </li>
                            <li class="ell"><i></i><a href="http://5sing.kugou.com/topic/aqy/aqy.html"
                                                      target="_blank"
                                                      title="【招募】爱奇艺国风美少年报名入口">【招募】爱奇艺国风美少年报名入口</a></li>
                            <li class="ell"><i></i><a href="http://5sing.kugou.com/yc/3714124.html"
                                                      target="_blank"
                                                      title="【首发】叶洛洛古风新曲《如萤》">【首发】叶洛洛古风新曲《如萤》</a></li>
                            <li class="ell"><i></i><a href="http://5sing.kugou.com/yc/3714124.html"
                                                      target="_blank"
                                                      title="【首发】叶洛洛古风新曲《如萤》">【首发】叶洛洛古风新曲《如萤》</a></li>
                            <li class="ell"><i></i><a href="http://5sing.kugou.com/yc/3714124.html"
                                                      target="_blank"
                                                      title="【首发】叶洛洛古风新曲《如萤》">【首发】叶洛洛古风新曲《如萤》</a></li>
                            <li class="ell"><i></i><a href="http://5sing.kugou.com/yc/3714124.html"
                                                      target="_blank"
                                                      title="【首发】叶洛洛古风新曲《如萤》">【首发】叶洛洛古风新曲《如萤》</a></li>

                        </ul>
                    </div>
                </div>

                <!-- 右边结束-->
            </div>
        </div>
    </div>

</div>
<!---->

<!-- 隐藏的登录界面-->
<div class="signform" id="signform" style="display: none">
    <div class="signclose">
        <span class="glyphicon glyphicon-remove" aria-hidden="true" width="35px" height="35px" onclick="signclose()"></span>
    </div>
    <div class="login-center">
        <div class="container">
        <form class="form-horizontal" action="${pageContext.request.contextPath}/frontDesk/login.do" method="post">
            <div class="form-group">
                <label for="countName" class="col-sm-2 control-label"><span class="glyphicon glyphicon-user" aria-hidden="true" style="background-color: #fff"></span></label>
                <div class="col-sm-3">
                    <input type="text" class="form-control" id="countName" name="countName" placeholder="账号/邮箱/手机号" >
                </div>
            </div>
            <div class="form-group">
                <label for="countPassword" class="col-sm-2 control-label"><span class="glyphicon glyphicon-lock" aria-hidden="true" style="background-color: #fff"></span></label>
                <div class="col-sm-3">
                    <input type="password" class="form-control" id="countPassword" name="countPassword" placeholder="请输入密码"  >
                </div>
            </div>
            <div class="form-group">
                <label for="code" class="col-sm-2 control-label">验证码</label>
                <div class="col-sm-2">
                    <input type="text" class="form-control" id="code" name="code" placeholder="请输入验证码" >
                </div>
                <div class="col-sm-1">
                    <img alt="验证码" id="imagecode" src="${pageContext.request.contextPath}/frontDesk/ImageServlet.do"/>
                    <a href="javascript: reloadCode();">看不清楚</a>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <button type="submit" class="btn btn-default">登录</button>
                    <button type="reset" class="btn btn-default">重置</button>
                </div>
            </div>
        </form>
        </div>
    </div>
</div>
<div class="signform" id="registerform" style="display: none">
    <div class="signclose">
        <img src="image/signclose.ico" width="35px" height="35px" onclick="signclose()">
    </div>
    <div class="userdiv">
        <input  id="registeruser" class="signinput" onblur="loading()" type="text" placeholder="用户名" name="user">
    </div>
    <img src="image/signloading.gif" style="display: none" id="registerloading">
    <div class="pwddiv">
        <input  id="registerpwd" class="signinput" type="password" placeholder="密码" name="pwd">
    </div>
    <div class="pwddiv">
        <input  id="registerrepwd" class="signinput" type="password" placeholder="再次输入密码" name="pwd">
    </div>
    <div class="postdiv">
        <button>注册</button>
    </div>
    <br>
    <div class="change" style="color: #4d4d4d">
        <p>已有账号?立刻去<a href="#" style="text-decoration: none;color: #43A047">登录</a>吧</p>
    </div>
</div>

<!--界面结束-->
<!-- 嵌入的播放器-->
                            <div class="mp">
                                <div class="mp-box">
                                    <img src="img/mplayer_error.png" alt="music cover" class="mp-cover">
                                    <div class="mp-info">
                                        <p class="mp-name">歌名</p>
                                        <p class="mp-singer">歌手</p>
                                        <p><span class="mp-time-current">00:00</span>/<span
                                                class="mp-time-all">00:00</span></p>
                                    </div>
                                    <div class="mp-btn">
                                        <button class="mp-prev" title="上一首"></button>
                                        <button class="mp-pause" title="播放"></button>
                                        <button class="mp-next" title="下一首"></button>
                                        <button class="mp-mode" title="播放模式"></button>
                                        <div class="mp-vol">
                                            <button class="mp-vol-img" title="静音"></button>
                                            <div class="mp-vol-range" data-range_min="0" data-range_max="100"
                                                 data-cur_min="80">
                                                <div class="mp-vol-current"></div>
                                                <div class="mp-vol-circle"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="mp-pro">
                                        <div class="mp-pro-current"></div>
                                    </div>
                                    <div class="mp-menu">
                                        <button class="mp-list-toggle"></button>
                                        <button class="mp-lrc-toggle"></button>
                                    </div>
                                </div>
                                <button class="mp-toggle">
                                    <span class="mp-toggle-img"></span>
                                </button>
                                <div class="mp-lrc-box">
                                    <ul class="mp-lrc"></ul>
                                </div>
                                <button class="mp-lrc-close"></button>
                                <div class="mp-list-box">
                                    <ul class="mp-list-title"></ul>
                                    <table class="mp-list-table">
                                        <thead>
                                        <tr>
                                            <th>歌名</th>
                                            <th>歌手</th>
                                            <th>时长</th>
                                        </tr>
                                        </thead>
                                        <tbody class="mp-list"></tbody>
                                    </table>
                                </div>
                            </div>


                            <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
                            <script src="bootstrap-3.3.7/bootstrap-3.3.7/dist/js/bootstrap.min.js"></script>
                            <script src="mplayer/js/mplayer.js"></script>
                            <script src="mplayer/js/mplayer-list.js"></script>
                            <script src="mplayer/js/mplayer-functions.js"></script>
                            <script src="http://cdn.bootcss.com/jquery-nstslider/1.0.13/jquery.nstSlider.min.js"></script>
                            <script src="js/singerList.js"></script>
                            <script src="js/songList.js"></script>
                            <script src="js/songHotList.js"></script>
                            <script src="js/songNewList.js"></script>
                            <script src="js/songClassicalList.js"></script>
                            <script src="js/hotRanking.js"></script>
                            <script src="js/singerRanking.js"></script>
                            <script src="js/oldRanking.js"></script>
                            <script src="layui/layui.js"></script>
<script src="js/signformchange.js"></script>
                            <script>
                                layui.use('carousel', function () {
                                    var carousel = layui.carousel;

                                    //执行一个轮播实例
                                    carousel.render({
                                        elem: '#test1'
                                        , width: '100%' //设置容器宽度
                                        , height: 200
                                        , arrow: 'hover'

                                        , anim: 'fade' //切换动画方式
                                    });
                                });
                            </script>
                            <script>
                                var modeText = ['顺序播放', '单曲循环', '随机播放', '列表循环'];
                                var player = new MPlayer({
                                    // 容器选择器名称
                                    containerSelector: '.mp',
                                    // 播放列表
                                    songList: mplayer_song,
                                    // 专辑图片错误时显示的图片
                                    defaultImg: 'img/mplayer_error.png',
                                    // 自动播放
                                    autoPlay: true,
                                    // 播放模式(0->顺序播放,1->单曲循环,2->随机播放,3->列表循环(默认))
                                    playMode: 0,
                                    playList: 0,
                                    playSong: 0,
                                    // 当前歌词距离顶部的距离
                                    lrcTopPos: 34,
                                    // 列表模板，用${变量名}$插入模板变量
                                    listFormat: '<tr><td>${name}$</td><td>${singer}$</td><td>${time}$</td></tr>',
                                    // 音量滑块改变事件名称
                                    volSlideEventName: 'change',
                                    // 初始音量
                                    defaultVolume: 80
                                }, function () {
                                    // 绑定事件
                                    this.on('afterInit', function () {
                                        console.log('播放器初始化完成，正在准备播放');
                                    }).on('beforePlay', function () {
                                        var $this = this;
                                        var song = $this.getCurrentSong(true);
                                        var songName = song.name + ' - ' + song.singer;
                                        console.log('即将播放' + songName + '，return false;可以取消播放');
                                    }).on('timeUpdate', function () {
                                        var $this = this;
                                        console.log('当前歌词：' + $this.getLrc());
                                    }).on('end', function () {
                                        var $this = this;
                                        var song = $this.getCurrentSong(true);
                                        var songName = song.name + ' - ' + song.singer;
                                        console.log(songName + '播放完毕，return false;可以取消播放下一曲');
                                    }).on('mute', function () {
                                        var status = this.getIsMuted() ? '已静音' : '未静音';
                                        console.log('当前静音状态：' + status);
                                    }).on('changeMode', function () {
                                        var $this = this;
                                        var mode = modeText[$this.getPlayMode()];
                                        $this.dom.container.find('.mp-mode').attr('title', mode);
                                        console.log('播放模式已切换为：' + mode);
                                    });
                                });


                                $(document.body).append(player.audio); // 测试用

                                setEffects(player);

                            </script>
                            <!-- 播放器结束-->
<!-- 验证码跳转开始-->
<script>
    function reloadCode(){
        var time = new Date().getTime();
        document.getElementById("imagecode").src="${pageContext.request.contextPath}/frontDesk/ImageServlet.do?d="+time;
    }
</script>
<!-- 验证码结束-->
<footer class="main-footer">
    <div class="container">
        <div class="row">
            <div class="col-sm-4">
                <div class="widget">
                    <h4 class="title">友情链接</h4>

                </div>
            </div>

            <div class="col-sm-4">
                <div class="widget">
                    <h4 class="title">我们用到的技术</h4>

                </div>
            </div>

            <div class="col-sm-4">
                <div class="widget">
                    <h4 class="title">赞助商</h4>
                    <div class="content friend-links">

                    </div>
                </div>
            </div>
        </div>
    </div>
</footer>

<div class="copyright">
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <span>Copyright &copy; <a href="#">都市猎人</a></span> |
            </div>
        </div>
    </div>
</div>
</body>
</html>
