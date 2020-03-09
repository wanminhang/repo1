<%--
  Created by IntelliJ IDEA.
  User: 86173
  Date: 2020/3/7
  Time: 22:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>谈同个人博客♠★♠一个前端设计的热血青年</title>

    <link href="css/base.css" rel="stylesheet">
    <link href="css/index.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <script src="js/modernizr.js"></script>
    <![endif]-->
    <script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
</head>
<style>
    #register,#login{
        background:url(images/bg.jpg) repeat;
        padding: 30px 50px;
    }
    #loginbtn,#registbtn{
        background-color: rgb(107, 107, 107);
        color: #FFF;
        font-size: medium ;
        font-family: "新宋体";
        margin-left: 5px;
        padding-top: 0px;
        width: 50px;
        border: none;
        cursor: pointer;
        height: 28px;
        line-height: 28px;
        border-radius: 5px;
    }
    #searchform{
        margin-top: 2px;
    }
    .msg{
        color: red;
        font-size: 20px;
        line-height: 30px;
    }
</style>
<script type="text/javascript">

    function refreshCode() {
        $("#img").attr("src","/vcode?date="+new Date())
    }
    $(function () {
        $("#commit").click(function () {
           $.post("/loginServlet",{blogname:$("#blogname").val(),password:$("#password").val(),vcode:$("#vcode").val()},function (resp){
                      if (resp.res==2){
                          $("#tip").text("验证码错误");
                      } else if(resp.res==1){
                          $("#msg").text("用户名或密码错误");
                      } else{
                          location.href="/index.jsp";
                      }
               setTimeout("undo()",5000)
           },"json")
        })
        
    })
    function undo() {
        $("#msg").text("");
        $("#tip").text("")
    }
    // function login() {
    //     $("#myModal").css({"display":"block","padding-right":"16px"});
    // }

</script>
<body>
<!--登录的模态框-->
<div id="myModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <form id="login" action="#" method="post">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                    <h4 class="modal-title" id="myModalLabel">登录页面</h4>
                </div>
                &emsp;&emsp;&emsp;&emsp; &emsp;&emsp;
                    <span id="msg"></span>


                <div class="modal-body">
                    <div class="input-group">
                        <span class="input-group-addon" id="basic-addon1">用&ensp;户&ensp;名</span>
                        <input type="text" class="form-control" placeholder="请输入用户名" aria-describedby="basic-addon1" id="blogname" name="blogname">
                    </div>
                    <p></p>
                    <div class="input-group">
                        <span class="input-group-addon" id="basic-addon2">密&emsp;&emsp;码</span>
                        <input type="password" class="form-control" placeholder="请输入密码" aria-describedby="basic-addon2" id="password" name="password">
                    </div>
                    <p></p>
                    <div class="input-group">
                        <span class="input-group-addon" id="basic-addon3">验&ensp;证&ensp;码</span>
                        <input type="text" class="form-control" placeholder="请输入验证码" aria-describedby="basic-addon3" id="vcode" name="vcode">
                    </div>
                    &emsp;&emsp;&emsp;&emsp; &emsp;&emsp;
                        <span id="tip"></span>
                </div>
                <a href="javascript:refreshCode()">
                    <img src="/vcode" id="img" title="看不清楚刷新" style="margin-left: 100px"></a>
                <div class="modal-footer">
                    <button type="button" class="btn btn-warning" data-dismiss="modal">返回</button>

                    <button type="reset" class="btn btn-danger">重置</button>
                    <button type="button" class="btn btn-primary" id="commit">登录</button>
                </div>
            </form>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div>
