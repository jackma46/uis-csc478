function hidePassword() {
  var x = document.getElementById("password_textbox");
  if (x.type === "text") {
    x.type = "password";
  } else {
    x.type = "text";
  }
}