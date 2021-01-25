/*
jQWidgets v11.0.1 (2020-Dec)
Copyright (c) 2011-2020 jQWidgets.
License: https://jqwidgets.com/license/
*/
/* eslint-disable */

(function(a){a.jqx.dataview.grouping=function(){this.loadgrouprecords=function(B,E,p,C,G,e,P,D,v){var K=B;var h=this;var O=new Array();for(var l=0;l<h.groups.length;l++){O[l]=h.generatekey()}var I=new Array();var b=0;var O=O;var y=new Array();var N=E;var d=E;var z=h.groups.length;this.loadedrecords=new Array();this.bounditems=new Array();this.loadedrecords=new Array();this.loadedrootgroups=new Array();this.loadedgroups=new Array();this.loadedgroupsByKey=new Array();this.sortedgroups=new Array();var M=this.sortdata!=null;var Q=M?this.sortdata:this.records;if(this.pageable){var s=new Array();var A=0;if(!Q[E]){a.each(Q,function(i,q){s[E+i++]=this});Q=s}}if(this.virtualmode){var s=new Array();var A=0;for(var N=0;N<p-E;N++){if(Q[N]){s[E+A++]=Q[N]}else{if(Q[E+A]){s[E+A]=Q[E+A];A++}}}N=0;Q=s}for(var c=E;c<p;c++){var w={};if(!M){w=a.extend({},Q[c])}else{w=a.extend({},Q[c].value)}var F=w[h.uniqueId];if(G>=D||F!=P[G][h.uniqueId]||(e&&e[F])){v[v.length]=G}var J=new Array();var u=0;for(var l=0;l<z;l++){var r=h.groups[l];var H=w[r];if(H==null){H=""}J[u++]={value:H,hash:O[l]}}if(J.length!=z){break}var j=null;var k="";var f=-1;for(var L=0;L<J.length;L++){f++;var n=J[L].value;var t=J[L].hash;k=k+"_"+t+"_"+n;if(y[k]!=undefined&&y[k]!=null){j=y[k];continue}if(j==null){j={group:n,subItems:new Array(),subGroups:new Array(),level:0};I[b++]=j;j.uniqueid=h.generatekey();h.loadedgroupsByKey[n]=j}else{var m={group:n,subItems:new Array(),subGroups:new Array(),parentItem:j,level:j.level+1};h.loadedgroupsByKey[j.uniqueid+"_"+n]=m;m.uniqueid=h.generatekey();j.subGroups[j.subGroups.length++]=m;j=m}y[k]=j}if(j!=null){if(undefined==w.uid){w.uid=this.getid(this.source.id,w,N)}if(!M){w.boundindex=N;this.recordsbyid["id"+w.uid]=Q[c]}else{w.boundindex=Q[c].index;this.recordsbyid["id"+w.uid]=Q[c].value}this.bounditems[w.boundindex]=w;this.sortedgroups[N]=w;w.uniqueid=h.generatekey();w.parentItem=j;w.level=j.level+1;j.subItems[j.subItems.length++]=w}else{if(undefined==w.uid){w.uid=this.getid(this.source.id,w,N)}if(!M){w.boundindex=N;this.recordsbyid["id"+w.uid]=Q[c]}else{w.boundindex=Q[c].index;this.recordsbyid["id"+w.uid]=Q[c].value}this.sortedgroups[N]=w;this.bounditems[w.boundindex]=w;w.uniqueid=h.generatekey()}G++;N++;d++}var g=function(q,R,S){for(var i=0;i<R.subItems.length;i++){R.subItems[i].visibleindex=B+S;q.rows[S]=R.subItems[i];q.loadedrecords[S]=R.subItems[i];S++}return S};var o=function(Y,W,S){var V=1;var R=Y.grid.columns.records?Y.grid.columns.records:Y.grid.columns;if(Y.aggregates==true){for(var T=0;T<R.length;T++){if(R[T].aggregates){V=Math.max(V,R[T].aggregates.length)}}}var q=function(aa){if(Y.aggregates==true){var Z=function(ad){var ab=aa;var af={};var ag=function(ai){for(var ah=0;ah<R.length;ah++){if(R[ah].aggregates){var ao=Y.grid.getcolumnaggregateddata(R[ah].datafield,R[ah].aggregates,true,ai);for(var al=0;al<R[ah].aggregates.length;al++){if(R[ah].aggregates[ad]){var am=R[ah];var ak=R[ah].aggregates[ad];var aj=ak;aj=Y.grid._getaggregatename(aj);var an=aj+":"+ao[ak];if(ao[ak]){af[am.datafield]=an}else{af[am.datafield]=aj+":"+ao[aj]}}}}}};if(ab!=null){af.level=ab.level;af.visibleindex=B+S;af.uniqueid=Y.generatekey();Y.rows[S]=af;Y.loadedrecords[S++]=af;af.totalsrow=true;if(aa.subItems.length>0){ab=aa.subItems[aa.subItems.length-1];af.parentItem=ab.parentItem;if(af.parentItem.subItems){af.parentItem.subItems[af.parentItem.subItems.length]=af}var ac=[];var ae=function(){for(var ah=0;ah<aa.subItems.length;ah++){if(aa.subItems[ah].totalsrow){continue}ac[ac.length]=aa.subItems[ah]}};ae(aa);ag(ac)}else{if(aa.subGroups.length>0){ab=aa.subGroups[aa.subGroups.length-1];af.level=ab.level;af.parentItem=aa;aa.subGroups[aa.subGroups.length]=af;var ac=[];var ae=function(ai){if(ai.totalsrow){return}for(var ah=0;ah<ai.subItems.length;ah++){if(ai.subItems[ah].totalsrow){continue}ac[ac.length]=ai.subItems[ah]}for(var ah=0;ah<ai.subGroups.length;ah++){ae(ai.subGroups[ah])}};ae(aa);ag(ac)}}}};for(var i=0;i<V;i++){Z(i)}}};for(var U in W.subGroups){var X=W.subGroups[U];if(X.subGroups){Y.loadedgroups[Y.loadedgroups.length]=X;X.visibleindex=B+S;Y.rows[S]=X;Y.loadedrecords[S]=X;S++;if(X.subGroups.length>0){S=o(Y,X,S)}else{if(X.subItems.length>0){S=g(Y,X,S)}}}}if(W.subItems.length>0){S=g(Y,W,S)}q(W);return S};var x=I.length;this.loadedgroups=new Array();this.rows=new Array();var K=0;for(var N=0;N<x;N++){var r=I[N];this.loadedrootgroups[N]=r;this.loadedgroups[this.loadedgroups.length]=r;r.visibleindex=B+K;this.rows[K]=r;this.loadedrecords[K]=r;K++;K=o(this,r,K)}return K};this._updategroupsinpage=function(C,r,L,d,u,j,f){var p=new Array();var w=[];if(this.groupable&&this.groups.length>0){var B=0;var h=new Array();var g=new Array();for(var m=0;m<C.groups.length;m++){g[m]=C.generatekey()}var G=0;var o=new Array();var k=0;if(f>this.totalrecords){f=this.totalrecords}for(var v=j;v<f;v++){var I=a.extend({},C.sortedgroups[v]);var D=I[C.uniqueId];if(!C.pagesize||(L>=C.pagesize*C.pagenum&&L<C.pagesize*(C.pagenum+1))){if(d>=u||D!=p[d][C.uniqueId]||(updated&&updated[D])){w[w.length]=d}var e=new Array();var y=0;for(var m=0;m<C.groups.length;m++){var n=C.groups[m];var E=I[n];if(null==E){E=""}e[y++]={value:E,hash:g[m]}}if(e.length!=C.groups.length){break}var z=null;var s="";var c=-1;for(var A=0;A<e.length;A++){c++;var H=e[A].value;var l=e[A].hash;s=s+"_"+l+"_"+H;if(h[s]!=undefined&&h[s]!=null){z=h[s];continue}if(z==null){z={group:H,subItems:new Array(),subGroups:new Array(),level:0};o[k++]=z;var F=C.loadedgroupsByKey[H];if(F!=undefined){z.visibleindex=F.visibleindex;z.uniqueid=F.uniqueid}}else{var t={group:H,subItems:new Array(),subGroups:new Array(),parentItem:z,level:z.level+1};var F=C.loadedgroupsByKey[z.uniqueid+"_"+H];t.visibleindex=F.visibleindex;t.uniqueid=F.uniqueid;z.subGroups[z.subGroups.length++]=t;z=t}h[s]=z}if(z!=null){I.parentItem=z;I.level=z.level+1;z.subItems[z.subItems.length++]=I}d++}G++;L++}var x=function(M,N,q){for(var i=0;i<N.subItems.length;i++){p[q]=a.extend({},N.subItems[i]);q++}return q};var J=function(O){var q=false;for(var N in O.subGroups){var M=O.subGroups[N];if(M.subGroups){if(M.subGroups.length>0){var i=J(M);if(i){q=true;return true}}if(M.subItems.length>0){q=true;return true}}}if(O.subItems.length>0){q=true;return true}return q};var b=function(S,Q,T){var P=1;var M=S.grid.columns.records?S.grid.columns.records:S.grid.columns;if(S.aggregates==true){for(var N=0;N<M.length;N++){if(M[N].aggregates){P=Math.max(P,M[N].aggregates.length)}}}var q=function(V){if(S.aggregates==true){var U=function(Y){var W=V;var aa={};var ab=function(ad){for(var ac=0;ac<M.length;ac++){if(M[ac].aggregates){var aj=S.grid.getcolumnaggregateddata(M[ac].datafield,M[ac].aggregates,true,ad);for(var ag=0;ag<M[ac].aggregates.length;ag++){if(M[ac].aggregates[Y]){var ah=M[ac];var af=M[ac].aggregates[Y];var ae=af;ae=S.grid._getaggregatename(ae);var ai=ae+":"+aj[af];aa[ah.datafield]=ai}}}}};if(W!=null){aa.level=W.level;aa.visibleindex=T;aa.uniqueid=S.generatekey();p[T]=aa;S.loadedrecords[T++]=aa;aa.totalsrow=true;if(V.subItems.length>0){W=V.subItems[V.subItems.length-1];aa.parentItem=W.parentItem;if(aa.parentItem.subItems){aa.parentItem.subItems[aa.parentItem.subItems.length]=aa}var X=[];var Z=function(){for(var ac=0;ac<V.subItems.length;ac++){if(V.subItems[ac].totalsrow){continue}X[X.length]=V.subItems[ac]}};Z(V);ab(X)}else{if(V.subGroups.length>0){W=V.subGroups[V.subGroups.length-1];aa.level=W.level;aa.parentItem=V;V.subGroups[V.subGroups.length]=aa;var X=[];var Z=function(ad){if(ad.totalsrow){return}for(var ac=0;ac<ad.subItems.length;ac++){if(ad.subItems[ac].totalsrow){continue}X[X.length]=ad.subItems[ac]}for(var ac=0;ac<ad.subGroups.length;ac++){Z(ad.subGroups[ac])}};Z(V);ab(X)}}}};for(var i=0;i<P;i++){U(i)}}};for(var O in Q.subGroups){var R=Q.subGroups[O];if(R.subGroups){if(J(R)){p[T]=R;T++;if(R.subGroups.length>0){T=b(S,R,T)}else{if(R.subItems.length>0){T=x(S,R,T)}}}}}if(Q.subItems.length>0){T=x(S,Q,T)}q(Q);return T};var K=0;for(var G=0;G<o.length;G++){var n=o[G];if(J(n)){p[B]=n;B++;B=b(this,n,B)}}}return p}};a.extend(a.jqx._jqxGrid.prototype,{_initgroupsheader:function(){this.groupsheader.css("visibility","hidden");if(this._groupsheader()){this.groupsheader.css("visibility","inherit");var e=this;var c=this.gridlocalization.groupsheaderstring;this.groupsheaderdiv=this.groupsheaderdiv||a('<div style="width: 100%; position: relative;"></div>');this.groupsheaderdiv.height(this.groupsheaderheight);this.groupsheaderdiv.css("top",0);this.groupsheader.append(this.groupsheaderdiv);this.groupheadersbounds=new Array();var d=this.groups.length;this.groupsheaderdiv.children().remove();this.groupsheaderdiv[0].innerHTML="";var b=new Array();if(d>0){a.each(this.groups,function(i){var n=this;var m=e._getColumnText(this);var l=m.label;var k=e._rendergroupcolumn(l,n);k.addClass(e.toThemeProperty("jqx-grid-group-column"));e.groupsheaderdiv.append(k);if(e.closeablegroups){var j=a(k.find(".jqx-icon-close"));if(e.isTouchDevice()&&e.touchmode!==true){e.addHandler(j,"touchstart",function(){e.removegroupat(i);return false})}else{e.addHandler(j,"click",function(){e.removegroupat(i);return false})}}if(e.sortable){e.addHandler(k,"click",function(){var o=e.getcolumn(n);if(o!=null){e._togglesort(o)}return false})}b[b.length]=k;e._handlegroupstocolumnsdragdrop(this,k);if(i<d-1){var g=k.height();var h=a('<div style="float: left; position: relative;"></div>');if(e.rtl){h.css("float","right")}h.width(e.groupindentwidth/3);h.height(1);h.css("top",g/2);h.addClass(e.toThemeProperty("jqx-grid-group-column-line"));e.groupsheaderdiv.append(h)}})}else{var f=a('<div style="position: relative;">'+c+"</div>");this.groupsheaderdiv.append(f);if(this.rtl){f.addClass(this.toThemeProperty("jqx-rtl"))}}this._groupheaders=b;this._updategroupheadersbounds()}},_updategroupheadersbounds:function(){var c=this;var b=this.groupsheaderdiv.children().outerHeight();var d=(this.groupsheader.height()-b)/2;this.groupsheaderdiv.css("top",d);if(!this.rtl){this.groupsheaderdiv.css("left",d);this.groupsheaderdiv.css("right","")}else{this.groupsheaderdiv.css("left","");this.groupsheaderdiv.css("right",d)}if(this.rtl){this._groupheaders.reverse()}a.each(this._groupheaders,function(f){var e=this.coord();c.groupheadersbounds[f]={left:e.left,top:e.top,width:this.outerWidth(),height:this.outerHeight(),index:f}})},addgroup:function(c){if(c){var b=this;if(b.groups!==b.dataview.groups){b.dataview.groups=b.groups}b.groups[b.groups.length]=c;b.refreshgroups();this._raiseEvent(12,{type:"Add",index:b.groups[b.groups.length],groups:b.groups})}},insertgroup:function(d,c){if(d!=undefined&&d!=null&&d>=0&&d<=this.groups.length){if(c){var b=this;if(b.groups!==b.dataview.groups){b.dataview.groups=b.groups}b.groups.splice(d,0,c.toString());b.refreshgroups();this._raiseEvent(12,{type:"Insert",index:d,groups:b.groups})}}},refreshgroups:function(){this._refreshdataview();this._render(true,true,true,false);this._postrender("group")},_insertaftergroup:function(d,c){var b=this._getGroupIndexByDataField(d);this.insertgroup(b+1,c)},_insertbeforegroup:function(d,c){var b=this._getGroupIndexByDataField(d);this.insertgroup(b,c)},removegroupat:function(c){if(c>=0&&c!=null&&c!=undefined){var b=this;if(b.groups!==b.dataview.groups){b.dataview.groups=b.groups}b.groups.splice(c,1);b.refreshgroups();if(b.virtualmode){b.updatebounddata()}this._raiseEvent(12,{type:"Remove",index:c,groups:b.groups});return true}return false},cleargroups:function(){var b=this;b.groups=[];b.dataview.groups=b.groups;b.refreshgroups();this._raiseEvent(12,{type:"Clear",index:-1,groups:b.groups});return true},removegroup:function(c){if(c==null){return false}var b=this.groups.indexOf(c.toString());return this.removegroupat(b)},getrootgroupscount:function(){var b=this.dataview.loadedrootgroups.length;return b},collapsegroup:function(c){if(c>=0&&c.toString().indexOf(".")===-1){return this._setrootgroupstate(c,false)}var b=c.toString().split(".");var f=null;if(!this.groupsVisibility){this.groupsVisibility=new Array()}for(var d=0;d<b.length;d++){var c=parseInt(b[d]);if(d==0){var f=this.dataview.loadedrootgroups[c];this.groupsVisibility[f.group]=null}else{var e=f.subGroups[c];if(e){f=e;if(d==b.length-1){this._setgroupstate(f,false,true);this.groupsVisibility[f.group]=null}}}}},expandgroup:function(c){if(c>=0&&c.toString().indexOf(".")===-1){return this._setrootgroupstate(c,true)}var b=c.toString().split(".");var f=null;for(var d=0;d<b.length;d++){var c=parseInt(b[d]);if(d==0){var f=this.dataview.loadedrootgroups[c];this._setrootgroupstate(c,true);if(!this.groupsVisibility){this.groupsVisibility=new Array()}this.groupsVisibility[f.group]=f}else{var e=f.subGroups[c];if(e){f=e;this._setgroupstate(f,true,true);if(!this.groupsVisibility){this.groupsVisibility=new Array()}this.groupsVisibility[f.group]=f}}}},collapseallgroups:function(b){this._setbatchgroupstate(false,b)},expandallgroups:function(b){this._setbatchgroupstate(true,b)},isgroupexpanded:function(c){var d=this.dataview.loadedrootgroups[c];if(d==null){return null}var b=this.expandedgroups[d.uniqueid].expanded;return b},jsonParser:function(){var k="~",l="\\x"+("0"+k.charCodeAt(0).toString(16)).slice(-2),o="\\"+l,d=new RegExp(l,"g"),m=new RegExp(o,"g"),g=new RegExp("(?:^|([^\\\\]))"+o),n=[].indexOf||function(s){for(var t=this.length;t--&&this[t]!==s;){}return t},f=String;function c(y,t,C){var D=false,B=!!t,E=[],z=[y],s=[y],x=[C?k:"[Circular]"],A=y,w=1,u,v;if(B){v=typeof t==="object"?function(F,G){return F!==""&&n.call(t,F)<0?void 0:G}:t}return function(F,G){if(B){G=v.call(this,F,G)}if(D){if(A!==this){u=w-n.call(z,this)-1;w-=u;z.splice(w,z.length);E.splice(w-1,E.length);A=this}if(typeof G==="object"&&G){if(n.call(z,G)<0){z.push(A=G)}w=z.length;u=n.call(s,G);if(u<0){u=s.push(G)-1;if(C){E.push((""+F).replace(d,l));x[u]=k+E.join(k)}else{x[u]=x[0]}}else{G=x[u]}}else{if(typeof G==="string"&&C){G=G.replace(l,o).replace(k,l)}}}else{D=true}return G}}function q(v,u){for(var s=0,t=u.length;s<t;v=v[u[s++].replace(m,k)]){}return v}function b(s){return function(u,v){var t=typeof v==="string";if(t&&v.charAt(0)===k){return new f(v.slice(1))}if(u===""){v=h(v,v,{})}if(t){v=v.replace(g,"$1"+k).replace(o,l)}return s?s.call(this,u,v):v}}function j(s,w,v){for(var t=0,u=w.length;t<u;t++){w[t]=h(s,w[t],v)}return w}function r(s,v,u){for(var t in v){if(v.hasOwnProperty(t)){v[t]=h(s,v[t],u)}}return v}function h(s,u,t){return u instanceof Array?j(s,u,t):(u instanceof f?(u.length?(t.hasOwnProperty(u)?t[u]:t[u]=q(s,u.split(k))):s):(u instanceof Object?r(s,u,t):u))}var p={stringify:function i(v,t,u,s){return p.parser.stringify(v,c(v,t,!s),u)},parse:function e(t,s){return p.parser.parse(t,b(s))},parser:JSON};return p},getgroup:function(e){var k=this.dataview.loadedrootgroups[e];if(k==null){return null}var f=this.expandedgroups[k.uniqueid].expanded;var g=k.group;var b=k.level;var c=new Array();this._getsubgroups(c,k);var j=this;var d={group:g,level:b,expanded:f,subgroups:c};if(k.subItems){var h=new Array();a.each(k.subItems,function(){var l=this.boundindex;h[h.length]=j.getrowdata(l)});if(h.length>0){d.subrows=h}}var i=this.jsonParser().stringify(k);i=i.replace(/subItems/ig,"subrows");i=i.replace(/subGroups/ig,"subgroups");d=this.jsonParser().parse(i);return d},getrootgroups:function(){var d=this.dataview.loadedrootgroups.length;var c=new Array();for(var b=0;b<d;b++){c[b]=this.getgroup(b)}return c},_getsubgroups:function(c,k){var j=this;for(var e in k.subGroups){var i=k.subGroups[e];var f=j.expandedgroups[i.uniqueid].expanded;var g=i.group;var b=i.level;c[c.length]={group:g,level:b,expanded:f};if(i.subItems){var h=new Array();a.each(i.subItems,function(){var l=this.boundindex;h[h.length]=j.getrowdata(l)});c[c.length-1].subrows=h}if(i.subGroups){var d=new Array();j._getsubgroups(d,i)}}return c},_setbatchgroupstate:function(b,f){var c=this;for(var d in this.dataview.loadedrootgroups){c._setrootgroupstate(d,b,false,true)}if(f==false){c._requiresupdate=true;c._renderrows(c.virtualsizeinfo);return true}var e=this.vScrollBar[0].style.visibility;this.rendergridcontent(true,false);if(e!=this.vScrollBar[0].style.visibility||this._hiddencolumns){this._updatecolumnwidths();this._updatecellwidths();this._renderrows(this.virtualsizeinfo)}return true},_setrootgroupstate:function(d,b,f,c){if(d==undefined||d==null||d<0){return false}if(!this.groupable||this.groups.length==0){return false}var j=f!=undefined?f:true;if(d>=0&&d<this.dataview.loadedrootgroups.length){var h=this.dataview.loadedrootgroups[d];if(this.pageable){var g=new Array();for(var e=0;e<this.dataview.rows.length;e++){if(this.dataview.rows[e].group!=null&&this.dataview.rows[e].level===0){g.push(this.dataview.rows[e])}}h=g[d];if(!h){return}}return this._setgroupstate(h,b,j,c)}return false},_togglegroupstate:function(e,f){if(e==null||e==undefined){return false}var c=this.vScrollInstance.value;var d=this.expandedgroups[e.uniqueid];if(d==undefined){d=false}else{d=d.expanded}d=!d;if(!this.groupsVisibility){this.groupsVisibility=new Array()}if(d){this.groupsVisibility[e.group]=e}else{this.groupsVisibility[e.group]=null}var b=this._setgroupstate(e,d,f);this._newmax=null;if(c!==0&&this.vScrollBar.css("visibility")!=="hidden"){if(c<=this.vScrollInstance.max){this.vScrollInstance.setPosition(c)}else{this.vScrollInstance.setPosition(this.vScrollInstance.max)}}return b},_setgroupstate:function(f,b,h,c){if(f==null||f==undefined){return false}var e=false;if(this.editable&&this.editcell){this.endcelledit(this.editcell.row,this.editcell.column,false,false)}var d=this.expandedgroups[f.uniqueid];if(d==undefined){d={expanded:false};e=true}if(d.expanded!=b){e=true}if(e){this.expandedgroups[f.uniqueid]={expanded:b,group:f};this._setsubgroupsvisibility(this,f,!b,c);if(h){var g=this.vScrollBar[0].style.visibility;this.rendergridcontent(true,false);if(g!=this.vScrollBar[0].style.visibility||this._hiddencolumns){this._updatecolumnwidths();this._updatecellwidths();this._renderrows(this.virtualsizeinfo)}}if(undefined==this.suspendgroupevents||this.suspendgroupevents==false){if(b){this._raiseEvent(4,{group:f.group,parentgroup:f.parentItem?f.parentItem.group:null,level:f.level,visibleindex:f.visibleindex})}else{this._raiseEvent(5,{group:f.group,parentgroup:f.parentItem?f.parentItem.group:null,level:f.level,visibleindex:f.visibleindex})}}return true}return false},_setgroupitemsvisibility:function(c,e,d){for(var b=0;b<e.subItems.length;b++){c._setrowvisibility(e.subItems[b].visibleindex,d,false)}},_setsubgroupsvisibility:function(c,h,f,d){if(h.parentItem!=null){if(this.hiddens[h.parentItem.visibleindex]){return}}else{if(h.parentItem==null){if(this.hiddens[h.visibleindex]){return}}}for(var g in h.subGroups){var e=h.subGroups[g];if(!f){c._setrowvisibility(e.visibleindex,f,false)}var b=!f;if(!d){if(c.expandedgroups[e.uniqueid]==undefined){b=false}else{b=c.expandedgroups[e.uniqueid].expanded}}else{this.expandedgroups[e.uniqueid]={expanded:b,group:e}}if(e.subGroups){if(e.subGroups.length>0){c._setsubgroupsvisibility(c,e,!b||f,d)}else{if(e.subItems.length>0){c._setgroupitemsvisibility(c,e,!b||f)}}}if(f){c._setrowvisibility(e.visibleindex,f,false)}}if(h.subItems&&h.subItems.length>0){c._setgroupitemsvisibility(c,h,f)}},_handlecolumnsdragdrop:function(){var d=this;var g=-1;var c=false;if(!d.groupable){return}var f="mousemove.grouping"+this.element.id;var e="mousedown.grouping"+this.element.id;var h="mouseup.grouping"+this.element.id;var b=false;if(this.isTouchDevice()&&this.touchmode!==true){b=true;f=a.jqx.mobile.getTouchEventName("touchmove")+".grouping"+this.element.id;e=a.jqx.mobile.getTouchEventName("touchstart")+".grouping"+this.element.id;h=a.jqx.mobile.getTouchEventName("touchend")+".grouping"+this.element.id}this.removeHandler(a(document),f);this.addHandler(a(document),f,function(j){if(!d.showgroupsheader){return true}if(d.dragcolumn!=null){var l=parseInt(j.pageX);var u=parseInt(j.pageY);if(b){var r=d.getTouches(j);var p=r[0];l=parseInt(p.pageX);u=parseInt(p.pageY)}var n=d.host.coord();var v=parseInt(n.left);var w=parseInt(n.top);if(d.dragmousedownoffset==undefined||d.dragmousedownoffset==null){d.dragmousedownoffset={left:0,top:0}}var t=parseInt(l)-parseInt(d.dragmousedownoffset.left);var i=parseInt(u)-parseInt(d.dragmousedownoffset.top);d.dragcolumn.css({left:t+"px",top:i+"px"});c=false;if(l>=v&&l<=v+d.host.width()){if(u>=w&&u<=w+d.host.height()){c=true}}g=-1;if(c){d.dragcolumnicon.removeClass(d.toThemeProperty("jqx-grid-dragcancel-icon"));d.dragcolumnicon.addClass(d.toThemeProperty("jqx-grid-drag-icon"));var s=d.groupsheader.coord();var m=s.top+d.groupsheader.height();var q=a.data(d.dragcolumn[0],"datarecord");if(q){var k=d.groups.indexOf(q.toString())}else{var k=-1}var o=(k==-1)||(d.groups.length>1&&k>-1);if(d.dropline!=null){if(u>=s.top&&u<=m){if(o){g=d._handlegroupdroplines(l)}}else{d.dropline.fadeOut("slow")}}}else{if(d.dropline!=null){d.dropline.fadeOut("slow")}d.dragcolumnicon.removeClass(d.toThemeProperty("jqx-grid-drag-icon"));d.dragcolumnicon.addClass(d.toThemeProperty("jqx-grid-dragcancel-icon"))}if(b){j.preventDefault();j.stopPropagation();return false}}},{passive:false});this.removeHandler(a(document),h);this.addHandler(a(document),h,function(i){if(!d.showgroupsheader){return true}d.__drag=false;a(document.body).removeClass("jqx-disableselect");var m=parseInt(i.pageX);var s=parseInt(i.pageY);if(b){var p=d.getTouches(i);var o=p[0];m=parseInt(o.pageX);s=parseInt(o.pageY)}var n=d.host.coord();var t=parseInt(n.left);var u=parseInt(n.top);var k=d.groupsheader.height();if(d.showtoolbar){u+=d.toolbarheight}d.dragstarted=false;d.dragmousedown=null;if(d.dragcolumn!=null){var l=a.data(d.dragcolumn[0],"datarecord");d.dragcolumn.remove();d.dragcolumn=null;if(l!=null){if(!d.getcolumn(l).groupable){if(d.dropline!=null){d.dropline.remove();d.dropline=null}return}if(c){if(g!=-1){var q=g.index;var r=d.groups[q];var j=d._getGroupIndexByDataField(l);if(j!=q){if(j!=undefined&&j>=0){d.groups.splice(j,1)}if(g.position=="before"){if(!d.rtl){d._insertbeforegroup(r,l)}else{d._insertaftergroup(r,l)}}else{if(!d.rtl){d._insertaftergroup(r,l)}else{d._insertbeforegroup(r,l)}}}}else{if(d.groups.length==0){if(s>u&&s<=u+k){d.addgroup(l)}}else{if(s>u+k){var j=d._getGroupIndexByDataField(l);d.removegroupat(j)}}}}if(d.dropline!=null){d.dropline.remove();d.dropline=null}}}})},_getGroupIndexByDataField:function(b){for(var c=0;c<this.groups.length;c++){if(this.groups[c]==b){return c}}return -1},_isColumnInGroups:function(c){for(var b=0;b<this.groups.length;b++){if(this.groups[b]==c){return true}}return false},_handlegroupdroplines:function(d){var b=this;var c=-1;a.each(b.groupheadersbounds,function(e){if(d<=this.left+this.width/2){var f=this.left-3;if(e>0){f=this.left-1-b.groupindentwidth/6}b.dropline.css("left",f);b.dropline.css("top",this.top);b.dropline.height(this.height);b.dropline.fadeIn("slow");c={index:e,position:"before"};if(b.rtl){c={index:b.groupheadersbounds.length-1-e,position:"before"}}return false}else{if(d>=this.left+this.width/2){b.dropline.css("left",1+this.left+this.width);b.dropline.css("top",this.top);b.dropline.height(this.height);b.dropline.fadeIn("slow");c={index:e,position:"after"};if(b.rtl){c={index:b.groupheadersbounds.length-1-e,position:"after"}}}}});return c},_handlegroupstocolumnsdragdrop:function(c,e){this.dragmousedown=null;this.dragmousedownoffset=null;this.dragstarted=false;this.dragcolumn=null;var f=this;var d;var h="mousedown";var g="mousemove";var b=false;if(this.isTouchDevice()&&this.touchmode!==true){b=true;h=a.jqx.mobile.getTouchEventName("touchstart");g=a.jqx.mobile.getTouchEventName("touchmove")}this.addHandler(e,"dragstart",function(i){return false});this.addHandler(e,h,function(i){if(!f.showgroupsheader){return true}var l=i.pageX;var k=i.pageY;f.__drag=true;f.dragmousedown={left:l,top:k};if(b){var j=f.getTouches(i);var n=j[0];l=n.pageX;k=n.pageY;f.dragmousedown={left:l,top:k};if(i.preventDefault){i.preventDefault()}}var m=a(i.target).coord();f.dragmousedownoffset={left:parseInt(l)-parseInt(m.left),top:parseInt(k-m.top)}});this.addHandler(e,g,function(i){if(!f.showgroupsheader){return true}if(f.dragmousedown){d={left:i.pageX,top:i.pageY};if(b){var k=f.getTouches(i);var m=k[0];d={left:m.pageX,top:m.pageY}}if(!f.dragstarted&&f.dragcolumn==null){var j=Math.abs(d.left-f.dragmousedown.left);var l=Math.abs(d.top-f.dragmousedown.top);if(j>3||l>3){f._createdragcolumn(e,d,true);a(document.body).addClass("jqx-disableselect");a.data(f.dragcolumn[0],"datarecord",c);if(i.preventDefault){i.preventDefault()}}}}},{passive:false})},_createdragcolumn:function(c,e,g){var h=this;var f=e;h.dragcolumn=a("<div></div>");var j=c.clone();h.dragcolumn.css("z-index",999999);j.css("border-width","1px");j.css("opacity","0.4");var i=a(j.find("."+h.toThemeProperty("jqx-grid-column-menubutton")));if(i.length>0){i.css("display","none")}var b=a(j.find(".jqx-icon-close"));if(b.length>0){b.css("display","none")}h.dragcolumnicon=a('<div style="z-index: 9999; position: absolute; left: 100%; top: 50%; margin-left: -18px; margin-top: -7px;"></div>');h.dragcolumnicon.addClass(h.toThemeProperty("jqx-grid-drag-icon"));h.dragcolumn.css("float","left");h.dragcolumn.css("position","absolute");var d=h.host.coord();j.width(c.width()+16);h.dragcolumn.append(j);h.dragcolumn.height(c.height());h.dragcolumn.width(j.width());h.dragcolumn.append(h.dragcolumnicon);a(document.body).append(h.dragcolumn);j.css("margin-left",0);j.css("left",0);j.css("top",0);h.dragcolumn.css("left",f.left+h.dragmousedown.left);h.dragcolumn.css("top",f.top+h.dragmousedown.top);if(g!=undefined&&g){h.dropline=a('<div style="display: none; position: absolute;"></div>');h.dropline.width(2);h.dropline.addClass(h.toThemeProperty("jqx-grid-group-drag-line"));a(document.body).append(h.dropline)}},iscolumngroupable:function(b){return this._getcolumnproperty(b,"groupable")},_handlecolumnstogroupsdragdrop:function(c,f){this.dragmousedown=null;this.dragmousedownoffset=null;this.dragstarted=false;this.dragcolumn=null;var g=this;var e;var b=false;if(this.isTouchDevice()&&this.touchmode!==true){b=true}var d="mousedown.drag";var e="mousemove.drag";if(b){d=a.jqx.mobile.getTouchEventName("touchstart")+".drag";e=a.jqx.mobile.getTouchEventName("touchmove")+".drag"}else{this.addHandler(f,"dragstart",function(h){return false})}this.addHandler(f,d,function(j){if(!g.showgroupsheader){return true}g.__drag=true;if(g._isColumnInGroups(c.displayfield)){if(f.css("cursor")!="col-resize"){return true}else{return true}}if(false==c.groupable){return true}var i=j.pageX;var h=j.pageY;if(b){var k=g.getTouches(j);var m=k[0];i=m.pageX;h=m.pageY}g.dragmousedown={left:i,top:h};if(b){if(j.preventDefault){j.preventDefault()}}var l=a(j.target).coord();g.dragmousedownoffset={left:parseInt(i)-parseInt(l.left),top:parseInt(h-l.top)}});this.addHandler(f,e,function(j){if(!g.showgroupsheader){return true}if(g._isColumnInGroups(c.displayfield)){if(f.css("cursor")!="col-resize"){return true}else{return true}}if(g.dragmousedown){var i=j.pageX;var h=j.pageY;if(b){var l=g.getTouches(j);var n=l[0];i=n.pageX;h=n.pageY}e={left:i,top:h};if(!g.dragstarted&&g.dragcolumn==null){var k=Math.abs(e.left-g.dragmousedown.left);var m=Math.abs(e.top-g.dragmousedown.top);if(k>3||m>3){g._createdragcolumn(f,e,true);a.data(g.dragcolumn[0],"datarecord",c.displayfield);if(j.preventDefault){j.preventDefault()}}}}})},_rendergroupcolumn:function(g,h){var e=a('<div style="float: left; position: relative;"></div>');if(this.rtl){e.css("float","right")}if(this.groupcolumnrenderer!=null){e[0].innerHTML=this.groupcolumnrenderer(g);e.addClass(this.toThemeProperty("jqx-grid-group-column"));e.addClass(this.toThemeProperty("jqx-fill-state-normal"))}if(this.closeablegroups){if(e[0].innerHTML==""){e[0].innerHTML='<a style="float: left;" href="#">'+g+"</a>"}if(this.rtl){e[0].innerHTML='<a style="float: right;" href="#">'+g+"</a>"}var d=!this.rtl?"right":"left";var c='<div style="float: '+d+'; min-height: 16px; min-width: 18px;"><div style="position: absolute; left: 100%; top: 50%; margin-left: -18px; margin-top: -8px; float: none; width: 16px; height: 16px;" class="'+this.toThemeProperty("jqx-icon-close")+'"></div></div>';if(a.jqx.browser.msie&&a.jqx.browser.version<8){c='<div style="float: left; min-height: 16px; min-width: 18px;"><div style="position: absolute; left: 100%; top: 50%; margin-left: -18px; margin-top: -8px; float: none; width: 16px; height: 16px;" class="'+this.toThemeProperty("jqx-icon-close")+'"></div></div>'}if(this.rtl){var c='<div style="float: '+d+'; min-height: 16px; min-width: 18px;"><div style="position: absolute; left: 0px; top: 50%; margin-top: -8px; float: none; width: 16px; height: 16px;" class="'+this.toThemeProperty("jqx-icon-close")+'"></div></div>';if(a.jqx.browser.msie&&a.jqx.browser.version<8){c='<div style="float: left; min-height: 16px; min-width: 18px;"><div style="position: absolute; left: 0px; top: 50%; margin-top: -8px; float: none; width: 16px; height: 16px;" class="'+this.toThemeProperty("jqx-icon-close")+'"></div></div>'}}e[0].innerHTML+=c}else{if(e[0].innerHTML==""){e[0].innerHTML='<a href="#">'+g+"</a>"}}if(this.sortable){var f=a('<div style="float: right; min-height: 16px; min-width: 18px;"><div style="position: absolute; left: 100%; top: 50%; margin-left: -16px; margin-top: -8px; float: none; width: 16px; height: 16px;" class="'+this.toThemeProperty("jqx-grid-column-sortascbutton")+'"></div></div>');var b=a('<div style="float: right; min-height: 16px; min-width: 18px;"><div style="position: absolute; left: 100%; top: 50%; margin-left: -16px; margin-top: -8px; float: none; width: 16px; height: 16px;" class="'+this.toThemeProperty("jqx-grid-column-sortdescbutton")+'"></div></div>');if(this.closeablegroups){var f=a('<div style="float: right; min-height: 16px; min-width: 18px;"><div style="position: absolute; left: 100%; top: 50%; margin-left: -32px; margin-top: -8px; float: none; width: 16px; height: 16px;" class="'+this.toThemeProperty("jqx-grid-column-sortascbutton")+'"></div></div>');var b=a('<div style="float: right; min-height: 16px; min-width: 18px;"><div style="position: absolute; left: 100%; top: 50%; margin-left: -32px; margin-top: -8px; float: none; width: 16px; height: 16px;" class="'+this.toThemeProperty("jqx-grid-column-sortdescbutton")+'"></div></div>')}if(this.rtl){var f=a('<div style="float: right; min-height: 16px; min-width: 18px;"><div style="position: absolute; left: 0px; top: 50%; margin-left: 0px; margin-top: -8px; float: none; width: 16px; height: 16px;" class="'+this.toThemeProperty("jqx-grid-column-sortascbutton")+'"></div></div>');var b=a('<div style="float: right; min-height: 16px; min-width: 18px;"><div style="position: absolute; left: 0px; top: 50%; margin-left: 0px; margin-top: -8px; float: none; width: 16px; height: 16px;" class="'+this.toThemeProperty("jqx-grid-column-sortdescbutton")+'"></div></div>');if(this.closeablegroups){var f=a('<div style="float: right; min-height: 16px; min-width: 18px;"><div style="position: absolute; left: 0px; top: 50%; margin-left: 16px; margin-top: -8px; float: none; width: 16px; height: 16px;" class="'+this.toThemeProperty("jqx-grid-column-sortascbutton")+'"></div></div>');var b=a('<div style="float: right; min-height: 16px; min-width: 18px;"><div style="position: absolute; left: 0px; top: 50%; margin-left: 16px; margin-top: -8px; float: none; width: 16px; height: 16px;" class="'+this.toThemeProperty("jqx-grid-column-sortdescbutton")+'"></div></div>')}}f.css("display","none");b.css("display","none");if(a.jqx.browser.msie&&a.jqx.browser.version<8){f.css("float","left");b.css("float","left")}e.append(f);e.append(b);a.data(document.body,"groupsortelements"+h,{sortasc:f,sortdesc:b})}e.addClass(this.toThemeProperty("jqx-fill-state-normal"));e.addClass(this.toThemeProperty("jqx-grid-group-column"));return e},_rendergroup:function(p,x,b,v,k,B,u){var H=x;var c=x.cells[b.level];if(this.rtl){c=x.cells[x.cells.length-1-b.level]}var F=this._findgroupstate(b.uniqueid);if(b.bounddata.subGroups.length>0||b.bounddata.subItems.length>0){var i=this.rtl?"-rtl":"";var C=this.toThemeProperty("jqx-icon-arrow-right");if(i){C=this.toThemeProperty("jqx-icon-arrow-left")}if(F){c.className+=" "+this.toThemeProperty("jqx-grid-group-expand"+i)+" "+this.toThemeProperty("jqx-icon-arrow-down")}else{c.className+=" "+this.toThemeProperty("jqx-grid-group-collapse"+i)+" "+C}}var t=this._getColumnText(this.groups[b.level]).label;var d=this.groupindentwidth;var r=this.rowdetails&&this.showrowdetailscolumn?(1+p)*d:(p)*d;var y=u-r;var g=b.level+1;if(this.rtl){g=0}var n=H.cells[g];var A=2;while(n!=undefined&&n.style.display=="none"&&A<H.cells.length-1){n=H.cells[g+A-1];A++}var f=a(n);if(!n){return}n.style.width=parseInt(y)+"px";if(n.className.indexOf("jqx-grid-cell-filter")!=-1){f.removeClass(this.toThemeProperty("jqx-grid-cell-filter"))}if(n.className.indexOf("jqx-grid-cell-sort")!=-1){f.removeClass(this.toThemeProperty("jqx-grid-cell-sort"))}if(n.className.indexOf("jqx-grid-cell-pinned")!=-1){f.removeClass(this.toThemeProperty("jqx-grid-cell-pinned"))}if(this.groupsrenderer!=null){var h={group:b.group,level:b.level,parent:b.bounddata.parentItem,subGroups:b.bounddata.subGroups,subItems:b.bounddata.subItems,groupcolumn:this._getColumnText(this.groups[b.level]).column};var q=this.groupsrenderer(t+": "+b.group,b.group,F,h);if(q){n.innerHTML=q}else{var l=b.bounddata.subItems.length>0?b.bounddata.subItems.length:b.bounddata.subGroups.length;if(this.showgroupaggregates){var I=b.bounddata.subItems.length>0?b.bounddata.subItems:b.bounddata.subGroups;l=0;for(var G=0;G<I.length;G++){if(I[G].totalsrow){continue}l++}}n.innerHTML='<div class="'+this.toThemeProperty("jqx-grid-groups-row")+'" style="position: absolute;"><span>'+t+': </span><span class="'+this.toThemeProperty("jqx-grid-groups-row-details")+'">'+b.group+" ("+l+")</span></div>"}}else{var e=this._getcolumnbydatafield(this.groups[b.level]);var z=b.group;if(e!=null){if(e.cellsformat){if(a.jqx.dataFormat){if(a.jqx.dataFormat.isDate(z)){z=a.jqx.dataFormat.formatdate(z,e.cellsformat,this.gridlocalization)}else{if(a.jqx.dataFormat.isNumber(z)){z=a.jqx.dataFormat.formatnumber(z,e.cellsformat,this.gridlocalization)}}}}var l=b.bounddata.subItems.length>0?b.bounddata.subItems.length:b.bounddata.subGroups.length;if(this.showgroupaggregates){var I=b.bounddata.subItems.length>0?b.bounddata.subItems:b.bounddata.subGroups;l=0;for(var G=0;G<I.length;G++){if(I[G].totalsrow){continue}l++}}n.innerHTML='<div class="'+this.toThemeProperty("jqx-grid-groups-row")+'" style="position: absolute;"><span>'+t+': </span><span class="'+this.toThemeProperty("jqx-grid-groups-row-details")+'">'+z+" ("+l+")</span></div>"}else{throw new Error("jqxGrid: Unable to find '"+this.groups[b.level]+"' group in the Grid's columns collection.")}}if(this.rtl){if(!e){e=this._getcolumnbydatafield(this.groups[b.level])}var s=this.hScrollBar.css("visibility")=="hidden"?0:this.hScrollInstance.max-this.hScrollInstance.value;var D=this.vScrollBar.css("visibility")=="hidden"?0:this.scrollbarsize+6;var r=this.rowdetails&&this.showrowdetailscolumn?(2+b.level)*d:(1+b.level)*d;n.style.width=u+parseInt(s)-r-D+"px";f.addClass(this.toThemeProperty("jqx-rtl"));var w=a(x.cells[x.cells.length-1]).css("z-index");f.css("z-index",w);var E=f.find("div");var y=E.width();E.css("left","100%");var o=this.columns.records[x.cells.length-2-b.level]!=null?this.columns.records[x.cells.length-2-b.level].pinned:false;if(this.table.width()<u){u=this.table.width();if(this.vScrollBar.css("visibility")!="hidden"){u+=this.vScrollBar.outerWidth()}}if(e.pinned||o){if(this.rowdetails&&this.showrowdetailscolumn){u+=30}E.css("margin-left",-y);n.style.width=u+s-r-D+"px"}else{var s=this.hScrollBar.css("visibility")=="hidden"?0:this.hScrollInstance.max;n.style.width=u+s-r-D+"px";var y=E.width();E.css("margin-left",-y)}}}})})(jqxBaseFramework);

