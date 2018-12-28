<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<html>
<head>
    <style type="text/css">
        #mydiv{
            position: absolute;
            left: 50%;
            top:50%;
            margin-left:-200px;
            margin-top: -50px;
        }

        .mouseOver{
            background: #708090;
            color:#FFFAFA;
        }

        .mouseOut{
            background: #FFFAFA;
            color:#000000;
        }



    </style>
    <script type="text/javascript">
        var xmlHttp;
        function getMoreContents() {
            var contents = document.getElementById("keyword");
            if(contents.value == ""){
                clearContent();
                return;
            }
            xmlHttp = createXMLHttp();
            var url = "search?keyword="+String(contents.value);
            xmlHttp.open("GET",url,true);

            xmlHttp.onreadystatechange = callback;
            xmlHttp.send(null);
        }

        function callback() {
            if(xmlHttp.readyState == 4){
                if(xmlHttp.status == 200){
                    var result = xmlHttp.responseText;
                    var json = eval("("+result+")");
                    setContent(json);
                }
            }
        }

        function setContent(contents) {

            clearContent();

            setLocation();

            var size = contents.length;
            for(var i=0;i<size;i++){
                var nextNode= contents[i];
                var tr = document.createElement("tr");
                var td = document.createElement("td");
                td.setAttribute("border","0");
                td.setAttribute("bgcolor","#FFFAFA");
                td.onmouseover=function () {
                    this.className='mouseOver';
                };
                td.onmouseout=function () {
                    this.className="mouseOut";
                };
                td.onclick=function () {

                };
                var text = document.createTextNode(nextNode);
                td.appendChild(text);
                tr.appendChild(td);
                document.getElementById("content_body").appendChild(tr);
            }
        }

        function clearContent() {
            var contentTableBody = document.getElementById("content_body");
            var size = contentTableBody.childNodes.length;
            for (var i= size -1;i>=0;i--){
                contentTableBody.removeChild(contentTableBody.childNodes[i]);
            }
            document.getElementById("popDiv").style.border = "none";
        }
        
        function keywordBlur() {
            clearContent();
        }

        function setLocation() {
            var content = document.getElementById("keyword");
            var width = content.offsetWidth;
            var left = content["offsetLeft"];
            var top = content["offsetTop"]+content.offsetHeight;
            var popDiv = document.getElementById("popDiv");
            popDiv.style.border= "black 1px solid";
            popDiv.style.left = left + "px";
            popDiv.style.top = top + "px";
            popDiv.style.width = width + "px";
            document.getElementById("content_table").style.width = width +"px";
        }

        function createXMLHttp(){
            var xmlHttp;
            if(window.XMLHttpRequest){
                xmlHttp= new XMLHttpRequest();
            }
            if (window.ActiveXObject){
                xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");
                if(!xmlHttp){
                    xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
                }
            }
            return xmlHttp;
        }

    </script>
</head>
<body>
<div id ="mydiv">
    <input type="text" size="50" id="keyword" onkeyup="getMoreContents()"
    onblur="keywordBlur()" onfocus="getMoreContents()"/>
    <input type="button" value="百度一下" width="50px"/>
    <div id = "popDiv">
        <table id = "content_table" bgcolor="#FFFAFA" BORDER="0" cellspacing="0" cellpadding="0">
            <tbody id="content_body">
            </tbody>
        </table>
    </div>

</div>
</body>
</html>
