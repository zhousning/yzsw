$(".home_settings").ready(function() {
  if ($(".home_settings.new, .home_settings.edit").length > 0) {
    $(".secd-item").change(function (e) {
      var fcts = "";
      var check_boxes = $("input[class='secd-item']:checked");
      $.each(check_boxes, function(){
        fcts += $(this).val() + "," + this.dataset.name + ";"
      });
      $('.secd-html').html(fcts)
    })
  }
})
