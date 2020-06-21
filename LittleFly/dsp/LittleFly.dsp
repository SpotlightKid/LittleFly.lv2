

/*******************************************************************************
**************************** File generated by *********************************
********************************************************************************
 ./build-plug.py -i LittleFly.sch -T --table_neg 1 -N -n LittleFly --build
*******************************************************************************/

// generated automatically
// DO NOT MODIFY!
declare id "littlefly";
declare name "LittleFly";
declare category "Extern";
declare shortname "LittleFly";
declare description "Overdrive Pedal";

import("stdfaust.lib");

/*******************************************************************************
  * 1-dimensional function table for linear interpolation
*******************************************************************************/
rd = library("reducemaps.lib");

//-- Rdtable from waveform
rtable(table, r) = (table, int(r)):rdtable;

//-- Copy the sign of x to f
ccopysign(f, x) = ma.fabs(f) * sign(x);

//-- Get sign of value x
sign(x) = x<0, 1, -1 : select2;

//-- Check if value x is negative
fsignbit(x) = x<0;

//-- Get fractal part of value n
fractal(n) = n - int(n);

//-- Interpolate value between i and i+1 in table with fractal coefficient f.
interpolation(table, size, f, i) = select2(i<0,select2(i>size-2,
    rtable(table, i)*(1-f) + rtable(table,i+1)*f, rtable(table, size-1)),
    rtable(table, 0)) : table_gate(table);

//-- reduce dc-offset (noise) from table response for very low values
table_gate(table,x) = select2(ma.fabs(x):rd.maxn(4096)<ma.fabs(rtable(table, 1))*(0.12), x, x*x*x);

//-- Linear interpolation for value x in rdtable
circuit_response(table, low, high, step, size, x) =
    interpolation(table, size, fractal(linindex(step, x)),
    int(linindex(step, x))), x : ccopysign;

//-- Calculate linear table index for value x
linindex(step, x) = ma.fabs(x) * step;

//-- predefined filterbank 
freq_split = fi.filterbank(3, (86.0,210.0,1200.0,6531.0));


/****************************************************************************************
* littlefly_table generated by DK/circ_table_gen.py -- do not modify manually
****************************************************************************************/

 // variables used
 // --sig_max  1.400000
 // --table_div  1.000000
 // --table_op  1.000000

littlefly_clip = circuit_response(littlefly_table, low, high, step, size) with{

    low = 0;
    high =0.204782;
    step =142.143;
    size =200;

    littlefly_table = waveform {
    0.000000000000,0.001897054068,0.007017360151,0.013671863929,0.020536805597,
    0.027279298487,0.033776527970,0.040037354753,0.046070324603,0.051883678996,
    0.057485365493,0.062883047817,0.068084115629,0.073095694000,0.077924652598,
    0.082577614579,0.087060965201,0.091380860157,0.095543233636,0.099553806126,
    0.103418091952,0.107141406567,0.110728873598,0.114185431654,0.117515840899,
    0.120724689413,0.123816399318,0.126795232712,0.129665297381,0.132430552324,
    0.135094813088,0.137661756902,0.140134927653,0.142517740668,0.144813487342,
    0.147025339594,0.149156354173,0.151209476806,0.153187546204,0.155093297919,
    0.156929368074,0.158698296953,0.160402532463,0.162044433477,0.163626273056,
    0.165150241550,0.166618449601,0.168032931023,0.169395645592,0.170708481727,
    0.171973259076,0.173191731017,0.174365587059,0.175496455158,0.176585903957,
    0.177635444939,0.178646534501,0.179620575959,0.180558921474,0.181462873917,
    0.182333688654,0.183172575282,0.183980699287,0.184759183653,0.185509110407,
    0.186231522113,0.186927423301,0.187597781862,0.188243530373,0.188865567389,
    0.189464758681,0.190041938426,0.190597910367,0.191133448912,0.191649300211,
    0.192146183181,0.192624790499,0.193085789564,0.193529823410,0.193957511602,
    0.194369451087,0.194766217020,0.195148363561,0.195516424637,0.195870914683,
    0.196212329353,0.196541146201,0.196857825348,0.197162810111,0.197456527624,
    0.197739389419,0.198011792005,0.198274117410,0.198526733711,0.198769995543,
    0.199004244591,0.199229810062,0.199447009140,0.199656147424,0.199857519352,
    0.200051408611,0.200238088525,0.200417822434,0.200590864063,0.200757457868,
    0.200917839375,0.201072235510,0.201220864909,0.201363938223,0.201501658408,
    0.201634221006,0.201761814418,0.201884620161,0.202002813125,0.202116561809,
    0.202226028558,0.202331369785,0.202432736193,0.202530272978,0.202624120031,
    0.202714412134,0.202801279147,0.202884846184,0.202965233790,0.203042558105,
    0.203116931029,0.203188460371,0.203257250005,0.203323400009,0.203387006803,
    0.203448163289,0.203506958973,0.203563480090,0.203617809728,0.203670027936,
    0.203720211842,0.203768435755,0.203814771269,0.203859287364,0.203902050498,
    0.203943124705,0.203982571676,0.204020450849,0.204056819493,0.204091732783,
    0.204125243878,0.204157403998,0.204188262487,0.204217866892,0.204246263019,
    0.204273495002,0.204299605363,0.204324635071,0.204348623598,0.204371608973,
    0.204393627838,0.204414715494,0.204434905956,0.204454231991,0.204472725175,
    0.204490415926,0.204507333554,0.204523506296,0.204538961359,0.204553724955,
    0.204567822340,0.204581277845,0.204594114916,0.204606356139,0.204618023276,
    0.204629137294,0.204639718396,0.204649786045,0.204659358993,0.204668455308,
    0.204677092397,0.204685287032,0.204693055372,0.204700412986,0.204707374875,
    0.204713955489,0.204720168755,0.204726028087,0.204731546411,0.204736736181,
    0.204741609395,0.204746177614,0.204750451976,0.204754443212,0.204758161661,
    0.204761617286,0.204764819684,0.204767778103,0.204770501451,0.204772998313,
    0.204775276960,0.204777345359,0.204779211189,0.204780881847,0.204782364459
    };
};


