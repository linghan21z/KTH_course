/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : M-2016.12
// Date      : Thu Nov 17 15:06:49 2022
/////////////////////////////////////////////////////////////


module MAC_DW_mult_tc_0 ( a, b, product );
  input [9:0] a;
  input [9:0] b;
  output [19:0] product;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n21, n22, n23, n24, n25, n27, n28, n29, n30, n31, n32,
         n33, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n47, n48,
         n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62,
         n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76,
         n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90,
         n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103,
         n104, n105, n106, n107, n108, n109, n110, n111, n112, n113, n114,
         n115, n116, n117, n119, n120, n121, n122, n123, n124, n125, n126,
         n128, n129, n130, n131, n132, n133, n134, n135, n136, n281, n282,
         n283, n284, n286, n287, n288, n289, n290, n291, n292, n293, n294,
         n295, n296, n297, n298, n299, n300, n301, n302, n303, n304, n305,
         n306, n307, n308, n309, n310, n311, n312, n313, n314, n315, n316,
         n317, n318, n319, n320, n321, n322, n323, n324, n325, n326, n327,
         n328, n329, n330, n331, n332, n333, n334, n335, n336, n337, n338,
         n339, n340, n341, n342, n343, n344, n345, n346, n347, n348, n349,
         n350, n351, n352, n353, n354, n355, n356, n357, n358, n359, n360,
         n361, n362, n363, n364, n365, n366, n367, n368;

  CMPE32D1 U2 ( .A(n87), .B(n19), .CI(n2), .CO(n1), .S(product[18]) );
  CMPE32D1 U3 ( .A(n286), .B(n21), .CI(n3), .CO(n2), .S(product[17]) );
  CMPE32D1 U4 ( .A(n22), .B(n23), .CI(n4), .CO(n3), .S(product[16]) );
  CMPE32D1 U5 ( .A(n24), .B(n28), .CI(n5), .CO(n4), .S(product[15]) );
  CMPE32D1 U6 ( .A(n29), .B(n31), .CI(n6), .CO(n5), .S(product[14]) );
  CMPE32D1 U7 ( .A(n32), .B(n36), .CI(n7), .CO(n6), .S(product[13]) );
  CMPE32D1 U8 ( .A(n37), .B(n41), .CI(n8), .CO(n7), .S(product[12]) );
  CMPE32D1 U9 ( .A(n42), .B(n48), .CI(n9), .CO(n8), .S(product[11]) );
  CMPE32D1 U10 ( .A(n55), .B(n49), .CI(n10), .CO(n9), .S(product[10]) );
  CMPE32D1 U11 ( .A(n62), .B(n56), .CI(n11), .CO(n10), .S(product[9]) );
  CMPE32D1 U12 ( .A(n67), .B(n63), .CI(n12), .CO(n11), .S(product[8]) );
  CMPE32D1 U13 ( .A(n72), .B(n68), .CI(n13), .CO(n12), .S(product[7]) );
  CMPE32D1 U14 ( .A(n74), .B(n73), .CI(n14), .CO(n13), .S(product[6]) );
  CMPE32D1 U15 ( .A(n78), .B(n75), .CI(n15), .CO(n14), .S(product[5]) );
  CMPE32D1 U16 ( .A(n80), .B(n79), .CI(n16), .CO(n15), .S(product[4]) );
  CMPE32D1 U17 ( .A(n85), .B(n81), .CI(n17), .CO(n16), .S(product[3]) );
  CMPE32D1 U18 ( .A(n126), .B(n135), .CI(n18), .CO(n17), .S(product[2]) );
  CMPE22D1 U19 ( .A(n86), .B(n136), .CO(n18), .S(product[1]) );
  CMPE32D1 U21 ( .A(n97), .B(n25), .CI(n88), .CO(n21), .S(n22) );
  CMPE32D1 U22 ( .A(n89), .B(n288), .CI(n27), .CO(n23), .S(n24) );
  CMPE42D1 U24 ( .A(n107), .B(n33), .C(n90), .CIX(n30), .D(n98), .CO(n28), 
        .COX(n27), .S(n29) );
  CMPE42D1 U25 ( .A(n99), .B(n91), .C(n290), .CIX(n35), .D(n38), .CO(n31), 
        .COX(n30), .S(n32) );
  CMPE42D1 U27 ( .A(n108), .B(n100), .C(n43), .CIX(n40), .D(n39), .CO(n36), 
        .COX(n35), .S(n37) );
  CMPE32D1 U28 ( .A(n117), .B(n45), .CI(n92), .CO(n38), .S(n39) );
  CMPE42D1 U29 ( .A(n109), .B(n52), .C(n50), .CIX(n47), .D(n44), .CO(n41), 
        .COX(n40), .S(n42) );
  CMPE32D1 U30 ( .A(n93), .B(n101), .CI(n292), .CO(n43), .S(n44) );
  CMPE42D1 U32 ( .A(n59), .B(n53), .C(n57), .CIX(n54), .D(n51), .CO(n48), 
        .COX(n47), .S(n49) );
  CMPE32D1 U33 ( .A(n94), .B(n102), .CI(n110), .CO(n50), .S(n51) );
  CMPE42D1 U36 ( .A(n128), .B(n60), .C(n64), .CIX(n61), .D(n58), .CO(n55), 
        .COX(n54), .S(n56) );
  CMPE32D1 U37 ( .A(n111), .B(n103), .CI(n119), .CO(n57), .S(n58) );
  CMPE22D1 U38 ( .A(n95), .B(n82), .CO(n59), .S(n60) );
  CMPE42D1 U39 ( .A(n120), .B(n104), .C(n69), .CIX(n66), .D(n65), .CO(n62), 
        .COX(n61), .S(n63) );
  CMPE32D1 U40 ( .A(n96), .B(n112), .CI(n129), .CO(n64), .S(n65) );
  CMPE42D1 U41 ( .A(n130), .B(n113), .C(n121), .CIX(n71), .D(n70), .CO(n67), 
        .COX(n66), .S(n68) );
  CMPE22D1 U42 ( .A(n105), .B(n83), .CO(n69), .S(n70) );
  CMPE42D1 U43 ( .A(n106), .B(n131), .C(n122), .CIX(n76), .D(n114), .CO(n72), 
        .COX(n71), .S(n73) );
  CMPE32D1 U44 ( .A(n132), .B(n123), .CI(n77), .CO(n74), .S(n75) );
  CMPE22D1 U45 ( .A(n115), .B(n84), .CO(n76), .S(n77) );
  CMPE32D1 U46 ( .A(n116), .B(n133), .CI(n124), .CO(n78), .S(n79) );
  OAI22D1 U210 ( .A1(n353), .A2(n327), .B1(n326), .B2(n354), .ZN(n115) );
  ND2D2 U211 ( .A1(n326), .A2(n361), .ZN(n327) );
  INVD1 U212 ( .I(a[7]), .ZN(n289) );
  OR2D1 U213 ( .A1(n283), .A2(n284), .Z(n125) );
  INVD1 U214 ( .I(a[3]), .ZN(n293) );
  XNR2D1 U215 ( .A1(n294), .A2(n303), .ZN(n338) );
  XOR2D1 U216 ( .A1(n294), .A2(a[2]), .Z(n324) );
  CMPE22D1 U217 ( .A(n134), .B(n125), .CO(n80), .S(n81) );
  INVD1 U218 ( .I(b[2]), .ZN(n303) );
  ND2D1 U219 ( .A1(n281), .A2(n282), .ZN(n134) );
  OR2D0 U220 ( .A1(n338), .A2(n323), .Z(n281) );
  OR2D1 U221 ( .A1(n339), .A2(n295), .Z(n282) );
  ND2D1 U222 ( .A1(a[1]), .A2(n295), .ZN(n323) );
  NR2D1 U223 ( .A1(n345), .A2(n325), .ZN(n283) );
  XNR2D1 U224 ( .A1(a[7]), .A2(a[8]), .ZN(n311) );
  INVD1 U225 ( .I(a[5]), .ZN(n291) );
  XOR2D1 U226 ( .A1(n293), .A2(a[4]), .Z(n326) );
  XNR2D1 U227 ( .A1(a[5]), .A2(a[6]), .ZN(n307) );
  NR2D0 U228 ( .A1(n324), .A2(n346), .ZN(n284) );
  INVD1 U229 ( .I(a[9]), .ZN(n287) );
  INVD1 U230 ( .I(a[1]), .ZN(n294) );
  ND2D1 U231 ( .A1(n324), .A2(n352), .ZN(n325) );
  INVD0 U232 ( .I(b[4]), .ZN(n301) );
  OAI32D1 U233 ( .A1(n291), .A2(b[0]), .A3(n326), .B1(n291), .B2(n327), .ZN(
        n84) );
  INVD1 U234 ( .I(b[3]), .ZN(n302) );
  INVD1 U235 ( .I(b[5]), .ZN(n300) );
  INVD1 U236 ( .I(b[1]), .ZN(n304) );
  INVD1 U237 ( .I(b[6]), .ZN(n299) );
  INVD1 U238 ( .I(n45), .ZN(n292) );
  INVD1 U239 ( .I(n1), .ZN(product[19]) );
  INVD1 U240 ( .I(n33), .ZN(n290) );
  INVD1 U241 ( .I(n25), .ZN(n288) );
  INVD1 U242 ( .I(n19), .ZN(n286) );
  ND2D1 U243 ( .A1(n311), .A2(n336), .ZN(n313) );
  ND2D1 U244 ( .A1(n307), .A2(n368), .ZN(n306) );
  INVD1 U245 ( .I(a[0]), .ZN(n295) );
  INVD1 U246 ( .I(b[0]), .ZN(n296) );
  INVD1 U247 ( .I(b[8]), .ZN(n298) );
  INVD1 U248 ( .I(b[7]), .ZN(n297) );
  NR2D0 U249 ( .A1(n295), .A2(n296), .ZN(product[0]) );
  OAI22D0 U250 ( .A1(n305), .A2(n306), .B1(n307), .B2(n308), .ZN(n99) );
  OAI22D0 U251 ( .A1(n308), .A2(n306), .B1(n307), .B2(n309), .ZN(n98) );
  XNR2D0 U252 ( .A1(n289), .A2(n297), .ZN(n308) );
  AO21D0 U253 ( .A1(n306), .A2(n307), .B(n310), .Z(n97) );
  NR2D0 U254 ( .A1(n311), .A2(n296), .ZN(n96) );
  OAI22D0 U255 ( .A1(n312), .A2(n313), .B1(n311), .B2(n314), .ZN(n95) );
  XNR2D0 U256 ( .A1(n296), .A2(n287), .ZN(n312) );
  OAI22D0 U257 ( .A1(n314), .A2(n313), .B1(n311), .B2(n315), .ZN(n94) );
  XNR2D0 U258 ( .A1(n287), .A2(n304), .ZN(n314) );
  OAI22D0 U259 ( .A1(n315), .A2(n313), .B1(n311), .B2(n316), .ZN(n93) );
  XNR2D0 U260 ( .A1(n287), .A2(n303), .ZN(n315) );
  OAI22D0 U261 ( .A1(n316), .A2(n313), .B1(n311), .B2(n317), .ZN(n92) );
  XNR2D0 U262 ( .A1(n287), .A2(n302), .ZN(n316) );
  OAI22D0 U263 ( .A1(n317), .A2(n313), .B1(n311), .B2(n318), .ZN(n91) );
  XNR2D0 U264 ( .A1(n287), .A2(n301), .ZN(n317) );
  OAI22D0 U265 ( .A1(n318), .A2(n313), .B1(n311), .B2(n319), .ZN(n90) );
  XNR2D0 U266 ( .A1(n287), .A2(n300), .ZN(n318) );
  OAI22D0 U267 ( .A1(n319), .A2(n313), .B1(n311), .B2(n320), .ZN(n89) );
  XNR2D0 U268 ( .A1(n287), .A2(n299), .ZN(n319) );
  OAI22D0 U269 ( .A1(n320), .A2(n313), .B1(n311), .B2(n321), .ZN(n88) );
  XNR2D0 U270 ( .A1(n287), .A2(n297), .ZN(n320) );
  AO21D0 U271 ( .A1(n313), .A2(n311), .B(n322), .Z(n87) );
  OAI21D0 U272 ( .A1(b[0]), .A2(n294), .B(n323), .ZN(n86) );
  OAI32D0 U273 ( .A1(n293), .A2(b[0]), .A3(n324), .B1(n293), .B2(n325), .ZN(
        n85) );
  OAI32D0 U274 ( .A1(n289), .A2(b[0]), .A3(n307), .B1(n289), .B2(n306), .ZN(
        n83) );
  OAI32D0 U275 ( .A1(n287), .A2(b[0]), .A3(n311), .B1(n287), .B2(n313), .ZN(
        n82) );
  XNR2D0 U276 ( .A1(n328), .A2(n329), .ZN(n53) );
  ND2D0 U277 ( .A1(n329), .A2(n328), .ZN(n52) );
  OA22D0 U278 ( .A1(n330), .A2(n325), .B1(n324), .B2(n331), .Z(n328) );
  AOI21D0 U279 ( .A1(n295), .A2(n323), .B(n332), .ZN(n329) );
  OAI22D0 U280 ( .A1(n324), .A2(n333), .B1(n331), .B2(n325), .ZN(n45) );
  XNR2D0 U281 ( .A1(n293), .A2(n298), .ZN(n331) );
  OAI22D0 U282 ( .A1(n326), .A2(n334), .B1(n335), .B2(n327), .ZN(n33) );
  OAI22D0 U283 ( .A1(n309), .A2(n306), .B1(n307), .B2(n310), .ZN(n25) );
  XNR2D0 U284 ( .A1(a[7]), .A2(b[9]), .ZN(n310) );
  XNR2D0 U285 ( .A1(n289), .A2(n298), .ZN(n309) );
  OAI22D0 U286 ( .A1(n321), .A2(n313), .B1(n311), .B2(n322), .ZN(n19) );
  XNR2D0 U287 ( .A1(a[9]), .A2(b[9]), .ZN(n322) );
  XNR2D0 U288 ( .A1(n287), .A2(a[8]), .ZN(n336) );
  XNR2D0 U289 ( .A1(n287), .A2(n298), .ZN(n321) );
  OAI22D0 U290 ( .A1(b[0]), .A2(n323), .B1(n337), .B2(n295), .ZN(n136) );
  OAI22D0 U291 ( .A1(n337), .A2(n323), .B1(n338), .B2(n295), .ZN(n135) );
  XNR2D0 U292 ( .A1(n294), .A2(n304), .ZN(n337) );
  OAI22D0 U293 ( .A1(n339), .A2(n323), .B1(n340), .B2(n295), .ZN(n133) );
  XNR2D0 U294 ( .A1(n294), .A2(n302), .ZN(n339) );
  OAI22D0 U295 ( .A1(n340), .A2(n323), .B1(n341), .B2(n295), .ZN(n132) );
  XNR2D0 U296 ( .A1(n294), .A2(n301), .ZN(n340) );
  OAI22D0 U297 ( .A1(n341), .A2(n323), .B1(n342), .B2(n295), .ZN(n131) );
  XNR2D0 U298 ( .A1(n294), .A2(n300), .ZN(n341) );
  OAI22D0 U299 ( .A1(n342), .A2(n323), .B1(n343), .B2(n295), .ZN(n130) );
  XNR2D0 U300 ( .A1(n294), .A2(n299), .ZN(n342) );
  OAI22D0 U301 ( .A1(n343), .A2(n323), .B1(n344), .B2(n295), .ZN(n129) );
  XNR2D0 U302 ( .A1(n294), .A2(n297), .ZN(n343) );
  OAI22D0 U303 ( .A1(n344), .A2(n323), .B1(n332), .B2(n295), .ZN(n128) );
  XNR2D0 U304 ( .A1(a[1]), .A2(b[9]), .ZN(n332) );
  XNR2D0 U305 ( .A1(n294), .A2(n298), .ZN(n344) );
  NR2D0 U306 ( .A1(n324), .A2(n296), .ZN(n126) );
  XNR2D0 U307 ( .A1(n296), .A2(n293), .ZN(n345) );
  OAI22D0 U308 ( .A1(n346), .A2(n325), .B1(n324), .B2(n347), .ZN(n124) );
  XNR2D0 U309 ( .A1(n293), .A2(n304), .ZN(n346) );
  OAI22D0 U310 ( .A1(n347), .A2(n325), .B1(n324), .B2(n348), .ZN(n123) );
  XNR2D0 U311 ( .A1(n293), .A2(n303), .ZN(n347) );
  OAI22D0 U312 ( .A1(n348), .A2(n325), .B1(n324), .B2(n349), .ZN(n122) );
  XNR2D0 U313 ( .A1(n293), .A2(n302), .ZN(n348) );
  OAI22D0 U314 ( .A1(n349), .A2(n325), .B1(n324), .B2(n350), .ZN(n121) );
  XNR2D0 U315 ( .A1(n293), .A2(n301), .ZN(n349) );
  OAI22D0 U316 ( .A1(n350), .A2(n325), .B1(n324), .B2(n351), .ZN(n120) );
  XNR2D0 U317 ( .A1(n293), .A2(n300), .ZN(n350) );
  OAI22D0 U318 ( .A1(n351), .A2(n325), .B1(n324), .B2(n330), .ZN(n119) );
  XNR2D0 U319 ( .A1(n293), .A2(n297), .ZN(n330) );
  XNR2D0 U320 ( .A1(n293), .A2(n299), .ZN(n351) );
  AO21D0 U321 ( .A1(n325), .A2(n324), .B(n333), .Z(n117) );
  XNR2D0 U322 ( .A1(a[3]), .A2(b[9]), .ZN(n333) );
  XNR2D0 U323 ( .A1(n293), .A2(a[2]), .ZN(n352) );
  NR2D0 U324 ( .A1(n326), .A2(n296), .ZN(n116) );
  XNR2D0 U325 ( .A1(n296), .A2(n291), .ZN(n353) );
  OAI22D0 U326 ( .A1(n354), .A2(n327), .B1(n326), .B2(n355), .ZN(n114) );
  XNR2D0 U327 ( .A1(n291), .A2(n304), .ZN(n354) );
  OAI22D0 U328 ( .A1(n355), .A2(n327), .B1(n326), .B2(n356), .ZN(n113) );
  XNR2D0 U329 ( .A1(n291), .A2(n303), .ZN(n355) );
  OAI22D0 U330 ( .A1(n356), .A2(n327), .B1(n326), .B2(n357), .ZN(n112) );
  XNR2D0 U331 ( .A1(n291), .A2(n302), .ZN(n356) );
  OAI22D0 U332 ( .A1(n357), .A2(n327), .B1(n326), .B2(n358), .ZN(n111) );
  XNR2D0 U333 ( .A1(n291), .A2(n301), .ZN(n357) );
  OAI22D0 U334 ( .A1(n358), .A2(n327), .B1(n326), .B2(n359), .ZN(n110) );
  XNR2D0 U335 ( .A1(n291), .A2(n300), .ZN(n358) );
  OAI22D0 U336 ( .A1(n359), .A2(n327), .B1(n326), .B2(n360), .ZN(n109) );
  XNR2D0 U337 ( .A1(n291), .A2(n299), .ZN(n359) );
  OAI22D0 U338 ( .A1(n360), .A2(n327), .B1(n326), .B2(n335), .ZN(n108) );
  XNR2D0 U339 ( .A1(n291), .A2(n298), .ZN(n335) );
  XNR2D0 U340 ( .A1(n291), .A2(n297), .ZN(n360) );
  AO21D0 U341 ( .A1(n327), .A2(n326), .B(n334), .Z(n107) );
  XNR2D0 U342 ( .A1(a[5]), .A2(b[9]), .ZN(n334) );
  XNR2D0 U343 ( .A1(n291), .A2(a[4]), .ZN(n361) );
  NR2D0 U344 ( .A1(n307), .A2(n296), .ZN(n106) );
  OAI22D0 U345 ( .A1(n362), .A2(n306), .B1(n307), .B2(n363), .ZN(n105) );
  XNR2D0 U346 ( .A1(n296), .A2(n289), .ZN(n362) );
  OAI22D0 U347 ( .A1(n363), .A2(n306), .B1(n307), .B2(n364), .ZN(n104) );
  XNR2D0 U348 ( .A1(n289), .A2(n304), .ZN(n363) );
  OAI22D0 U349 ( .A1(n364), .A2(n306), .B1(n307), .B2(n365), .ZN(n103) );
  XNR2D0 U350 ( .A1(n289), .A2(n303), .ZN(n364) );
  OAI22D0 U351 ( .A1(n365), .A2(n306), .B1(n307), .B2(n366), .ZN(n102) );
  XNR2D0 U352 ( .A1(n289), .A2(n302), .ZN(n365) );
  OAI22D0 U353 ( .A1(n366), .A2(n306), .B1(n307), .B2(n367), .ZN(n101) );
  XNR2D0 U354 ( .A1(n289), .A2(n301), .ZN(n366) );
  OAI22D0 U355 ( .A1(n367), .A2(n306), .B1(n307), .B2(n305), .ZN(n100) );
  XNR2D0 U356 ( .A1(n289), .A2(n299), .ZN(n305) );
  XNR2D0 U357 ( .A1(n289), .A2(a[6]), .ZN(n368) );
  XNR2D0 U358 ( .A1(n289), .A2(n300), .ZN(n367) );
