# Example call
#
# new app.Upload(
#   s3_upload_form_el: $(ID_FOR_MY_UPLOAD_FORM_HERE)
#   success: ->
#     callback function here
# )

app = window.app = window.app or {};

class app.Upload
  constructor: (options) ->
    _self = @
    REQUIRED_OPTIONS = ['s3_upload_form_el']
    @data_holder_el = $("[data-uploader='data']") || false
    @progress_el = $("[data-uploader='progress-holder']") || false
    @options = {}

    for key, opt of options
      _self.options[key] = opt
      for rqo, index in REQUIRED_OPTIONS
        if rqo == key
          REQUIRED_OPTIONS.splice(index, 1)
        
    for rqo in REQUIRED_OPTIONS
      throw new Error "You must specify #{rqo}"

    @options.s3_upload_form_el.S3Uploader()

    @options.s3_upload_form_el.bind "s3_uploads_start", (e) ->
      _self.progress_el.fadeIn('fast');
      _self.progress_el.find("[data-uploader='progress-percentage']").html 0 + "%"


    @options.s3_upload_form_el.bind "s3_uploads_progress", (e, data) ->
      percent = parseInt(data.loaded / data.total * 100, 10)
      _self.progress_el.find("[data-uploader='progress-percentage']").html Math.round(percent) + "%"

    @options.s3_upload_form_el.bind "s3_upload_complete", (e, content) ->
      _self.progress_el.fadeOut "fast"
      _self.data_holder_el.show()
      if _self.data_holder_el
        _self.data_holder_el.find("[data-uploader='name']").html content.filename
        _self.data_holder_el.find("[data-uploader='size']").html numeral(content.filesize).format("0.0b")

      _self.options.success(content) if _self.options.success


    (if BrowserDetect.browser is "Explorer" then $(".ie-upload").show() else $(".normal-upload").show())

  Upload
