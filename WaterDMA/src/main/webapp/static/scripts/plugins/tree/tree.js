(function(n){n.fn.swapClass=function(n,t){return this.removeClass(n).addClass(t)};n.fn.switchClass=function(n,t){return this.hasClass(n)?this.swapClass(n,t):this.swapClass(t,n)};n.fn.treeview=function(t){function d(n,t){var o,u;if(t.push("<div class='bbit-tree-bwrap'>"),t.push("<div class='bbit-tree-body "+r+"'>"),t.push("<ul class='bbit-tree-root ",i.theme,"'>"),n&&n.length>0)for(o=n.length,u=0;u<o;u++)f(n[u],t,0,u,u==o-1);else c(null,!1,function(n){var u,r;if(n&&n.length>0)for(e=n,i.data=n,i.description&&n.unshift({id:"",text:i.description,value:"",img:"-1",parentnodes:"0",showcheck:!1,isexpand:!0,complete:!0,hasChildren:!1,ChildNodes:[]}),u=n.length,r=0;r<u;r++)f(n[r],t,0,r,r==u-1)});t.push("<\/ul>");t.push("<\/div>");t.push("<\/div>")}function f(n,t,u,e,o){var v=n.id.replace(/[^\w]/gi,"_"),l,h,a,c,s;if(t.push("<li class='bbit-tree-node'>"),l=n.title,l=l?n.title:n.text,t.push("<div id='",r,"_",v,"' tpath='",e,"' unselectable='on' title='",l,"'"),h=[],h.push("bbit-tree-node-el"),n.hasChildren?h.push(n.isexpand?"bbit-tree-node-expanded":"bbit-tree-node-collapsed"):h.push("bbit-tree-node-leaf"),n.classes&&h.push(n.classes),t.push(" class='",h.join(" "),"'>"),t.push("<span class='bbit-tree-node-indent'>"),u==1)t.push("<img class='bbit-tree-icon' src='"+i.cbiconpath+"s.gif'/>");else if(u>1)for(t.push("<img class='bbit-tree-icon' src='"+i.cbiconpath+"s.gif'/>"),a=1;a<u;a++)t.push("<img class='bbit-tree-elbow-line' src='"+i.cbiconpath+"s.gif'/>");if(t.push("<\/span>"),h.length=0,n.hasChildren?n.isexpand?h.push(o?"bbit-tree-elbow-end-minus":"bbit-tree-elbow-minus"):h.push(o?"bbit-tree-elbow-end-plus":"bbit-tree-elbow-plus"):h.push(o?"bbit-tree-elbow-end":"bbit-tree-elbow"),t.push("<img class='bbit-tree-ec-icon ",h.join(" "),"' src='"+i.cbiconpath+"s.gif'/>"),i.showcheck&&n.showcheck&&((n.checkstate==null||n.checkstate==undefined)&&(n.checkstate=0),t.push("<img  id='",r,"_",v,"_cb' class='bbit-tree-node-cb' src='",i.cbiconpath,i.icons[n.checkstate],"'/>")),n.hasChildren?n.img==-1?t.push(""):n.img?t.push('<i class="'+n.img+'"><\/i>&nbsp;'):t.push("<i class=\"fa fa-folder-open\" style='width:15px'>&nbsp;<\/i>"):n.img==-1?t.push(""):n.img?t.push('<i class="'+n.img+'"><\/i>&nbsp;'):t.push('<i class="fa fa-file-o"><\/i>&nbsp;'),t.push("<a hideFocus class='bbit-tree-node-anchor' tabIndex=1 href='javascript:void(0);'>"),t.push("<span data-value='"+n.id+"' class='bbit-tree-node-text' unselectable='on'>",n.text,"<\/span>"),t.push("<\/a>"),t.push("<\/div>"),n.hasChildren)if(n.isexpand){if(t.push("<ul  class='bbit-tree-node-ct'  style='z-index: 0; position: static; visibility: visible; top: auto; left: auto;'>"),n.ChildNodes)for(c=n.ChildNodes.length,s=0;s<c;s++)n.ChildNodes[s].parent=n,f(n.ChildNodes[s],t,u+1,e+"."+s,s==c-1);t.push("<\/ul>")}else{if(t.push("<ul style='display:none;'>"),n.ChildNodes)for(c=n.ChildNodes.length,s=0;s<c;s++)n.ChildNodes[s].parent=n,f(n.ChildNodes[s],t,u+1,e+"."+s,s==c-1);t.push("<\/ul>")}t.push("<\/li>");n.render=!0}function y(n){for(var r=n.split("."),i=e,t=0;t<r.length;t++)i=t==0?i[r[t]]:i.ChildNodes[r[t]];return i}function h(t,u,f){var l=t.checkstate,e,c,s;if(f==1)t.checkstate=u;else{var o=t.ChildNodes,a=o.length,h=!0;for(e=0;e<a;e++)if(u==1&&o[e].checkstate!=1||u==0&&o[e].checkstate!=0){h=!1;break}t.checkstate=h?u:2}t.render&&l!=t.checkstate&&(c=t.id.replace(/[^\w]/gi,"_"),s=n("#"+r+"_"+c+"_cb"),s.length==1&&s.attr("src",i.cbiconpath+i.icons[t.checkstate]))}function p(n,t,i){var u,r,f;if(n(t,i,1)!=!1&&t.ChildNodes!=null&&t.ChildNodes.length>0)for(u=t.ChildNodes,r=0,f=u.length;r<f;r++)p(n,u[r],i)}function g(n,t,i){for(var r=t.parent;r;){if(n(r,i,0)===!1)break;r=r.parent}}function nt(t){var s=n(this).attr("tpath"),f=t.target||t.srcElement,u=y(s),e,l,o,a,v;f.tagName=="IMG"?n(f).hasClass("bbit-tree-elbow-plus")||n(f).hasClass("bbit-tree-elbow-end-plus")?(n(this).find("i").hasClass("fa-folder")&&n(this).find("i").swapClass("fa-folder","fa-folder-open"),e=n(this).next(),e.hasClass("bbit-tree-node-ct")?e.slideDown(200):(l=s.split(".").length,u.complete?u.ChildNodes!=null&&w(u.ChildNodes,l,s,e,u):(n(this).addClass("bbit-tree-node-loading"),c(u,!0,function(n){u.complete=!0;u.ChildNodes=n;w(n,l,s,e,u)}))),n(f).hasClass("bbit-tree-elbow-plus")?n(f).swapClass("bbit-tree-elbow-plus","bbit-tree-elbow-minus"):n(f).swapClass("bbit-tree-elbow-end-plus","bbit-tree-elbow-end-minus"),n(this).swapClass("bbit-tree-node-collapsed","bbit-tree-node-expanded")):n(f).hasClass("bbit-tree-elbow-minus")||n(f).hasClass("bbit-tree-elbow-end-minus")?(n(this).find("i").hasClass("fa-folder-open")&&n(this).find("i").swapClass("fa-folder-open","fa-folder"),n(this).next().slideUp(200),n(f).hasClass("bbit-tree-elbow-minus")?n(f).swapClass("bbit-tree-elbow-minus","bbit-tree-elbow-plus"):n(f).swapClass("bbit-tree-elbow-end-minus","bbit-tree-elbow-end-plus"),n(this).swapClass("bbit-tree-node-expanded","bbit-tree-node-collapsed")):n(f).hasClass("bbit-tree-node-cb")&&(o=u.checkstate!=1?1:0,a=!0,i.oncheckboxclick&&(a=i.oncheckboxclick.call(f,u,o)),a!=!1&&(i.cascadecheck?(p(h,u,o),g(h,u,o)):h(u,o,1))):(i.citem&&(v=i.citem.id.replace(/[^\w]/gi,"_"),n("."+r).removeClass("bbit-tree-selected")),i.citem=u,n("."+r).find("div").removeClass("bbit-tree-selected"),n(this).addClass("bbit-tree-selected"),i.onnodeclick&&(u.expand||(u.expand=function(){tt.call(u)}),i.onnodeclick.call(this,u)))}function tt(){var i=this,u=i.id.replace(/[^\w]/gi,"_"),t=n("#"+r+"_"+u+" img.bbit-tree-ec-icon");t.length>0&&t.click()}function w(n,t,i,r,u){var s=n.length,o,e;if(s>0){for(o=[],e=0;e<s;e++)n[e].parent=u,f(n[e],o,t,i+"."+e,e==s-1);r.html(o.join(""));o=null;l(r)}r.addClass("bbit-tree-node-ct").css({"z-index":0,position:"static",visibility:"visible",top:"auto",left:"auto",display:""});r.prev().removeClass("bbit-tree-node-loading")}function c(t,r,u){var f;i.url&&(t&&t!=null&&(f=it(t)),i.param!=null&&(f=i.param),n.ajax({type:i.method,url:i.url,data:f,async:r,dataType:i.datatype,success:u,error:function(){dialogMsg("加载数据失败",-1)}}))}function it(n){return[{name:"id",value:encodeURIComponent(n.id)},{name:"text",value:encodeURIComponent(n.text)},{name:"value",value:encodeURIComponent(n.value)},{name:"checkstate",value:n.checkstate}]}function b(){n(this).hover(function(){n(this).addClass("bbit-tree-node-over")},function(){n(this).removeClass("bbit-tree-node-over")}).click(nt).find("img.bbit-tree-ec-icon").each(function(){n(this).hasClass("bbit-tree-elbow")||n(this).hover(function(){n(this).parent().addClass("bbit-tree-ec-over")},function(){n(this).parent().removeClass("bbit-tree-ec-over")})})}function l(t){var i=n("li.bbit-tree-node>div",t);i.each(b)}function rt(t){var o=t.replace(/[^\w-]/gi,"_"),u=n("#"+r+"_"+o);if(u.length>0){u.addClass("bbit-tree-node-loading");var s=u.hasClass("bbit-tree-elbow-end")||u.hasClass("bbit-tree-elbow-end-plus")||u.hasClass("bbit-tree-elbow-end-minus"),e=u.attr("tpath"),h=e.split(".").length,i=y(e);i&&c(i,!0,function(n){var t,r;i.complete=!0;i.ChildNodes=n;i.isexpand=!0;i.hasChildren=n&&n.length>0?!0:!1;t=[];f(i,t,h-1,e,s);t.shift();t.pop();r=u.parent();r.html(t.join(""));t=null;l(r);b.call(r.find(">div"))})}}function a(n,t,i){for(var r=0,u=n.length;r<u;r++)n[r].showcheck==!0&&n[r].checkstate==1&&t.push(i(n[r])),n[r].ChildNodes!=null&&n[r].ChildNodes.length>0&&a(n[r].ChildNodes,t,i)}function k(n,t,i){for(var r=0,u=n.length;r<u;r++)n[r].showcheck==!0&&(n[r].checkstate==1||n[r].checkstate==2)&&t.push(i(n[r])),n[r].ChildNodes!=null&&n[r].ChildNodes.length>0&&k(n[r].ChildNodes,t,i)}var i={method:"GET",datatype:"json",url:!1,param:null,cbiconpath:"/static/scripts/plugins/tree/images/icons/",icons:["checkbox_0.png","checkbox_1.png","checkbox_2.png"],showcheck:!1,oncheckboxclick:!1,onnodeclick:!1,cascadecheck:!0,data:null,clicktoggle:!0,theme:"bbit-tree-arrows"},o,s,v;n.extend(i,t);var e=i.data,u=n(this),r=u.attr("id");if((r==null||r=="")&&(r="bbtree"+(new Date).getTime(),u.attr("id",r)),u.height(i.height),i.slimscroll==!0?u.css({overflow:"auto","overflow-y":"hidden"}):u.css({overflow:"auto"}),o=[],d(i.data,o),u.html(""),u.addClass("bbit-tree").append(o.join("")),l(u),o=null,i.showcheck)for(s=0;s<3;s++)v=new Image,v.src=i.cbiconpath+i.icons[s];return u[0].t={getSelectedNodes:function(n){var t=[];return n?k(e,t,function(n){return n}):a(e,t,function(n){return n}),t},getSelectedValues:function(){var n=[];return a(e,n,function(n){return n.value}),n},getCurrentItem:function(){return i.citem},reflash:function(n){var t;t=typeof n=="string"?n:n.id;rt(t)}},u};n.fn.getCheckedNodes=function(){return this[0].t?this[0].t.getSelectedValues():null};n.fn.getCheckedAllNodes=function(){var t=n(this),r=t.attr("id").trim().length+1,i=[];return t.find(".bbit-tree-node-cb").each(function(){var t=n(this).attr("src"),u;t=t.substr(t.lastIndexOf("/")+1);(t=="checkbox_1.png"||t=="checkbox_2.png")&&(u=n(this).attr("id").substring(parseInt(r)).replace(/_/g,"-"),u=u.substring(0,u.length-3),i.push(u))}),i};n.fn.setCheckedNodes=function(t){var i=n(this),r=i.attr("id").trim();n.each(t,function(n,t){var u=i.find("#"+r+"_"+t.replace(/-/g,"_")+"_cb");u.length!=0&&u.trigger("click")})};n.fn.setCheckedNodeOne=function(t){var i=n(this),u=i.attr("id").trim(),r=i.find("#"+u+"_"+t.replace(/-/g,"_")+"_cb");r.length!=0&&r.trigger("click")};n.fn.setNoCheckedNodes=function(t){var i=n(this),u=i.attr("id").trim(),r=i.find("#"+u+"_"+t.replace(/-/g,"_")+"_cb"),f=r.attr("src");r.attr("src",f.replace("checkbox_1.png","checkbox_0.png"))};n.fn.getTSNs=function(n){return this[0].t?this[0].t.getSelectedNodes(n):null};n.fn.getCurrentNode=function(){return this[0].t?this[0].t.getCurrentItem():null};n.fn.reflash=function(n){if(this[0].t)return this[0].t.reflash(n)};n.fn.setTreeHeight=function(t){var i=n(this);i.height(t)};n.fn.setNodeChecked=function(t){var i=n(this),u=i.attr("id").trim(),r;i.find(".bbit-tree-selected").removeClass("bbit-tree-selected");r=i.find("#"+u+"_"+t.replace(/-/g,"_"));r.addClass("bbit-tree-selected")}})(jQuery)