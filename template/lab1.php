<form name="form" method="post" action="">
  <label>Enter Captcha:</label><br/>
  <input type="text" name="captcha" />
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

  function goBack() {
    window.location.href = 'index.html';
  }
</script>

<?php
session_start();
$status = '';

if (isset($_POST['captcha']) && ($_POST['captcha'] != "")) {
  // Checking entered captcha code with the generated captcha code
  if (strcasecmp($_SESSION['captcha'], $_POST['captcha']) != 0) {
    // if you want case-sensitive match, check above with strcmp()
    $status = "<p style='color:#FFFFFF; font-size:20px'><span style='background-color:#FF0000;'>Submitted captcha code does not match!</span></p>";
  } else {
    $status = "<p style='color:#FFFFFF; font-size:20px'>
      <span style='background-color:#46ab4a;'>Submitted captcha code is correct.</span></p>";
  }
}

echo $status;
?>

