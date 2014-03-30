/ qc

file:`:test.q
codeLines:read0 file;

linesHit:([file:`$(); lineNum:`int$()] r:`boolean$());
functionsEntered:([file:`$(); lineNum:`int$()] r:`boolean$());

logLine:{ `linesHit upsert (x;y;1b) };
logFunction:{ `functionsEntered upsert (x;y;1b) };

logLineInject:{[file;lineNum] "logLine[`",string[file],";",string[lineNum],"];"};
logFunctionInject:{[file;line;lineNum] ssr[line;"{";"{logFunction[`",string[file],";",string[lineNum],"];"] };

nf:` sv {[file;line;lineNum] 
	/ get line begins
	logLineInject[file;lineNum],
		/ get functions
		logFunctionInject[file;line;lineNum]
	} .' (file),/:(enlist each codeLines),'(1 + til count codeLines);

value nf;

hout:"<html><body><font face='courier'><table>";

hout,: raze { "<tr><td",$[z in x;" bgcolor='#00FF7F'";""],"><pre>",y,"</pre></td></tr>" }[key[linesHit]`lineNum;] .' (enlist each codeLines),'1+til count codeLines;

hout,:"</table></font></body></html>";

