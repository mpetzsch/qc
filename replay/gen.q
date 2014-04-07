
/ setup log
L:`:ml;
.[L;();:;()];
l:hopen L;

gr:{[t] n:first 1?1000; (`upd;t;(n?.z.n; n?`4; first 1?100h; n?100000000; n?100.0; n?`long$100e6; n?`4))  }

atl:{[t] l enlist gr[t]}

do[50000;atl`tblA]

-1!"done"
\\