/****************************************************************************************
* littlefly_neg_table generated by DK/circ_table_gen.py -- do not modify manually
****************************************************************************************/

 // variables used
 // --sig_max  -1.400000
 // --table_div  1.000000
 // --table_op  1.000000

littlefly_neg_clip = circuit_response(littlefly_neg_table, low, high, step, size) with{

    low = 0;
    high =-0.239189;
    step =142.143;
    size =200;

    littlefly_neg_table = waveform {
    0.000000000000,-0.001898005048,-0.007020570129,-0.013677549823,-0.020555997477,
    -0.027408423200,-0.034158565856,-0.040771644041,-0.047229533412,-0.053522479567,
    -0.059645502093,-0.065596570911,-0.071375579392,-0.076983720995,-0.082423089005,
    -0.087696407952,-0.092806847081,-0.097757887177,-0.102553223348,-0.107196692780,
    -0.111692220176,-0.116043776228,-0.120255345715,-0.124330902701,-0.128274391315,
    -0.132089710820,-0.135780704009,-0.139351148250,-0.142804748632,-0.146145132776,
    -0.149375847004,-0.152500353642,-0.155522029178,-0.158444163163,-0.161269957704,
    -0.164002527442,-0.166644899928,-0.169200016316,-0.171670732331,-0.174059819445,
    -0.176369966224,-0.178603779810,-0.180763787518,-0.182852438505,-0.184872105421,
    -0.186825086327,-0.188713606534,-0.190539820262,-0.192305812534,-0.194013600978,
    -0.195665137596,-0.197262310493,-0.198806945489,-0.200300807546,-0.201745601737,
    -0.203142972822,-0.204494497875,-0.205800984505,-0.207061069189,-0.208274238272,
    -0.209442233845,-0.210566733312,-0.211649351790,-0.212691644423,-0.213695108609,
    -0.214661186143,-0.215591265283,-0.216486682737,-0.217348725577,-0.218178633085,
    -0.218977598524,-0.219746770847,-0.220487256344,-0.221200120227,-0.221886388153,
    -0.222547047694,-0.223183049749,-0.223795309911,-0.224384709772,-0.224952098189,
    -0.225498292501,-0.226024079693,-0.226530217530,-0.227017435638,-0.227486436552,
    -0.227937896719,-0.228372467466,-0.228790775937,-0.229193425989,-0.229580999053,
    -0.229954054973,-0.230313132805,-0.230658751585,-0.230991411078,-0.231311592494,
    -0.231619759169,-0.231916357239,-0.232201816272,-0.232476549885,-0.232740956336,
    -0.232995419095,-0.233240307394,-0.233475976752,-0.233702769491,-0.233921015216,
    -0.234131031298,-0.234333123320,-0.234527585520,-0.234714701209,-0.234894743179,
    -0.235067974091,-0.235234646855,-0.235395004987,-0.235549282964,-0.235697706554,
    -0.235840493143,-0.235977852043,-0.236109984796,-0.236237085458,-0.236359340883,
    -0.236476930982,-0.236590028989,-0.236698801704,-0.236803409734,-0.236904007720,
    -0.237000744565,-0.237093763639,-0.237183202991,-0.237269195542,-0.237351869279,
    -0.237431347434,-0.237507748668,-0.237581187230,-0.237651773131,-0.237719612294,
    -0.237784806712,-0.237847454589,-0.237907650481,-0.237965485436,-0.238021047120,
    -0.238074419943,-0.238125685181,-0.238174921092,-0.238222203029,-0.238267603546,
    -0.238311192504,-0.238353037169,-0.238393202309,-0.238431750287,-0.238468741152,
    -0.238504232722,-0.238538280668,-0.238570938595,-0.238602258114,-0.238632288925,
    -0.238661078878,-0.238688674049,-0.238715118802,-0.238740455853,-0.238764726333,
    -0.238787969845,-0.238810224523,-0.238831527083,-0.238851912879,-0.238871415951,
    -0.238890069076,-0.238907903814,-0.238924950552,-0.238941238551,-0.238956795983,
    -0.238971649976,-0.238985826648,-0.238999351150,-0.239012247697,-0.239024539607,
    -0.239036249330,-0.239047398483,-0.239058007882,-0.239068097568,-0.239077686838,
    -0.239086794273,-0.239095437766,-0.239103634541,-0.239111401187,-0.239118753675,
    -0.239125707382,-0.239132277116,-0.239138477134,-0.239144321165,-0.239149822426,
    -0.239154993644,-0.239159847075,-0.239164394518,-0.239168647335,-0.239172616466,
    -0.239176312444,-0.239179745411,-0.239182925133,-0.239185861014,-0.239188562107
    };
};

