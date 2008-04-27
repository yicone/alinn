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
	
	var dframe = document.createElement("IFRAME");
	var jframe = $(dframe);
	jframe.attr("name", "");
	jframe.attr("id", "");
	jframe.attr("scrolling", "no");
	jframe.attr("frameborder", "0");
	jframe.attr("style", "width:1000px;height:800px;");
	jframe.attr("marginheight", "0");
	jframe.attr("marginwidth", "0");
	jframe.attr("border", "0");
	jframe.attr("src", "http://localhost:2189/Zone/ZoneOutput.aspx?" + query);
	$("body").append(jframe);
}

generateIFrame();
