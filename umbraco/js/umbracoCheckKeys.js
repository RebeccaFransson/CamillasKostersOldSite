var ctrlDown=false;var shiftDown=false;var keycode=0;var currentRichTextDocument=null;var currentRichTextObject=null;function umbracoCheckKeysUp(A){ctrlDown=A.ctrlKey;shiftDown=A.shiftKey}function umbracoActivateKeys(C,A,B){ctrlDown=C;shiftDown=A;keycode=B;return runShortCuts()}function umbracoActivateKeysUp(C,A,B){ctrlDown=C;shiftDown=A;keycode=B}function umbracoCheckKeys(A){ctrlDown=A.ctrlKey;shiftDown=A.shiftKey;keycode=A.keyCode;return runShortCuts()}function shortcutCheckKeysPressFirefox(A){if(ctrlDown&&keycode==83){A.preventDefault()}}function runShortCuts(){if(currentRichTextObject!=undefined&&currentRichTextObject!=null){if(ctrlDown){if(!shiftDown&&keycode==9){functionsFrame.tabSwitch(1)}else{if(shiftDown&&keycode==9){functionsFrame.tabSwitch(-1)}}if(keycode==83){doSubmit();return false}if(shiftDown&&currentRichTextObject){if(keycode==70){functionsFrame.umbracoInsertForm(myAlias);return false}if(keycode==76){functionsFrame.umbracoLink(myAlias);return false}if(keycode==77){functionsFrame.umbracoInsertMacro(myAlias,umbracoPath);return false}if(keycode==80){functionsFrame.umbracoImage(myAlias);return false}if(keycode==84){functionsFrame.umbracoInsertTable(myAlias);return false}if(keycode==86){functionsFrame.umbracoShowStyles(myAlias);return false}if(keycode==85){functionsFrame.document.getElementById("TabView1_tab01layer_publish").click();return false}}}}else{if(isDialog){if(keycode==27){window.close()}if(keycode==13&&functionsFrame.submitOnEnter!=undefined){if(!functionsFrame.disableEnterSubmit){if(functionsFrame.submitOnEnter){if(window.addEventListener){e.preventDefault()}doSubmit()}}}if(ctrlDown){if(keycode==83){doSubmit()}else{if(keycode==85){document.getElementById("TabView1_tab01layer_publish").click()}else{if(!shiftDown&&keycode==9){functionsFrame.tabSwitch(1);return false}else{if(shiftDown&&keycode==9){functionsFrame.tabSwitch(-1);return false}}}}}}}return true}if(window.addEventListener){document.addEventListener("keyup",umbracoCheckKeysUp,false);document.addEventListener("keydown",umbracoCheckKeys,false);document.addEventListener("keypress",shortcutCheckKeysPressFirefox,false)}else{document.attachEvent("onkeyup",umbracoCheckKeysUp);document.attachEvent("onkeydown",umbracoCheckKeys)};