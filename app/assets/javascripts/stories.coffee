$(document).on 'ajax:error', (event) ->
  xhr = event.detail[2]
  errors = JSON.parse(xhr.responseText)
  error_list = ''
  errors.forEach (error) ->
    error_list += "<li>#{error}</li>"
  $('#notifications').html "<ul>#{error_list}</ul>"
  return