/*******************************************************************************
  * littlefly generated by dkbuiler from LittleFly.sch
*******************************************************************************/

p1 = pre : fi.iir((b0/a0,b1/a0,b2/a0,b3/a0,b4/a0),(a1/a0,a2/a0,a3/a0,a4/a0)) : littleflyclip with {
    LogPot(a, x) = ba.if(a, (exp(a * x) - 1) / (exp(a) - 1), x);
    Inverted(b, x) = ba.if(b, 1 - x, x);
    s = 0.993;
    fs = float(ma.SR);
    pre = _;



    Volume = vslider("Volume[name:Volume][style:knob]", 0.5, 0, 1, 0.01) : Inverted(0) : si.smooth(s);

    b0 = Volume*pow(fs,2)*(9.59122077944672e-15*fs + 6.69516165427397e-16);

    b1 = -1.91824415588934e-14*Volume*pow(fs,3);

    b2 = -1.33903233085479e-15*Volume*pow(fs,2);

    b3 = 1.91824415588934e-14*Volume*pow(fs,3);

    b4 = Volume*pow(fs,2)*(-9.59122077944672e-15*fs + 6.69516165427397e-16);

    a0 = fs*(fs*(fs*(1.81805047330593e-19*fs + 3.13076156727864e-16) + 1.21278288958878e-13) + 7.15960280649683e-13) + 8.2091625339262e-13;

    a1 = fs*(pow(fs,2)*(-7.27220189322371e-19*fs - 6.26152313455728e-16) + 1.43192056129937e-12) + 3.28366501357048e-12;

    a2 = pow(fs,2)*(1.09083028398356e-18*pow(fs,2) - 2.42556577917757e-13) + 4.92549752035572e-12;

    a3 = fs*(pow(fs,2)*(-7.27220189322371e-19*fs + 6.26152313455728e-16) - 1.43192056129937e-12) + 3.28366501357048e-12;

    a4 = fs*(fs*(fs*(1.81805047330593e-19*fs - 3.13076156727864e-16) + 1.21278288958878e-13) - 7.15960280649683e-13) + 8.2091625339262e-13;
};

littleflyp = _<: ba.if(fsignbit(_), littlefly_neg_clip, littlefly_clip) :>_ ;

littleflyclip = freq_split: ( littleflyp , littleflyp , littleflyp, littleflyp, littleflyp) :>_;

process =  p1 ;