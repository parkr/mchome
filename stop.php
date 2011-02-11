<?php

function sayStop($i){
	if($i > 0){
		echo "Stop that.<br>";
		sayStop($i-1);
	}
}

sayStop(10);
echo "This request was done so using recursion in PHP.";
?>
