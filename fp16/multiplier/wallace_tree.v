module wallace_tree(input clk,input [10:0] a,input [10:0] b,output reg [21:0] out);
wire p00,p01,p02,p03,p04,p05,p06,p07,p08,p09,p010;
wire p10,p11,p12,p13,p14,p15,p16,p17,p18,p19,p110;
wire p20,p21,p22,p23,p24,p25,p26,p27,p28,p29,p210;
wire p30,p31,p32,p33,p34,p35,p36,p37,p38,p39,p310;
wire p40,p41,p42,p43,p44,p45,p46,p47,p48,p49,p410;
wire p50,p51,p52,p53,p54,p55,p56,p57,p58,p59,p510;
wire p60,p61,p62,p63,p64,p65,p66,p67,p68,p69,p610;
wire p70,p71,p72,p73,p74,p75,p76,p77,p78,p79,p710;
wire p80,p81,p82,p83,p84,p85,p86,p87,p88,p89,p810;
wire p90,p91,p92,p93,p94,p95,p96,p97,p98,p99,p910;
wire p100,p101,p102,p103,p104,p105,p106,p107,p108,p109,p1010;
wire c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12,c13,c14,c15,c16,c17,c18,c19,c20,c21,c22,c23,c24,c25,c26,c27,c28,c29,c30,c31,c32,c33,c34,c35,c36,c37,c38,c39,c40,c41,c42,c43,c44,c45,c46,c47,c48,c49,c50,c51,c52,c53,c54,c55,c56,c57,c58,c59,c60,c61,c62,c63,c64,c65,c66,c67,c68,c69,c70,c71,c72,c73,c74,c75,c76,c77,c78,c79,c80,c81,c82,c83,c84,c85,c86,c87,c88,c89,c90,c91,c92,c93,c94,c95,c96,c97,c98,c99,c100,c101,c102,c103,c104,c105,c106,c107,c108,c109,c110,c111,c112,c113,c114,c115,c116,c117,c118,c119,c120,c121,c122,c123,c124,c125,c126;
wire s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14,s15,s16,s17,s18,s19,s20,s21,s22,s23,s24,s25,s26,s27,s28,s29,s30,s31,s32,s33,s34,s35,s36,s37,s38,s39,s40,s41,s42,s43,s44,s45,s46,s47,s48,s49,s50,s51,s52,s53,s54,s55,s56,s57,s58,s59,s60,s61,s62,s63,s64,s65,s66,s67,s68,s69,s70,s71,s72,s73,s74,s75,s76,s77,s78,s79,s80,s81,s82,s83,s84,s85,s86,s87,s88,s89,s90,s91,s92,s93,s94,s95,s96,s97,s98,s99,s100,s101,s102,s103,s104,s105,s106,s107,s108,s109,s110,s111,s112,s113,s114,s115,s116,s117,s118,s119,s120,s121,s122,s123,s124,s125;
assign p00=a[0]*b[0],p01=a[0]*b[1],p02=a[0]*b[2],p03=a[0]*b[3],p04=a[0]*b[4],p05=a[0]*b[5],p06=a[0]*b[6],p07=a[0]*b[7],p08=a[0]*b[8],p09=a[0]*b[9],p010=a[0]*b[10];
assign p10=a[1]*b[0],p11=a[1]*b[1],p12=a[1]*b[2],p13=a[1]*b[3],p14=a[1]*b[4],p15=a[1]*b[5],p16=a[1]*b[6],p17=a[1]*b[7],p18=a[1]*b[8],p19=a[1]*b[9],p110=a[1]*b[10];
assign p20=a[2]*b[0],p21=a[2]*b[1],p22=a[2]*b[2],p23=a[2]*b[3],p24=a[2]*b[4],p25=a[2]*b[5],p26=a[2]*b[6],p27=a[2]*b[7],p28=a[2]*b[8],p29=a[2]*b[9],p210=a[2]*b[10];
assign p30=a[3]*b[0],p31=a[3]*b[1],p32=a[3]*b[2],p33=a[3]*b[3],p34=a[3]*b[4],p35=a[3]*b[5],p36=a[3]*b[6],p37=a[3]*b[7],p38=a[3]*b[8],p39=a[3]*b[9],p310=a[3]*b[10];
assign p40=a[4]*b[0],p41=a[4]*b[1],p42=a[4]*b[2],p43=a[4]*b[3],p44=a[4]*b[4],p45=a[4]*b[5],p46=a[4]*b[6],p47=a[4]*b[7],p48=a[4]*b[8],p49=a[4]*b[9],p410=a[4]*b[10];
assign p50=a[5]*b[0],p51=a[5]*b[1],p52=a[5]*b[2],p53=a[5]*b[3],p54=a[5]*b[4],p55=a[5]*b[5],p56=a[5]*b[6],p57=a[5]*b[7],p58=a[5]*b[8],p59=a[5]*b[9],p510=a[5]*b[10];
assign p60=a[6]*b[0],p61=a[6]*b[1],p62=a[6]*b[2],p63=a[6]*b[3],p64=a[6]*b[4],p65=a[6]*b[5],p66=a[6]*b[6],p67=a[6]*b[7],p68=a[6]*b[8],p69=a[6]*b[9],p610=a[6]*b[10];
assign p70=a[7]*b[0],p71=a[7]*b[1],p72=a[7]*b[2],p73=a[7]*b[3],p74=a[7]*b[4],p75=a[7]*b[5],p76=a[7]*b[6],p77=a[7]*b[7],p78=a[7]*b[8],p79=a[7]*b[9],p710=a[7]*b[10];
assign p80=a[8]*b[0],p81=a[8]*b[1],p82=a[8]*b[2],p83=a[8]*b[3],p84=a[8]*b[4],p85=a[8]*b[5],p86=a[8]*b[6],p87=a[8]*b[7],p88=a[8]*b[8],p89=a[8]*b[9],p810=a[8]*b[10];
assign p90=a[9]*b[0],p91=a[9]*b[1],p92=a[9]*b[2],p93=a[9]*b[3],p94=a[9]*b[4],p95=a[9]*b[5],p96=a[9]*b[6],p97=a[9]*b[7],p98=a[9]*b[8],p99=a[9]*b[9],p910=a[9]*b[10];
assign p100=a[10]*b[0],p101=a[10]*b[1],p102=a[10]*b[2],p103=a[10]*b[3],p104=a[10]*b[4],p105=a[10]*b[5],p106=a[10]*b[6],p107=a[10]*b[7],p108=a[10]*b[8],p109=a[10]*b[9],p1010=a[10]*b[10];

