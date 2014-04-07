/ q coverage
/ TODO: uncertainty marker for [ and {, function entry, function entry with [args]

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

/ call some funcs here ...

saveHtml:{
	hout::"<html><body><font face='courier'><table>";
	hout,: raze { "<tr><td>",string[z],"</td><td",$[z in x;" bgcolor='#dfd'";""],"><pre>",y,"</pre></td></tr>" }[key[linesHit]`lineNum;] .' (enlist each codeLines),'1+til count codeLines;
	hout,:"</table></font></body></html>";
	`:qc.html 0: enlist hout;
	}

