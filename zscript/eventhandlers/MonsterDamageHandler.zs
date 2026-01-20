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
		int digiCount = e.Damage;		// Copy of the damage number

		Vector3 randomVel = (
			frandom(-0.5, 0.5),
			frandom(-0.5, 0.5),
			2.0
		);
		Vector3 spawnPos = (
			e.Thing.pos.x + frandom(-2.0, 2.0),
			e.Thing.pos.y + frandom(-2.0, 2.0),
			e.Thing.pos.z + (0.85 * e.Thing.height) - (frandom(0.1, 0.5) * e.Thing.height)
		);

		Console.printf("%d", e.Damage);
		
		// Spawn floating thingies for each of the digits
		// Superior way of doing this?
		while (digiCount > 0) {
			Actor damageIndicator = Actor.Spawn("DamageIndicator", spawnPos);

			damageIndicator.A_SpriteOffset(-(16/2 * numSpawned), 0);
			damageIndicator.frame = digiCount % 10;
			damageIndicator.vel = randomVel;

			digiCount /= 10;
			numSpawned++;
		}
	}
}
