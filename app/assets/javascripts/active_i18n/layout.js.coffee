$ ->
  $("#change_locale").change () ->
    window.location = $(this).find(":selected").data("url")


  $(".translation .translated").each () ->
    w = $(this)
    form = w.find("form")
    content = w.find(".content")
    form.hide().each () ->
      form = $(this)
      form.find("li.cancel a").click () -> 
        form.hide()
        content.show()
        false

      form.submit () -> 
        $.ajax(
          url: $(this).attr("action"),
          type: "POST"
          data: {translation: form.find("textarea").val()}
          success: (ret) ->
            content.text(ret).show()
            form.hide()
        )
        false


    content.click () ->
      w.find("form").show()
      $(this).hide()