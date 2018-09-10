$ ->
  $('body').on 'click', '[data-dismiss]', ->
    element = $(this).data('dismiss')
    $(".#{element}").fadeOut 200, ->
      this.remove()
