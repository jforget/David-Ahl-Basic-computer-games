100 REM -*- encoding: utf-8; indent-tabs-mode: nil -*-
110 REM
120 REM     Test script to check the various delimiters inside PRINT statements
130 REM     Copyright (c) 2026 Jean Forget
140 REM
150 REM     This program is distributed under the same terms as Perl
160 REM     GNU Public License version 1 or later and Perl Artistic License
170 REM
180 REM     You can find the text of the licenses in the F<LICENSE> file or at
190 REM     L<https://dev.perl.org/licenses/artistic.html>
200 REM     and L<https://www.gnu.org/licenses/gpl-1.0.html>.
210 REM
220 REM     Here is the summary of GPL:
230 REM
240 REM     This program is free software; you can redistribute it and/or modify
250 REM     it under the terms of the GNU General Public License as published by
260 REM     the Free Software Foundation; either version 1, or (at your option)
270 REM     any later version.
280 REM
290 REM     This program is distributed in the hope that it will be useful,
300 REM     but WITHOUT ANY WARRANTY; without even the implied warranty of
310 REM     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
320 REM     GNU General Public License for more details.
330 REM
340 REM     You should have received a copy of the GNU General Public License
350 REM     along with this program; if not, write to the Free Software Foundation,
360 REM     Inc., <https://www.fsf.org/>.
370 REM
1010 LET N = 5
1020 LET R$ = "....+....1....+....2....+....3....+....4"
1100 PRINT 100
1110 FOR I = 1 TO N
1120 READ A$, B$
1130 PRINT A$, B$
1140 PRINT B$,
1150 PRINT A$
1160 NEXT
1170 RESTORE
1180 PRINT R$
1200 PRINT 200
1210 FOR I = 1 TO N
1220 READ A$, B$
1230 PRINT A$; B$
1240 PRINT B$;
1250 PRINT A$
1260 NEXT
1270 RESTORE
1280 PRINT R$
1300 PRINT 300
1310 FOR I = 1 TO N
1320 READ A$, B$
1330 PRINT A$ TAB(20) B$
1340 PRINT B$ TAB(20) A$
1360 NEXT
1370 RESTORE
1400 PRINT 400
1410 FOR I = 1 TO N
1420 READ A$, B$
1430 PRINT A$ B$
1440 PRINT B$
1450 PRINT A$
1460 NEXT
1470 RESTORE
2000 DATA a, b
2010 DATA alpha, bravo
2020 DATA able, baker
2040 DATA Alice, Bob
2050 DATA anticonstitutionnellement, bactériologistes