<!--注册的模态框-->
<div id="myModar" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLaber">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <form id="register" action="#" method="post">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                    <h4 class="modal-title" id="myModalLaber">注册页面</h4>
                </div>
                <div class="modal-body">
                    <div class="input-group">
                        <span class="input-group-addon" id="basic-addonr0">昵&emsp;称</span>
                        <input type="text" class="form-control" placeholder="请输入昵称" aria-describedby="basic-addonr0">
                    </div>
                    <p></p>
                    <div class="input-group">
                        <span class="input-group-addon" id="basic-addonr1">姓&emsp;名</span>
                        <input type="text" class="form-control" placeholder="请输入姓名" aria-describedby="basic-addonr1">
                    </div>
                    <p></p>
                    <div class="input-group">
                        <span class="input-group-addon" id="basic-addonr2">密&emsp;码</span>
                        <input type="text" class="form-control" placeholder="请输入密码" aria-describedby="basic-addonr2">
                    </div>
                    <p></p>

                    <div class="input-group">
                        <span class="input-group-addon" id="basic-addonr3">性&emsp;别</span>&emsp;&emsp;&emsp;
                        <div class="form-control" aria-describedby="basic-addonr3" style="margin-top:-20px">
                            <span >男</span>&ensp;
                            <input type="radio" name="sex" >&emsp;&emsp;&emsp;
                            <span >女</span>&ensp;
                            <input type="radio" name="sex">
                        </div>
                    </div>

                    <p></p>
                    <div class="input-group">
                        <span class="input-group-addon" id="basic-addonr4">地&emsp;址</span>
                        <input type="text" class="form-control" placeholder="请输入地址" aria-describedby="basic-addonr4">
                    </div>
                    <p></p>
                    <div class="input-group">
                        <span class="input-group-addon" id="basic-addonr5">Q&ensp;&emsp;Q</span>
                        <input type="text" class="form-control" placeholder="请输入地址" aria-describedby="basic-addonr5">
                    </div>
                    <p></p>
                    <div class="input-group">
                        <span class="input-group-addon" id="basic-addonr6">邮&emsp;箱</span>
                        <input type="text" class="form-control" placeholder="请输入地址" aria-describedby="basic-addonr6">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="reset" class="btn btn-danger" data-dismiss="modal">重置</button>
                    <button type="submit" class="btn btn-primary">注册</button>
                </div>
            </form>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div>

<!--以上为模态框-->


<div class="topnav">
    <!-- Button trigger modal -->
    <div class="row">
        <div class="col-md-6"></div>
        <div class="col-md-3">
            <form action="/e/search/index.php" method="post" name="searchform" id="searchform">
                <input name="keyboard" id="keyboard" class="input_text" value="请输入关键字" style="color: rgb(153, 153, 153);width: 250px" onfocus="if(value=='请输入关键字'){this.style.color='#000';value=''}" onblur="if(value==''){this.style.color='#999';value='请输入关键字'}" type="text">
                <input name="show" value="title" type="hidden">
                <input name="tempid" value="1" type="hidden">
                <input name="tbname" value="news" type="hidden">
                <input name="Submit" class="input_submit" value="搜索" type="submit">
            </form>

        </div>
        <div class="col-md-2">
            <button id="loginbtn" type="button" class="btn btn-default btn-sm" data-toggle="modal" data-target="#myModal">
                登录
            </button>
            <button id="registbtn" type="button" class="btn btn-default btn-sm" data-toggle="modal" data-target="#myModar">
                注册
            </button>

        </div>
    </div>

    <!-- Modal -->
