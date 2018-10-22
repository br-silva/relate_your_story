$ ->
  $(document).on 'ajax:error', 'form', (event) ->
    invalidFields = JSON.parse event.detail[0]
    fields = Object.keys invalidFields
    $('form .field ul')
      .prev().removeClass('invalid-field')
      .next().remove()
    fields.forEach (field) ->
      errorList = ''
      invalidFields[field].forEach (errorMessage) ->
        errorList += "<li>#{field.replace('_', ' ')} #{errorMessage}</li>"
      $("form :input[id$='#{field}']")
        .after("<ul class='form-error-messages'>#{errorList}</ul>")
        .addClass('invalid-field')
