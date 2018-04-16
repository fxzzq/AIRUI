var addTab = function(opts){
	var t = $('#layout_center_tabs');
	if (t.tabs('exists', opts.title)) {
		t.tabs('select', opts.title);
	} else {
		t.tabs('add', opts);
	}
}


var serializeObject = function(form) {
	var o = {};
	$.each(form.serializeArray(), function(index) {
		if (o[this['name']]) {
			o[this['name']] = o[this['name']] + "," + this['value'];
		} else {
			o[this['name']] = this['value'];
		}
	});
	return o;
};

/**
 * 
 * 验证规则扩展
 */
$.extend($.fn.validatebox.defaults.rules, {
	phone : {
		validator : function(value, param) {
			var reg = /^1[3|4|5|8][0-9]\d{4,8}$/;
			return reg.test(value);
		},
		message : '请输入电话号码'
	},
	leter:{
		validator:function(value,param){
			var reg = /^[a-zA-Z]{4}$/;
			return reg.test(value);
		},
		message : '请输4位以上英文字母'
	},
	chinese:{
		validator:function(value,param){
			var reg = /^[\u2E80-\u9FFF]+$/;
			return reg.test(value);
		},
		message : '请输中文'
	},
});