
<script language="LiveScript">
<!-- 

function addChar(input, character)
{
    if(input.value == null || input.value == "0")
        input.value = character
    else
        input.value += character
}

function deleteChar(input)
{
    input.value = input.value.substring(0, input.value.length - 1)
}

function changeSign(input)
{
    // could use input.value = 0 - input.value, but let's show off substring
    if(input.value.substring(0, 1) == "-")
	input.value = input.value.substring(1, input.value.length)
    else
	input.value = "-" + input.value
}

function compute(form) 
{
	form.display.value = eval(form.display.value)
}

function square(form) 
{
	form.display.value = eval(form.display.value) * eval(form.display.value)
}

function checkNum(str) 
{
	for (var i = 0; i < str.length; i++) {
		var ch = str.substring(i, i+1)
		if (ch < "0" || ch > "9") {
			if (ch != "/" && ch != "*" && ch != "+" && ch != "-" 
				&& ch != "(" && ch!= ")") {
				alert("invalid entry!")
				return false
			}
		}
	}
	return true
}

<!--  -->
</script>


</HEAD>

<BODY bgcolor="white">


<form>
<table border="5" align=center>
<tr align="center">
<td colspan = 4>

<table border="3">
<tr>
<td align=center><input name="display" value="0" size=20></td>
</tr>
</table>

</td>
</tr>

<tr align=center>
<td>
<input type="button" value="    7    "
  onClick="addChar(this.form.display, '7')">
</td>
<td>
<input type="button" value="    8    "
  onClick="addChar(this.form.display, '8')">
</td>
<td>
<input type="button" value="    9    "
  onClick="addChar(this.form.display, '9')">
</td>
<td>
<input type="button" value="    /     "
  onClick="addChar(this.form.display, '/')">
</td>
</tr>

<tr align=center>
<td>
<input type="button" value="    4    "
  onClick="addChar(this.form.display, '4')">
</td>
<td>
<input type="button" value="    5    "
  onClick="addChar(this.form.display, '5')">
</td>
<td>
<input type="button" value="    6    "
  onClick="addChar(this.form.display, '6')">
</td>
<td>
<input type="button" value="    *    "
  onClick="addChar(this.form.display, '*')">
</td>
</tr>

<tr align=center>
<td>
<input type="button" value="    1    "
  onClick="addChar(this.form.display, '1')">
</td>
<td>
<input type="button" value="    2    "
  onClick="addChar(this.form.display, '2')">
</td>
<td>
<input type="button" value="    3    "
  onClick="addChar(this.form.display, '3')">
</td>
<td>
<input type="button" value="     -    " 
  onClick="addChar(this.form.display, '-')">
</td>
</tr>

<tr align=center>
<td>
<input type="button" value="    0    "
  onClick="addChar(this.form.display, '0')"> 
</td>
<td>
<input type="button" value="     .    "
  onClick="addChar(this.form.display, '.')"> 
</td>
<td>
<input type="button" value="   +/-   "
  onClick="changeSign(this.form.display)">
</td>
<td>
<input type="button" value="    +    "
  onClick="addChar(this.form.display, '+')">
</td>
</tr>

<tr align=center>
<td>
<input type="button" value="    (    "
  onClick="addChar(this.form.display, '(')"> 
</td>
<td>
<input type="button" value="     )    "
  onClick="addChar(this.form.display, ')')"> 
</td>
<td>
<input type="button" value="   sq    "
  onClick="if (checkNum(this.form.display.value))
	{ square(this.form) }">
</td>
<td>
<input type="button" value="    <-   "
  onClick="deleteChar(this.form.display)">
</td>
</tr>

<tr align=center>
<td colspan="2">
<input type="button" value="      Resultado      " name="enter"
  onClick="if (checkNum(this.form.display.value))
	{ compute(this.form) }">
</td>
<td colspan="2">
<input type="button" value="         C          "
  onClick="this.form.display.value = 0 ">
</td>
</tr>
</table>
</form>


<!-- w w w . h t m l p o i n t . c o m -->
