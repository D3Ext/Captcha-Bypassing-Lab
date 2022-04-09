<?php
	session_start();
	$status = '';

    	if (isset($_POST['captcha']) && ($_POST['captcha'] != ""))
    	{
        	// Validation: Checking entered captcha code with the generated captcha code
        	if (strcasecmp($_SESSION['captcha'], $_POST['captcha']) != 0)
        	{
            	// Note: the captcha code is compared case insensitively.
            	// if you want case sensitive match, check above with strcmp()
            	$status = "<p style='color:#FFFFFF; font-size:20px'>
		<span style='background-color:#FF0000;'>Entered captcha code does not match! Kindly try again</span></p>";
        }
        else
        {
            $status = "<p style='color:#FFFFFF; font-size:20px'>
<span style='background-color:#46ab4a;'>Your captcha code is match.</span>
</p>";
        }
    }
    echo $status;
?>
<form name="form" method="post" action="">
<label><strong>Enter Captcha:</strong></label><br />
<input type="text" name="captcha" />
<p><br />
<img src="captcha.php?rand=<?php echo rand(); ?>" id='captcha_image'>
</p>
<p>Can't read the image?
<a href='javascript: refreshCaptcha();'>click here</a>
to refresh</p>
<br>
<input type="submit" name="submit" value="Submit">
</form>
<script>
//Refresh Captcha
function refreshCaptcha(){
    var img = document.images['captcha_image'];
    img.src = img.src.substring(
                0,img.src.lastIndexOf("?")
                )+"?rand="+Math.random()*1000;
}
</script>
