## Place all the behaviors and hooks related to the matching controller here.
## All this logic will automatically be available in application.js.
## You can use CoffeeScript in this file: http://coffeescript.org/
#$ ->
#  openBlock = (e)->
#    if e.key == '{'
#      text = $(this).val()
#      elem = $('<div class="code-block" contenteditable>').text(text)
#      editor = $('<input type="text" class="code-inline" size="40" autofocus id="edit">')
#      editor.on 'keypress', openBlock
#      $(this).after(elem)
#      $(elem).append('{<br>')
#      $(elem).append(editor)
#      $(elem).append('<br>}')
#      $(this).remove()
#      $(editor).focus()
#      e.preventDefault()
#    else if e.key == ';'
#      text = $(this).val() + ';'
#      elem = $('<div class="code-block">').text(text)
#      editor = $('<input type="text" class="code-inline" size="40" autofocus id="edit">')
#      editor.on 'keypress', openBlock
#      $(this).after(elem)
#      $(elem).after('<br>')
#      $(elem).after(editor)
#      $(elem).after('<br>')
#      $(this).remove()
#      $(editor).focus()
#      e.preventDefault()
#
#  $('#edit').on 'keypress', openBlock
#  $('.code-block').on 'click', ->
#    $(this).attr('contenteditable', true)
focus_elem = (selector) ->
  $(selector).get(0).focus()
insert_editor = (elem) ->
  editor = $('<div class="code-block" contenteditable="true"></div>')
  set_key_handler(editor)
  $(elem).append('{<br>')
  $(elem).append(editor)
  $(elem).append('<br>}')
  editor.get(0).focus()
key_handler = (e) ->
  if e.key == '{'
    clear_content_editable()
    insert_editor($(this))
    e.preventDefault()
set_key_handler = (e) ->
  $(e).on 'keypress', key_handler
clear_content_editable = ->
  $('*').attr('contenteditable', false)
$ ->
  insert_editor($('.editor-root'))
