function generateIFrame(){
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
	jframe.attr("src", "http://www.aaaa0.com/Public/ZoneOutput.aspx?" + query);
	$("body").append(jframe);
}

$(document).ready(generateIFrame);
