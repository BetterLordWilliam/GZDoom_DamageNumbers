class DamageIndicator : Actor {
	int maxLifeTicks;
	int lifeTicks;
	int damageAmount;
	
	property MaxLifeTicks: maxLifeTicks;
	property LifeTicks: lifeTicks;
	property DamageAmount: damageAmount;
	
	Default {
		-SOLID;
		+NOCLIP;
		+NOGRAVITY;
		+BRIGHT;
		+BILLBOARDFACECAMERA;
		+NOBLOCKMAP;
		+NOBLOCKMONST;
		+NOTRIGGER;
		+NOINTERACTION;
		+CLIENTSIDEONLY;
		
		RenderStyle 'Translucent';
		Alpha 1.0;

		DamageIndicator.MaxLifeTicks 25;
		DamageIndicator.LifeTicks 0;
	}
	
	States {
		Spawn:
			DGIT # 1;
			Loop;
	}
	
	override void Tick() {
		Super.Tick();
		
		LifeTicks = LifeTicks + 1;
		Alpha = 1.0 - (float(LifeTicks) / float(MaxLifeTicks));
		
		if (LifeTicks == MaxLifeTicks) {
			Destroy();
		}
	}
}
