<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


<input type="submit" id="Submit">

<div>Click the enable and disable buttom </Div>

<button onclick="myFunction()">Disable</button>
<button onclick="myFunction1()">Enable</button>

<script>
function myFunction() {
document.getElementById("Submit").disabled = true;
}
function myFunction1() {
document.getElementById("Submit").disabled = false;
}
</script>
<a href="index.jsp" ><button type="submit" name="SubmitButton" value="accept" id="buttonAccept" onclick="return foo();">Accept</button></a>
<a href=""><button   type="submit" name="SubmitButton" value="cancel" id="buttonCancel" onclick="return foo1();">Cancel</button></a>
<script>

$("#btnAnchr").on('click', function (e) {
    $(this).attr("disabled", "disabled");
    e.preventDefault();
});



function foo() {
   document.getElementById("buttonAccept").disabled = true;
  
   return true;
}
function foo1() {
document.getElementById("buttonCancel").disabled = true;
}
</script>

//*



<a href='http://somepage.com' id='get' onlick='document.getElementById(this.id).removeAttribute("href");'>Something to be go </a>
 <td><a href="http://www.google.com.my/" onclick="return false"> Google </a>



<a href="https://codepedia.info" id="btnAnchr">Anchor Tag Click me</a>








</body>
</html>