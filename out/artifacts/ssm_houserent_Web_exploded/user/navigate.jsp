<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/user/css/navigate.css">
<div id="index_head">
        <div id="address">
            <img id="addressimg" src="${pageContext.request.contextPath}/user/images/jkf_imgs/address.svg" alt="苏州">
            <span>当前城市[<span id="addresssp"></span>]</span>
        </div>
        <ul id="home">
            <li><a href="/">首页</a></li>
        </ul>

</div>
<script type="text/javascript" src="https://webapi.amap.com/maps?v=1.4.15&key=f33ff318925b81fd4f3773c5a1efa107&plugin=AMap.CitySearch"></script>
<script type="text/javascript">
    var map = new AMap.Map("container", {
        resizeEnable: true,
        center: [116.397428, 39.90923],
        zoom: 13
    });
    //获取用户所在城市信息
    function showCityInfo() {
        //实例化城市查询类
        var citysearch = new AMap.CitySearch();
        //自动获取用户IP，返回当前城市
        citysearch.getLocalCity(function(status, result) {
            if (status === 'complete' && result.info === 'OK') {
                if (result && result.city && result.bounds) {
                    var cityinfo = result.city;
                    var citybounds = result.bounds;
                    document.getElementById('addresssp').innerHTML = cityinfo;
                    //地图显示当前城市
                    map.setBounds(citybounds);
                }
            } else {
                document.getElementById('addresssp').innerHTML = result.info;
            }
        });
    }
    showCityInfo();
</script>
<script>
    let ROOTSources = "${pageContext.request.contextPath}";
</script>

