jQuery ->
  $.ajax {
    dataType: "json",
    url: "./Journal.json",
    success: (data)->
      directive = { 'a':'who', 'a@href':'site' };        
      $('ol#animals').autoRender(data)

      alert "yada" + data.toString()
  }
