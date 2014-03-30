/ qc

f:`:test.q
l:read0 f;

c:([f:`$(); l:`int$()] r:`boolean$());
cf:([f:`$(); l:`int$()] r:`boolean$());

bl:{ `c upsert (x;y;1b) };
bf:{ `cf upsert (x;y;1b) };

blt:{[f;n] "bl[`",string[f],";",string[n],"];"};
bft:{[f;l;n] ssr[l;"{";"{bf[`",string[f],";",string[n],"];"] };

nf:` sv {[f;l;n] 
	/ get line begins
	blt[f;n],
		/ get functions
		bft[f;l;n]
	} .' (f),/:(enlist each l),'(1 + til count l);

value nf;

hout:"<html><body><font face='courier'><table>";

hout,: raze { "<tr><td",$[z in x;" bgcolor='#00FF7F'";""],"><pre>",y,"</pre></td></tr>" }[key[c]`l;] .' (enlist each l),'1+til count l;

hout,:"</table></font></body></html>";

