/ qc

f:`:test.q
l:read0 f;

c:([f:`$(); l:`int$()] r:`boolean$());
cf:([f:`$(); l:`int$()] r:`boolean$());

bl:{ `c upsert (x;y;1b) };
bf:{ `cf upsert (x;y;1b) };

nf:` sv {[f;l;n] 
	/ get line begins
	"bl[`",string[f],";",string[n],"];",
		/ get functions
		ssr[l;"{";"{bf[`",string[f],";",string[n],"];"] 
	} .' (f),/:(enlist each l),'(1 + til count l);

value nf;

hout:"<html><body><font face='courier'><table>";

hout,: raze { "<tr><td",$[z in x;" bgcolor='green'";""],"><pre>",y,"</pre></td></tr>" }[key[c]`l;] .' (enlist each l),'1+til count l;

hout,:"</table></font></body></html>";

