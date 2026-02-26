100 REM -*- encoding: utf-8; indent-tabs-mode: nil -*-
110 REM
120 REM     Test script copied from the Vintage Basic package and slightly updated
130 REM     Released under the BSD 3-Clause "New" or "Revised" License
140 REM
150 REM     Copyright (c) 2009-2017, Lyle Kopnicky
160 REM     All rights reserved.
170 REM
180 REM     Redistribution and use in source and binary forms, with or without
190 REM     modification, are permitted provided that the following conditions are
200 REM     met:
210 REM
220 REM     * Redistributions of source code must retain the above copyright
230 REM       notice this list of conditions and the following disclaimer.
240 REM
250 REM     * Redistributions in binary form must reproduce the above copyright
260 REM       notice, this list of conditions and the following disclaimer in the
270 REM       documentation and/or other materials provided with the
280 REM       distribution.
290 REM
300 REM     * Neither the name of Lyle Kopnicky nor the names of his contributors
310 REM       may be used to endorse or promote products derived from this
320 REM       software without specific prior written permission.
330 REM
340 REM     THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
350 REM     "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
360 REM     LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
370 REM     A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
380 REM     OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
390 REM     SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
400 REM     LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
410 REM     DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
420 REM     THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
430 REM     (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
440 REM     OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
450 REM
460 REM     Modification of the test script: Copyright (c) 2026, Jean Forget
470 REM
1010 INPUT "ENTER A STRING";A$
1020 INPUT "ENTER A NUMBER";N
1025 PRINT : PRINT : PRINT : PRINT
1030 PRINT "ASC(A$) = ";ASC(A$)
1040 PRINT "CHR$(N) = ";CHR$(N)
1050 PRINT "LEFT$(A$,N) = ";LEFT$(A$,N)
1060 PRINT "MID$(A$,N) = ";MID$(A$,N)
1070 PRINT "MID$(A$,N,3) = ";MID$(A$,N,3)
1080 PRINT "RIGHT$(A$,N) = ";RIGHT$(A$,N)
1090 PRINT "LEN(A$) = ";LEN(A$)
1100 PRINT "VAL(A$) = ";VAL(A$)
1110 PRINT "STR$(N) = ";STR$(N)
1120 PRINT "SPC(N) = '";SPC(N);"'"
