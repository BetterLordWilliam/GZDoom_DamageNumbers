class DamageIndicator : Actor {
	int maxLifeTicks;
	int damageAmount;
	int lifeTicks;
	
// 	property MaxLifeTicks: maxLifeTicks;
// 	property LifeTicks: lifeTicks;
	
	Default {
		-SOLID;
		+NOGRAVITY;
		+BRIGHT;
		+BILLBOARDFACECAMERA;
		+NOBLOCKMAP;
		+NOBLOCKMONST;
		+NOTRIGGER;
		+NOINTERACTION;
		+CLIENTSIDEONLY;

		Projectile;
	}
	
	States {
		Spawn:
			DGIT # 1;
			Loop;
		Death:
			Stop;
	}
	
	void Init(int damageAmount) {
// 		Console.printf("DIGIT INITIALIZED");
		
		
		self.lifeTicks = 0;
		self.maxLifeTicks = 75;
		self.damageAmount = damageAmount;
		self.sprite = GetSpriteIndex("DGIT");
		self.frame = self.damageAmount;
	}
	
	override void Tick() {
		Super.Tick();
		
		lifeTicks = lifeTicks + 1;
		
// 		Console.printf("I AM TICKING");
		
		if (lifeTicks == maxLifeTicks) {
			SetStateLabel("Death");
// 			Console.printf("I AM DYING");
			return;
		}

// 		if (lifeTicks % 10 == 0) {
// 			scale *= 0.9;
// 		}
	}
}
