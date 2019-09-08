$(function(){
	window.onload = (e) => {
        /* 'links' the js with the Nui message from main.lua */
		window.addEventListener('message', (event) => {
            //document.querySelector("#logo").innerHTML = " "
			var item = event.data;


			if (item !== undefined && item.type === "ui") {
                /* if the display is true, it will show */
				if (item.display === true) {
		
					$("#container").show();
		
                     /* if the display is false, it will hide */
				} else{
					$("#container").hide();
				
			}
			}

			if ( item !== undefined && item.dataab !== undefined && item.dataab.includes("charlevel") == true) {
					$("#container").html(item.dataab.replace("charlevel","Lv: "));
				
			}
			if ( item !== undefined && item.datlvl !== undefined && item.datlvl.includes("lvlpercent") == true) {
				 $("#myBar").width(item.datlvl.replace("lvlpercent",""));

			}
		});
	};
});