var headerHtml = $("#material-header-holder .ui-datepicker-material-header");

/* カレンダに表示する変数を定義*/
var changeMaterialHeader = function(header, date) {
  var year   = date.format('YYYY');
  var month  = date.format('MMM');
  var dayNum = date.format('D');
  var isoDay = date.isoWeekday();

	var weekday = new Array(7);
	weekday[1] = "月";
	weekday[2] = "火";
	weekday[3] = "水";
	weekday[4] = "木";
	weekday[5] = "金";
	weekday[6] = "土";
	weekday[7]=  "日";

  $('.ui-datepicker-material-day', header).text(weekday[isoDay]);
  $('.ui-datepicker-material-year', header).text(year);
  $('.ui-datepicker-material-month', header).text(month);
  $('.ui-datepicker-material-day-num', header).text(dayNum);
};


$.datepicker._selectDateOverload = $.datepicker._selectDate;
$.datepicker._selectDate = function(id, dateStr) {
  var target = $(id);
  var inst = this._getInst(target[0]);
  inst.inline = true;
  $.datepicker._selectDateOverload(id, dateStr);
  inst.inline = false;
  this._updateDatepicker(inst);

  headerHtml.remove();
  $(".ui-datepicker").prepend(headerHtml);
};

$("input[data-type='date']").on("focus", function() {
  //var date;
  //if (this.value == "") {
  //  date = moment();
  //} else {
  //  date = moment(this.value, 'YYYY/MM/DD');
  //}

 	$(".ui-datepicker").prepend(headerHtml);
  //$(this).datepicker._selectDate(this, date);
});


/* フォームを選択したらカレンダを表示する */
$("input[data-type='date']").datepicker({
  showButtonPanel: true,
  closeText: 'OK',
  onSelect: function(date, inst) {
    changeMaterialHeader(headerHtml, moment(date, 'YYYY/MM/DD'));
  },
});

/* カレンダの選択に応じてヘッダの日付を変える */
changeMaterialHeader(headerHtml, moment());
$('input').datepicker('show');