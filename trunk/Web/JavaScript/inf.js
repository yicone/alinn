function generateIFrame(){
    var query = "titlecolor=" + aaaa0_titlecolor;
    query = query + "&textcolor=" + aaaa0_textcolor;
    query = query + "&linkcolor=" + aaaa0_linkcolor;
    query = query + "&bordercolor=" + aaaa0_bordercolor;
    query = query + "&backgroundcolor=" + aaaa0_backgroundcolor;
    query = query + "&groundingcolor=" + aaaa0_groundingcolor;
    query = query + "&cornerstyle=" + aaaa0_cornerstyle;
    query = query + "&backgroundimage=" + aaaa0_backgroundimage;
    query = query + "&iconimage=" + aaaa0_iconimage;
    query = query + "&sizecode=" + aaaa0_sizecode;
    query = query + "&layouttype=" + aaaa0_layouttype;
    
    query = query + "&zoneid=" + aaaa0_pid;
    query = query + "&zonehref=" + location.href;

	var dframe = document.createElement("IFRAME");
	var jframe = $(dframe);
	jframe.attr("name", "a");
	jframe.attr("id", "");
	jframe.attr("scrolling", "no");
	jframe.attr("frameborder", "0");
	var size = aaaa0_sizecode.split("x");
	var width = size[0];
	var height = size[1];
	jframe.attr("width", width);
	jframe.attr("height", height);
	jframe.attr("marginheight", "0");
	jframe.attr("marginwidth", "0");
	jframe.attr("border", "0");
	jframe.attr("src", "http://www.aaaa0.com/Public/ZoneOutput.aspx?" + query);
	$("body").append(jframe);
}

$(document).ready(generateIFrame);
