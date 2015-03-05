
function buscarVideo(video) {
	url = decodeURIComponent(video);
	resultado = $.base64.decode(url);
	return resultado;
}

function buscarVideo2(video) {
	url = decodeURIComponent(video);
	resultado = jQuery.base64.decode(url);
	return resultado;
}