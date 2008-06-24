function generateIFrame(){
    var query = new StringBuilder("titlecolor=");
    query.append(aaaa0_titlecolor);
    query.append("&textcolor=");
    query.append(aaaa0_textcolor);
    query.append("&linkcolor=");
    query.append(aaaa0_linkcolor);
    query.append("&bordercolor=");
    query.append(aaaa0_bordercolor);
    query.append("&backgroundcolor=");
    query.append(aaaa0_backgroundcolor);
    query.append("&groundingcolor=");
    query.append(aaaa0_groundingcolor);
    query.append("&cornerstyle=");
    query.append(aaaa0_cornerstyle);
    query.append("&backgroundimage=");
    query.append(aaaa0_backgroundimage);
    query.append("&iconimage=");
    query.append(aaaa0_iconimage);
    query.append("&sizecode=");
    query.append(aaaa0_sizecode);
    query.append("&layouttype=");
    query.append(aaaa0_layouttype);
    
    query.append("&zoneid=")
    query.append(aaaa0_pid);
    query.append("&zonehref=")
    query.append(location.href);

//	var dframe = document.createElement("IFRAME");
//	var jframe = $(dframe);
//	jframe.attr("name", "a");
//	jframe.attr("id", "");
//	jframe.attr("scrolling", "no");
//	jframe.attr("frameborder", "0");
//	var size = aaaa0_sizecode.split("x");
//	var width = size[0];
//	var height = size[1];
//	jframe.attr("width", width);
//	jframe.attr("height", height);
//	jframe.attr("marginheight", "0");
//	jframe.attr("marginwidth", "0");
//	jframe.attr("border", "0");
//	jframe.attr("src", "http://www.aaaa0.com/Public/ZoneOutput.aspx?" + query);
//	alert(dframe.innerHtml);
//	$("body").append(jframe);

    var size = aaaa0_sizecode.split("x");
    var width = size[0];
    var height = size[1];
    var sb = new StringBuilder('<iframe name="a" id="" scrolling="no" frameborder="0" marginheight="0" marginwidth="0" border="0" ');
    sb.append(' width="' + width + '"' );
    sb.append(' height="' + height + '"' );
    sb.append(' src="http://www.aaaa0.com/Public/ZoneOutput.aspx?' + query + '" ></iframe>');
    document.write(sb.toString());
} 

//提高字符串合并的性能
function StringBuilder(value){
    this.strings = new Array("");
    this.append(value);
}

StringBuilder.prototype.append = function(s){
    if (s) {
        this.strings.push(s);
    }
}
StringBuilder.prototype.clear = function(){
    this.strings.length = 1;
}
StringBuilder.prototype.toString = function(){
    return this.strings.join("");
}

generateIFrame();