endmodule


module MAC_DW01_add_0 ( A, B, CI, SUM, CO );
  input [23:0] A;
  input [23:0] B;
  output [23:0] SUM;
  input CI;
  output CO;
  wire   n1;
  wire   [23:1] carry;

  CMPE32D1 U1_22 ( .A(A[22]), .B(B[22]), .CI(carry[22]), .CO(carry[23]), .S(
        SUM[22]) );
  CMPE32D1 U1_21 ( .A(A[21]), .B(B[21]), .CI(carry[21]), .CO(carry[22]), .S(
        SUM[21]) );
  CMPE32D1 U1_20 ( .A(A[20]), .B(B[20]), .CI(carry[20]), .CO(carry[21]), .S(
        SUM[20]) );
  CMPE32D1 U1_17 ( .A(A[17]), .B(B[17]), .CI(carry[17]), .CO(carry[18]), .S(
        SUM[17]) );
  CMPE32D1 U1_16 ( .A(A[16]), .B(B[16]), .CI(carry[16]), .CO(carry[17]), .S(
        SUM[16]) );
  CMPE32D1 U1_15 ( .A(A[15]), .B(B[15]), .CI(carry[15]), .CO(carry[16]), .S(
        SUM[15]) );
  CMPE32D1 U1_14 ( .A(A[14]), .B(B[14]), .CI(carry[14]), .CO(carry[15]), .S(
        SUM[14]) );
  CMPE32D1 U1_13 ( .A(A[13]), .B(B[13]), .CI(carry[13]), .CO(carry[14]), .S(
        SUM[13]) );
  CMPE32D1 U1_12 ( .A(A[12]), .B(B[12]), .CI(carry[12]), .CO(carry[13]), .S(
        SUM[12]) );
  CMPE32D1 U1_11 ( .A(A[11]), .B(B[11]), .CI(carry[11]), .CO(carry[12]), .S(
        SUM[11]) );
  CMPE32D1 U1_10 ( .A(A[10]), .B(B[10]), .CI(carry[10]), .CO(carry[11]), .S(
        SUM[10]) );
  CMPE32D1 U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(carry[8]), .S(SUM[7])
         );
  CMPE32D1 U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  CMPE32D1 U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  CMPE32D1 U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  CMPE32D1 U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  CMPE32D1 U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  CMPE32D1 U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1]) );
  XOR3D1 U1_23 ( .A1(A[23]), .A2(B[23]), .A3(carry[23]), .Z(SUM[23]) );
  FA1D1 U1_19 ( .A(A[19]), .B(B[19]), .CI(carry[19]), .CO(carry[20]), .S(
        SUM[19]) );
  FA1D1 U1_9 ( .A(A[9]), .B(B[9]), .CI(carry[9]), .CO(carry[10]), .S(SUM[9])
         );
  FA1D1 U1_18 ( .A(A[18]), .B(B[18]), .CI(carry[18]), .CO(carry[19]), .S(
        SUM[18]) );
  FA1D1 U1_8 ( .A(A[8]), .B(B[8]), .CI(carry[8]), .CO(carry[9]), .S(SUM[8]) );
  AN2D0 U1 ( .A1(B[0]), .A2(A[0]), .Z(n1) );
  XOR2D1 U2 ( .A1(B[0]), .A2(A[0]), .Z(SUM[0]) );
