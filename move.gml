/// @function				move(_collisionObjects)
/// @description			moves instance using ax and ay and collisionObjects
/// @param					_collisionObjects array

function move(_collisionObjects){

	_collisionObjects[0] = is_undefined(_collisionObjects) ? noone : _collisionObjects[0]
	

	var collision = false
	var x0 = x
	var y0 = y
	var xx = x
	var yy = y
	var x1 = x
	var y1 = y
	var xn = x
	var yn = y
	var collisionObject = noone


	var dx = ax/(5*sqrt(power(ax,2)+power(ay,2)))
	var dy = ay/(5*sqrt(power(ax,2)+power(ay,2)))

	repeat round(sqrt(power(ax,2)+power(ay,2))*5) {

	    if sqrt(power(xx-x0,2)+power(yy-y0,2)) < sqrt(power(ax,2)+power(ay,2)) and !collision{
	        xx += dx
	        yy += dy
	    }
		
		x1 = xx
		y1 = yy
     

	    // Check collisions
	    for (var i = array_length_1d(_collisionObjects) - 1; i > -1; i--;){
	        if place_meeting(round(x1), round(y1), _collisionObjects[i]) and !collision{
	            ax = 0
	            ay = 0
	            collision = true
	            if collisionObject == noone {
	                collisionObject = instance_place(round(x1), round(y1), _collisionObjects[i])
	            }
	        }
        
	    }
    
	
	
	    // out of map
    
	    if (round(x1) - abs(sprite_width/2) <= 0 
	        or round(y1) - abs(sprite_height/2) <= 0
	        or round(x1) + abs(sprite_width/2) >= room_width 
	        or round(y1) + abs(sprite_height/2) >= room_height
	        ) {
        
	        ax = 0
	        ay = 0
	        collision = true
	    }


	    // if no collision, then good position
	    if !collision { 
	        xn = x1
	        yn = y1
        
	    }


	}

	// move
	x = xn
	y = yn
	

	
}
