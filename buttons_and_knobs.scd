(Window.closeAll;
k = Window("gui elements", Rect(
	Window.availableBounds.width/2,
	185,
	(Window.availableBounds.width/2),
	(Window.availableBounds.width/2)-40),border:true)
.front
.background_(
	Color.black
	//Color.rand
).alwaysOnTop_(true);

k.view.decorator_(FlowLayout(k.bounds,5@5,0@0)))

(Array.fill(64,{
	arg i;
	Knob(
		k,
		(k.bounds.width/16.9)@(k.bounds.width/16.9)
	).color_(
		[
			Color.new(1,1,1,0.5),
			Color.new(1,1,1,0.5),
			Color.new(0,0,0,0.5),
			Color.new(0,0,0,0.5)
		]
		//Array.fill(4, {Color.rand})
	).action_(
		{
			arg obj;
			("knob " ++ i ++ " set to " ++ obj.value).postln
		}
	)
}))

(2.do(
	{
		arg i;
		Array.fill(16,{
			arg j;
			Button(
				k,
				(k.bounds.width/16.9)@(k.bounds.width/16.9)
			).states_(
				[
					[ " ",
						Color.new(1,1,1,0.5),
						Color.new(1,1,1,0.5)
						//Color.rand, Color.rand
					]
				]
			).mouseDownAction_(
				{
					if(i == 0,
						{("momentary button " ++ j ++ " pressed").postln},
						{("momentary button " ++ (j+16) ++ " pressed").postln}
					)
				}
			)
		});
		Array.fill(16,{
			arg m;
			Button(
				k,
				(k.bounds.width/16.9)@(k.bounds.width/16.9)
			).states_(
				[
					[ " ",
						Color.new(1,1,1,0.25),
						Color.new(1,1,1,0.25)
						//Color.rand, Color.rand
					],
					[ " ",
						Color.new(1,1,1,0.75),
						Color.new(1,1,1,0.75)
						//Color.rand, Color.rand
					]
				]
			).action_(
				{
					arg view;
					if(view.value == 3)
					{view.value = 1};
					if(i == 0,
						{("toggle " ++ m ++ " set to " ++ view.value).postln},
						{("toggle " ++ (m+16) ++ " set to " ++ view.value).postln}
					)
				}
			)
		})
	}
))

(Array.fill(16,{
	arg n;
	Slider(
		k,
		(k.bounds.width/16.9)@(k.bounds.width/2.5)
	).action_(
		{
			arg obj;
			("slider " ++ n ++ " set to " ++ obj.value).postln
		}
	).background_(
		Color.new(1,1,1,0.25)
		//Color.rand
	).knobColor_(
		Color.black
		//Color.rand
	)
});
Slider(
	k,
	(k.bounds.width-35)@(k.bounds.height/16.9)
).action_(
	{
		arg obj;
		("slider 16 set to " ++ obj.value).postln
	}
).background_(
	Color.new(1,1,1,0.25)
	//Color.rand
).knobColor_(
	Color.black
	//Color.rand
))

k.close;
