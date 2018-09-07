$ ->
  $('body').on 'click', '.js-dismiss-modal', ->
    $('#modal').fadeOut 200, ->
      this.remove()
