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

Copy the following files/directories:

1. ```/include``` **to** ```app/assets/javascripts``` 

2. ```/css/upload.css.scss``` **to** ```app/assets/stylesheets``` 

3. ```/images/loading.gif``` **to** ```app/assets/images```

4. ```/shared``` **to** ```app/views```

##HTML

Use this code where ever you want the ```name``` and ```size``` to appear on the page. **Note**: CSS for this element is found in ```upload.css.scss```.

```html
<div data-uploader="data">
  <i class="fa fa-file"></i> <strong>File</strong>: <span data-uploader='name'></span> - <span data-uploader='size'></span>
</div>
``` 

Using <a href="http://fontawesome.io/">FontAwesome</a>. Include in the ```head``` after the stylesheets include tag:

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

**Note 1**: Make sure to add ```data: {:uploader => 'form'}``` to your form as shown above. 

**Note 2**: The HTML above uses Twitter bootstrap. To include bootstarp in your project go <a href="https://github.com/jona/start_it_up">here</a>.


