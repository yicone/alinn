function generateIFrame(){
//	var jsonStyle = '["'+ alinn_titlecolor + '","';
//	jsonStyle = jsonStyle + alinn_textcolor + '","';
//	jsonStyle = jsonStyle + alinn_linkcolor + '","';
//	jsonStyle = jsonStyle + alinn_bordercolor + '","';
//	jsonStyle = jsonStyle + alinn_backgroundcolor + '","';
//	jsonStyle = jsonStyle + alinn_groundingcolor + '","';
//	jsonStyle = jsonStyle + alinn_cornerstyle + '","';
//	jsonStyle = jsonStyle + alinn_backgroundimage + '","';
//	jsonStyle = jsonStyle + alinn_iconimage + '"]';

    var query = "titlecolor=" + alinn_titlecolor;
    query = query + "&textcolor=" + alinn_textcolor;
    query = query + "&linkcolor=" + alinn_linkcolor;
    query = query + "&bordercolor=" + alinn_bordercolor;
    query = query + "&backgroundcolor=" + alinn_backgroundcolor;
    query = query + "&groundingcolor=" + alinn_groundingcolor;
    query = query + "&cornerstyle=" + alinn_cornerstyle;
    query = query + "&backgroundimage=" + alinn_backgroundimage;
    query = query + "&iconimage=" + alinn_iconimage;
    query = query + "&sizecode=" + alinn_sizecode;
    query = query + "&layouttype=" + alinn_layouttype;
    
    query = query + "&zoneid=" + alinn_pid;
    query = query + "&zonehref=" + location.href;
	
	var dframe = document.createElement("IFRAME");
	var jframe = $(dframe);
	jframe.attr("name", "");
	jframe.attr("id", "");
	jframe.attr("scrolling", "no");
	jframe.attr("frameborder", "0");
	jframe.attr("style", "width:760px;height:90px;");
	jframe.attr("marginheight", "0");
	jframe.attr("marginwidth", "0");
	//jframe.attr("border", "0");
	jframe.attr("src", "../Zone/ZoneOutput.aspx?" + query);
	$("body").append(jframe);
	//alert("hi");
}

$(document).ready(generateIFrame);
//	            $(document).mouseover(handleEvent);
//                $(document).mousemove(handleEvent);
//                $(document).mouseout(handleEvent);
//                $(document).blur(handleEvent);
	
	function handleEvent(oEvent){
                //if (oEvent.target.tagName == 'IFRAME'){// &&
//                oEvent.pageX == -1 &&
//                oEvent.pageY == -1){// &&
                //oEvent.fromElement == '[object]') {
                    // 假如需要向其他页面提交
                    //document.adform.submit();
                    //var num = parseInt(shownum.innerHTML);
                    //shownum.innerHTML = num + 1;
                    
                    alert("hi");
                    
                    var kvp = {
                        zoneid: alinn_pid,
                        url: location.href,
                        host: location.host
                    }
                    
                    alert(location.href);
                    alert(location.host);
                    $.post("ZoneStat.aspx", kvp, success = function(){
                        alert("统计信息已发送！");
                    });
                //}
                return false;
            }
