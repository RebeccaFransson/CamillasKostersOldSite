function toggleTree(C){var A=jQuery("#leftDIV");var F=jQuery("#rightDIV");var B=A.css("display");var D=jQuery(C);if(B=="none"){A.show();D.removeClass();resizePage()}else{A.hide();D.addClass("on");var E=jQuery(window).width();F.width(E-20)}}function resizePage(E){var H=jQuery("#rightDIV");var K=jQuery("#right");var L=jQuery("#leftDIV");var C=jQuery("#treeToggle");var D=jQuery("#PlaceHolderAppIcons");var A=jQuery("#uiArea");if(jQuery(window)){var F=jQuery(window).height()-48;var J=jQuery(window).width();var B=parseInt(J*0.25);var G=parseInt(J-B-30);var I=parseInt(F-5);L.width(B);if(D!=null){I=I-135;resizeGuiWindow("PlaceHolderAppIcons",B,140)}resizeGuiWindow("treeWindow",B,I);if(L.css("display")=="none"){H.width(J-24)}else{H.width(G)}if(F>0){H.height(F);C.height(F)}C.show();A.show()}}function resizeGuiWindow(B,D,A,C){resizePanelTo(B,false,D,A)}function resizeGuiWindowWithTabs(B,C,A){right.document.all[B+"ContainerTable"].width=C+22;right.document.all[B+"ContainerTableSpacer"].width=C;right.document.all[B+"Bottom"].width=C+12;right.document.all[B+"BottomSpacer"].width=C;right.document.all[B].style.width=C;if(right.document.all[B+"BottomLabel"]){right.document.all[B+"ContainerTable"].height=A-13;right.document.all[B].style.height=A-13}else{right.document.all[B+"ContainerTable"].height=A+3;right.document.all[B].style.height=A+3}};