/// @description Dialog callback

// First we need to match the async dialog prompt id.
if(async_load[?"id"] == msgId)
{
	// Now we need to know what button was pressed (Okay/Cancel)
	// The 'status' key will give us that information.
	if (async_load[?"status"])
	{
		// Now we check to see if the value was not empty and 
		if (async_load[?"result"] != "")
		{
			// We will now enter edit mode so we set the selected slot name.
			selected = async_load[?"result"];
			
			// Create a set of point (objects that will be used for saving data)
			for(var i = 0 ; i < 3 ; i++)
			{
				instance_create_depth(800 + i*100, 200, depth, Obj_GameCenter_SavedGames_Point);
			}
			
			setSlotEditMode(true);
		}
	}
}
