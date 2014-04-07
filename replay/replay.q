

upd:{insert[x;y];}
-1!"basic upd setup"
upd:{`rec upsert (last[y[2]];last[y[3]])} / only ok if batches are not re-formed (i.e. tp cannot re-batch)

\l schemas.q
-1!"schemas loaded",-3!tables[]

ml:`:ml
-1!"msg log = ml"
