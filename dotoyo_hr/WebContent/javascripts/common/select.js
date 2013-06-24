function menuClick(sender, searchdown, xoffset, yoffset){
	  $(searchdown).css("left",$(sender).offset().left-6);
      $(searchdown).css("top",$(sender).offset().top + $(sender).outerHeight()+2);
      $(searchdown).show();
}
function menuHide(sender){
	$(sender).fadeOut("slow");	
}
function absolutePoint(element) {
	var result = { x: element.offsetLeft, y: element.offsetTop };
	element = element.offsetParent;
	while (element) {
		result.x += element.offsetLeft;
		result.y += element.offsetTop;
		element = element.offsetParent;
	}
	return result;
}


$(document).mouseup(function(){$(".head-down div").hide();});
$(document).mouseup(function(){$(".park-down div").hide();});
$(document).mouseup(function(){$(".china-down div").hide();});
$(document).mouseup(function(){$(".salon-down div").hide();});
$(document).mouseup(function(){$(".search-down div").hide();});
$(document).mouseup(function(){$(".abstract-down div").hide();});
$(document).mouseup(function(){$(".jobs-down div").hide();});
$(document).mouseup(function(){$(".moban-down div").hide();});
$(document).mouseup(function(){$(".excavate-down div").hide();});
$(document).mouseup(function(){$(".zs-down div").hide();});






