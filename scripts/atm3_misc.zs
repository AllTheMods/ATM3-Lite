import crafttweaker.item.IIngredient as IIngredient;
import crafttweaker.item.IItemStack as IItemStack;
import crafttweaker.oredict.IOreDict as IOreDict;
import crafttweaker.oredict.IOreDictEntry as IOreDictEntry;

//      ================================================
print(" =================== ATM Misc =================== ");
print(" ================================================ ");

//====== Variables ======
//
	var planks = <ore:plankWood>;
	var strings = <ore:string>;
	var cobweb = <minecraft:web>;
	var marble = <ore:stoneMarble>;


//====== Misc Tool Conflicts ======
//
	recipes.remove(<techreborn:bronzespade:0>);       //conflicts with <thermalfoundation:tool.shovel_bronze:0>
	recipes.remove(<techreborn:bronzesword:0>);       //conflicts with <thermalfoundation:tool.sword_bronze:0>
	recipes.remove(<techreborn:bronzeaxe:0>);         //conflicts with <thermalfoundation:tool.axe_bronze:0>
	recipes.remove(<techreborn:bronzehoe:0>);         //conflicts with <thermalfoundation:tool.hoe_bronze:0>
	recipes.remove(<techreborn:bronzehelmet:0>);      //conflicts with <thermalfoundation:armor.helmet_bronze:0>
	recipes.remove(<techreborn:bronzeboots:0>);       //conflicts with <thermalfoundation:armor.boots_bronze:0>
	recipes.remove(<techreborn:bronzepickaxe:0>);     //conflicts with <thermalfoundation:tool.pickaxe_bronze:0>
	recipes.remove(<techreborn:bronzechestplate:0>);  //conflicts with <thermalfoundation:armor.plate_bronze:0>
	recipes.remove(<techreborn:bronzeleggings:0>);    //conflicts with <thermalfoundation:armor.legs_bronze:0>
	//recipes.remove(<embers:pickaxe_lead:0>);          //conflicts with <thermalfoundation:tool.pickaxe_lead:0>
	//recipes.remove(<embers:pickaxe_copper:0>);        //conflicts with <thermalfoundation:tool.pickaxe_copper:0>
	//recipes.remove(<embers:pickaxe_silver:0>);        //conflicts with <thermalfoundation:tool.pickaxe_silver:0>
	//recipes.remove(<embers:pickaxe_aluminum:0>);      //conflicts with <thermalfoundation:tool.pickaxe_aluminum:0>
	//recipes.remove(<embers:pickaxe_bronze:0>);        //conflicts with <thermalfoundation:tool.pickaxe_bronze:0>
	//recipes.remove(<embers:pickaxe_electrum:0>);      //conflicts with <thermalfoundation:tool.pickaxe_electrum:0>
	//recipes.remove(<embers:pickaxe_nickel:0>);        //conflicts with <thermalfoundation:tool.pickaxe_nickel:0>
	//recipes.remove(<embers:pickaxe_tin:0>);           //conflicts with <thermalfoundation:tool.pickaxe_tin:0>
	//recipes.remove(<embers:pickaxe_bronze:0>);        //conflicts with <techreborn:bronzepickaxe:0>	

	
//====== Forestry gears redundant ======
//------ NOTE: remove not working now becasue mezz isn't using the recipe event and CrT literally can't event
//
	recipes.remove(<forestry:gear_bronze>);
	recipes.remove(<forestry:gear_copper>);
	recipes.remove(<forestry:gear_tin>);

	
//====== Recipe tweaks ======
//------ Mostly just due to conflicting recipe overlap
//
//	recipes.removeShaped(<rustic:crop_stake:0>);
//	recipes.addShaped("cropstake", <rustic:crop_stake:0> * 3,
//		[[null, null, planks],
//		[null, planks, null],
//		[planks, null, null]]);


	recipes.removeShaped(<stevescarts:modulecomponents:43>);
	recipes.addShaped("fuse", <stevescarts:modulecomponents:43> * 12,
		[[strings, null, null],
		[null, strings, null],
		[null, null, strings]]);

	recipes.removeShaped(<quark:marble:1>);
	recipes.addShaped("marble", <quark:marble:1> * 9,
		[[marble, marble, marble],
		[marble, marble, marble],
		[marble, marble, marble]]);


	

//====== TechReborn Coolant/Cell Conflict ======
//--Ord (12-JULY-2017)
//
	//could be worthy of a report to mod dev as it might be an oversight
	//10k coolant cell can be crafted with the bucket of water
	//<techreborn:part:36> versus <techreborn:dynamiccell:0>
	
	recipes.removeShaped(<techreborn:part:36>, 
		[[null,	<*>,	null],
		 [<*>,	null,	<*>	],
		 [null,	<*>,	null]]
	);
	// for some reason this is removing the 10k coolant recipe that has a bucket in the center
	// could be a CrT bug, need to re-add the recipe for now:
	
		recipes.addShaped("coolantcell10k", <techreborn:part:36>, 
		[[		null,		<ore:ingotTin>,			null		],
		 [<ore:ingotTin>,	<minecraft:bucket>,	<ore:ingotTin>	],
		 [		null,		<ore:ingotTin>,			null		]]
	);


//====== Quark Iron Plate (decoration) ======
//--Ord (12-JULY-2017)
//
	recipes.remove(<quark:iron_plate:0>); 	// conflicts with <techreborn:iron_furnace:0>

	// Orig recipe was 8 iron ingots -> 24 plate (3 plates per ingot)
	// Adding bucket adds 3 ingots (or 9 "plates" worth)
	// 24+9 = 33 and that's just a dumb number so I'm rounding down to a neat half-stack of 32

	recipes.addShapedMirrored("quarkdecorfixiron", <quark:iron_plate:0>*32,
		[[<ore:ingotIron>, <ore:ingotIron>, <ore:ingotIron>],
		 [<ore:ingotIron>, <minecraft:bucket>, <ore:ingotIron>],
		 [<ore:ingotIron>, <ore:ingotIron>, <ore:ingotIron>]]
	);




//====== Charcoal / Graphite ======
// - Conflicts with tiny charcoal
//--Ord (12-JULY-2017)
//

	recipes.remove(<actuallyadditions:block_misc:5>);	// conflicts with <chisel:block_charcoal2:1>

//====== Tech Reborn / Machine Frame ======
// - Conflicts with IC2 machines
//--Ord (7-AUGUST-2017)
//

	recipes.remove(<techreborn:machine_frame>);	

//======= Crafting Table isnt oredict ============
// remove and create a new one
// Oz 10-8-17

	recipes.remove(<minecraft:crafting_table>);
	recipes.addShaped("newcraftingtable", <minecraft:crafting_table>,
	[[<ore:plankWood>, <ore:plankWood>],
	[<ore:plankWood>, <ore:plankWood>]]
	);


