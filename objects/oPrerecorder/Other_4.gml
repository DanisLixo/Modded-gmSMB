if (startRecord && !instance_exists(oRecorder)) {
	instance_destroy(); 
	instance_create_depth(x,y,depth,oRecorder);
} 