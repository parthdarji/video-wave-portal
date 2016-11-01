<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Untitled Document</title>
        <script src="jquery-1.2.3min.js"></script>
        <script type="text/javascript">
            //script from Mistonline.in (Please dont remove this line)
            (function($) {
                $.extend({
                    jYoutube: function(url, size) {
                        if (url === null) {
                            return "";
                        }
                        size = (size === null) ? "big" : size;
                        var vid;
                        var results;
                        results = url.match("[\\?&]v=([^&#]*)");
                        vid = (results === null) ? url : results[1];
                        if (size == "small") {
                            return "http://localhost:8080/vidio/videoplay.jsp?" + vid + "=25&category=1";
                        } else {
                            return "http://img.youtube.com/vi/" + vid + "/0.jpg";
                        }
                    }
                })
            })(jQuery);
            $(document).ready(function() {
                // Get youtube video thumbnail on user click
                var url = '';
                $('#submit').click(function() {
                    // Check for empty input field
                    if ($('#url').val() != '') {
                        // Get youtube video's thumbnail url
                        url = $.jYoutube($('#url').val());
                        // Now append this image to <div id="thumbs">
                        $('#youtubethumbs').append($('<img src="' + url + '" />'));
                    }
                });
            });
        </script>
    </head>

    <body>
        <div class="left">
            <h1>Submit YouTube Video link</h1>
            <form>
                <input type="text" name="url" id="url"/>
                <input type='button' value="Get Video Thumbnail" id="submit"/>
            </form>
            <p>Your YouTube video thumbs:</p>
            <div id="youtubethumbs"> </div>
        </div>
    </body>
</html>