var ultraSimpleMailerTotalMails;function ultraSimpleMailer_doSend(A){document.getElementById(A+"_doTest").value="";document.getElementById(A+"_doSend").value="true";document.forms[0].submit()}function ultraSimpleMailer_doSendTest(A){document.getElementById(A+"_doTest").value="true";document.getElementById(A+"_doSend").value="";document.forms[0].submit()}function ultraSimpleMailerDoSend(){ultraSimpleMailerShowProgressBar();document.forms[0].submit()}function ultraSimpleMailerShowProgressBar(){setTimeout("ultraSimpleMailerShowStatus()",100);setTimeout("ultraSimpleMailerUpdateStatus()",200)}function ultraSimpleMailerShowStatus(){document.getElementById("ultraSimpleMailerFormDiv").style.display="none";document.getElementById("ultraSimpleMailerAnimDiv").style.display="block";document.getElementById("ultraSimpleMailerAnim").src="images/anims/publishPages.gif"}function ultraSimpleMailerUpdateStatus(){umbraco.presentation.webservices.legacyAjaxCalls.ProgressStatus(ultraSimpleMailerId+"Done",ultraSimpleMailerUpdateStatusDo)}function ultraSimpleMailerUpdateStatusDo(B){progressBarUpdateLabel("ultraSimpleMailerUpgradeStatus","<b>"+B+" of "+ultraSimpleMailerTotalMails+"</b>");B=parseInt(B);if(B>0){var A=Math.round((B/ultraSimpleMailerTotalMails)*100);progressBarUpdate("ultraSimpleMailerUpgradeStatus",A)}setTimeout("ultraSimpleMailerUpdateStatus()",500)};