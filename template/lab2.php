<?php
session_start();
$status = '';

$USER = 'admin';
$PASSWORD = 'password';

if (isset($_POST['captcha']) && ($_POST['captcha'] != "") && ($_POST['username'] != "") && ($_POST['password'] != ""))
{
  // Validation: Checking entered captcha code with the generated captcha code
  if (strcasecmp($_SESSION['captcha'], $_POST['captcha']) != 0)
  {
    // Note: the captcha code is compared case insensitively.
    // if you want case-sensitive match, check above with strcmp()
    $status = "<p style='color:#FFFFFF; font-size:20px'><span style='background-color:#FF0000;'>Submitted captcha code does not match!</span></p>";
  } else {
    if ($_POST['username'] == $USER) {
      if ($_POST['password'] == $PASSWORD) {
        echo "<p style='color:#FFFFFF; font-size:20px'><span style='background-color:#46ab4a;'>Access Granted</span></p>";
      } else {
        echo "<p style='color:#FFFFFF; font-size:20px'><span style='background-color:#FF0000;'>Invalid Password</span></p>";
      }
    } else {
      echo "<p style='color:#FFFFFF; font-size:20px'><span style='background-color:#FF0000;'>Invalid User</span></p>";
    }
    
    // $status = "<p style='color:#FFFFFF; font-size:20px'><span style='background-color:#46ab4a;'>Submitted captcha code is correct.</span></p>";
  }
}
echo $status;
?>

<form name="form" method="post" action="">
  Username: <input type="text" name="username" id="username" size="10"><br>
  Password: <input type="password" name="password" id="password" size="15"><br>
  Enter Captcha: <input type="text" name="captcha"><br>

  <p>
    <img src="captcha.php?rand=<?php echo rand(); ?>" id='captcha_image'>
  </p>
  <p>Can't read the image? Click
    <a href='javascript: refreshCaptcha();'>here</a>
    to refresh
  </p>

  <input type="submit" name="submit" value="Submit">
  <a href="index.html">
    <input type="button" value="Go back" />
  </a>
</form>

<script>
  // Refresh Captcha
  function refreshCaptcha() {
    var img = document.images['captcha_image'];
    img.src = img.src.substring(0, img.src.lastIndexOf("?")) + "?rand=" + Math.random() * 1000;
  }
</script>

