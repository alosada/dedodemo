// You might have to remove this code if you have other JS initializers.
// Copy the initialize function in your JS initializer

window.addEventListener( 'load', initialize)

function initialize(){
	deDoDrop = new DeDropDo()
  	deDoDrop.bindEventListeners()
}

// END



function DeDropDo() {
	this.primary = document.getElementById("dedodrop-primary").innerHTML
	this.secondary = document.getElementById("dedodrop-secondary").innerHTML
	this.old = ""
}

DeDropDo.prototype = {
	bindEventListeners: function(){
		var primaryList = document.getElementById(deDoDrop.primary)
		primaryList.addEventListener("change", this.actions, false);
	},
	actions: function(){
		deDoDrop.hideOld(deDoDrop.old)
		var id = "dedodrop-id"+this.value;
		deDoDrop.showOptions(id)
		deDoDrop.killFirst()
		deDoDrop.enableSecondary()
	},
	enableSecondary: function(){
		var childrenList = document.getElementById(deDoDrop.secondary);
		childrenList.disabled = false;
	},
	hideOld: function(id){
		var options = document.getElementsByClassName(id);
		var l = options.length;
		for (var i = 0; i<l; i++){
			options[i].className = id + " dedodrop-hidden"
		}
	},
	showOptions: function(id){
		deDoDrop.old = id
		var options = document.getElementsByClassName(id);
		var l = options.length;
		for (var i = 0; i<l; i++){
			options[i].className = id + " dedodrop-visible"
		}
	},
	killFirst: function(){
		victim = document.getElementById("dedodrop-kill")
		if (victim !== null)
			victim.remove()

	}
}