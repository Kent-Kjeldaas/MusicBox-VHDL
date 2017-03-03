----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/27/2016 12:57:07 PM
-- Design Name: 
-- Module Name: buzz_top - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity freq_chooser is
    Port (
           note : in STD_LOGIC_VECTOR (7 downto 0);
           frequency : out integer);
end freq_chooser;

architecture arch of freq_chooser is

begin
    
    with note select 
        frequency <= 382225 when "01000011",
                     340524 when "01000100",
                     303372 when "01000101",
                     286345 when "01000110", 
                     255105 when "01000111",
                     227273 when "01000001", 
                     202477 when "01000010",
                     191113 when "01100011",
                     170262 when "01100100",
                     151686 when "01100101",
                     127552 when "01100110", 
                     113636 when "01100001",
                     101238 when "01100010",
                     1000000000 when others;
                     
                     
--                     when "00000000" => half_period <= 03057805; -- C0  > freq=16.351598 half=3057805.146493 pow=-57
--                     when "00000001" => half_period <= 02886184; -- C#0 > freq=17.323914 half=2886183.730959 pow=-56
--                     when "00000010" => half_period <= 02724195; -- D0  > freq=18.354048 half=2724194.685330 pow=-55
--                     when "00000011" => half_period <= 02571297; -- D#0 > freq=19.445436 half=2571297.386225 pow=-54
--                     when "00000100" => half_period <= 02426982; -- E0  > freq=20.601722 half=2426981.553122 pow=-53
--                     when "00000101" => half_period <= 02290766; -- F0  > freq=21.826764 half=2290765.545343 pow=-52
--                     when "00000110" => half_period <= 02162195; -- F#0 > freq=23.124651 half=2162194.754624 pow=-51
--                     when "00000111" => half_period <= 02040840; -- G0  > freq=24.499715 half=2040840.087903 pow=-50
--                     when "00001000" => half_period <= 01926297; -- G#0 > freq=25.956544 half=1926296.535262 pow=-49
--                     when "00001001" => half_period <= 01818182; -- A0  > freq=27.500000 half=1818181.818240 pow=-48
--                     when "00001010" => half_period <= 01716135; -- A#0 > freq=29.135235 half=1716135.114020 pow=-47
--                     when "00001011" => half_period <= 01619816; -- B0  > freq=30.867706 half=1619815.851214 pow=-46
--                     when "00001100" => half_period <= 01528903; -- C1  > freq=32.703196 half=1528902.573234 pow=-45
--                     when "00001101" => half_period <= 01443092; -- C#1 > freq=34.647829 half=1443091.865468 pow=-44
--                     when "00001110" => half_period <= 01362097; -- D1  > freq=36.708096 half=1362097.342654 pow=-43
--                     when "00001111" => half_period <= 01285649; -- D#1 > freq=38.890873 half=1285648.693102 pow=-42
--                     when "00010000" => half_period <= 01213491; -- E1  > freq=41.203445 half=1213490.776551 pow=-41
--                     when "00010001" => half_period <= 01145383; -- F1  > freq=43.653529 half=1145382.772662 pow=-40
--                     when "00010010" => half_period <= 01081097; -- F#1 > freq=46.249303 half=1081097.377303 pow=-39
--                     when "00010011" => half_period <= 01020420; -- G1  > freq=48.999429 half=1020420.043943 pow=-38
--                     when "00010100" => half_period <= 00963148; -- G#1 > freq=51.913087 half=963148.267623 pow=-37
--                     when "00010101" => half_period <= 00909091; -- A1  > freq=55.000000 half=909090.909113 pow=-36
--                     when "00010110" => half_period <= 00858068; -- A#1 > freq=58.270470 half=858067.557003 pow=-35
--                     when "00010111" => half_period <= 00809908; -- B1  > freq=61.735413 half=809907.925600 pow=-34
--                     when "00011000" => half_period <= 00764451; -- C2  > freq=65.406391 half=764451.286611 pow=-33
--                     when "00011001" => half_period <= 00721546; -- C#2 > freq=69.295658 half=721545.932728 pow=-32
--                     when "00011010" => half_period <= 00681049; -- D2  > freq=73.416192 half=681048.671322 pow=-31
--                     when "00011011" => half_period <= 00642824; -- D#2 > freq=77.781746 half=642824.346546 pow=-30
--                     when "00011100" => half_period <= 00606745; -- E2  > freq=82.406889 half=606745.388271 pow=-29
--                     when "00011101" => half_period <= 00572691; -- F2  > freq=87.307058 half=572691.386327 pow=-28
--                     when "00011110" => half_period <= 00540549; -- F#2 > freq=92.498606 half=540548.688647 pow=-27
--                     when "00011111" => half_period <= 00510210; -- G2  > freq=97.998859 half=510210.021968 pow=-26
--                     when "00100000" => half_period <= 00481574; -- G#2 > freq=103.826174 half=481574.133808 pow=-25
--                     when "00100001" => half_period <= 00454545; -- A2  > freq=110.000000 half=454545.454553 pow=-24
--                     when "00100010" => half_period <= 00429034; -- A#2 > freq=116.540940 half=429033.778498 pow=-23
--                     when "00100011" => half_period <= 00404954; -- B2  > freq=123.470825 half=404953.962797 pow=-22
--                     when "00100100" => half_period <= 00382226; -- C3  > freq=130.812783 half=382225.643302 pow=-21
--                     when "00100101" => half_period <= 00360773; -- C#3 > freq=138.591315 half=360772.966361 pow=-20
--                     when "00100110" => half_period <= 00340524; -- D3  > freq=146.832384 half=340524.335658 pow=-19
--                     when "00100111" => half_period <= 00321412; -- D#3 > freq=155.563492 half=321412.173270 pow=-18
--                     when "00101000" => half_period <= 00303373; -- E3  > freq=164.813778 half=303372.694133 pow=-17
--                     when "00101001" => half_period <= 00286346; -- F3  > freq=174.614116 half=286345.693161 pow=-16
--                     when "00101010" => half_period <= 00270274; -- F#3 > freq=184.997211 half=270274.344321 pow=-15
--                     when "00101011" => half_period <= 00255105; -- G3  > freq=195.997718 half=255105.010982 pow=-14
--                     when "00101100" => half_period <= 00240787; -- G#3 > freq=207.652349 half=240787.066902 pow=-13
--                     when "00101101" => half_period <= 00227273; -- A3  > freq=220.000000 half=227272.727275 pow=-12
--                     when "00101110" => half_period <= 00214517; -- A#3 > freq=233.081881 half=214516.889247 pow=-11
--                     when "00101111" => half_period <= 00202477; -- B3  > freq=246.941651 half=202476.981397 pow=-10
--                     when "00110000" => half_period <= 00191113; -- C4  > freq=261.625565 half=191112.821650 pow=-9
--                     when "00110001" => half_period <= 00180386; -- C#4 > freq=277.182631 half=180386.483179 pow=-8
--                     when "00110010" => half_period <= 00170262; -- D4  > freq=293.664768 half=170262.167828 pow=-7
--                     when "00110011" => half_period <= 00160706; -- D#4 > freq=311.126984 half=160706.086634 pow=-6
--                     when "00110100" => half_period <= 00151686; -- E4  > freq=329.627557 half=151686.347065 pow=-5
--                     when "00110101" => half_period <= 00143173; -- F4  > freq=349.228231 half=143172.846579 pow=-4
--                     when "00110110" => half_period <= 00135137; -- F#4 > freq=369.994423 half=135137.172160 pow=-3
--                     when "00110111" => half_period <= 00127553; -- G4  > freq=391.995436 half=127552.505490 pow=-2
--                     when "00111000" => half_period <= 00120394; -- G#4 > freq=415.304698 half=120393.533450 pow=-1
--                     when "00111001" => half_period <= 00113636; -- A4  > freq=440.000000 half=113636.363636 pow=0
--                     when "00111010" => half_period <= 00107258; -- A#4 > freq=466.163762 half=107258.444623 pow=1
--                     when "00111011" => half_period <= 00101238; -- B4  > freq=493.883301 half=101238.490698 pow=2
--                     when "00111100" => half_period <= 00095556; -- C5  > freq=523.251131 half=95556.410824 pow=3
--                     when "00111101" => half_period <= 00090193; -- C#5 > freq=554.365262 half=90193.241589 pow=4
--                     when "00111110" => half_period <= 00085131; -- D5  > freq=587.329536 half=85131.083913 pow=5
--                     when "00111111" => half_period <= 00080353; -- D#5 > freq=622.253967 half=80353.043316 pow=6
--                     when "01000000" => half_period <= 00075843; -- E5  > freq=659.255114 half=75843.173532 pow=7
--                     when "01000001" => half_period <= 00071586; -- F5  > freq=698.456463 half=71586.423289 pow=8
--                     when "01000010" => half_period <= 00067569; -- F#5 > freq=739.988845 half=67568.586079 pow=9
--                     when "01000011" => half_period <= 00063776; -- G5  > freq=783.990872 half=63776.252744 pow=10
--                     when "01000100" => half_period <= 00060197; -- G#5 > freq=830.609395 half=60196.766725 pow=11
--                     when "01000101" => half_period <= 00056818; -- A5  > freq=880.000000 half=56818.181818 pow=12
--                     when "01000110" => half_period <= 00053629; -- A#5 > freq=932.327523 half=53629.222311 pow=13
--                     when "01000111" => half_period <= 00050619; -- B5  > freq=987.766603 half=50619.245348 pow=14
--                     when "01001000" => half_period <= 00047778; -- C6  > freq=1046.502261 half=47778.205412 pow=15
--                     when "01001001" => half_period <= 00045097; -- C#6 > freq=1108.730524 half=45096.620794 pow=16
--                     when "01001010" => half_period <= 00042566; -- D6  > freq=1174.659072 half=42565.541956 pow=17
--                     when "01001011" => half_period <= 00040177; -- D#6 > freq=1244.507935 half=40176.521658 pow=18
--                     when "01001100" => half_period <= 00037922; -- E6  > freq=1318.510228 half=37921.586766 pow=19
--                     when "01001101" => half_period <= 00035793; -- F6  > freq=1396.912926 half=35793.211644 pow=20
--                     when "01001110" => half_period <= 00033784; -- F#6 > freq=1479.977691 half=33784.293039 pow=21
--                     when "01001111" => half_period <= 00031888; -- G6  > freq=1567.981744 half=31888.126372 pow=22
--                     when "01010000" => half_period <= 00030098; -- G#6 > freq=1661.218790 half=30098.383362 pow=23
--                     when "01010001" => half_period <= 00028409; -- A6  > freq=1760.000000 half=28409.090909 pow=24
--                     when "01010010" => half_period <= 00026815; -- A#6 > freq=1864.655046 half=26814.611155 pow=25
--                     when "01010011" => half_period <= 00025310; -- B6  > freq=1975.533205 half=25309.622674 pow=26
--                     when "01010100" => half_period <= 00023889; -- C7  > freq=2093.004522 half=23889.102706 pow=27
--                     when "01010101" => half_period <= 00022548; -- C#7 > freq=2217.461048 half=22548.310397 pow=28
--                     when "01010110" => half_period <= 00021283; -- D7  > freq=2349.318143 half=21282.770978 pow=29
--                     when "01010111" => half_period <= 00020088; -- D#7 > freq=2489.015870 half=20088.260829 pow=30
--                     when "01011000" => half_period <= 00018961; -- E7  > freq=2637.020455 half=18960.793383 pow=31
--                     when "01011001" => half_period <= 00017897; -- F7  > freq=2793.825852 half=17896.605822 pow=32
--                     when "01011010" => half_period <= 00016892; -- F#7 > freq=2959.955382 half=16892.146520 pow=33
--                     when "01011011" => half_period <= 00015944; -- G7  > freq=3135.963488 half=15944.063186 pow=34
--                     when "01011100" => half_period <= 00015049; -- G#7 > freq=3322.437581 half=15049.191681 pow=35
--                     when "01011101" => half_period <= 00014205; -- A7  > freq=3520.000000 half=14204.545454 pow=36
--                     when "01011110" => half_period <= 00013407; -- A#7 > freq=3729.310092 half=13407.305578 pow=37
--                     when "01011111" => half_period <= 00012655; -- B7  > freq=3951.066410 half=12654.811337 pow=38
--                     when "01100000" => half_period <= 00011945; -- C8  > freq=4186.009045 half=11944.551353 pow=39
--                     when "01100001" => half_period <= 00011274; -- C#8 > freq=4434.922096 half=11274.155198 pow=40
--                     when "01100010" => half_period <= 00010641; -- D8  > freq=4698.636287 half=10641.385489 pow=41
--                     when "01100011" => half_period <= 00010044; -- D#8 > freq=4978.031740 half=10044.130414 pow=42
--                     when "01100100" => half_period <= 00009480; -- E8  > freq=5274.040911 half=9480.396691 pow=43
--                     when "01100101" => half_period <= 00008948; -- F8  > freq=5587.651703 half=8948.302911 pow=44
--                     when "01100110" => half_period <= 00008446; -- F#8 > freq=5919.910764 half=8446.073260 pow=45
--                     when "01100111" => half_period <= 00007972; -- G8  > freq=6271.926976 half=7972.031593 pow=46
--                     when "01101000" => half_period <= 00007525; -- G#8 > freq=6644.875161 half=7524.595840 pow=47
--                     when "01101001" => half_period <= 00007102; -- A8  > freq=7040.000000 half=7102.272727 pow=48
--                     when "01101010" => half_period <= 00006704; -- A#8 > freq=7458.620185 half=6703.652789 pow=49
--                     when "01101011" => half_period <= 00006327; -- B8  > freq=7902.132820 half=6327.405668 pow=50
--                     when "01101100" => half_period <= 00005972; -- C9  > freq=8372.018090 half=5972.275676 pow=51
--                     when "01101101" => half_period <= 00005637; -- C#9 > freq=8869.844192 half=5637.077599 pow=52
--                     when "01101110" => half_period <= 00005321; -- D9  > freq=9397.272574 half=5320.692744 pow=53
--                     when "01101111" => half_period <= 00005022; -- D#9 > freq=9956.063479 half=5022.065207 pow=54
--                     when "01110000" => half_period <= 00004740; -- E9  > freq=10548.081822 half=4740.198346 pow=55
--                     when "01110001" => half_period <= 00004474; -- F9  > freq=11175.303406 half=4474.151455 pow=56
--                     when "01110010" => half_period <= 00004223; -- F#9 > freq=11839.821527 half=4223.036630 pow=57
--                     when "01110011" => half_period <= 00003986; -- G9  > freq=12543.853952 half=3986.015796 pow=58
--                     when "01110100" => half_period <= 00003762; -- G#9 > freq=13289.750323 half=3762.297920 pow=59
--                     when "01110101" => half_period <= 00003551; -- A9  > freq=14080.000001 half=3551.136363 pow=60
--                     when "01110110" => half_period <= 00003352; -- A#9 > freq=14917.240369 half=3351.826394 pow=61
--                     when "01110111" => half_period <= 00003164; -- B9  > freq=15804.265641 half=3163.702834 pow=62
--                     when "01111000" => half_period <= 00002986; -- C10 > freq=16744.036180 half=2986.137838 pow=63
--                     when "01111001" => half_period <= 00002819; -- C#10 > freq=17739.688383 half=2818.538800 pow=64
--                     when "01111010" => half_period <= 00002660; -- D10 > freq=18794.545148 half=2660.346372 pow=65
--                     when "01111011" => half_period <= 00002511; -- D#10 > freq=19912.126959 half=2511.032604 pow=66
--                     when "01111100" => half_period <= 00002370; -- E10 > freq=21096.163643 half=2370.099173 pow=67
--                     when "01111101" => half_period <= 00002237; -- F10 > freq=22350.606813 half=2237.075728 pow=68
--                     when "01111110" => half_period <= 00002112; -- F#10 > freq=23679.643055 half=2111.518315 pow=69
--                     when "01111111" => half_period <= 00001993; -- G10 > freq=25087.707904 half=1993.007898 pow=70
--                     when "10000000" => half_period <= 00001881; -- G#10 > freq=26579.500646 half=1881.148960 pow=71
--                     when "10000001" => half_period <= 00001776; -- A10 > freq=28160.000001 half=1775.568182 pow=72
--                     when "10000010" => half_period <= 00001676; -- A#10 > freq=29834.480739 half=1675.913197 pow=73
--                     when "10000011" => half_period <= 00001582; -- B10 > freq=31608.531282 half=1581.851417 pow=74
--                     when others => half_period <= 1000000000;


end arch;