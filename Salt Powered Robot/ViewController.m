//
//  ViewController.m
//  Salt Powered Robot
//
//  Created by Garrett Mulroney on 5/19/17.
//  Copyright © 2017 Garrett Mulroney. All rights reserved.
//

#import "ViewController.h"
#import "AudioLabel.h"
#import "AudioCell.h"

@interface ViewController ()

@end

@implementation ViewController {
    IBOutlet UICollectionView* audioCollection;
    NSArray* audios;
    NSArray* favorites;
    NSArray* objects;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    audios = @[
               [AudioLabel audioLabelWithTitle:@"40k" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"a40k" ofType:@"wav"]] favorited:[[defaults objectForKey:@"a40k"] boolValue] objectId:@"a40k"],
               [AudioLabel audioLabelWithTitle:@"I'll shit on you" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"a247365" ofType:@"wav"]] favorited:[[defaults objectForKey:@"a247365"] boolValue] objectId:@"a247365"],
               [AudioLabel audioLabelWithTitle:@"Admit it's broken" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"admititsbroken" ofType:@"wav"]] favorited:[[defaults objectForKey:@"admititsbroken"] boolValue] objectId:@"admititsbroken"],
               [AudioLabel audioLabelWithTitle:@"All Bitch Asses" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"allbitchasses" ofType:@"wav"]] favorited:[[defaults objectForKey:@"allbitchasses"] boolValue] objectId:@"allbitchasses"],
               [AudioLabel audioLabelWithTitle:@"Fuck Shit" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"allfuckshit" ofType:@"wav"]] favorited:[[defaults objectForKey:@"allfuckshit"] boolValue] objectId:@"allfuckshit"],
               [AudioLabel audioLabelWithTitle:@"And honestly" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"andhonestly" ofType:@"wav"]] favorited:[[defaults objectForKey:@"andhonestly"] boolValue] objectId:@"andhonestly"],
               [AudioLabel audioLabelWithTitle:@"Answer that" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"answerthat" ofType:@"wav"]] favorited:[[defaults objectForKey:@"answerthat"] boolValue] objectId:@"answerthat"],
               [AudioLabel audioLabelWithTitle:@"Anthony" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"anthony" ofType:@"wav"]] favorited:[[defaults objectForKey:@"anthony"] boolValue] objectId:@"anthony"],
               [AudioLabel audioLabelWithTitle:@"Armada" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"armada" ofType:@"wav"]] favorited:[[defaults objectForKey:@"armada"] boolValue] objectId:@"armada"],
               [AudioLabel audioLabelWithTitle:@"Attack Wing" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"atackwing" ofType:@"wav"]] favorited:[[defaults objectForKey:@"atackwing"] boolValue] objectId:@"atackwing"],
               [AudioLabel audioLabelWithTitle:@"Because I focus" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"becauseifocus" ofType:@"wav"]] favorited:[[defaults objectForKey:@"becauseifocus"] boolValue] objectId:@"becauseifocus"],
               [AudioLabel audioLabelWithTitle:@"Because of my opinions" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"becauseofmyopinions" ofType:@"wav"]] favorited:[[defaults objectForKey:@"becauseofmyopinions"] boolValue] objectId:@"becauseofmyopinions"],
               [AudioLabel audioLabelWithTitle:@"Been a while" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"beenawhile" ofType:@"wav"]] favorited:[[defaults objectForKey:@"beenawhile"] boolValue] objectId:@"beenawhile"],
               [AudioLabel audioLabelWithTitle:@"Being Angry" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"beingangry" ofType:@"wav"]] favorited:[[defaults objectForKey:@"beingangry"] boolValue] objectId:@"beingangry"],
               [AudioLabel audioLabelWithTitle:@"Be men about it" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"bemenaboutit" ofType:@"wav"]] favorited:[[defaults objectForKey:@"bemenaboutit"] boolValue] objectId:@"bemenaboutit"],
               [AudioLabel audioLabelWithTitle:@"Best Imperial Guard" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"bestimperialguard" ofType:@"wav"]] favorited:[[defaults objectForKey:@"bestimperialguard"] boolValue] objectId:@"bestimperialguard"],
               [AudioLabel audioLabelWithTitle:@"Bitch Ass" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"bitchass" ofType:@"wav"]] favorited:[[defaults objectForKey:@"bitchass"] boolValue] objectId:@"bitchass"],
               [AudioLabel audioLabelWithTitle:@"Blocks of peasants" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"blocksofpeasants" ofType:@"wav"]] favorited:[[defaults objectForKey:@"blocksofpeasants"] boolValue] objectId:@"blocksofpeasants"],
               [AudioLabel audioLabelWithTitle:@"Calm the fuck down" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"calmthefuckdown" ofType:@"wav"]] favorited:[[defaults objectForKey:@"calmthefuckdown"] boolValue] objectId:@"calmthefuckdown"],
               [AudioLabel audioLabelWithTitle:@"Cannot win" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"cannotwin" ofType:@"wav"]] favorited:[[defaults objectForKey:@"cannotwin"] boolValue] objectId:@"cannotwin"],
               [AudioLabel audioLabelWithTitle:@"Chill the fuck out" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"chillthefuckout" ofType:@"wav"]] favorited:[[defaults objectForKey:@"chillthefuckout"] boolValue] objectId:@"chillthefuckout"],
               [AudioLabel audioLabelWithTitle:@"Clearly" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"clearly" ofType:@"wav"]] favorited:[[defaults objectForKey:@"clearly"] boolValue] objectId:@"clearly"],
               [AudioLabel audioLabelWithTitle:@"Come after broke MF" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"comeafterabrokemf" ofType:@"wav"]] favorited:[[defaults objectForKey:@"comeafterabrokemf"] boolValue] objectId:@"comeafterabrokemf"],
               [AudioLabel audioLabelWithTitle:@"Congradulations" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"congradulations" ofType:@"wav"]] favorited:[[defaults objectForKey:@"congradulations"] boolValue] objectId:@"congradulations"],
               [AudioLabel audioLabelWithTitle:@"Didn't count" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"didntcount" ofType:@"wav"]] favorited:[[defaults objectForKey:@"didntcount"] boolValue] objectId:@"didntcount"],
               [AudioLabel audioLabelWithTitle:@"Don't have a problem" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"donthaveaproblem" ofType:@"wav"]] favorited:[[defaults objectForKey:@"donthaveaproblem"] boolValue] objectId:@"donthaveaproblem"],
               [AudioLabel audioLabelWithTitle:@"Drop pods" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"droppods" ofType:@"wav"]] favorited:[[defaults objectForKey:@"droppods"] boolValue] objectId:@"droppods"],
               [AudioLabel audioLabelWithTitle:@"Dumb Mechanic" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"dumbfuckingmechanic" ofType:@"wav"]] favorited:[[defaults objectForKey:@"dumbfuckingmechanic"] boolValue] objectId:@"dumbfuckingmechanic"],
               [AudioLabel audioLabelWithTitle:@"Every List" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"everyplayereverylist" ofType:@"wav"]] favorited:[[defaults objectForKey:@"everyplayereverylist"] boolValue] objectId:@"everyplayereverylist"],
               [AudioLabel audioLabelWithTitle:@"Every Wednesday" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"everywednesday" ofType:@"wav"]] favorited:[[defaults objectForKey:@"everywednesday"] boolValue] objectId:@"everywednesday"],
               [AudioLabel audioLabelWithTitle:@"Excuse" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"excuse" ofType:@"wav"]] favorited:[[defaults objectForKey:@"excuse"] boolValue] objectId:@"excuse"],
               [AudioLabel audioLabelWithTitle:@"Faction Loyal" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"factionloyal" ofType:@"wav"]] favorited:[[defaults objectForKey:@"factionloyal"] boolValue] objectId:@"factionloyal"],
               [AudioLabel audioLabelWithTitle:@"Failed Leadership" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"failedaleadershipcheck" ofType:@"wav"]] favorited:[[defaults objectForKey:@"failedaleadershipcheck"] boolValue] objectId:@"failedaleadershipcheck"],
               [AudioLabel audioLabelWithTitle:@"Fantasy" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"fantasy" ofType:@"wav"]] favorited:[[defaults objectForKey:@"fantasy"] boolValue] objectId:@"fantasy"],
               [AudioLabel audioLabelWithTitle:@"Few people have done that" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"fewpeoplehavedonethat" ofType:@"wav"]] favorited:[[defaults objectForKey:@"fewpeoplehavedonethat"] boolValue] objectId:@"fewpeoplehavedonethat"],
               [AudioLabel audioLabelWithTitle:@"Fluff" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"fluff" ofType:@"wav"]] favorited:[[defaults objectForKey:@"fluff"] boolValue] objectId:@"fluff"],
               [AudioLabel audioLabelWithTitle:@"Fortifications" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"fortifications" ofType:@"wav"]] favorited:[[defaults objectForKey:@"fortifications"] boolValue] objectId:@"fortifications"],
               [AudioLabel audioLabelWithTitle:@"Hobbit" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"fuckinghobbit" ofType:@"wav"]] favorited:[[defaults objectForKey:@"fuckinghobbit"] boolValue] objectId:@"fuckinghobbit"],
               [AudioLabel audioLabelWithTitle:@"Moron" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"fuckingmoron" ofType:@"wav"]] favorited:[[defaults objectForKey:@"fuckingmoron"] boolValue] objectId:@"fuckingmoron"],
               [AudioLabel audioLabelWithTitle:@"Murder you" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"fuckingmurderedyou" ofType:@"wav"]] favorited:[[defaults objectForKey:@"fuckingmurderedyou"] boolValue] objectId:@"fuckingmurderedyou"],
               [AudioLabel audioLabelWithTitle:@"Stupid" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"fuckingstupid" ofType:@"wav"]] favorited:[[defaults objectForKey:@"fuckingstupid"] boolValue] objectId:@"fuckingstupid"],
               [AudioLabel audioLabelWithTitle:@"Fuck off" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"fuckoff" ofType:@"wav"]] favorited:[[defaults objectForKey:@"fuckoff"] boolValue] objectId:@"fuckoff"],
               [AudioLabel audioLabelWithTitle:@"Fuck off 2" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"fuckoff2" ofType:@"wav"]] favorited:[[defaults objectForKey:@"fuckoff2"] boolValue] objectId:@"fuckoff2"],
               [AudioLabel audioLabelWithTitle:@"Fuck shit" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"fuckshit" ofType:@"wav"]] favorited:[[defaults objectForKey:@"fuckshit"] boolValue] objectId:@"fuckshit"],
               [AudioLabel audioLabelWithTitle:@"Fuck you" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"fuckyou" ofType:@"wav"]] favorited:[[defaults objectForKey:@"fuckyou"] boolValue] objectId:@"fuckyou"],
               [AudioLabel audioLabelWithTitle:@"Fuck you 2" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"fuckyou3" ofType:@"wav"]] favorited:[[defaults objectForKey:@"fuckyou3"] boolValue] objectId:@"fuckyou3"],
               [AudioLabel audioLabelWithTitle:@"Fuck you 3" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"fuckyou4" ofType:@"wav"]] favorited:[[defaults objectForKey:@"fuckyou4"] boolValue] objectId:@"fuckyou4"],
               [AudioLabel audioLabelWithTitle:@"Know if" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"fukingknowit" ofType:@"wav"]] favorited:[[defaults objectForKey:@"fukingknowit"] boolValue] objectId:@"fukingknowit"],
               [AudioLabel audioLabelWithTitle:@"Get it for real" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"getitforreal" ofType:@"wav"]] favorited:[[defaults objectForKey:@"getitforreal"] boolValue] objectId:@"getitforreal"],
               [AudioLabel audioLabelWithTitle:@"Give a fuck" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"giveafuck" ofType:@"wav"]] favorited:[[defaults objectForKey:@"giveafuck"] boolValue] objectId:@"giveafuck"],
               [AudioLabel audioLabelWithTitle:@"Have to be a bitch" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"havetobeabitch" ofType:@"wav"]] favorited:[[defaults objectForKey:@"havetobeabitch"] boolValue] objectId:@"havetobeabitch"],
               [AudioLabel audioLabelWithTitle:@"Have you ever won" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"haveyoueverwon" ofType:@"wav"]] favorited:[[defaults objectForKey:@"haveyoueverwon"] boolValue] objectId:@"haveyoueverwon"],
               [AudioLabel audioLabelWithTitle:@"Have you ever won 2" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"haveyoueverwonbest" ofType:@"wav"]] favorited:[[defaults objectForKey:@"haveyoueverwonbest"] boolValue] objectId:@"haveyoueverwonbest"],
               [AudioLabel audioLabelWithTitle:@"Heldrakes" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"helldrakesaregood" ofType:@"wav"]] favorited:[[defaults objectForKey:@"helldrakesaregood"] boolValue] objectId:@"helldrakesaregood"],
               [AudioLabel audioLabelWithTitle:@"How about we talk abou that" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"howboutwetalkaboutthat" ofType:@"wav"]] favorited:[[defaults objectForKey:@"howboutwetalkaboutthat"] boolValue] objectId:@"howboutwetalkaboutthat"],
               [AudioLabel audioLabelWithTitle:@"How I'm right" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"howiknowimright" ofType:@"wav"]] favorited:[[defaults objectForKey:@"howiknowimright"] boolValue] objectId:@"howiknowimright"],
               [AudioLabel audioLabelWithTitle:@"How the fuck" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"howthefuck" ofType:@"wav"]] favorited:[[defaults objectForKey:@"howthefuck"] boolValue] objectId:@"howthefuck"],
               [AudioLabel audioLabelWithTitle:@"Huhuhu" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"huhuhu" ofType:@"wav"]] favorited:[[defaults objectForKey:@"huhuhu"] boolValue] objectId:@"huhuhu"],
               [AudioLabel audioLabelWithTitle:@"Sitting down" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"iamsittingdown" ofType:@"wav"]] favorited:[[defaults objectForKey:@"iamsittingdown"] boolValue] objectId:@"iamsittingdown"],
               [AudioLabel audioLabelWithTitle:@"I don't Talk shit" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"idontalkshit" ofType:@"wav"]] favorited:[[defaults objectForKey:@"idontalkshit"] boolValue] objectId:@"idontalkshit"],
               [AudioLabel audioLabelWithTitle:@"I don't like it" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"idontlikeit" ofType:@"wav"]] favorited:[[defaults objectForKey:@"idontlikeit"] boolValue] objectId:@"idontlikeit"],
               [AudioLabel audioLabelWithTitle:@"If there's no fight" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"ifthereisnofight" ofType:@"wav"]] favorited:[[defaults objectForKey:@"ifthereisnofight"] boolValue] objectId:@"ifthereisnofight"],
               [AudioLabel audioLabelWithTitle:@"I have aGT win" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"ihaveagtwin" ofType:@"wav"]] favorited:[[defaults objectForKey:@"ihaveagtwin"] boolValue] objectId:@"ihaveagtwin"],
               [AudioLabel audioLabelWithTitle:@"I know more" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"iknowmore" ofType:@"wav"]] favorited:[[defaults objectForKey:@"iknowmore"] boolValue] objectId:@"iknowmore"],
               [AudioLabel audioLabelWithTitle:@"I know more 2" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"iknowmore2" ofType:@"wav"]] favorited:[[defaults objectForKey:@"iknowmore2"] boolValue] objectId:@"iknowmore2"],
               [AudioLabel audioLabelWithTitle:@"I know what it's like to win" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"iknowwhatitsliketowin" ofType:@"wav"]] favorited:[[defaults objectForKey:@"iknowwhatitsliketowin"] boolValue] objectId:@"iknowwhatitsliketowin"],
               [AudioLabel audioLabelWithTitle:@"I'm fine" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"imfine" ofType:@"wav"]] favorited:[[defaults objectForKey:@"imfine"] boolValue] objectId:@"imfine"],
               [AudioLabel audioLabelWithTitle:@"I'm sure" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"imsure" ofType:@"wav"]] favorited:[[defaults objectForKey:@"imsure"] boolValue] objectId:@"imsure"],
               [AudioLabel audioLabelWithTitle:@"In my eyes" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"inmyeyes" ofType:@"wav"]] favorited:[[defaults objectForKey:@"inmyeyes"] boolValue] objectId:@"inmyeyes"],
               [AudioLabel audioLabelWithTitle:@"I think you're wrong" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"ithinkyouarewrong" ofType:@"wav"]] favorited:[[defaults objectForKey:@"ithinkyouarewrong"] boolValue] objectId:@"ithinkyouarewrong"],
               [AudioLabel audioLabelWithTitle:@"It's not a question for me" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"itsnotaquestionforme" ofType:@"wav"]] favorited:[[defaults objectForKey:@"itsnotaquestionforme"] boolValue] objectId:@"itsnotaquestionforme"],
               [AudioLabel audioLabelWithTitle:@"6th Ed" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"itwas6thed" ofType:@"wav"]] favorited:[[defaults objectForKey:@"itwas6thed"] boolValue] objectId:@"itwas6thed"],
               [AudioLabel audioLabelWithTitle:@"I won" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"iwon" ofType:@"wav"]] favorited:[[defaults objectForKey:@"iwon"] boolValue] objectId:@"iwon"],
               [AudioLabel audioLabelWithTitle:@"Just checking" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"justchecking" ofType:@"wav"]] favorited:[[defaults objectForKey:@"justchecking"] boolValue] objectId:@"justchecking"],
               [AudioLabel audioLabelWithTitle:@"Just one" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"justone" ofType:@"wav"]] favorited:[[defaults objectForKey:@"justone"] boolValue] objectId:@"justone"],
               [AudioLabel audioLabelWithTitle:@"Keep it to facts" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"keepittofacts" ofType:@"wav"]] favorited:[[defaults objectForKey:@"keepittofacts"] boolValue] objectId:@"keepittofacts"],
               [AudioLabel audioLabelWithTitle:@"Last time we played" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"lasttimeweplayed" ofType:@"wav"]] favorited:[[defaults objectForKey:@"lasttimeweplayed"] boolValue] objectId:@"lasttimeweplayed"],
               [AudioLabel audioLabelWithTitle:@"Legend never dies" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"legendneverdies" ofType:@"wav"]] favorited:[[defaults objectForKey:@"legendneverdies"] boolValue] objectId:@"legendneverdies"],
               [AudioLabel audioLabelWithTitle:@"Like your argument" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"likeyourargument" ofType:@"wav"]] favorited:[[defaults objectForKey:@"likeyourargument"] boolValue] objectId:@"likeyourargument"],
               [AudioLabel audioLabelWithTitle:@"Literally nobody" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"literallynobody" ofType:@"wav"]] favorited:[[defaults objectForKey:@"literallynobody"] boolValue] objectId:@"literallynobody"],
               [AudioLabel audioLabelWithTitle:@"Loser for me" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"loserforme" ofType:@"wav"]] favorited:[[defaults objectForKey:@"loserforme"] boolValue] objectId:@"loserforme"],
               [AudioLabel audioLabelWithTitle:@"Makes you a fuck boi" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"makesyouafuckboi" ofType:@"wav"]] favorited:[[defaults objectForKey:@"makesyouafuckboi"] boolValue] objectId:@"makesyouafuckboi"],
               [AudioLabel audioLabelWithTitle:@"Making bullshit up" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"makingbullshitup" ofType:@"wav"]] favorited:[[defaults objectForKey:@"makingbullshitup"] boolValue] objectId:@"makingbullshitup"],
               [AudioLabel audioLabelWithTitle:@"Mordhiem" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"mordhiem" ofType:@"wav"]] favorited:[[defaults objectForKey:@"mordhiem"] boolValue] objectId:@"mordhiem"],
               [AudioLabel audioLabelWithTitle:@"More than one" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"a40k" ofType:@"wav"]] favorited:[[defaults objectForKey:@"morethanone"] boolValue] objectId:@"morethanone"],
               [AudioLabel audioLabelWithTitle:@"Name them" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"namethem" ofType:@"wav"]] favorited:[[defaults objectForKey:@"namethem"] boolValue] objectId:@"namethem"],
               [AudioLabel audioLabelWithTitle:@"Necromunda" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"necromunda" ofType:@"wav"]] favorited:[[defaults objectForKey:@"necromunda"] boolValue] objectId:@"necromunda"],
               [AudioLabel audioLabelWithTitle:@"Netlists" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"netlists" ofType:@"wav"]] favorited:[[defaults objectForKey:@"netlists"] boolValue] objectId:@"netlists"],
               [AudioLabel audioLabelWithTitle:@"Never once seen it" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"neveronceseenit" ofType:@"wav"]] favorited:[[defaults objectForKey:@"neveronceseenit"] boolValue] objectId:@"neveronceseenit"],
               [AudioLabel audioLabelWithTitle:@"None of them are any better" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"noneareanybetter" ofType:@"wav"]] favorited:[[defaults objectForKey:@"noneareanybetter"] boolValue] objectId:@"noneareanybetter"],
               [AudioLabel audioLabelWithTitle:@"Nonononono" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"nononono" ofType:@"wav"]] favorited:[[defaults objectForKey:@"nononono"] boolValue] objectId:@"nononono"],
               [AudioLabel audioLabelWithTitle:@"No null deploy in warmachine" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"nonulldeployinwarmachine" ofType:@"wav"]] favorited:[[defaults objectForKey:@"nonulldeployinwarmachine"] boolValue] objectId:@"nonulldeployinwarmachine"],
               [AudioLabel audioLabelWithTitle:@"No one ever run that" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"nooneeverthanthat" ofType:@"wav"]] favorited:[[defaults objectForKey:@"nooneeverthanthat"] boolValue] objectId:@"nooneeverthanthat"],
               [AudioLabel audioLabelWithTitle:@"Not better than you" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"notbetterthanyou" ofType:@"wav"]] favorited:[[defaults objectForKey:@"notbetterthanyou"] boolValue] objectId:@"notbetterthanyou"],
               [AudioLabel audioLabelWithTitle:@"Not good enough to win" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"notgoodenoughtowin" ofType:@"wav"]] favorited:[[defaults objectForKey:@"notgoodenoughtowin"] boolValue] objectId:@"notgoodenoughtowin"],
               [AudioLabel audioLabelWithTitle:@"No they weren't" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"notheyfuckingwerent" ofType:@"wav"]] favorited:[[defaults objectForKey:@"notheyfuckingwerent"] boolValue] objectId:@"notheyfuckingwerent"],
               [AudioLabel audioLabelWithTitle:@"Nothing to do" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"nothingtodo" ofType:@"wav"]] favorited:[[defaults objectForKey:@"nothingtodo"] boolValue] objectId:@"nothingtodo"],
               [AudioLabel audioLabelWithTitle:@"Not one single other" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"notonesingleother" ofType:@"wav"]] favorited:[[defaults objectForKey:@"notonesingleother"] boolValue] objectId:@"notonesingleother"],
               [AudioLabel audioLabelWithTitle:@"Not wrong" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"notwrong" ofType:@"wav"]] favorited:[[defaults objectForKey:@"notwrong"] boolValue] objectId:@"notwrong"],
               [AudioLabel audioLabelWithTitle:@"Only way he can win" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"onlywayhecanwingames" ofType:@"wav"]] favorited:[[defaults objectForKey:@"onlywayhecanwingames"] boolValue] objectId:@"onlywayhecanwingames"],
               [AudioLabel audioLabelWithTitle:@"Overpowered" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"overpowered" ofType:@"wav"]] favorited:[[defaults objectForKey:@"overpowered"] boolValue] objectId:@"overpowered"],
               [AudioLabel audioLabelWithTitle:@"Overpowered 2" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"overpowered2" ofType:@"wav"]] favorited:[[defaults objectForKey:@"overpowered2"] boolValue] objectId:@"overpowered2"],
               [AudioLabel audioLabelWithTitle:@"Overpowered shit" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"overpoweredshit" ofType:@"wav"]] favorited:[[defaults objectForKey:@"overpoweredshit"] boolValue] objectId:@"overpoweredshit"],
               [AudioLabel audioLabelWithTitle:@"Own a ps4" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"ownaps4" ofType:@"wav"]] favorited:[[defaults objectForKey:@"ownaps4"] boolValue] objectId:@"ownaps4"],
               [AudioLabel audioLabelWithTitle:@"Paul" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"paul" ofType:@"wav"]] favorited:[[defaults objectForKey:@"paul"] boolValue] objectId:@"paul"],
               [AudioLabel audioLabelWithTitle:@"Pick your battles" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"paul" ofType:@"wav"]] favorited:[[defaults objectForKey:@"paul"] boolValue] objectId:@"paul"],
               [AudioLabel audioLabelWithTitle:@"Play drop pods" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"playdroppods" ofType:@"wav"]] favorited:[[defaults objectForKey:@"playdroppods"] boolValue] objectId:@"playdroppods"],
               [AudioLabel audioLabelWithTitle:@"Play fantasy" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"playfantasy" ofType:@"wav"]] favorited:[[defaults objectForKey:@"playfantasy"] boolValue] objectId:@"playfantasy"],
               [AudioLabel audioLabelWithTitle:@"Playing Empire" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"playingempire" ofType:@"wav"]] favorited:[[defaults objectForKey:@"playingempire"] boolValue] objectId:@"playingempire"],
               [AudioLabel audioLabelWithTitle:@"Playing wolfstar" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"playingwolfstar" ofType:@"wav"]] favorited:[[defaults objectForKey:@"playingwolfstar"] boolValue] objectId:@"playingwolfstar"],
               [AudioLabel audioLabelWithTitle:@"Play tau" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"playtau" ofType:@"wav"]] favorited:[[defaults objectForKey:@"playtau"] boolValue] objectId:@"playtau"],
               [AudioLabel audioLabelWithTitle:@"Prove me wrong" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"provemewrong" ofType:@"wav"]] favorited:[[defaults objectForKey:@"provemewrong"] boolValue] objectId:@"provemewrong"],
               [AudioLabel audioLabelWithTitle:@"Real fucking special" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"realfuckingspecial" ofType:@"wav"]] favorited:[[defaults objectForKey:@"realfuckingspecial"] boolValue] objectId:@"realfuckingspecial"],
               [AudioLabel audioLabelWithTitle:@"Real are scrubs" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"reallyarescrub" ofType:@"wav"]] favorited:[[defaults objectForKey:@"reallyarescrub"] boolValue] objectId:@"reallyarescrub"],
               [AudioLabel audioLabelWithTitle:@"Real quick" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"realquick" ofType:@"wav"]] favorited:[[defaults objectForKey:@"realquick"] boolValue] objectId:@"realquick"],
               [AudioLabel audioLabelWithTitle:@"RT win" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"rtwin" ofType:@"wav"]] favorited:[[defaults objectForKey:@"rtwin"] boolValue] objectId:@"rtwin"],
               [AudioLabel audioLabelWithTitle:@"Running" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"running" ofType:@"wav"]] favorited:[[defaults objectForKey:@"running"] boolValue] objectId:@"running"],
               [AudioLabel audioLabelWithTitle:@"Said 5 times" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"saidit5times" ofType:@"wav"]] favorited:[[defaults objectForKey:@"saidit5times"] boolValue] objectId:@"saidit5times"],
               [AudioLabel audioLabelWithTitle:@"Salt is a part of my life" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"saltisapartofmylife" ofType:@"wav"]] favorited:[[defaults objectForKey:@"saltisapartofmylife"] boolValue] objectId:@"saltisapartofmylife"],
               [AudioLabel audioLabelWithTitle:@"Shitty little army" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"shittylittlearmy" ofType:@"wav"]] favorited:[[defaults objectForKey:@"shittylittlearmy"] boolValue] objectId:@"shittylittlearmy"],
               [AudioLabel audioLabelWithTitle:@"Shut up" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"shutthefuckup" ofType:@"wav"]] favorited:[[defaults objectForKey:@"shutthefuckup"] boolValue] objectId:@"shutthefuckup"],
               [AudioLabel audioLabelWithTitle:@"Shut up 2" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"shutthefuckup2" ofType:@"wav"]] favorited:[[defaults objectForKey:@"shutthefuckup2"] boolValue] objectId:@"shutthefuckup2"],
               [AudioLabel audioLabelWithTitle:@"So I choose not to" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"soichoosenotto" ofType:@"wav"]] favorited:[[defaults objectForKey:@"soichoosenotto"] boolValue] objectId:@"soichoosenotto"],
               [AudioLabel audioLabelWithTitle:@"So ok" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"sook" ofType:@"wav"]] favorited:[[defaults objectForKey:@"sook"] boolValue] objectId:@"sook"],
               [AudioLabel audioLabelWithTitle:@"Supposed to be impresive" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"supposedtobeimpressive" ofType:@"wav"]] favorited:[[defaults objectForKey:@"supposedtobeimpressive"] boolValue] objectId:@"supposedtobeimpressive"],
               [AudioLabel audioLabelWithTitle:@"Sure you're happy" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"sureyourerealhappy" ofType:@"wav"]] favorited:[[defaults objectForKey:@"sureyourerealhappy"] boolValue] objectId:@"sureyourerealhappy"],
               [AudioLabel audioLabelWithTitle:@"Talking shit" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"talkingshit" ofType:@"wav"]] favorited:[[defaults objectForKey:@"talkingshit"] boolValue] objectId:@"talkingshit"],
               [AudioLabel audioLabelWithTitle:@"Talking shit about bald people" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"talkingshitabouttallpeople" ofType:@"wav"]] favorited:[[defaults objectForKey:@"talkingshitabouttallpeople"] boolValue] objectId:@"talkingshitabouttallpeople"],
               [AudioLabel audioLabelWithTitle:@"Tell me why" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"tellmewhy" ofType:@"wav"]] favorited:[[defaults objectForKey:@"tellmewhy"] boolValue] objectId:@"tellmewhy"],
               [AudioLabel audioLabelWithTitle:@"Tell the world" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"telltheworld" ofType:@"wav"]] favorited:[[defaults objectForKey:@"telltheworld"] boolValue] objectId:@"telltheworld"],
               [AudioLabel audioLabelWithTitle:@"Tempestus Scions" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"tempestusscions" ofType:@"wav"]] favorited:[[defaults objectForKey:@"tempestusscions"] boolValue] objectId:@"tempestusscions"],
               [AudioLabel audioLabelWithTitle:@"Terrain pieces" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"terianpieces" ofType:@"wav"]] favorited:[[defaults objectForKey:@"terianpieces"] boolValue] objectId:@"terianpieces"],
               [AudioLabel audioLabelWithTitle:@"Basic Login" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"thatsbasiclogic" ofType:@"wav"]] favorited:[[defaults objectForKey:@"thatsbasiclogic"] boolValue] objectId:@"thatsbasiclogic"],
               [AudioLabel audioLabelWithTitle:@"Just fucking wrong" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"thatsjustfuckingwrong" ofType:@"wav"]] favorited:[[defaults objectForKey:@"thatsjustfuckingwrong"] boolValue] objectId:@"thatsjustfuckingwrong"],
               [AudioLabel audioLabelWithTitle:@"Not Defeat" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"thatsnotdefeat" ofType:@"wav"]] favorited:[[defaults objectForKey:@"thatsnotdefeat"] boolValue] objectId:@"thatsnotdefeat"],
               [AudioLabel audioLabelWithTitle:@"That's what you're saying" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"thatwhatyouresaying" ofType:@"wav"]] favorited:[[defaults objectForKey:@"thatwhatyouresaying"] boolValue] objectId:@"thatwhatyouresaying"],
               [AudioLabel audioLabelWithTitle:@"They never did it" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"theyneverdidit" ofType:@"wav"]] favorited:[[defaults objectForKey:@"theyneverdidit"] boolValue] objectId:@"theyneverdidit"],
               [AudioLabel audioLabelWithTitle:@"Things you're not familiar" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"thingsyournotfamiliar" ofType:@"wav"]] favorited:[[defaults objectForKey:@"thingsyournotfamiliar"] boolValue] objectId:@"thingsyournotfamiliar"],
               [AudioLabel audioLabelWithTitle:@"Throw some names" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"thowsomenamesout" ofType:@"wav"]] favorited:[[defaults objectForKey:@"thowsomenamesout"] boolValue] objectId:@"thowsomenamesout"],
               [AudioLabel audioLabelWithTitle:@"Underpowered" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"underpowered" ofType:@"wav"]] favorited:[[defaults objectForKey:@"underpowered"] boolValue] objectId:@"underpowered"],
               [AudioLabel audioLabelWithTitle:@"Wasn't gunna go there" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"wasntgonnagothere" ofType:@"wav"]] favorited:[[defaults objectForKey:@"wasntgonnagothere"] boolValue] objectId:@"wasntgonnagothere"],
               [AudioLabel audioLabelWithTitle:@"Watch other people win" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"watchingotherpeoplewin" ofType:@"wav"]] favorited:[[defaults objectForKey:@"watchingotherpeoplewin"] boolValue] objectId:@"watchingotherpeoplewin"],
               [AudioLabel audioLabelWithTitle:@"Well uhhh" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"welluhhhhhhhh" ofType:@"wav"]] favorited:[[defaults objectForKey:@"welluhhhhhhhh"] boolValue] objectId:@"welluhhhhhhhh"],
               [AudioLabel audioLabelWithTitle:@"We tied" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"wetied" ofType:@"wav"]] favorited:[[defaults objectForKey:@"wetied"] boolValue] objectId:@"wetied"],
               [AudioLabel audioLabelWithTitle:@"What argument" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"whatargument" ofType:@"wav"]] favorited:[[defaults objectForKey:@"whatargument"] boolValue] objectId:@"whatargument"],
               [AudioLabel audioLabelWithTitle:@"What faction" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"whatfaction" ofType:@"wav"]] favorited:[[defaults objectForKey:@"whatfaction"] boolValue] objectId:@"whatfaction"],
               [AudioLabel audioLabelWithTitle:@"What list" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"whatlist" ofType:@"wav"]] favorited:[[defaults objectForKey:@"whatlist"] boolValue] objectId:@"whatlist"],
               [AudioLabel audioLabelWithTitle:@"What's it like from the bottom" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"whatsitlikefromthebottom" ofType:@"wav"]] favorited:[[defaults objectForKey:@"whatsitlikefromthebottom"] boolValue] objectId:@"whatsitlikefromthebottom"],
               [AudioLabel audioLabelWithTitle:@"Where did you end up" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"wheredidyouendupontables" ofType:@"wav"]] favorited:[[defaults objectForKey:@"wheredidyouendupontables"] boolValue] objectId:@"wheredidyouendupontables"],
               [AudioLabel audioLabelWithTitle:@"Where is has existed" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"whereithaseverexisted" ofType:@"wav"]] favorited:[[defaults objectForKey:@"whereithaseverexisted"] boolValue] objectId:@"whereithaseverexisted"],
               [AudioLabel audioLabelWithTitle:@"Which ones" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"whichones" ofType:@"wav"]] favorited:[[defaults objectForKey:@"whichones"] boolValue] objectId:@"whichones"],
               [AudioLabel audioLabelWithTitle:@"With tanks" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"withtanks" ofType:@"wav"]] favorited:[[defaults objectForKey:@"withtanks"] boolValue] objectId:@"withtanks"],
               [AudioLabel audioLabelWithTitle:@"Xwing" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"xwing" ofType:@"wav"]] favorited:[[defaults objectForKey:@"xwing"] boolValue] objectId:@"xwing"],
               [AudioLabel audioLabelWithTitle:@"Yaya sure sure" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"yayasuresure" ofType:@"wav"]] favorited:[[defaults objectForKey:@"yayasuresure"] boolValue] objectId:@"yayasuresure"],
               [AudioLabel audioLabelWithTitle:@"You choose not to play" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"youchoosenottoplayit" ofType:@"wav"]] favorited:[[defaults objectForKey:@"youchoosenottoplayit"] boolValue] objectId:@"youchoosenottoplayit"],
               [AudioLabel audioLabelWithTitle:@"You have failed" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"youhavefailed" ofType:@"wav"]] favorited:[[defaults objectForKey:@"youhavefailed"] boolValue] objectId:@"youhavefailed"],
               [AudioLabel audioLabelWithTitle:@"You moron" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"youmoron" ofType:@"wav"]] favorited:[[defaults objectForKey:@"youmoron"] boolValue] objectId:@"youmoron"],
               [AudioLabel audioLabelWithTitle:@"You're a pussy" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"youreafuckingpussy" ofType:@"wav"]] favorited:[[defaults objectForKey:@"youreafuckingpussy"] boolValue] objectId:@"youreafuckingpussy"],
               [AudioLabel audioLabelWithTitle:@"Your special deathstar" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"yourspecialdeathstar" ofType:@"wav"]] favorited:[[defaults objectForKey:@"yourspecialdeathstar"] boolValue] objectId:@"yourspecialdeathstar"],
               [AudioLabel audioLabelWithTitle:@"You sure about that" path:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"yousureaboutthat" ofType:@"wav"]] favorited:[[defaults objectForKey:@"yousureaboutthat"] boolValue] objectId:@"yousureaboutthat"]
               ];
    objects = [audios copy];
    [audioCollection reloadData];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [objects count];
}

- (UICollectionViewCell*)collectionView:(UICollectionView*)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    AudioCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"audioCell" forIndexPath:indexPath];
    [cell setAudioLabel:objects[indexPath.item]];
    return cell;
}

- (IBAction)toggleFavorites:(id)sender {
    if ([sender isOn]) {
        NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
        NSMutableArray* temp = [@[] mutableCopy];
        for (AudioLabel* a in audios) {
            if ([[defaults objectForKey:a.objectId] boolValue]) {
                [temp addObject:a];
            }
        }
        objects = [NSArray arrayWithArray:temp];
    } else {
        objects = [audios copy];
    }
    [audioCollection reloadData];
}

@end
