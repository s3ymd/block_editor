# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  openBlock = (e)->
    if e.key == '{'
      text = $(this).val()
      elem = $('<div class="code-block">').text(text)
      editor = $('<input type="text" class="code-inline" size="40" autofocus id="edit">')
      editor.on 'keypress', openBlock
      $(this).after(elem)
      $(elem).append('{<br>')
      $(elem).append(editor)
      $(elem).append('<br>}')
      $(this).remove()
      $(editor).focus()
      e.preventDefault()
    else if e.key == ';'
      text = $(this).val() + ';'
      elem = $('<div class="code-block">').text(text)
      editor = $('<input type="text" class="code-inline" size="40" autofocus id="edit">')
      editor.on 'keypress', openBlock
      $(this).after(elem)
      $(elem).after('<br>')
      $(elem).after(editor)
      $(elem).after('<br>')
      $(this).remove()
      $(editor).focus()
      e.preventDefault()

  $('#edit').on 'keypress', openBlock
