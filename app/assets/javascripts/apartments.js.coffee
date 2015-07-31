$.rails.allowAction = (link) ->
  return true unless link.attr('data-confirm')
  $.rails.showConfirmDialog(link) # look bellow for implementations
  false # always stops the action since code runs asynchronously

$.rails.confirmed = (link) ->
  link.removeAttr('data-confirm')
  link.trigger('click.rails')

$.rails.showConfirmDialog = (link) ->
  message = link.attr 'data-confirm'
  html = """
          <div class="modal" id="confirmationDialog" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
              <div class="modal-content">
                <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                  <h4>#{message}</h4>
                </div>
                <div class="modal-body">
                  <p>Are you sure you want to delete?</p>
                </div>
                <div class="modal-footer">
                  <a data-dismiss="modal" class="btn btn-default">Cancel</a>
                  <a data-dismiss="modal" class="btn btn-danger confirm">Delete</a>
                </div>
              </div>
            </div>
          </div>
         """
  $(html).modal()
  $('#confirmationDialog .confirm').on 'click', -> $.rails.confirmed(link)