</div>
<div id="wrapper">
    <header>
        <div class="headtop"></div>
        <div class="contenttop">
            <div class="logo f_l">谈同个人博客♠★♠一个前端设计的热血青年</div>

            <div class="blank"></div>
            <nav>
                <div  class="navigation">
                    <ul class="menu">
                        <li><a href="index.html">网站首页</a></li>
                        <li><a href="#">关于我</a>
                            <ul>
                                <li><a href="about.html">个人简介</a></li>
                                <li><a href="listpic.html">个人相册</a></li>
                            </ul>
                        </li>
                        <li><a href="404.html">我的日记</a>
                            <ul>
                                <li><a href="newslistpic.html">个人日记</a></li>
                                <li><a href="newslistpic.html">学习笔记</a></li>
                            </ul>
                        </li>
                        <li><a href="404.html">技术文章</a> </li>
                        <li><a href="404.html">给我留言</a> </li>
                    </ul>
                </div>
            </nav>
            <SCRIPT type=text/javascript>
                // Navigation Menu
                $(function() {
                    $(".menu ul").css({display: "none"}); // Opera Fix
                    $(".menu li").hover(function(){
                        $(this).find('ul:first').css({visibility: "visible",display: "none"}).slideDown("normal");
                    },function(){
                        $(this).find('ul:first').css({visibility: "hidden"});
                    });
                });
            </SCRIPT>
        </div>
    </header>
    <div class="jztop"></div>
    <div class="container">
        <div class="bloglist f_l">


            <!--@@@@第一篇文章开始@@@@-->
            <h3><a href="w1.html" target="_blank">【从前端菜鸟到大神】一片总结的很好的文章</a></h3>
            <figure><img src="images/img_1.jpg" alt="【从前端菜鸟到大神】一片总结的很好的文章"></figure>
            <ul>
                <p> 结合个人经历总结的前端入门方法，总结从零基础到具备前端基本技能的道路、学习方法、资料。由于能力有限，不能保证面面俱到，只是作为入门参考，面向初学者，让初学者少走弯路。</p>
                <a title="【从前端菜鸟到大神】一片总结的很好的文章" href="w1.html" target="_blank" class="readmore">阅读全文&gt;&gt;</a>
            </ul>
            <p class="dateview"><span>2017-10-13</span><span>作者：谈同</span><span>个人博客：[<a href="/jstt/bj/">前端笔记</a>]</span></p>
            <h3><a href="/jstt/bj/2015-01-09/740.html">



                <!--@@@@第二篇文章开始@@@@@-->

                【深入理解html5系列-文本标签】…</a></h3>
            <figure><img src="images/img_2.png" alt="【深入理解html5系列-文本标签】…"></figure>
            <ul>
                <p>身为一名IT技术人员磨练自己的技术是必不可少的，关注微信号coder_online，程序员互动联盟，可以与大牛在线随时讨论自己感兴趣的话题，让自己用最少的时间学到最多的东西....</p>
                <a title="【深入理解html5系列-文本标签】…" href="w2.html" target="_blank" class="readmore">阅读全文&gt;&gt;</a>
            </ul>
            <p class="dateview"><span>2017-10-09</span><span>作者：谈同</span><span>个人博客：[<a href="w2.html">心得笔记</a>]</span></p>


            <!--@@@@第三篇文章开始@@@@@-->

            <h3><a href="w3.html">
                你就是你自己，别相信任何人对你的评价</a></h3>
            <figure><img src="images/img_3.jpg" alt="【你就是你自己，别相信任何人对你的评价】…">
            </figure>
            <ul>
                <p>那一年你4岁，非常喜欢唱歌。你有着动听的嗓音，并且唱歌让你快乐。有一天你妈妈加班到了晚上8点才回家，你不知道她今天跟同事吵了架并且被一位客户投诉，不知道她今天头疼了一整天晚上几乎都没有吃饭....</p>
                <a title="分" href="w3.html" target="_blank" class="readmore">阅读全文&gt;&gt;</a>
            </ul>
            <p class="dateview"><span>2014-11-06</span><span>作者：谈同</span><span>个人博客：[<a href="/jstt/bj/">心得笔记</a>]</span></p>

            <!--@@@@第四篇文章开始@@@@@-->

            <h3><a href="w4.html">帝国cms常用标签调用方法总结（不得不收藏哦）</a></h3>
            <figure><img src="images/img_4.jpg" alt="帝国cms常用标签调用方法总结（不得不收藏哦）" height="100"></figure>
            <ul>
                <p>帝国CMS使用技巧之多种终端访问版本制作 帝国cms - 安全、强大、稳定、灵活。随着移动互联网的发展，现在访问互联网的不单是台式/笔记本电脑，还有手机、平板电脑等访问终端。各种终端显示效果均有区别。而帝国CMS内置的“模板组”功能就支持生成不同版本页面和网站，以达到更好的用户体验。下面我们来讲解一下基本思路：</p>
                <a title="帝国cms常用标签调用方法总结（不得不收藏哦）" href="w4.html" target="_blank" class="readmore">阅读全文&gt;&gt;</a>
            </ul>
            <p class="dateview"><span>2015-01-09</span><span>作者：谈同</span><span>个人博客：[<a href="/jstt/bj/">心得笔记</a>]</span></p>

            <!--@@@@第五篇文章开始@@@@@-->

            mime
            <h3><a href="w5.html">【你不了解】一篇关于设计理念的文章</a></h3>
            <figure><img src="images/img_5.jpg" alt="【你不了解】一篇关于设计理念的文章"></figure>
            <ul>
                <p> 设计是从人类生活的开始而不是工业革命之后才产生的。博物馆中文化性收藏品，其作者当
                    时并未被称为设计师，但他们却是真正的设计者。人类的历史、文化遗产都产生于设计，我们能通过当时的设计看到当时的文化。所以大家的责任重大，设计师是在进行一种文化活动，把设计推向
                    未来，有人认为，设计师改变的只是景观，而我不这样看，我认为设计师是在改变世界，这是两个
                    概念。</p>
                <a title="【你不了解】一篇关于设计理念的文章" href="w5.html" target="_blank" class="readmore">阅读全文&gt;&gt;</a>
            </ul>
            <p class="dateview"><span>2017-07-13</span><span>作者：谈同</span><span>个人博客：[<a href="/jstt/bj/">心得笔记</a>]</span></p>


            <!--@@@@第六篇文章开始@@@@@-->


            <h3><a href="w6.html">【我的经历】…</a></h3>
            <figure><img src="images/logo.png" alt="【我的经历】…"></figure>
            <ul>
                <p>博客从最初的域名购买，到上线已经有半年的时间了，这半年的时间，有笑过，有怨过，有悔过，有执着过，也有放弃过…但最后还是坚持了下来，时间如此匆匆，等再回过头已来不及去弥补....
                    <br><br>
                <h1><a href="http:www.tthcclove.cn" style="color:#444">谈同个人博客</a>
                </h1>
                </p>
                <a title="【我的经历】…" href="w6.html" target="_blank" class="readmore">阅读全文&gt;&gt;</a>
            </ul>
            <p class="dateview"><span>2017-04-09</span><span>作者：谈同</span><span>个人博客：[<a href="/jstt/bj/">心得笔记</a>]</span></p>
        </div>

        <!--首页主要文章部分结束-->

        <div class="r_box f_r">
            <div class="tit01">
                <h3 class="tit">关注我</h3>
                <div class="gzwm">
                    <ul>
                        <li><a class="email" href="tel:15594992776" target="_blank">我的电话</a></li>
                        <li><a class="qq" href="mailto:157956315@qq.com" target="_blank">我的邮箱</a></li>
                        <li><a class="tel" href="http://wpa.qq.com/msgrd?v=3&uin=157956315&site=qq&menu=yes" target="_blank" title="如果QQ未被唤起请按照提示添加我的QQ">我的QQ</a></li>
                        <li><a class="prize" href="#" title="个人奖项">个人奖项</a></li>
                    </ul>
                </div>
            </div>
            <!--tit01 end-->

            <div class="tuwen">
                <h3 class="tit">图文推荐</h3>
                <ul>
                    <li><a href="404.html"><img src="images/02.jpg"><b>H5新属性</b></a>
                        <p><span class="tulanmu"><a href="404.html">PC代码</a></span><span class="tutime">2015-02-15</span></p>
                    </li>
                    <li><a href="404.html"><img src="images/02.jpg"><b>教你怎样用欠费手机拨打电话</b></a>
                        <p><span class="tulanmu"><a href="404.html">手机配件</a></span><span class="tutime">2015-02-15</span></p>
                    </li>
                    <li><a href="404.html" title="手机的16个惊人小秘密，据说99.999%的人都不知"><img src="images/3.jpeg" width="100" width="70" height="57"><b>手机的16个惊人小秘密，据说...</b></a>
                        <p><span class="tulanmu"><a href="404.html">手机配件</a></span><span class="tutime">2015-02-15</span></p>
                    </li>
                    <li><a href="404.html"><img src="images/06.jpg"><b>住在手机里的朋友</b></a>
                        <p><span class="tulanmu"><a href="404.html">手机配件</a></span><span class="tutime">2015-02-15</span></p>
                    </li>
                    <li><a href="404.html"><img src="images/04.jpg"><b>教你怎样用欠费手机拨打电话</b></a>
                        <p><span class="tulanmu"><a href="404.html">手机配件</a></span><span class="tutime">2015-02-15</span></p>
                    </li>
                    <li><a href="404.html"><img src="images/02.jpg"><b>教你怎样用欠费手机拨打电话</b></a>
                        <p><span class="tulanmu"><a href="404.html">手机配件</a></span><span class="tutime">2015-02-15</span></p>
                    </li>
                    <li><a href="404.html" title="手机的16个惊人小秘密，据说99.999%的人都不知"><img src="images/3.jpeg" width="70" height="57"><b>手机的16个惊人小秘密，据说...</b></a>
                        <p><span class="tulanmu"><a href="404.html">手机配件</a></span><span class="tutime">2015-02-15</span></p>
                    </li>
                </ul>
            </div>
            <div class="ph">
                <h3 class="tit">点击排行</h3>
                <ul class="rank">
                    <li><a href="404.html" title="【心路历程】一篇关于设计理念的文章" target="_blank">【心路历程】一篇关于设计理念的文章</a></li>
                    <li><a href="404.html" title="IP要突破2000+了" target="_blank">IP要突破2000+了</a></li>
                    <li><a href="404.html" title="帝国cms首页、自定义页面如何实现分页" target="_blank">帝国cms首页、自定义页面如何实现分页</a></li>
                    <li><a href="404.html" title="【已评选】给我模板PSD源文件，我给你设计HTML！" target="_blank">【已评选】给我模板PSD源文件，我给你设计HTML！</a></li>
                    <li><a href="404.html" title="【郑重申明】本站只提供静态模板下载！" target="_blank">【郑重申明】本站只提供静态模板下载！</a></li>
                    <li><a href="404.html" title="【孕期日记】生活本该如此" target="_blank">【孕期日记】生活本该如此</a></li>
                    <li><a href="404.html" title="【【深入理解html5系列-文本标签】…" target="_blank">【【深入理解html5系列-文本标签】…</a></li>
                    <li><a href="404.html" title=" 2014年度优秀个人博客排名公布" target="_blank"> 2014年度优秀个人博客排名公布</a></li>
                    <li><a href="404.html" title="2014年度优秀个人博客评选活动" target="_blank">2014年度优秀个人博客评选活动</a></li>
                    <li><a href="/404.html" title="使用CSS3制作文字、图片倒影" target="_blank">使用CSS3制作文字、图片倒影</a></li>
                    <li><a href="404.html" title="【分享】css3侧边栏导航不同方向划出效果" target="_blank">【分享】css3侧边栏导航不同方向划出效果</a></li>
                    <li><a href="404.html" title="分" target="_blank">分</a></li>
                </ul>
            </div>
            <div class="ad"> <img src="images/xifu.jpeg" height="300" width="110"> </div>
        </div>
    </div>

    <!-- container代码 结束 -->
    <div class="jzend"></div>

    <!--<div class="comment">-->
    <!--    <div id="SOHUCS"></div>-->
    <!--<script type="text/javascript">-->
    <!--(function(){-->
    <!--var appid = 'cytk2a7nr';-->
    <!--var conf = '3437d86f4a4e9bf3aad1ef65fc2740b5';-->
    <!--var width = window.innerWidth || document.documentElement.clientWidth;-->
    <!--if (width < 960) {-->
    <!--window.document.write('<script id="changyan_mobile_js" charset="utf-8" type="text/javascript" src="http://changyan.sohu.com/upload/mobile/wap-js/changyan_mobile.js?client_id=' + appid + '&conf=' + conf + '"><\/script>'); } else { var loadJs=function(d,a){var c=document.getElementsByTagName("head")[0]||document.head||document.documentElement;var b=document.createElement("script");b.setAttribute("type","text/javascript");b.setAttribute("charset","UTF-8");b.setAttribute("src",d);if(typeof a==="function"){if(window.attachEvent){b.onreadystatechange=function(){var e=b.readyState;if(e==="loaded"||e==="complete"){b.onreadystatechange=null;a()}}}else{b.onload=a}}c.appendChild(b)};loadJs("http://changyan.sohu.com/upload/changyan.js",function(){window.changyan.api.config({appid:appid,conf:conf})}); } })(); </script>-->

    <!--&lt;!&ndash;PC版&ndash;&gt;-->
    <!--<div id="SOHUCS" sid="" ></div>-->
    <!--<script charset="utf-8" type="text/javascript" src="https://changyan.sohu.com/upload/changyan.js" ></script>-->
    <!--<script type="text/javascript">-->
    <!--window.changyan.api.config({-->
    <!--appid: 'cytk2a7nr',-->
    <!--conf: '3437d86f4a4e9bf3aad1ef65fc2740b5'-->
    <!--});-->
    <!--</script>-->

    <!--&lt;!&ndash;PC和WAP自适应版&ndash;&gt;-->
    <!--<div id="SOHUCS" sid="请将此处替换为配置SourceID的语句" ></div>-->
    <!--<script type="text/javascript">-->
    <!--(function(){-->
    <!--var appid = 'cytk2a7nr';-->
    <!--var conf = 'prod_53c868f5f3ac56a10e72d038ac860764';-->
    <!--var width = window.innerWidth || document.documentElement.clientWidth;-->
    <!--if (width < 960) {-->
    <!--window.document.write('<script id="changyan_mobile_js" charset="utf-8" type="text/javascript" src="https://changyan.sohu.com/upload/mobile/wap-js/changyan_mobile.js?client_id=' + appid + '&conf=' + conf + '"><\/script>'); } else { var loadJs=function(d,a){var c=document.getElementsByTagName("head")[0]||document.head||document.documentElement;var b=document.createElement("script");b.setAttribute("type","text/javascript");b.setAttribute("charset","UTF-8");b.setAttribute("src",d);if(typeof a==="function"){if(window.attachEvent){b.onreadystatechange=function(){var e=b.readyState;if(e==="loaded"||e==="complete"){b.onreadystatechange=null;a()}}}else{b.onload=a}}c.appendChild(b)};loadJs("https://changyan.sohu.com/upload/changyan.js",function(){window.changyan.api.config({appid:appid,conf:conf})}); } })(); </script>-->
    <!--</div>-->



    <footer>
        <div class="footer">
            <div class="f_l">
                <p>All Rights Reserved 版权所有：<a href="http://www.tthcclove.cn">谈同个人博客</a> 备案号：陕ICP备17018883号</p>
            </div>
            <div class="f_r textr">
                <p>157956315</p>
            </div>
        </div>
    </footer>
</div>
<!--百度推送代码-->
<script>
    (function(){
        var bp = document.createElement('script');
        var curProtocol = window.location.protocol.split(':')[0];
        if (curProtocol === 'https') {
            bp.src = 'https://zz.bdstatic.com/linksubmit/push.js';
        }
        else {
            bp.src = 'http://push.zhanzhang.baidu.com/push.js';
        }
        var s = document.getElementsByTagName("script")[0];
        s.parentNode.insertBefore(bp, s);
    })();
</script>

</body>
</html>
