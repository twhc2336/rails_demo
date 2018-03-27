// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require_tree ./jquery
//= require bootstrap-sprockets
//= require_tree .

//預覽圖片功能
function readImageUrl(input, image_tag_id){
	if(input.files && input.files[0]){
		var reader = new FileReader();
		//先定義onload事件
		reader.onload = function(){
			$("#"+image_tag_id).attr("src", this.result);
		}
		//readAsDataURL才會觸發onload事件
		reader.readAsDataURL(input.files[0]);

	}else{
		//如果沒有選擇圖片則使用原本圖片
		var original_url = $("#"+image_tag_id).attr("original_image");
		$("#"+image_tag_id).attr("src", original_url)
	}
}