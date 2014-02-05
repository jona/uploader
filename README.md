#Uploader

An add-on for the <a href="https://github.com/waynehoover/s3_direct_upload">s3_direct_upload</a> gem.

##Installation

You must first add this line to your application's Gemfile:

```ruby 
gem 's3_direct_upload'
```

**Note**: To see more in-depth instructions on how to install this gem, go <a href="https://github.com/waynehoover/s3_direct_upload">here</a>.

Add this to your **application.js** file:

```
//= require jquery-fileupload/basic
//= require jquery-fileupload/vendor/tmpl
```

##Assets

Copy the directory ```include``` and copy it to ```app/assets/javascripts```. 

Copy the file ```upload.css.scss``` in the css directory to ```app/assets/stylesheets```. 

Copy the file ```loading.giff``` in the images directory to ```app/assets/images```. 

Copy the ```shared``` directory to ```app/views```. Render it where ever you need it.

##HTML

Use this code where ever you want the ```file name``` and ```file size``` to appear on the page. **Note**: CSS for this element is found in ```upload.css.scss```.

```html
<div data-uploader="data">
  <i class="fa fa-file"></i> <strong>File</strong>: <span data-uploader='name'></span> - <span data-uploader='size'></span>
</div>
``` 

Using <a href="http://fontawesome.io/">FontAwesome</a>. Include in the you ```head```:

```html
<link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">
```

Wrap the ```s3_uploader_form``` form as shown below:

```html
<div class="btn btn-default upload-btn">
  Browse
  <%= s3_uploader_form data: {:uploader => 'form'} do %>
    <%= file_field_tag :file, multiple: true %>
  <% end %>
</div>
```

**Note**: Make sure to add ```data: {:uploader => 'form'}``` to your form as shown above.