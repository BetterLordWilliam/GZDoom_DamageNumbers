
// 		TextureID digiTexId = TexMan.CheckForTexture("DGITA0", TexMan.Type_Sprite);
			
// 		if (!digiTexId.Exists()) {
// 			Console.printf("[ERROR] TEXTURE DOES NOT EXIST");
// 			return;
// 		}
			
// 		Vector2 digiTexSize = TexMan.GetScaledSize(digiTexId);

class MonsterDamageEventHandler : EventHandler {

	override void WorldThingDamaged(WorldEvent e) {
		if (e.Thing && e.Damage > 0) {
			SpawnDamageIndicator(e);
		}
	}
	
	override void WorldThingDied(WorldEvent e) {
		if (e.Thing && e.Damage > 0) {
			SpawnDamageIndicator(e);
		}
	}
	
	private void SpawnDamageIndicator(WorldEvent e) {
		int numSpawned = 0;
		int invr = random(0, 1);
		int digiCount = e.Damage;		// Copy of the damage number
		Vector3 randomVel = (
			frandom(-1.0, 1.0),
			frandom(-1.0, 1.0),
			3.0
		);
		Vector3 spawnPos = (
			e.Thing.pos.x + frandom(-1.0, 1.0),
			e.Thing.pos.y + frandom(-1.0, 1.0),
			e.Thing.pos.z + (0.85 * e.Thing.height)
		);

		Console.printf("%d", e.Damage);
		
		// Spawn floating thingies for each of the digits
		// Superior way of doing this?
		while (digiCount > 0) {
			Actor damageIndicator = Actor.Spawn("DamageIndicator", spawnPos);
			(DamageIndicator(damageIndicator)).Init(digiCount % 10);
			damageIndicator.A_SpriteOffset(-(16/2 * numSpawned), 0);
			damageIndicator.vel = randomVel;
			digiCount /= 10;
			numSpawned++;
		}
	}
}