//Stage 1
assign c1=p01&p10; //1
assign {c2,s1}=p02+p11+p20;//2
assign {c3,s2}=p03+p12+p21;//3 p30
assign {c4,s3}=p04+p13+p22;//4
assign {c5,s4}=p31+p40;
assign {c6,s5}=p05+p14+p23;//5
assign {c7,s6}=p32+p41+p50;
assign {c8,s7}=p06+p15+p24;//6 p60
assign {c9,s8}=p33+p42+p51;
assign {c10,s9}=p07+p16+p25;//7
assign {c11,s10}=p34+p43+p52;
assign {c12,s11}=p61+p70;
assign {c13,s12}=p08+p17+p26;//8
assign {c14,s13}=p35+p44+p53;
assign {c15,s14}=p62+p71+p80;
assign {c16,s15}=p09+p18+p27;//9 p90
assign {c17,s16}=p36+p45+p54;
assign {c18,s17}=p63+p72+p81;
assign {c19,s18}=p010+p19+p28;//10
assign {c20,s19}=p37+p46+p55;
assign {c21,s20}=p64+p73+p82;
assign {c22,s21}=p91+p100;
assign {c23,s22}=p110+p29+p38;//11 p101
assign {c24,s23}=p47+p56+p65;
assign {c25,s24}=p74+p83+p92;
assign {c26,s25}=p210+p39+p48;//12
assign {c27,s26}=p57+p66+p75;
assign {c28,s27}=p84+p93+p102;
assign {c29,s28}=p310+p49+p58;//13
assign {c30,s29}=p67+p76+p85;
assign {c31,s30}=p94+p103;
assign {c32,s31}=p410+p59+p68;//14 p104
assign {c33,s32}=p77+p86+p95;
assign {c34,s33}=p510+p69+p78;//15
assign {c35,s34}=p87+p96+p105;
assign {c36,s35}=p610+p79+p88;//16
assign {c37,s36}=p97+p106;
assign {c38,s37}=p710+p89+p98;//17 p107
assign {c39,s38}=p810+p99+p108;//18
assign {c40,s39}=p910+p109;//19

//Stage 2
assign {c41,s40}=s1+c1;//2
assign {c42,s41}=s2+c2+p30;//3
assign {c43,s42}=s3+c3+s4;//4
assign {c44,s43}=c4+c5+s5;//5 s6
assign {c45,s44}=c6+c7+p60;//6
assign {c46,s45}=s7+s8;
assign {c47,s46}=s9+s10+s11;//7
assign {c48,s47}=c9+c8;
assign {c49,s48}=c10+c11+c12;//8
assign {c50,s49}=s12+s13+s14;
assign {c51,s50}=c13+c14+p90;//9 s17
assign {c52,s51}=c15+s15+s16;
assign {c53,s52}=c16+c17+c18;//10 s21
assign {c54,s53}=s18+s19+s20;
assign {c55,s54}=p101+c19+c20;//11
assign {c56,s55}=c21+c22+s22;
assign {c57,s56}=s23+s24;
assign {c58,s57}=c23+c24+c25;//12
assign {c59,s58}=s25+s26+s27;
assign {c60,s59}=c26+c27+c28;//13
assign {c61,s60}=s28+s29+s30;
assign {c62,s61}=p104+c29+c30;//14
assign {c63,s62}=c31+s31+s32;
assign {c64,s63}=c32+c33+s33;//15 s34
assign {c65,s64}=c34+c35+s35;//16 s36
assign {c66,s65}=p107+c36+c37;//17 s37
assign {c67,s66}=c38+s38;//18
assign {c68,s67}=c39+s39;//19
assign {c69,s68}=c40+p1010;//20

