var step=8;var padding=10;function progressBarUpdate(E,D){var C=document.getElementById("progressBar"+E).style.width;C=Math.round(C.substring(0,C.length-2))-padding;var B=C/100;var A=Math.round(B*D);if(A%step==0||D>99){document.getElementById("progressBar"+E+"_indicator").style.width=A}}function progressBarUpdateLabel(B,A){document.getElementById("progressBar"+B+"_text").innerHTML=A}function progressBarTest(B,A){progressBarUpdate(B,A);progressBarUpdateLabel(B,A+"%");if(A<100){A++;setTimeout("progressBarTest('"+B+"', "+A+")",100)}};