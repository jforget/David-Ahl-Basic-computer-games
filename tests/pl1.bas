100 REM -*- encoding: utf-8; indent-tabs-mode: nil -*-
110 REM
120 REM     Test script to check if tokenizing find embedded keywords
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
1010 REM The following line is perfectly valid in PL/1
1020 REM     IF ELSE < THEN THEN IF = ELSE ELSE IF = THEN
1030 REM The corresponding lines for ZX Spectrum would be
1040 INPUT "THEN", THEN
1050 INPUT "IF", IF
1060 IF IF < THEN THEN GO TO 1090
1070 LET LET = THEN
1080 GO TO 1100
1090 LET LET = IF
1100 PRINT LET
