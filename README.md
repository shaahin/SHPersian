SHPersian
=========


SHPersian is a set of tools for Persian/Arabic iOS App developers.

This package includes required classes to add custom look and feel to texts in your Persian iOS apps.

This also includes custom controls with built-in custom Persian font support out of the box.


## How to Use

You may take a look at the sample project to get how to use the SHPersian controls. It's so simple.

### SHLabel

For apps that show Persian/Arabic texts in UILabels, You may just change the class name for the UILabel to SHLabel. Then add a row with "Font" for title, and your custom font name as String value in the "User Defined Runtime Attributes" section in your storyboard. That's all. Your text will now render in your custom font look. SHLabel now supports multiline text handling.

You can access -actualHeight to get the size of the label for showing the whole text in lines. You can also use -resizeToFitText to let SHLabel resize itself and set it's height for text to fit.

### SHButton

And now you can use SHButton instead of UIButtons. change the class name for the UIButton to SHButton. You can add a row with "Font" for title, and your custom font name as String value in the "User Defined Runtime Attributes" section in your storyboard. It works like the standard UIButton but it supports Persian fonts and will render the button title correctly.  



## Support

<form action="https://www.paypal.com/cgi-bin/webscr" method="post" style="text-align: center; padding-top:5px">
<input type="hidden" name="cmd" value="_s-xclick">
<input type="hidden" name="hosted_button_id" value="MZ4LKCTHYX5LQ">
<input type="image" src="https://www.paypalobjects.com/en_US/i/btn/btn_donate_LG.gif" border="0" name="submit" alt="PayPal - The safer, easier way to pay online!">
<img alt="" border="0" src="https://www.paypalobjects.com/en_US/i/scr/pixel.gif" width="1" height="1">
</form>


## About

Shahin Katebi

- [Shaahin.us](http://shaahin.us)
- [GitHub/shaahin](http://github.com/shaahin)
- [Twitter/ShahinKatebi](http://twitter.com/ShahinKatebi)



#### Note: This document is being updated.