//Stage 3
assign {c70,s69}=c41+s41;//3
assign {c71,s70}=c42+s42;//4
assign {c72,s71}=s6+c43+s43;//5
assign {c73,s72}=c44+s44+s45;//6
assign {c74,s73}=c45+c46+s46;//7 s47
assign {c75,s74}=c47+c48+s48;//8 s49
assign {c76,s75}=s17+c49+c50;//9
assign {c77,s76}=s50+s51;
assign {c78,s77}=s21+c51+c52;//10
assign {c79,s78}=s52+s53;
assign {c80,s79}=c53+c54+s54;//11
assign {c81,s80}=s55+s56;
assign {c82,s81}=c55+c56+c57;//12
assign {c83,s82}=s57+s58;
assign {c84,s83}=c58+c59+s59;//13 s60
assign {c85,s84}=c60+c61+s61;//14 s62
assign {c86,s85}=s34+c62+c63;//15 s63
assign {c87,s86}=s36+c64+s64;//16
assign {c88,s87}=s37+c65+s65;//17
assign {c89,s88}=c66+s66;//18
assign {c90,s89}=c67+s67;//19 
assign {c91,s90}=c68+s68;//20 
//21 c69
//Stage 4
assign {c92,s91}=s70+c70;//4
assign {c93,s92}=c71+s71;//5
assign {c94,s93}=c72+s72;//6
assign {c95,s94}=s47+c73+s73;//7
assign {c96,s95}=s49+s74+c74;//8
assign {c97,s96}=c75+s75+s76;//9
assign {c98,s97}=c76+c77+s77;//10 s78
assign {c99,s98}=c78+c79+s79;//11 s80
assign {c100,s99}=c80+c81+s81;//12 s82
assign {c101,s100}=s60+c82+c83;//13 s83
assign {c102,s101}=s62+c84+s84;//14
assign {c103,s102}=s63+c85+s85;//15
assign {c104,s103}=c86+s86;//16
assign {c105,s104}=c87+s87;//17 
assign {c106,s105}=c88+s88;//18
assign {c107,s106}=c89+s89;//19
assign {c108,s107}=c90+s90;//20
assign {c109,s108}=c91+c69;//21

//Stage 5
assign {c110,s109}=c92+s92;//5
assign {c111,s110}=c93+s93;//6
assign {c112,s111}=c94+s94;//7
assign {c113,s112}=c95+s95;//8
assign {c114,s113}=s96+c96;//9
assign {c115,s114}=s78+c97+s97;//10
assign {c116,s115}=s80+c98+s98;//11
assign {c117,s116}=s82+c99+s99;//12
assign {c118,s117}=s83+c100+s100;//13
assign {c119,s118}=c101+s101;//14
assign {c120,s119}=c102+s102;//15
assign {c121,s120}=c103+s103;//16
assign {c122,s121}=c104+s104;//17
assign {c123,s122}=c105+s105;//18
assign {c124,s123}=c106+s106;//19
assign {c125,s124}=c107+s107;//20
assign {c126,s125}=c108+s108;//21

//Extra Pipeline Stage
reg [5:0] outmid ;
reg [15:0] clainput1,clainput2;
always @(negedge clk) begin
    outmid[0]<=p00;
    outmid[1]<=(p01^p10);
    outmid[2]<=s40;
    outmid[3]<=s69;
    outmid[4]<=s91;
    outmid[5]<=s109;
    clainput1<={c125,c124,c123,c122,c121,c120,c119,c118,c117,c116,c115,c114,c113,c112,c111,c110};
    clainput2<={s125,s124,s123,s122,s121,s120,s119,s118,s117,s116,s115,s114,s113,s112,s111,s110};
end

wire [16:0] claoutput;
//Final Stage
bit16cla b1(clainput1,clainput2,1'b0,claoutput);
//Final
always @(posedge clk) begin
    out[0]<=outmid[0];
    out[1]<=outmid[1];
    out[2]<=outmid[2];
    out[3]<=outmid[3];
    out[4]<=outmid[4];
    out[5]<=outmid[5];
    out[21:6]<=claoutput[15:0];
    end
endmodule 

