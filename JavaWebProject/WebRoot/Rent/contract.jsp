<%@ page import="com.chengxusheji.po.WantHourseInfo" %>
<%@ page import="com.chengxusheji.po.UserInfo" %>
<%@ page import="com.chengxusheji.po.Rent" %>
<%@ page import="com.chengxusheji.po.Hourse" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    Rent rent = (Rent) request.getAttribute("rent");
    Hourse hourse = rent.getHourseObj();
    UserInfo userInfo = rent.getUserInfoObj();
    String[] time = rent.getNowtime().split("-");
%>
<html>
<head>
    <title>租房合同</title>
    <link rel="stylesheet" type="text/css" href="house/css/common.css"/>
    <link rel="stylesheet" type="text/css" href="house/css/main.css"/>
    <script type="text/javascript" src="house/js/libs/modernizr.min.js"></script>
    <script type="text/javascript" src="house/js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="house/js/jquery-ui-datepicker.js"></script>
    <script type="text/javascript" src="house/js/jquery.validate.min.js"></script>
    <link rel="stylesheet" type="text/css" href="house/css/jquery-ui.css"/>
    <style type="text/css" media="print">
        .title{
            margin:10px auto;
            text-align:center;
            font-size:30px;
        }
        .button{
            margin:10px auto;
            text-align:center;
        }
        .btn6{
            display: none;
        }
    </style>
    <script type="text/javascript">
        function dayin(){
            window.print();
        }

    </script>
</head>
<body>
<form name="hetong" action="/house/hetong/updatehetong.action">
    <div class="title">房屋租赁合同</div><br>
<p>出租方（甲方）：__<%=hourse.getConnectPerson()%>__身份证号码：__<%=hourse.getCard()%>__</p>
<p>承租方（乙方）：__<%=userInfo.getUser_name()%>__身份证号码：__<%=userInfo.getCardNumber()%>__</p>
    <p>甲、乙双方就下列房屋的租赁达成如下协议：</p>
    <p>第一条 房屋信息</p>
    <p>甲方房屋（以下简称该房屋）位于__<%=hourse.getArea()%>__；位于第__<%=hourse.getLouceng()%>__层，</p>
    <p>第二条 房屋用途</p>
    <p>房屋用途为租赁住房。除双方另有约定外，乙方不得任意改变房屋用途。</p>
    <p>第三条 租赁期限</p>
    <p>租赁期限自__<%=rent.getStarttime()%>__至__<%=rent.getEndtime()%>__止。</p>
    <p>第四条 租金</p>
    <p>该房屋月租金为（人民币）__<%=rent.getRentprice()%10000%>__千__<%=rent.getRentprice()%1000%>__百__<%=rent.getRentprice()%100%>__拾__<%=rent.getRentprice()%10%>__元整。
    </p>
    <p>租赁期间，如遇到国家有关政策调整，则按新政策规定调整租金标准；除此之外，出租方不得以任何理由任意调整租金。
    </p>
    <p>第五条 付款方式</p>
    <p>乙方按（季）支付租金给甲方。</p>
    <p>第六条 交付房屋期限</p>
    <p>甲方应于本合同生效之日起____三___日内，将该房屋交付给__<%=userInfo.getUser_name()%>__.</p>
    <p>第七条 甲方对房屋产权的承诺</p>
    <p>甲方保证在交易时该房屋没有产权纠纷；除补充协议另有约定外，有关按揭、抵押债务、税项及租金等，甲方均在交付房屋前办妥。交易后如有上述未清事项，由甲方承担全部责任，由此给乙方造成经济损失的，由甲方负责赔偿。
    </p>
    <p>第八条 维修养护责任</p>
    <p>租赁期间，甲方对房屋及其附着设施每隔__一__个月检查、修缮一次，乙方应予积极协助，不得阻挠施工。正常的房屋大修理费用由甲方承担；日常的房屋维修费用由乙承担。
    </p>
    <p>因乙方管理使用不善造成房屋及其相连设备的损失和维修费用，由乙方承担并责任赔偿损失。
    </p>
    <p>租赁期间，防火安全，门前三包，综合治理及安全、保卫等工作，乙方应执行当地有关部门规定并承担全部责任和服从甲方监督检查。
    </p>
    <p>第九条 关于房屋租赁期间的有关费用</p>
    <p>在房屋租赁期间，以下费用由乙方支付：</p>
    <p>1、水、电费；2、煤气费；3、供暖费；4、物业管理费；</p>
    <p>第十条 房屋押金</p>
    <p>甲、乙双方自本合同签订之日起，由乙方支付甲方（相当于一个月房租的金额）作为押金。</p>
    <p>第十一条 租赁期满</p>
    <p>1、租赁期满后，如乙方要求继续租赁，甲方则优先同意继续租赁；</p>
    <p>2、租赁期满后，如甲方未明确表示不续租的，则视为同意乙方继续承租；</p>
    <p>3、租赁期限内，如乙方明确表示不租的，应提前一个月告知甲方，甲方应退还乙方已支付的租房款及押金。</p>
    <p>第十二条 违约责任</p>
    <p>租赁期间双方必须信守合同，任何一方违反本合同的规定，按年度须向对方交纳__一__个月租金作为违约金。</p>
    <p>第十三条 因不可抗力原因导致该房屋毁损和造成损失的，双方互不承担责任。</p>
    <p>第十四条 本合同未尽事项，由甲、乙双方另行议定，并签订补充协议。补充协议与本合同不一致的，以补充协议为准。</p>
    <p>第十五条 本合同之附件均为本合同不可分割之一部分。本合同及其附件内，空格部分填写的文字与印刷文字具有同等效力。</p>
    <p>本合同及其附件和补充协议中未规定的事项，均遵照中华人民共和国有关法律、法规和政策执行。</p>
    <p>第十六条 其他约定</p>
    <p>（一）出租方为已提供物品如下：</p>
    <p>（二）当前的水、电等表状况：</p>
    <p>第十七条 本合同在履行中发生争议，由甲、乙双方协商解决。协商不成时，甲、乙双方可向人民法院起诉。</p>
    <p>第十八条 本合同自甲、乙双方签字之日起生效，一式__三__份，甲、乙双方各执__一__份，具有同等效力，中介执__一_份备案。</p>
    <p>　甲方（签章）：____<%=hourse.getConnectPerson()%>___                              乙方（签章）：___<%=userInfo.getUser_name()%>____ </p>

    <p>电话：____<%=hourse.getConnectPhone()%>>____                                       电话： ________<%=userInfo.getUser_name()%>_____</p>

    <p>___<%=time[0]%>___年____<%=time[1]%>__月__<%=time[2]%>___日                        ___<%=time[0]%>_____年_<%=time[1]%>_月__<%=time[2]%>__日;</p>
<div class="button">
    <input class="btn btn6" onclick="dayin()" value="打印合同" type="button">
    <input class="btn btn6" onclick="history.go(-1)" value="返回" type="button">
</div>
</form>
</body>
</html>
