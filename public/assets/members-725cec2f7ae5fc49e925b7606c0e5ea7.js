var Members=function(e){this.elem=e,this.memberList={},this.numMembers=0};Members.prototype.list=function(){return this.memberList},Members.prototype.length=function(){return console.log("Number of members: "+String(this.numMembers)),this.numMembers},Members.prototype.addMembers=function(e){for(var t=0;t<e.length;t++)this.addMember(e[t])},Members.prototype.addMember=function(e){return console.log("Adding a new member."),this.memberList[e.id]?void console.log("Member already exists, don't add them."):(this.numMembers=this.numMembers+1,this.memberList[e.id]=e,void this.createHTML())},Members.prototype.removeMember=function(e){console.log("Removing member with id: "+e),this.memberList[e]&&(delete this.memberList[e],this.numMembers=this.numMembers-1,this.createHTML())},Members.prototype.createHTML=function(){console.log("Rendering members HTML");var e=this.elem;e.empty(),$.each(this.memberList,function(t,m){var r='<span class="selected-member" data-member-id="'+m.id+'"><button class="btn btn-default" style="margin: 3px;" onclick="mem.removeMember('+m.id+');">'+m.value+"</button></span><br />";e.append(r)})};