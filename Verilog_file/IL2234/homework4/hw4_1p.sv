//Name: Linghan Zhao
//PN:   20020717-5563，then（563 mod 2）+1 = 2
//      1.2 Question 2


bins both_low = {binsof S1 intersect [0:9] && binsof S2 intersect [0:9]};
bins signal1_low_signal2_high = {!binsof S1 intersect [0:9] && binsof S2 intersect [0:9]};
bins signal1_high_signal2_low = {binsof S1 intersect [0:9] && !binsof S2 intersect [0:9]};
bins bith_high = {!binsof S1 intersect [0:9] && !binsof S2 intersect [0:9]};

System Verilog implicitly creates coverage points for variable signal1 and signal2
the coverpoint S1 has 16 bins (16 possible values for signal1),
the coverpoint S2 has 16 bins (16 possible values for signal2).
bins both_low = {binsof S1 intersect [0:9] && binsof S2 intersect [0:9]};
  results in 100 cross products listed as
    <S1(0), S2(0)> <S1(0), S2(1)> ... <S1(0), S2(9)>
    <S1(1), S2(0)> <S1(1), S2(1)> ... <S1(1), S2(9)>
    ...
    <S1(9), S2(0)> <S1(9), S2(1)> ... <S1(9), S2(9)>

bins signal1_low_signal2_high = {!binsof S1 intersect [0:9] && binsof S2 intersect [0:9]};
  results in 60 cross products listed as
    <S1(10), S2(0)> <S1(10), S2(1)> ... <S1(10), S2(9)>
    <S1(11), S2(0)> <S1(11), S2(1)> ... <S1(11), S2(9)>
    ...
    <S1(15), S2(0)> <S1(15), S2(1)> ... <S1(15), S2(9)>

bins signal1_high_signal2_low = {binsof S1 intersect [0:9] && !binsof S2 intersect [0:9]};
  results in 60 cross products listed as
    <S1(0), S2(10)> <S1(0), S2(11)> ... <S1(0), S2(15)>
    <S1(1), S2(10)> <S1(1), S2(11)> ... <S1(1), S2(15)>
    ...
    <S1(9), S2(10)> <S1(9), S2(11)> ... <S1(9), S2(15)>

bins bith_high = {!binsof S1 intersect [0:9] && !binsof S2 intersect [0:9]};
  results in 36 cross products listed as
    <S1(10), S2(10)> <S1(10), S2(11)> ... <S1(10), S2(15)>
    <S1(11), S2(10)> <S1(11), S2(11)> ... <S1(11), S2(15)>
    ...
    <S1(15), S2(10)> <S1(15), S2(11)> ... <S1(15), S2(15)>


