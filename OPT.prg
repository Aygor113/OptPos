1 ' PRZYPISYWANIE ZMIENNYCH POCZATKOWYCH
2 Const Def Inte ROZMIAR = 2       'wymiar x i y macierzy (kwadrat)
3 Const Def Inte ILOSCPOZYCJIZ = 2 'wymiar z
4 Const Def Inte SKOK = 40        ' co ile beda sie zmieniac wartosci x i y w macierzy polozen
5 Const Def Inte SKOKZ = 20        'co ile beda sie zmieniac wartosci z w macierzy polozen
6 Def Inte M8
7 M8% = ROZMIAR%*ROZMIAR%*ILOSCPOZYCJIZ%
8 Dim MBOX%(8, 4)
9 'Dim MBOX%(8, 4)   'Tworzy tablice, iloœæ wierszy musi równaæ siê ROZMIAR*ROZMIAR*ILOSCPOZYCJIZ
10 P2 = (+417.00,-21.00,+578.00,+170.00,-24.00,-168.00) 'Punkt od którego zaczyna sie ruch
11 P3 = (+512.00,-21.00,+578.00,+170.00,-24.00,-168.00) 'Punkt w którym koñczy sie ruch
12 'P2 = (+517.00,-150.00,+600.00,+0.00,+0.00,+0.00)
13 'P3 = (+912.00,+70.00,+600.00,+0.00,+0.00,+0.00)
14 ' Ponizej wspolrzedne punktu z lewego gornego rogu macierzy polozen
15 Const Def Inte INITX = 80
16 Const Def Inte INITY = 80
17 Const Def Inte INITZ = 20
18 MBOX%(1,1) = INITX%
19 MBOX%(1,2) = INITY%
20 MBOX%(1,3) = INITZ%
21 'KONIEC PRZYPISYWANIA ZMIENNYCH POCZATKOWYCH
22 Def Inte ILOSCWIERSZY
23 ILOSCWIERSZY% = ROZMIAR%*ROZMIAR%*ILOSCPOZYCJIZ%
24 Def Inte L1         'Iterator po wierszach macierzy polozen bazy
25 L1% = 1
26 '================================================================================
27 'WLASCIWY PROGRAM
28 ' Petla tworzaca macierz  I x J
29 For M1=1 To ROZMIAR% Step 1
30     For M2 = 1 To ROZMIAR% Step 1             'ROZMIAR%+1
31         For M3 = 1 To ILOSCPOZYCJIZ% Step 1
32             If M1<2 And M2<2 Then
33                If L1%>1 Then
34                     MBOX%(L1%,1) = MBOX%(1,1) - (M1-1)*SKOK%
35                     MBOX%(L1%,2) = MBOX%(1,2) + (M2-1)*SKOK%
36                     MBOX%(L1%,3) = MBOX%(1,3) - (M3-1)*SKOKZ%
37                     L1% = L1%+1
38                Else
39                        L1% = L1%+1
40                EndIf
41             Else
42                 MBOX%(L1%,1) = MBOX%(1,1) - (M1-1)*SKOK%
43                 MBOX%(L1%,2) = MBOX%(1,2) + (M2-1)*SKOK%
44                 MBOX%(L1%,3) = MBOX%(1,3) - (M3-1)*SKOKZ%
45                 L1% = L1%+1
46             EndIf
47         Next M3
48     Next M2
49 Next M1
50 '================================================================
51 'Petla wyliczajaca czas
52 Def Inte BX
53 Def Inte BY
54 Def Inte BZ
55 Def Inte L2
56 L2% = 1
57 For M4=1 To ILOSCWIERSZY% Step 1
58     P1.X = MBOX%(M4,1)
59     P1.Y= MBOX%(M4,2)
60     P1.Z = MBOX%(M4,3)
61     Base P1         'Stworzenie bazy dla odpowiednich wartosci
62     M5 = PosCq(P2)
63     If M5 = 1 Then
64         Mov P2                ' Wywolanie funckji optymalizujacej ogarn¹c C_Timem
65         M6 = PosCq(P3)
66         If M6 = 1 Then
67             M_Timer(1)=0                     'GIT
68             Mov P3
69             Mov P2
70             ' tutaj czas koniec
71             T1 = M_Timer(1)                      'GIT
72             ' przypisanie czasu do 4 kolumny
73             MBOX%(L2%, 4) = T1                 'GIT
74             L2% = L2%+1                        'GIT
75             T1=0
76         Else                      'GIT
77             MBOX%(L2%, 4) = -99                'GIT
78             L2% = L2%+1
79         EndIf
80     Else
81         MBOX%(L2%, 4) = -99                'GIT
82         L2% = L2%+1
83     EndIf
84 Next M4
85 ' Znalezienie najlepszego punktu
86 Def Double BestTime
87 BestTime# = 999999999999.0#
88 Def Double BestPos
89 Def Double BestPosX
90 Def Double BestPosY
91 Def Double BestPosZ
92 Def Inte L9
93 L9% = 1
94 For M7=1 To ILOSCWIERSZY% Step 1
95     If (MBOX%(M7, 4) < BestTime# And MBOX%(M7,4) > 0) Then
96         BestTime# = MBOX%(M7,4)
97         BestPosX# = MBOX%(M7,1)
98         BestPosY# = MBOX%(M7,2)
99         BestPosZ# = MBOX%(M7,3)
100         L9% = M7
101     Else
102     EndIf
103 Next M7
104 P9.X = BestPosX#
105 P9.Y = BestPosY#
106 P9.Z = BestPosZ#
107 End
108 Hlt
P2=(+417.00,-21.00,+578.00,+170.00,-24.00,-168.00)(,)
P3=(+512.00,-21.00,+578.00,+170.00,-24.00,-168.00)(,)
P1=(+80.00,+120.00,+0.00,+0.00,+0.00,+0.00,+0.00,+0.00)(,)
P9=(+80.00,+120.00,+20.00,+0.00,+0.00,+0.00,+0.00,+0.00)(,)
