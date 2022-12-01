
event_inherited();

var _wall_found = check_collision(vel_x * 4, 0);

// This checks if a wall was found.
if (_wall_found)
{
	// This flips the sign of the X velocity, so if it's positive it becomes negative, and vice versa.
	// This means the enemy turns to the other direction (from left to right, and vice versa).
	vel_x = -vel_x;
}

// Here we are looking for a ledge, by checking for a collision 32 times ahead where the enemy is 
// moving.
// However this time the Y offset is set to 64, so it's looking for a collision 64 pixels below where
// the enemy would be.
// If a collision is not found there, it means that position has no ground for the enemy to walk on,
// so we've hit a ledge.
// The result of this function is stored in 'ground_ahead'.
var _ground_ahead = check_collision(vel_x * 32, 64);

// This checks if a collision was NOT found there, meaning we've hit a ledge.
if (!_ground_ahead)
{
	// This ensures the enemy is grounded, so enemies in mid-air do not turn.
	if (grounded)
	{
		// This makes the enemy turn.
		vel_x = -vel_x;
	}
}

// This checks if there is another enemy where this enemy is moving. This is used to make
// the enemy turn if it runs into another enemy, so they don't pass through each other.
var _inst = instance_place(x + vel_x * 16, y, obj_enemy_parent);

if (_inst != noone)
{
	// In that case the enemy turns.
	vel_x = -vel_x;
}