endmodule


module MAC ( sample_in, coefficient, accumulate, result );
  input [9:0] sample_in;
  input [9:0] coefficient;
  input [23:0] accumulate;
  output [23:0] result;
  wire   N9, N8, N7, N6, N5, N4, N3, N2, N19, N18, N17, N16, N15, N14, N13,
         N12, N11, N10, N1, N0;

  MAC_DW_mult_tc_0 mult_25 ( .a(sample_in), .b(coefficient), .product({N19, 
        N18, N17, N16, N15, N14, N13, N12, N11, N10, N9, N8, N7, N6, N5, N4, 
        N3, N2, N1, N0}) );
  MAC_DW01_add_0 add_25 ( .A({N19, N19, N19, N19, N19, N18, N17, N16, N15, N14, 
        N13, N12, N11, N10, N9, N8, N7, N6, N5, N4, N3, N2, N1, N0}), .B(
        accumulate), .CI(1'b0), .SUM(result) );
endmodule


module arithmetic_unit ( clk, nrst, nrst_mac, sample_in, coefficient, result
 );
  input [9:0] sample_in;
  input [9:0] coefficient;
  output [23:0] result;
  input clk, nrst, nrst_mac;
  wire   N2, N3, N4, N5, N6, N7, N8, N9, N10, N11, N12, N13, N14, N15, N16,
         N17, N18, N19, N20, N21, N22, N23, N24, N25;
  wire   [23:0] MAC_result;

  MAC MAC_1 ( .sample_in(sample_in), .coefficient(coefficient), .accumulate(
        result), .result(MAC_result) );
  DFCNQD1 \temp_result_reg[20]  ( .D(N22), .CP(clk), .CDN(nrst), .Q(result[20]) );
  DFCNQD1 \temp_result_reg[21]  ( .D(N23), .CP(clk), .CDN(nrst), .Q(result[21]) );
  DFCNQD1 \temp_result_reg[22]  ( .D(N24), .CP(clk), .CDN(nrst), .Q(result[22]) );
  DFCNQD1 \temp_result_reg[23]  ( .D(N25), .CP(clk), .CDN(nrst), .Q(result[23]) );
  DFCNQD1 \temp_result_reg[2]  ( .D(N4), .CP(clk), .CDN(nrst), .Q(result[2])
         );
  DFCNQD1 \temp_result_reg[3]  ( .D(N5), .CP(clk), .CDN(nrst), .Q(result[3])
         );
  DFCNQD1 \temp_result_reg[4]  ( .D(N6), .CP(clk), .CDN(nrst), .Q(result[4])
         );
  DFCNQD1 \temp_result_reg[5]  ( .D(N7), .CP(clk), .CDN(nrst), .Q(result[5])
         );
  DFCNQD1 \temp_result_reg[6]  ( .D(N8), .CP(clk), .CDN(nrst), .Q(result[6])
         );
  DFCNQD1 \temp_result_reg[7]  ( .D(N9), .CP(clk), .CDN(nrst), .Q(result[7])
         );
  DFCNQD1 \temp_result_reg[8]  ( .D(N10), .CP(clk), .CDN(nrst), .Q(result[8])
         );
  DFCNQD1 \temp_result_reg[9]  ( .D(N11), .CP(clk), .CDN(nrst), .Q(result[9])
         );
  DFCNQD1 \temp_result_reg[10]  ( .D(N12), .CP(clk), .CDN(nrst), .Q(result[10]) );
  DFCNQD1 \temp_result_reg[11]  ( .D(N13), .CP(clk), .CDN(nrst), .Q(result[11]) );
  DFCNQD1 \temp_result_reg[12]  ( .D(N14), .CP(clk), .CDN(nrst), .Q(result[12]) );
  DFCNQD1 \temp_result_reg[13]  ( .D(N15), .CP(clk), .CDN(nrst), .Q(result[13]) );
  DFCNQD1 \temp_result_reg[14]  ( .D(N16), .CP(clk), .CDN(nrst), .Q(result[14]) );
  DFCNQD1 \temp_result_reg[15]  ( .D(N17), .CP(clk), .CDN(nrst), .Q(result[15]) );
  DFCNQD1 \temp_result_reg[16]  ( .D(N18), .CP(clk), .CDN(nrst), .Q(result[16]) );
  DFCNQD1 \temp_result_reg[17]  ( .D(N19), .CP(clk), .CDN(nrst), .Q(result[17]) );
  DFCNQD1 \temp_result_reg[18]  ( .D(N20), .CP(clk), .CDN(nrst), .Q(result[18]) );
  DFCNQD1 \temp_result_reg[19]  ( .D(N21), .CP(clk), .CDN(nrst), .Q(result[19]) );
  DFCNQD1 \temp_result_reg[1]  ( .D(N3), .CP(clk), .CDN(nrst), .Q(result[1])
         );
  DFCNQD1 \temp_result_reg[0]  ( .D(N2), .CP(clk), .CDN(nrst), .Q(result[0])
         );
  CKAN2D1 U3 ( .A1(MAC_result[23]), .A2(nrst_mac), .Z(N25) );
  AN2D0 U4 ( .A1(MAC_result[18]), .A2(nrst_mac), .Z(N20) );
  AN2D0 U5 ( .A1(MAC_result[19]), .A2(nrst_mac), .Z(N21) );
  AN2D0 U6 ( .A1(MAC_result[8]), .A2(nrst_mac), .Z(N10) );
  AN2D0 U7 ( .A1(MAC_result[9]), .A2(nrst_mac), .Z(N11) );
  AN2D0 U8 ( .A1(MAC_result[22]), .A2(nrst_mac), .Z(N24) );
  AN2D0 U9 ( .A1(MAC_result[21]), .A2(nrst_mac), .Z(N23) );
  AN2D0 U10 ( .A1(MAC_result[20]), .A2(nrst_mac), .Z(N22) );
  AN2D0 U11 ( .A1(MAC_result[17]), .A2(nrst_mac), .Z(N19) );
  AN2D0 U12 ( .A1(MAC_result[16]), .A2(nrst_mac), .Z(N18) );
  AN2D0 U13 ( .A1(MAC_result[15]), .A2(nrst_mac), .Z(N17) );
  AN2D0 U14 ( .A1(MAC_result[14]), .A2(nrst_mac), .Z(N16) );
  AN2D0 U15 ( .A1(MAC_result[13]), .A2(nrst_mac), .Z(N15) );
  AN2D0 U16 ( .A1(MAC_result[12]), .A2(nrst_mac), .Z(N14) );
  AN2D0 U17 ( .A1(MAC_result[11]), .A2(nrst_mac), .Z(N13) );
  AN2D0 U18 ( .A1(MAC_result[10]), .A2(nrst_mac), .Z(N12) );
  AN2D0 U19 ( .A1(MAC_result[6]), .A2(nrst_mac), .Z(N8) );
  AN2D0 U20 ( .A1(nrst_mac), .A2(MAC_result[7]), .Z(N9) );
  AN2D0 U21 ( .A1(MAC_result[5]), .A2(nrst_mac), .Z(N7) );
  AN2D0 U22 ( .A1(MAC_result[4]), .A2(nrst_mac), .Z(N6) );
  AN2D0 U23 ( .A1(MAC_result[3]), .A2(nrst_mac), .Z(N5) );
  AN2D0 U24 ( .A1(MAC_result[2]), .A2(nrst_mac), .Z(N4) );
  AN2D0 U25 ( .A1(MAC_result[1]), .A2(nrst_mac), .Z(N3) );
  AN2D0 U26 ( .A1(MAC_result[0]), .A2(nrst_mac), .Z(N2) );
endmodule


module fsm ( nrst, clk, new_sample, write_enable, write_address, read_address, 
        coefficient_address, output_ready, nrst_mac );
  output [3:0] write_address;
  output [3:0] read_address;
  output [3:0] coefficient_address;
  input nrst, clk, new_sample;
  output write_enable, output_ready, nrst_mac;
  wire   N27, N28, N29, N30, N49, N50, N51, N52, N58, N59, N60, N61, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n1, n2, n3, n4, n6, n7, n8, n9, n10,
         n11, n12, n13, n14;
  wire   [3:0] counter;
  wire   [1:0] present_state;

  OA21D1 U14 ( .A1(n21), .A2(counter[2]), .B(n22), .Z(n20) );
  EDFCNQD1 \write_address_tmp_reg[0]  ( .D(N27), .E(new_sample), .CP(clk), 
        .CDN(nrst), .Q(write_address[0]) );
  EDFCNQD1 \write_address_tmp_reg[3]  ( .D(N30), .E(new_sample), .CP(clk), 
        .CDN(nrst), .Q(write_address[3]) );
  EDFCNQD1 \write_address_tmp_reg[2]  ( .D(N29), .E(new_sample), .CP(clk), 
        .CDN(nrst), .Q(write_address[2]) );
  DFCNQD1 \counter_reg[3]  ( .D(N61), .CP(clk), .CDN(nrst), .Q(counter[3]) );
  DFCNQD1 \present_state_reg[1]  ( .D(n35), .CP(clk), .CDN(nrst), .Q(
        present_state[1]) );
  DFCNQD1 \counter_reg[0]  ( .D(N58), .CP(clk), .CDN(nrst), .Q(counter[0]) );
  DFCNQD1 \counter_reg[1]  ( .D(N59), .CP(clk), .CDN(nrst), .Q(counter[1]) );
  DFCNQD1 \present_state_reg[0]  ( .D(n36), .CP(clk), .CDN(nrst), .Q(
        present_state[0]) );
  DFCNQD1 \counter_reg[2]  ( .D(N60), .CP(clk), .CDN(nrst), .Q(counter[2]) );
  DFCNQD2 \read_address_tmp_reg[1]  ( .D(N50), .CP(clk), .CDN(nrst), .Q(
        read_address[1]) );
  EDFCND1 \write_address_tmp_reg[1]  ( .D(N28), .E(new_sample), .CP(clk), 
        .CDN(nrst), .Q(write_address[1]), .QN(n2) );
  DFCNQD1 \read_address_tmp_reg[2]  ( .D(N51), .CP(clk), .CDN(nrst), .Q(
        read_address[2]) );
  DFCNQD2 \read_address_tmp_reg[0]  ( .D(N49), .CP(clk), .CDN(nrst), .Q(
        read_address[0]) );
  DFCNQD1 \read_address_tmp_reg[3]  ( .D(N52), .CP(clk), .CDN(nrst), .Q(
        read_address[3]) );
  NR2D1 U3 ( .A1(n17), .A2(n10), .ZN(coefficient_address[0]) );
  INVD1 U4 ( .I(counter[1]), .ZN(n11) );
  NR2D0 U5 ( .A1(n12), .A2(n17), .ZN(coefficient_address[2]) );
  ND2D1 U6 ( .A1(n15), .A2(n18), .ZN(n17) );
  XNR2D0 U7 ( .A1(n11), .A2(n10), .ZN(n23) );
  INVD0 U8 ( .I(counter[2]), .ZN(n12) );
  INVD0 U9 ( .I(counter[3]), .ZN(n13) );
  OAI32D0 U10 ( .A1(n19), .A2(counter[3]), .A3(n12), .B1(n20), .B2(n13), .ZN(
        N61) );
  NR2D0 U11 ( .A1(n21), .A2(counter[0]), .ZN(N58) );
  OAI32D0 U12 ( .A1(n16), .A2(present_state[1]), .A3(present_state[0]), .B1(n6), .B2(n7), .ZN(n36) );
  OAI32D0 U13 ( .A1(n25), .A2(read_address[0]), .A3(n26), .B1(n14), .B2(n1), 
        .ZN(N49) );
  NR2D0 U15 ( .A1(n8), .A2(read_address[3]), .ZN(n26) );
  NR2D0 U16 ( .A1(n9), .A2(read_address[2]), .ZN(n28) );
  NR2D0 U17 ( .A1(read_address[1]), .A2(read_address[0]), .ZN(n30) );
  ND3D0 U18 ( .A1(counter[1]), .A2(nrst_mac), .A3(counter[0]), .ZN(n19) );
  INVD1 U19 ( .I(n21), .ZN(nrst_mac) );
  NR2D1 U20 ( .A1(n17), .A2(n11), .ZN(coefficient_address[1]) );
  NR2D1 U21 ( .A1(n13), .A2(n17), .ZN(coefficient_address[3]) );
  NR2D1 U22 ( .A1(output_ready), .A2(n15), .ZN(n21) );
  AOI21D0 U23 ( .A1(n11), .A2(nrst_mac), .B(N58), .ZN(n22) );
  AOI21D0 U24 ( .A1(n2), .A2(n34), .B(N27), .ZN(n33) );
  ND2D1 U25 ( .A1(nrst_mac), .A2(n14), .ZN(n25) );
  INVD1 U26 ( .I(n28), .ZN(n8) );
  INVD1 U27 ( .I(n30), .ZN(n9) );
  INVD1 U28 ( .I(n16), .ZN(n6) );
  NR2D1 U29 ( .A1(n21), .A2(n23), .ZN(N59) );
  AN2D0 U30 ( .A1(n34), .A2(n1), .Z(N27) );
  AN2D0 U31 ( .A1(n15), .A2(n6), .Z(n35) );
  ND4D1 U32 ( .A1(counter[3]), .A2(counter[2]), .A3(n10), .A4(n11), .ZN(n18)
         );
  NR2D1 U33 ( .A1(n7), .A2(present_state[1]), .ZN(n15) );
  INVD1 U34 ( .I(counter[0]), .ZN(n10) );
  INVD1 U35 ( .I(present_state[0]), .ZN(n7) );
  NR3D0 U36 ( .A1(n14), .A2(present_state[1]), .A3(present_state[0]), .ZN(
        write_enable) );
  AN2D0 U37 ( .A1(present_state[1]), .A2(n7), .Z(output_ready) );
  OAI32D1 U38 ( .A1(n25), .A2(n26), .A3(n29), .B1(n14), .B2(n2), .ZN(N50) );
  AOI21D0 U39 ( .A1(read_address[1]), .A2(read_address[0]), .B(n30), .ZN(n29)
         );
  OAI32D1 U40 ( .A1(n31), .A2(write_address[3]), .A3(n3), .B1(n32), .B2(n4), 
        .ZN(N30) );
  AN2D0 U41 ( .A1(write_address[2]), .A2(n33), .Z(n32) );
  OAI22D0 U42 ( .A1(n14), .A2(n4), .B1(n24), .B2(n25), .ZN(N52) );
  AOI21D0 U43 ( .A1(read_address[3]), .A2(n8), .B(n26), .ZN(n24) );
  OAI22D0 U44 ( .A1(n14), .A2(n3), .B1(n27), .B2(n25), .ZN(N51) );
  AOI21D0 U45 ( .A1(read_address[2]), .A2(n9), .B(n28), .ZN(n27) );
  OAI22D0 U46 ( .A1(n22), .A2(n12), .B1(counter[2]), .B2(n19), .ZN(N60) );
  OAI22D0 U47 ( .A1(n33), .A2(n3), .B1(write_address[2]), .B2(n31), .ZN(N29)
         );
  OAI21D0 U48 ( .A1(present_state[0]), .A2(new_sample), .B(n17), .ZN(n16) );
  ND4D1 U49 ( .A1(write_address[2]), .A2(write_address[3]), .A3(n1), .A4(n2), 
        .ZN(n34) );
  INVD1 U50 ( .I(write_address[2]), .ZN(n3) );
  ND2D1 U51 ( .A1(write_address[0]), .A2(write_address[1]), .ZN(n31) );
  INVD1 U52 ( .I(write_address[0]), .ZN(n1) );
  INVD1 U53 ( .I(write_address[3]), .ZN(n4) );
  XNR2D1 U54 ( .A1(n2), .A2(write_address[0]), .ZN(N28) );
  INVD1 U55 ( .I(new_sample), .ZN(n14) );
endmodule


module rom_coefficients ( coeff_addr, coeff_out );
  input [3:0] coeff_addr;
  output [9:0] coeff_out;
  wire   n5, n6, n7, n8, n9, n1, n3, n4, n10;
  assign coeff_out[0] = 1'b1;
  assign coeff_out[7] = 1'b0;
  assign coeff_out[8] = 1'b0;
  assign coeff_out[9] = 1'b0;

  OR2D1 U3 ( .A1(n6), .A2(coeff_out[3]), .Z(coeff_out[2]) );
  AN2D0 U4 ( .A1(coeff_addr[2]), .A2(n6), .Z(coeff_out[6]) );
  AN2D0 U5 ( .A1(coeff_addr[2]), .A2(coeff_addr[0]), .Z(n1) );
  NR2D1 U6 ( .A1(n1), .A2(coeff_out[6]), .ZN(n5) );
  INVD0 U7 ( .I(n5), .ZN(coeff_out[5]) );
  OAI211D0 U8 ( .A1(n10), .A2(n7), .B(n8), .C(n3), .ZN(coeff_out[3]) );
  INVD1 U9 ( .I(coeff_addr[1]), .ZN(n4) );
  INVD1 U10 ( .I(coeff_out[4]), .ZN(n3) );
  ND3D1 U11 ( .A1(n3), .A2(n4), .A3(n7), .ZN(coeff_out[1]) );
  XNR2D1 U12 ( .A1(coeff_addr[3]), .A2(coeff_addr[2]), .ZN(n9) );
  INVD1 U13 ( .I(coeff_addr[3]), .ZN(n10) );
  ND3D1 U14 ( .A1(coeff_addr[1]), .A2(n10), .A3(coeff_addr[0]), .ZN(n8) );
  ND2D1 U15 ( .A1(coeff_addr[0]), .A2(n4), .ZN(n7) );
  OAI31D1 U16 ( .A1(n9), .A2(coeff_addr[1]), .A3(coeff_addr[0]), .B(n5), .ZN(
        coeff_out[4]) );
  NR2D1 U17 ( .A1(n4), .A2(coeff_addr[0]), .ZN(n6) );
endmodule


module delay_line ( clk, nrst, new_sample, write_enable, write_address, 
        read_address, sample_in, sample_out );
  input [3:0] write_address;
  input [3:0] read_address;
  input [9:0] sample_in;
  output [9:0] sample_out;
  input clk, nrst, new_sample, write_enable;
  wire   \data[10][9] , \data[10][8] , \data[10][7] , \data[10][6] ,
         \data[10][5] , \data[10][4] , \data[10][3] , \data[10][2] ,
         \data[10][1] , \data[10][0] , \data[9][9] , \data[9][8] ,
         \data[9][7] , \data[9][6] , \data[9][5] , \data[9][4] , \data[9][3] ,
         \data[9][2] , \data[9][1] , \data[9][0] , \data[8][9] , \data[8][8] ,
         \data[8][7] , \data[8][6] , \data[8][5] , \data[8][4] , \data[8][3] ,
         \data[8][2] , \data[8][1] , \data[8][0] , \data[7][9] , \data[7][8] ,
         \data[7][7] , \data[7][6] , \data[7][5] , \data[7][4] , \data[7][3] ,
         \data[7][2] , \data[7][1] , \data[7][0] , \data[6][9] , \data[6][8] ,
         \data[6][7] , \data[6][6] , \data[6][5] , \data[6][4] , \data[6][3] ,
         \data[6][2] , \data[6][1] , \data[6][0] , \data[5][9] , \data[5][8] ,
         \data[5][7] , \data[5][6] , \data[5][5] , \data[5][4] , \data[5][3] ,
         \data[5][2] , \data[5][1] , \data[5][0] , \data[4][9] , \data[4][8] ,
         \data[4][7] , \data[4][6] , \data[4][5] , \data[4][4] , \data[4][3] ,
         \data[4][2] , \data[4][1] , \data[4][0] , \data[3][9] , \data[3][8] ,
         \data[3][7] , \data[3][6] , \data[3][5] , \data[3][4] , \data[3][3] ,
         \data[3][2] , \data[3][1] , \data[3][0] , \data[2][9] , \data[2][8] ,
         \data[2][7] , \data[2][6] , \data[2][5] , \data[2][4] , \data[2][3] ,
         \data[2][2] , \data[2][1] , \data[2][0] , \data[1][9] , \data[1][8] ,
         \data[1][7] , \data[1][6] , \data[1][5] , \data[1][4] , \data[1][3] ,
         \data[1][2] , \data[1][1] , \data[1][0] , \data[0][9] , \data[0][8] ,
         \data[0][7] , \data[0][6] , \data[0][5] , \data[0][4] , \data[0][3] ,
         \data[0][2] , \data[0][1] , \data[0][0] , n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50,
         n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64,
         n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78,
         n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92,
         n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104, n105,
         n107, n108, n110, n112, n114, n115, n117, n122, n1, n2, n3, n4, n5,
         n6, n7, n8, n9, n10, n11, n32, n33, n34, n35, n36, n37, n106, n109,
         n111, n113, n116, n118, n119, n120, n121, n123, n124, n125, n126,
         n127, n128, n129, n130;

  EDFCNQD1 \data_reg[8][9]  ( .D(sample_in[9]), .E(n8), .CP(clk), .CDN(n111), 
        .Q(\data[8][9] ) );
  EDFCNQD1 \data_reg[8][8]  ( .D(sample_in[8]), .E(n8), .CP(clk), .CDN(n111), 
        .Q(\data[8][8] ) );
  EDFCNQD1 \data_reg[8][7]  ( .D(sample_in[7]), .E(n8), .CP(clk), .CDN(n111), 
        .Q(\data[8][7] ) );
  EDFCNQD1 \data_reg[8][6]  ( .D(sample_in[6]), .E(n8), .CP(clk), .CDN(n111), 
        .Q(\data[8][6] ) );
  EDFCNQD1 \data_reg[8][5]  ( .D(sample_in[5]), .E(n8), .CP(clk), .CDN(n111), 
        .Q(\data[8][5] ) );
  EDFCNQD1 \data_reg[8][4]  ( .D(sample_in[4]), .E(n8), .CP(clk), .CDN(n111), 
        .Q(\data[8][4] ) );
  EDFCNQD1 \data_reg[8][3]  ( .D(sample_in[3]), .E(n8), .CP(clk), .CDN(n111), 
        .Q(\data[8][3] ) );
  EDFCNQD1 \data_reg[8][2]  ( .D(sample_in[2]), .E(n8), .CP(clk), .CDN(n111), 
        .Q(\data[8][2] ) );
  EDFCNQD1 \data_reg[8][1]  ( .D(sample_in[1]), .E(n8), .CP(clk), .CDN(n111), 
        .Q(\data[8][1] ) );
  EDFCNQD1 \data_reg[8][0]  ( .D(sample_in[0]), .E(n8), .CP(clk), .CDN(n111), 
        .Q(\data[8][0] ) );
  EDFCNQD1 \data_reg[5][9]  ( .D(sample_in[9]), .E(n34), .CP(clk), .CDN(n116), 
        .Q(\data[5][9] ) );
  EDFCNQD1 \data_reg[5][8]  ( .D(sample_in[8]), .E(n34), .CP(clk), .CDN(n116), 
        .Q(\data[5][8] ) );
  EDFCNQD1 \data_reg[5][7]  ( .D(sample_in[7]), .E(n34), .CP(clk), .CDN(n116), 
        .Q(\data[5][7] ) );
  EDFCNQD1 \data_reg[5][6]  ( .D(sample_in[6]), .E(n34), .CP(clk), .CDN(n116), 
        .Q(\data[5][6] ) );
  EDFCNQD1 \data_reg[5][5]  ( .D(sample_in[5]), .E(n34), .CP(clk), .CDN(n116), 
        .Q(\data[5][5] ) );
  EDFCNQD1 \data_reg[5][4]  ( .D(sample_in[4]), .E(n34), .CP(clk), .CDN(n116), 
        .Q(\data[5][4] ) );
  EDFCNQD1 \data_reg[5][3]  ( .D(sample_in[3]), .E(n34), .CP(clk), .CDN(n116), 
        .Q(\data[5][3] ) );
  EDFCNQD1 \data_reg[5][2]  ( .D(sample_in[2]), .E(n34), .CP(clk), .CDN(n116), 
        .Q(\data[5][2] ) );
  EDFCNQD1 \data_reg[5][1]  ( .D(sample_in[1]), .E(n34), .CP(clk), .CDN(n118), 
        .Q(\data[5][1] ) );
  EDFCNQD1 \data_reg[5][0]  ( .D(sample_in[0]), .E(n34), .CP(clk), .CDN(n118), 
        .Q(\data[5][0] ) );
  EDFCNQD1 \data_reg[2][9]  ( .D(sample_in[9]), .E(n5), .CP(clk), .CDN(n119), 
        .Q(\data[2][9] ) );
  EDFCNQD1 \data_reg[2][8]  ( .D(sample_in[8]), .E(n5), .CP(clk), .CDN(n119), 
        .Q(\data[2][8] ) );
  EDFCNQD1 \data_reg[2][7]  ( .D(sample_in[7]), .E(n5), .CP(clk), .CDN(n119), 
        .Q(\data[2][7] ) );
  EDFCNQD1 \data_reg[2][6]  ( .D(sample_in[6]), .E(n5), .CP(clk), .CDN(n119), 
        .Q(\data[2][6] ) );
  EDFCNQD1 \data_reg[2][5]  ( .D(sample_in[5]), .E(n5), .CP(clk), .CDN(n120), 
        .Q(\data[2][5] ) );
  EDFCNQD1 \data_reg[2][4]  ( .D(sample_in[4]), .E(n5), .CP(clk), .CDN(n120), 
        .Q(\data[2][4] ) );
  EDFCNQD1 \data_reg[2][3]  ( .D(sample_in[3]), .E(n5), .CP(clk), .CDN(n120), 
        .Q(\data[2][3] ) );
  EDFCNQD1 \data_reg[2][2]  ( .D(sample_in[2]), .E(n5), .CP(clk), .CDN(n120), 
        .Q(\data[2][2] ) );
  EDFCNQD1 \data_reg[2][1]  ( .D(sample_in[1]), .E(n5), .CP(clk), .CDN(n120), 
        .Q(\data[2][1] ) );
  EDFCNQD1 \data_reg[2][0]  ( .D(sample_in[0]), .E(n5), .CP(clk), .CDN(n120), 
        .Q(\data[2][0] ) );
  EDFCNQD1 \data_reg[7][9]  ( .D(sample_in[9]), .E(n32), .CP(clk), .CDN(n111), 
        .Q(\data[7][9] ) );
  EDFCNQD1 \data_reg[7][8]  ( .D(sample_in[8]), .E(n32), .CP(clk), .CDN(n111), 
        .Q(\data[7][8] ) );
  EDFCNQD1 \data_reg[7][7]  ( .D(sample_in[7]), .E(n32), .CP(clk), .CDN(n113), 
        .Q(\data[7][7] ) );
  EDFCNQD1 \data_reg[7][6]  ( .D(sample_in[6]), .E(n32), .CP(clk), .CDN(n113), 
        .Q(\data[7][6] ) );
  EDFCNQD1 \data_reg[7][5]  ( .D(sample_in[5]), .E(n32), .CP(clk), .CDN(n113), 
        .Q(\data[7][5] ) );
  EDFCNQD1 \data_reg[7][4]  ( .D(sample_in[4]), .E(n32), .CP(clk), .CDN(n113), 
        .Q(\data[7][4] ) );
  EDFCNQD1 \data_reg[7][3]  ( .D(sample_in[3]), .E(n32), .CP(clk), .CDN(n113), 
        .Q(\data[7][3] ) );
  EDFCNQD1 \data_reg[7][2]  ( .D(sample_in[2]), .E(n32), .CP(clk), .CDN(n113), 
        .Q(\data[7][2] ) );
  EDFCNQD1 \data_reg[7][1]  ( .D(sample_in[1]), .E(n32), .CP(clk), .CDN(n113), 
        .Q(\data[7][1] ) );
  EDFCNQD1 \data_reg[7][0]  ( .D(sample_in[0]), .E(n32), .CP(clk), .CDN(n113), 
        .Q(\data[7][0] ) );
  EDFCNQD1 \data_reg[4][9]  ( .D(sample_in[9]), .E(n33), .CP(clk), .CDN(n118), 
        .Q(\data[4][9] ) );
  EDFCNQD1 \data_reg[4][8]  ( .D(sample_in[8]), .E(n33), .CP(clk), .CDN(n118), 
        .Q(\data[4][8] ) );
  EDFCNQD1 \data_reg[4][7]  ( .D(sample_in[7]), .E(n33), .CP(clk), .CDN(n118), 
        .Q(\data[4][7] ) );
  EDFCNQD1 \data_reg[4][6]  ( .D(sample_in[6]), .E(n33), .CP(clk), .CDN(n118), 
        .Q(\data[4][6] ) );
  EDFCNQD1 \data_reg[4][5]  ( .D(sample_in[5]), .E(n33), .CP(clk), .CDN(n118), 
        .Q(\data[4][5] ) );
  EDFCNQD1 \data_reg[4][4]  ( .D(sample_in[4]), .E(n33), .CP(clk), .CDN(n118), 
        .Q(\data[4][4] ) );
  EDFCNQD1 \data_reg[4][3]  ( .D(sample_in[3]), .E(n33), .CP(clk), .CDN(n118), 
        .Q(\data[4][3] ) );
  EDFCNQD1 \data_reg[4][2]  ( .D(sample_in[2]), .E(n33), .CP(clk), .CDN(n118), 
        .Q(\data[4][2] ) );
  EDFCNQD1 \data_reg[4][1]  ( .D(sample_in[1]), .E(n33), .CP(clk), .CDN(n118), 
        .Q(\data[4][1] ) );
  EDFCNQD1 \data_reg[4][0]  ( .D(sample_in[0]), .E(n33), .CP(clk), .CDN(n118), 
        .Q(\data[4][0] ) );
  EDFCNQD1 \data_reg[1][9]  ( .D(sample_in[9]), .E(n4), .CP(clk), .CDN(n120), 
        .Q(\data[1][9] ) );
  EDFCNQD1 \data_reg[1][8]  ( .D(sample_in[8]), .E(n4), .CP(clk), .CDN(n120), 
        .Q(\data[1][8] ) );
  EDFCNQD1 \data_reg[1][7]  ( .D(sample_in[7]), .E(n4), .CP(clk), .CDN(n120), 
        .Q(\data[1][7] ) );
  EDFCNQD1 \data_reg[1][6]  ( .D(sample_in[6]), .E(n4), .CP(clk), .CDN(n120), 
        .Q(\data[1][6] ) );
  EDFCNQD1 \data_reg[1][5]  ( .D(sample_in[5]), .E(n4), .CP(clk), .CDN(n120), 
        .Q(\data[1][5] ) );
  EDFCNQD1 \data_reg[1][4]  ( .D(sample_in[4]), .E(n4), .CP(clk), .CDN(n120), 
        .Q(\data[1][4] ) );
  EDFCNQD1 \data_reg[1][3]  ( .D(sample_in[3]), .E(n4), .CP(clk), .CDN(n120), 
        .Q(\data[1][3] ) );
  EDFCNQD1 \data_reg[1][2]  ( .D(sample_in[2]), .E(n4), .CP(clk), .CDN(n121), 
        .Q(\data[1][2] ) );
  EDFCNQD1 \data_reg[1][1]  ( .D(sample_in[1]), .E(n4), .CP(clk), .CDN(n121), 
        .Q(\data[1][1] ) );
  EDFCNQD1 \data_reg[1][0]  ( .D(sample_in[0]), .E(n4), .CP(clk), .CDN(n121), 
        .Q(\data[1][0] ) );
  EDFCNQD1 \data_reg[6][9]  ( .D(sample_in[9]), .E(n11), .CP(clk), .CDN(n113), 
        .Q(\data[6][9] ) );
  EDFCNQD1 \data_reg[6][8]  ( .D(sample_in[8]), .E(n11), .CP(clk), .CDN(n113), 
        .Q(\data[6][8] ) );
  EDFCNQD1 \data_reg[6][7]  ( .D(sample_in[7]), .E(n11), .CP(clk), .CDN(n113), 
        .Q(\data[6][7] ) );
  EDFCNQD1 \data_reg[6][6]  ( .D(sample_in[6]), .E(n11), .CP(clk), .CDN(n113), 
        .Q(\data[6][6] ) );
  EDFCNQD1 \data_reg[6][5]  ( .D(sample_in[5]), .E(n11), .CP(clk), .CDN(n113), 
        .Q(\data[6][5] ) );
  EDFCNQD1 \data_reg[6][4]  ( .D(sample_in[4]), .E(n11), .CP(clk), .CDN(n116), 
        .Q(\data[6][4] ) );
  EDFCNQD1 \data_reg[6][3]  ( .D(sample_in[3]), .E(n11), .CP(clk), .CDN(n116), 
        .Q(\data[6][3] ) );
  EDFCNQD1 \data_reg[6][2]  ( .D(sample_in[2]), .E(n11), .CP(clk), .CDN(n116), 
        .Q(\data[6][2] ) );
  EDFCNQD1 \data_reg[6][1]  ( .D(sample_in[1]), .E(n11), .CP(clk), .CDN(n116), 
        .Q(\data[6][1] ) );
  EDFCNQD1 \data_reg[6][0]  ( .D(sample_in[0]), .E(n11), .CP(clk), .CDN(n116), 
        .Q(\data[6][0] ) );
  EDFCNQD1 \data_reg[3][9]  ( .D(sample_in[9]), .E(n6), .CP(clk), .CDN(n118), 
        .Q(\data[3][9] ) );
  EDFCNQD1 \data_reg[3][8]  ( .D(sample_in[8]), .E(n6), .CP(clk), .CDN(n119), 
        .Q(\data[3][8] ) );
  EDFCNQD1 \data_reg[3][7]  ( .D(sample_in[7]), .E(n6), .CP(clk), .CDN(n119), 
        .Q(\data[3][7] ) );
  EDFCNQD1 \data_reg[3][6]  ( .D(sample_in[6]), .E(n6), .CP(clk), .CDN(n119), 
        .Q(\data[3][6] ) );
  EDFCNQD1 \data_reg[3][5]  ( .D(sample_in[5]), .E(n6), .CP(clk), .CDN(n119), 
        .Q(\data[3][5] ) );
  EDFCNQD1 \data_reg[3][4]  ( .D(sample_in[4]), .E(n6), .CP(clk), .CDN(n119), 
        .Q(\data[3][4] ) );
  EDFCNQD1 \data_reg[3][3]  ( .D(sample_in[3]), .E(n6), .CP(clk), .CDN(n119), 
        .Q(\data[3][3] ) );
  EDFCNQD1 \data_reg[3][2]  ( .D(sample_in[2]), .E(n6), .CP(clk), .CDN(n119), 
        .Q(\data[3][2] ) );
  EDFCNQD1 \data_reg[3][1]  ( .D(sample_in[1]), .E(n6), .CP(clk), .CDN(n119), 
        .Q(\data[3][1] ) );
  EDFCNQD1 \data_reg[3][0]  ( .D(sample_in[0]), .E(n6), .CP(clk), .CDN(n119), 
        .Q(\data[3][0] ) );
  EDFCNQD1 \data_reg[0][9]  ( .D(sample_in[9]), .E(n3), .CP(clk), .CDN(n121), 
        .Q(\data[0][9] ) );
  EDFCNQD1 \data_reg[0][8]  ( .D(sample_in[8]), .E(n3), .CP(clk), .CDN(n121), 
        .Q(\data[0][8] ) );
  EDFCNQD1 \data_reg[0][7]  ( .D(sample_in[7]), .E(n3), .CP(clk), .CDN(n121), 
        .Q(\data[0][7] ) );
  EDFCNQD1 \data_reg[0][6]  ( .D(sample_in[6]), .E(n3), .CP(clk), .CDN(n121), 
        .Q(\data[0][6] ) );
  EDFCNQD1 \data_reg[0][5]  ( .D(sample_in[5]), .E(n3), .CP(clk), .CDN(n121), 
        .Q(\data[0][5] ) );
  EDFCNQD1 \data_reg[0][4]  ( .D(sample_in[4]), .E(n3), .CP(clk), .CDN(n121), 
        .Q(\data[0][4] ) );
  EDFCNQD1 \data_reg[0][3]  ( .D(sample_in[3]), .E(n3), .CP(clk), .CDN(n121), 
        .Q(\data[0][3] ) );
  EDFCNQD1 \data_reg[0][2]  ( .D(sample_in[2]), .E(n3), .CP(clk), .CDN(n121), 
        .Q(\data[0][2] ) );
  EDFCNQD1 \data_reg[0][1]  ( .D(sample_in[1]), .E(n3), .CP(clk), .CDN(n121), 
        .Q(\data[0][1] ) );
  EDFCNQD1 \data_reg[0][0]  ( .D(sample_in[0]), .E(n3), .CP(clk), .CDN(n121), 
        .Q(\data[0][0] ) );
  EDFCNQD1 \data_reg[9][9]  ( .D(sample_in[9]), .E(n9), .CP(clk), .CDN(n109), 
        .Q(\data[9][9] ) );
  EDFCNQD1 \data_reg[9][8]  ( .D(sample_in[8]), .E(n9), .CP(clk), .CDN(n109), 
        .Q(\data[9][8] ) );
  EDFCNQD1 \data_reg[9][7]  ( .D(sample_in[7]), .E(n9), .CP(clk), .CDN(n109), 
        .Q(\data[9][7] ) );
  EDFCNQD1 \data_reg[9][6]  ( .D(sample_in[6]), .E(n9), .CP(clk), .CDN(n109), 
        .Q(\data[9][6] ) );
  EDFCNQD1 \data_reg[9][5]  ( .D(sample_in[5]), .E(n9), .CP(clk), .CDN(n109), 
        .Q(\data[9][5] ) );
  EDFCNQD1 \data_reg[9][4]  ( .D(sample_in[4]), .E(n9), .CP(clk), .CDN(n109), 
        .Q(\data[9][4] ) );
  EDFCNQD1 \data_reg[9][3]  ( .D(sample_in[3]), .E(n9), .CP(clk), .CDN(n109), 
        .Q(\data[9][3] ) );
  EDFCNQD1 \data_reg[9][2]  ( .D(sample_in[2]), .E(n9), .CP(clk), .CDN(n109), 
        .Q(\data[9][2] ) );
  EDFCNQD1 \data_reg[9][1]  ( .D(sample_in[1]), .E(n9), .CP(clk), .CDN(n109), 
        .Q(\data[9][1] ) );
  EDFCNQD1 \data_reg[9][0]  ( .D(sample_in[0]), .E(n9), .CP(clk), .CDN(n111), 
        .Q(\data[9][0] ) );
  EDFCNQD1 \data_reg[10][9]  ( .D(sample_in[9]), .E(n10), .CP(clk), .CDN(n106), 
        .Q(\data[10][9] ) );
  EDFCNQD1 \data_reg[10][8]  ( .D(sample_in[8]), .E(n10), .CP(clk), .CDN(n106), 
        .Q(\data[10][8] ) );
  EDFCNQD1 \data_reg[10][7]  ( .D(sample_in[7]), .E(n10), .CP(clk), .CDN(n106), 
        .Q(\data[10][7] ) );
  EDFCNQD1 \data_reg[10][6]  ( .D(sample_in[6]), .E(n10), .CP(clk), .CDN(n106), 
        .Q(\data[10][6] ) );
  EDFCNQD1 \data_reg[10][5]  ( .D(sample_in[5]), .E(n10), .CP(clk), .CDN(n106), 
        .Q(\data[10][5] ) );
  EDFCNQD1 \data_reg[10][4]  ( .D(sample_in[4]), .E(n10), .CP(clk), .CDN(n106), 
        .Q(\data[10][4] ) );
  EDFCNQD1 \data_reg[10][3]  ( .D(sample_in[3]), .E(n10), .CP(clk), .CDN(n109), 
        .Q(\data[10][3] ) );
  EDFCNQD1 \data_reg[10][2]  ( .D(sample_in[2]), .E(n10), .CP(clk), .CDN(n109), 
        .Q(\data[10][2] ) );
  EDFCNQD1 \data_reg[10][1]  ( .D(sample_in[1]), .E(n10), .CP(clk), .CDN(n109), 
        .Q(\data[10][1] ) );
  EDFCNQD1 \data_reg[10][0]  ( .D(sample_in[0]), .E(n10), .CP(clk), .CDN(n109), 
        .Q(\data[10][0] ) );
  EDFCND1 \data_reg[12][9]  ( .D(sample_in[9]), .E(n35), .CP(clk), .CDN(n37), 
        .QN(n12) );
  EDFCND1 \data_reg[12][8]  ( .D(sample_in[8]), .E(n35), .CP(clk), .CDN(n37), 
        .QN(n13) );
  EDFCND1 \data_reg[12][7]  ( .D(sample_in[7]), .E(n35), .CP(clk), .CDN(n37), 
        .QN(n14) );
  EDFCND1 \data_reg[12][6]  ( .D(sample_in[6]), .E(n35), .CP(clk), .CDN(n37), 
        .QN(n15) );
  EDFCND1 \data_reg[12][5]  ( .D(sample_in[5]), .E(n35), .CP(clk), .CDN(n37), 
        .QN(n16) );
  EDFCND1 \data_reg[12][4]  ( .D(sample_in[4]), .E(n35), .CP(clk), .CDN(n37), 
        .QN(n17) );
  EDFCND1 \data_reg[12][3]  ( .D(sample_in[3]), .E(n35), .CP(clk), .CDN(n37), 
        .QN(n18) );
  EDFCND1 \data_reg[12][2]  ( .D(sample_in[2]), .E(n35), .CP(clk), .CDN(n37), 
        .QN(n19) );
  EDFCND1 \data_reg[12][1]  ( .D(sample_in[1]), .E(n35), .CP(clk), .CDN(n37), 
        .QN(n20) );
  EDFCND1 \data_reg[12][0]  ( .D(sample_in[0]), .E(n35), .CP(clk), .CDN(n37), 
        .QN(n21) );
  EDFCND1 \data_reg[11][9]  ( .D(sample_in[9]), .E(n7), .CP(clk), .CDN(n37), 
        .QN(n22) );
  EDFCND1 \data_reg[11][8]  ( .D(sample_in[8]), .E(n7), .CP(clk), .CDN(n37), 
        .QN(n23) );
  EDFCND1 \data_reg[11][7]  ( .D(sample_in[7]), .E(n7), .CP(clk), .CDN(n37), 
        .QN(n24) );
  EDFCND1 \data_reg[11][6]  ( .D(sample_in[6]), .E(n7), .CP(clk), .CDN(n106), 
        .QN(n25) );
  EDFCND1 \data_reg[11][5]  ( .D(sample_in[5]), .E(n7), .CP(clk), .CDN(n106), 
        .QN(n26) );
  EDFCND1 \data_reg[11][4]  ( .D(sample_in[4]), .E(n7), .CP(clk), .CDN(n106), 
        .QN(n27) );
  EDFCND1 \data_reg[11][3]  ( .D(sample_in[3]), .E(n7), .CP(clk), .CDN(n106), 
        .QN(n28) );
  EDFCND1 \data_reg[11][2]  ( .D(sample_in[2]), .E(n7), .CP(clk), .CDN(n106), 
        .QN(n29) );
  EDFCND1 \data_reg[11][1]  ( .D(sample_in[1]), .E(n7), .CP(clk), .CDN(n106), 
        .QN(n30) );
  EDFCND1 \data_reg[11][0]  ( .D(sample_in[0]), .E(n7), .CP(clk), .CDN(n106), 
        .QN(n31) );
  ND2D1 U2 ( .A1(read_address[3]), .A2(read_address[2]), .ZN(n46) );
  AOI222D1 U3 ( .A1(\data[3][3] ), .A2(n50), .B1(\data[5][3] ), .B2(n51), .C1(
        \data[4][3] ), .C2(n36), .ZN(n82) );
  AOI222D1 U4 ( .A1(\data[3][1] ), .A2(n50), .B1(\data[5][1] ), .B2(n51), .C1(
        \data[4][1] ), .C2(n36), .ZN(n92) );
  AOI222D1 U5 ( .A1(\data[0][3] ), .A2(n53), .B1(\data[2][3] ), .B2(n54), .C1(
        \data[1][3] ), .C2(n55), .ZN(n81) );
  AOI222D1 U6 ( .A1(\data[0][1] ), .A2(n53), .B1(\data[2][1] ), .B2(n54), .C1(
        \data[1][1] ), .C2(n55), .ZN(n91) );
  AOI222D1 U7 ( .A1(\data[0][7] ), .A2(n53), .B1(\data[2][7] ), .B2(n54), .C1(
        \data[1][7] ), .C2(n55), .ZN(n61) );
  AOI222D1 U8 ( .A1(\data[0][5] ), .A2(n53), .B1(\data[2][5] ), .B2(n54), .C1(
        \data[1][5] ), .C2(n55), .ZN(n71) );
  AN2D1 U9 ( .A1(n130), .A2(read_address[0]), .Z(n102) );
  AN2D0 U10 ( .A1(n105), .A2(n103), .Z(n54) );
  INR2D1 U11 ( .A1(n101), .B1(n129), .ZN(n49) );
  INR2D1 U12 ( .A1(n101), .B1(n129), .ZN(n1) );
  AN2D0 U13 ( .A1(read_address[1]), .A2(read_address[0]), .Z(n101) );
  ND2D1 U14 ( .A1(n101), .A2(read_address[3]), .ZN(n2) );
  NR2D0 U15 ( .A1(read_address[0]), .A2(read_address[1]), .ZN(n104) );
  NR2D0 U16 ( .A1(n130), .A2(read_address[0]), .ZN(n103) );
  ND2D0 U17 ( .A1(n101), .A2(read_address[3]), .ZN(n45) );
  INVD1 U18 ( .I(read_address[1]), .ZN(n130) );
  AN2D0 U19 ( .A1(n102), .A2(read_address[3]), .Z(n43) );
  INVD0 U20 ( .I(read_address[2]), .ZN(n129) );
  AN2D0 U21 ( .A1(n105), .A2(n101), .Z(n50) );
  AN2D0 U22 ( .A1(n105), .A2(n104), .Z(n53) );
  AN2D0 U23 ( .A1(n105), .A2(n102), .Z(n55) );
  AN2D0 U24 ( .A1(n107), .A2(n108), .Z(n3) );
  AN2D0 U25 ( .A1(n110), .A2(n107), .Z(n4) );
  AN2D0 U26 ( .A1(n112), .A2(n107), .Z(n5) );
  AN2D0 U27 ( .A1(n114), .A2(n107), .Z(n6) );
  INVD1 U28 ( .I(write_enable), .ZN(n128) );
  AN2D0 U29 ( .A1(n122), .A2(n114), .Z(n7) );
  AN2D0 U30 ( .A1(n122), .A2(n108), .Z(n8) );
  AN2D0 U31 ( .A1(n122), .A2(n110), .Z(n9) );
  AN2D0 U32 ( .A1(n122), .A2(n112), .Z(n10) );
  AN2D0 U33 ( .A1(n117), .A2(n112), .Z(n11) );
  AN2D0 U34 ( .A1(n117), .A2(n114), .Z(n32) );
  AN2D0 U35 ( .A1(n117), .A2(n108), .Z(n33) );
  AN2D0 U36 ( .A1(n117), .A2(n110), .Z(n34) );
  BUFFD0 U37 ( .I(n125), .Z(n106) );
  BUFFD0 U38 ( .I(n123), .Z(n121) );
  BUFFD0 U39 ( .I(n123), .Z(n120) );
  BUFFD0 U40 ( .I(n123), .Z(n119) );
  BUFFD0 U41 ( .I(n124), .Z(n118) );
  BUFFD0 U42 ( .I(n124), .Z(n116) );
  BUFFD0 U43 ( .I(n124), .Z(n113) );
  BUFFD0 U44 ( .I(n125), .Z(n111) );
  BUFFD0 U45 ( .I(n125), .Z(n109) );
  NR2D1 U46 ( .A1(read_address[2]), .A2(read_address[3]), .ZN(n105) );
  AOI222D0 U47 ( .A1(\data[0][9] ), .A2(n53), .B1(\data[2][9] ), .B2(n54), 
        .C1(\data[1][9] ), .C2(n55), .ZN(n38) );
  AOI222D0 U48 ( .A1(\data[0][2] ), .A2(n53), .B1(\data[2][2] ), .B2(n54), 
        .C1(\data[1][2] ), .C2(n55), .ZN(n86) );
  AOI222D0 U49 ( .A1(\data[0][4] ), .A2(n53), .B1(\data[2][4] ), .B2(n54), 
        .C1(\data[1][4] ), .C2(n55), .ZN(n76) );
  AOI222D0 U50 ( .A1(\data[0][6] ), .A2(n53), .B1(\data[2][6] ), .B2(n54), 
        .C1(\data[1][6] ), .C2(n55), .ZN(n66) );
  AOI222D0 U51 ( .A1(\data[0][0] ), .A2(n53), .B1(\data[2][0] ), .B2(n54), 
        .C1(\data[1][0] ), .C2(n55), .ZN(n96) );
  AOI222D0 U52 ( .A1(\data[0][8] ), .A2(n53), .B1(\data[2][8] ), .B2(n54), 
        .C1(\data[1][8] ), .C2(n55), .ZN(n56) );
  AOI222D0 U53 ( .A1(\data[6][0] ), .A2(n47), .B1(\data[8][0] ), .B2(n48), 
        .C1(\data[7][0] ), .C2(n1), .ZN(n98) );
  ND4D1 U54 ( .A1(n93), .A2(n92), .A3(n91), .A4(n94), .ZN(sample_out[1]) );
  AOI221D0 U55 ( .A1(\data[10][1] ), .A2(n42), .B1(\data[9][1] ), .B2(n43), 
        .C(n95), .ZN(n94) );
  AOI222D0 U56 ( .A1(\data[6][1] ), .A2(n47), .B1(\data[8][1] ), .B2(n48), 
        .C1(\data[7][1] ), .C2(n1), .ZN(n93) );
  OAI22D0 U57 ( .A1(n2), .A2(n26), .B1(n46), .B2(n16), .ZN(n75) );
  OAI22D0 U58 ( .A1(n45), .A2(n30), .B1(n46), .B2(n20), .ZN(n95) );
  OAI22D0 U59 ( .A1(n2), .A2(n31), .B1(n46), .B2(n21), .ZN(n100) );
  OAI22D0 U60 ( .A1(n2), .A2(n22), .B1(n46), .B2(n12), .ZN(n44) );
  OAI22D0 U61 ( .A1(n2), .A2(n29), .B1(n46), .B2(n19), .ZN(n90) );
  OAI22D0 U62 ( .A1(n2), .A2(n28), .B1(n46), .B2(n18), .ZN(n85) );
  OAI22D0 U63 ( .A1(n2), .A2(n27), .B1(n46), .B2(n17), .ZN(n80) );
  OAI22D0 U64 ( .A1(n2), .A2(n25), .B1(n46), .B2(n15), .ZN(n70) );
  OAI22D0 U65 ( .A1(n2), .A2(n24), .B1(n46), .B2(n14), .ZN(n65) );
  OAI22D0 U66 ( .A1(n2), .A2(n23), .B1(n46), .B2(n13), .ZN(n60) );
  ND4D1 U67 ( .A1(n74), .A2(n72), .A3(n73), .A4(n71), .ZN(sample_out[5]) );
  AOI221D0 U68 ( .A1(\data[10][5] ), .A2(n42), .B1(\data[9][5] ), .B2(n43), 
        .C(n75), .ZN(n74) );
  AOI222D0 U69 ( .A1(\data[3][5] ), .A2(n50), .B1(\data[5][5] ), .B2(n51), 
        .C1(\data[4][5] ), .C2(n36), .ZN(n72) );
  AOI222D0 U70 ( .A1(\data[6][5] ), .A2(n47), .B1(\data[8][5] ), .B2(n48), 
        .C1(\data[7][5] ), .C2(n49), .ZN(n73) );
  ND4D1 U71 ( .A1(n61), .A2(n62), .A3(n63), .A4(n64), .ZN(sample_out[7]) );
  AOI221D0 U72 ( .A1(\data[10][7] ), .A2(n42), .B1(\data[9][7] ), .B2(n43), 
        .C(n65), .ZN(n64) );
  AOI222D0 U73 ( .A1(\data[3][7] ), .A2(n50), .B1(\data[5][7] ), .B2(n51), 
        .C1(\data[4][7] ), .C2(n36), .ZN(n62) );
  AOI222D0 U74 ( .A1(\data[6][7] ), .A2(n47), .B1(\data[8][7] ), .B2(n48), 
        .C1(\data[7][7] ), .C2(n1), .ZN(n63) );
  ND4D1 U75 ( .A1(n38), .A2(n39), .A3(n40), .A4(n41), .ZN(sample_out[9]) );
  AOI221D0 U76 ( .A1(\data[10][9] ), .A2(n42), .B1(\data[9][9] ), .B2(n43), 
        .C(n44), .ZN(n41) );
  AOI222D0 U77 ( .A1(\data[3][9] ), .A2(n50), .B1(\data[5][9] ), .B2(n51), 
        .C1(\data[4][9] ), .C2(n36), .ZN(n39) );
  AOI222D0 U78 ( .A1(\data[6][9] ), .A2(n47), .B1(\data[8][9] ), .B2(n48), 
        .C1(\data[7][9] ), .C2(n49), .ZN(n40) );
  ND4D1 U79 ( .A1(n81), .A2(n82), .A3(n83), .A4(n84), .ZN(sample_out[3]) );
  AOI221D0 U80 ( .A1(\data[10][3] ), .A2(n42), .B1(\data[9][3] ), .B2(n43), 
        .C(n85), .ZN(n84) );
  AOI222D0 U81 ( .A1(\data[6][3] ), .A2(n47), .B1(\data[8][3] ), .B2(n48), 
        .C1(\data[7][3] ), .C2(n49), .ZN(n83) );
  ND4D1 U82 ( .A1(n76), .A2(n77), .A3(n78), .A4(n79), .ZN(sample_out[4]) );
  AOI221D0 U83 ( .A1(\data[10][4] ), .A2(n42), .B1(\data[9][4] ), .B2(n43), 
        .C(n80), .ZN(n79) );
  AOI222D0 U84 ( .A1(\data[3][4] ), .A2(n50), .B1(\data[5][4] ), .B2(n51), 
        .C1(\data[4][4] ), .C2(n36), .ZN(n77) );
  AOI222D0 U85 ( .A1(\data[6][4] ), .A2(n47), .B1(\data[8][4] ), .B2(n48), 
        .C1(\data[7][4] ), .C2(n49), .ZN(n78) );
  ND4D1 U86 ( .A1(n86), .A2(n87), .A3(n88), .A4(n89), .ZN(sample_out[2]) );
  AOI221D0 U87 ( .A1(\data[10][2] ), .A2(n42), .B1(\data[9][2] ), .B2(n43), 
        .C(n90), .ZN(n89) );
  AOI222D0 U88 ( .A1(\data[3][2] ), .A2(n50), .B1(\data[5][2] ), .B2(n51), 
        .C1(\data[4][2] ), .C2(n36), .ZN(n87) );
  AOI222D0 U89 ( .A1(\data[6][2] ), .A2(n47), .B1(\data[8][2] ), .B2(n48), 
        .C1(\data[7][2] ), .C2(n49), .ZN(n88) );
  ND4D1 U90 ( .A1(n66), .A2(n67), .A3(n68), .A4(n69), .ZN(sample_out[6]) );
  AOI221D0 U91 ( .A1(\data[10][6] ), .A2(n42), .B1(\data[9][6] ), .B2(n43), 
        .C(n70), .ZN(n69) );
  AOI222D0 U92 ( .A1(\data[3][6] ), .A2(n50), .B1(\data[5][6] ), .B2(n51), 
        .C1(\data[4][6] ), .C2(n36), .ZN(n67) );
  AOI222D0 U93 ( .A1(\data[6][6] ), .A2(n47), .B1(\data[8][6] ), .B2(n48), 
        .C1(\data[7][6] ), .C2(n1), .ZN(n68) );
  ND4D1 U94 ( .A1(n56), .A2(n57), .A3(n58), .A4(n59), .ZN(sample_out[8]) );
  AOI221D0 U95 ( .A1(\data[10][8] ), .A2(n42), .B1(\data[9][8] ), .B2(n43), 
        .C(n60), .ZN(n59) );
  AOI222D0 U96 ( .A1(\data[3][8] ), .A2(n50), .B1(\data[5][8] ), .B2(n51), 
        .C1(\data[4][8] ), .C2(n36), .ZN(n57) );
  AOI222D0 U97 ( .A1(\data[6][8] ), .A2(n47), .B1(\data[8][8] ), .B2(n48), 
        .C1(\data[7][8] ), .C2(n1), .ZN(n58) );
  AN3D1 U98 ( .A1(read_address[3]), .A2(n129), .A3(n104), .Z(n48) );
  AN2D0 U99 ( .A1(n103), .A2(read_address[2]), .Z(n47) );
  AN2D0 U100 ( .A1(n103), .A2(read_address[3]), .Z(n42) );
  AN2D0 U101 ( .A1(n102), .A2(read_address[2]), .Z(n51) );
  ND4D1 U102 ( .A1(n96), .A2(n97), .A3(n98), .A4(n99), .ZN(sample_out[0]) );
  AOI221D0 U103 ( .A1(\data[10][0] ), .A2(n42), .B1(\data[9][0] ), .B2(n43), 
        .C(n100), .ZN(n99) );
  AOI222D0 U104 ( .A1(\data[3][0] ), .A2(n50), .B1(\data[5][0] ), .B2(n51), 
        .C1(\data[4][0] ), .C2(n36), .ZN(n97) );
  BUFFD1 U105 ( .I(n52), .Z(n36) );
  INR3D0 U106 ( .A1(n104), .B1(n129), .B2(read_address[3]), .ZN(n52) );
  INR2D1 U107 ( .A1(n115), .B1(write_address[2]), .ZN(n107) );
  NR2D1 U108 ( .A1(n128), .A2(write_address[3]), .ZN(n115) );
  INR3D0 U109 ( .A1(write_address[3]), .B1(n128), .B2(write_address[2]), .ZN(
        n122) );
  NR2D1 U110 ( .A1(write_address[0]), .A2(write_address[1]), .ZN(n108) );
  NR2D1 U111 ( .A1(n127), .A2(write_address[1]), .ZN(n110) );
  AN4D1 U112 ( .A1(write_address[3]), .A2(write_address[2]), .A3(n108), .A4(
        write_enable), .Z(n35) );
  AN2D0 U113 ( .A1(write_address[2]), .A2(n115), .Z(n117) );
  AN2D0 U114 ( .A1(write_address[1]), .A2(n127), .Z(n112) );
  AN2D0 U115 ( .A1(write_address[1]), .A2(write_address[0]), .Z(n114) );
  INVD1 U116 ( .I(write_address[0]), .ZN(n127) );
  BUFFD0 U117 ( .I(n126), .Z(n37) );
  BUFFD0 U118 ( .I(nrst), .Z(n126) );
  BUFFD0 U119 ( .I(nrst), .Z(n123) );
  BUFFD0 U120 ( .I(nrst), .Z(n124) );
  BUFFD0 U121 ( .I(nrst), .Z(n125) );
endmodule


module serial_fir ( clk, nrst, sample_in, new_sample, \output , output_ready
 );
  input [9:0] sample_in;
  output [23:0] \output ;
  input clk, nrst, new_sample;
  output output_ready;
  wire   n2, nrst_mac, write_enable;
  wire   [9:0] sample_out;
  wire   [9:0] coefficient;
  wire   [23:0] result;
  wire   [3:0] write_address;
  wire   [3:0] read_address;
  wire   [3:0] coefficient_address;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3;

  arithmetic_unit ARITHMETIC_UNIT_1 ( .clk(clk), .nrst(nrst), .nrst_mac(
        nrst_mac), .sample_in(sample_out), .coefficient({1'b0, 1'b0, 1'b0, 
        coefficient[6:1], 1'b1}), .result(result) );
  fsm FSM_1 ( .nrst(nrst), .clk(clk), .new_sample(new_sample), .write_enable(
        write_enable), .write_address(write_address), .read_address(
        read_address), .coefficient_address(coefficient_address), 
        .output_ready(n2), .nrst_mac(nrst_mac) );
  rom_coefficients ROM_COEFFICIENTS_1 ( .coeff_addr(coefficient_address), 
        .coeff_out({SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, coefficient[6:1], SYNOPSYS_UNCONNECTED__3})
         );
  delay_line DELAY_LINE_1 ( .clk(clk), .nrst(nrst), .new_sample(new_sample), 
        .write_enable(write_enable), .write_address(write_address), 
        .read_address(read_address), .sample_in(sample_in), .sample_out(
        sample_out) );
  BUFFD0 U26 ( .I(n2), .Z(output_ready) );
  AN2D0 U27 ( .A1(result[12]), .A2(output_ready), .Z(\output [12]) );
  AN2D0 U28 ( .A1(result[0]), .A2(output_ready), .Z(\output [0]) );
  AN2D0 U29 ( .A1(result[1]), .A2(output_ready), .Z(\output [1]) );
  AN2D0 U30 ( .A1(result[2]), .A2(output_ready), .Z(\output [2]) );
  AN2D0 U31 ( .A1(result[3]), .A2(output_ready), .Z(\output [3]) );
  AN2D0 U32 ( .A1(result[4]), .A2(output_ready), .Z(\output [4]) );
  AN2D0 U33 ( .A1(result[5]), .A2(output_ready), .Z(\output [5]) );
  AN2D0 U34 ( .A1(result[6]), .A2(output_ready), .Z(\output [6]) );
  AN2D0 U35 ( .A1(result[7]), .A2(output_ready), .Z(\output [7]) );
  AN2D0 U36 ( .A1(result[8]), .A2(output_ready), .Z(\output [8]) );
  AN2D0 U37 ( .A1(result[9]), .A2(output_ready), .Z(\output [9]) );
  AN2D0 U38 ( .A1(result[10]), .A2(output_ready), .Z(\output [10]) );
  AN2D0 U39 ( .A1(result[11]), .A2(output_ready), .Z(\output [11]) );
  AN2D0 U40 ( .A1(result[13]), .A2(output_ready), .Z(\output [13]) );
  AN2D0 U41 ( .A1(result[14]), .A2(output_ready), .Z(\output [14]) );
  AN2D0 U42 ( .A1(result[15]), .A2(output_ready), .Z(\output [15]) );
  AN2D0 U43 ( .A1(result[16]), .A2(output_ready), .Z(\output [16]) );
  AN2D0 U44 ( .A1(result[17]), .A2(output_ready), .Z(\output [17]) );
  AN2D0 U45 ( .A1(result[18]), .A2(output_ready), .Z(\output [18]) );
  AN2D0 U46 ( .A1(result[19]), .A2(output_ready), .Z(\output [19]) );
  AN2D0 U47 ( .A1(result[20]), .A2(output_ready), .Z(\output [20]) );
  AN2D0 U48 ( .A1(result[21]), .A2(output_ready), .Z(\output [21]) );
  AN2D0 U49 ( .A1(result[22]), .A2(output_ready), .Z(\output [22]) );
  AN2D0 U50 ( .A1(result[23]), .A2(output_ready), .Z(\output [23]) );
endmodule

