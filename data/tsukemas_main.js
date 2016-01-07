var textNodes = document.evaluate("/html/body//text()", document, null, XPathResult.UNORDERED_NODE_SNAPSHOT_TYPE, null);

var reg = new RegExp('(' + cvReg.join('|') + ')', 'g');

for (var i = 0; i < textNodes.snapshotLength; i++) {
    var textNode = textNodes.snapshotItem(i);
    textNode.textContent = textNode.textContent.replace(reg, function (match){
	return match + "(" + cvMap[match.replace(/\s+/g, "")] +")"
    });
}

