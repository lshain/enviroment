DISQUS.addBlocks("theme")(function(e){e.blocks.relatedThread=function(c,d){var a=new e.Builder,f=DISQUS.extend({},c,d);with(f)return a.put('    <li class="discovery-unit">        <h3 title="'),a.put(thread.title),a.put('"><span class="publisher-anchor-color"><a class="title" '),function(){var b={};e.extend(b,d);e.extend(b,{});a.put(e.renderBlock("linkAttributes",b))}(),a.put(">"),a.put(thread.title),a.put('</a></span></h3>        <ul class="meta">            <li class="likes" title="Stars"><span class="votes">Stars</span>'),
a.put((a.esc||function(b){return b})(thread.likes)),a.put('</li>            <li class="comments">                <a '),function(){var b={};e.extend(b,d);e.extend(b,{});a.put(e.renderBlock("linkAttributes",b))}(),a.put(">                "),thread.posts==1?a.put("                    1 comment                "):thread.posts>=0&&(a.put("                    "),a.put((a.esc||function(b){return b})(thread.posts)),a.put(" comments                ")),a.put('                </a>            </li>            <li class="time">'),
a.put((a.esc||function(b){return b})(thread.createdAgo)),a.put('</li>        </ul>        <a class="top-comment" '),function(){var b={};e.extend(b,d);e.extend(b,{});a.put(e.renderBlock("linkAttributes",b))}(),a.put(' data-role="discovery-top-comment">            <img src="'),a.put((a.esc||function(b){return b})(urls.avatar.generic)),a.put('" alt="Default user" data-role="discovery-avatar">            <p><span class="user" data-role="discovery-top-comment-author">'),a.put('</span> &#8212; <span data-role="discovery-top-comment-snippet">'),
a.put("</span></p>        </a>    </li>"),a.compile()};e.blocks.linkAttributes=function(c,d){var a=new e.Builder,f=DISQUS.extend({},c,d);with(f)return a.put('href="'),a.put((a.esc||function(b){return b})(thread.link)),a.put('#disqus_thread" data-redirect="'),a.put((a.esc||function(b){return b})(thread.redirectUrl)),a.put('"'),a.compile()};e.blocks.relatedThreads=function(c,d){var a=new e.Builder,f=DISQUS.extend({},c,d);with(f)return a.put('<div id="discovery-main">    <div id="discovery-note" style="display:none;">        <div class="alert">            The new DISQUS Discovery box helps you find other vibrant discussions on the communities you love. Feedback? <a href="https://www.surveymonkey.com/s/GHK872T" target="_blank">Let us know.</a>        </div>    </div>    <header>        <div id="discovery-options">            <span class="publisher-anchor-color"><a href="#" id="discovery-help" data-action="discovery-help">What\'s this?</a></span>            <a href="#" id="discovery-close" data-action="discovery-close" title="Close this box">\u00d7</a>        </div>        <h2>Also on '),
a.put((a.esc||function(b){return b})(forum.name)),a.put('</h2>    </header>    <section>        <ul id="discovery-units">            '),a.put("        </ul>    </section></div>"),a.compile()}});
(function(e){var c=e.DISQUS;c.registerActions=function(){c.define("discovery.views",function(){return{load:function(){var d=c.discovery.views,a=d.RelatedThreadView=Backbone.View.extend({events:{"click [data-redirect]":"swapLink"},dtplBlock:"relatedThread",initialize:function(a){this.snippetLimit=a.snippetLimit;this.model.on("fetchedTopComment",function(b){this.renderTopComment(b)},this)},swapLink:function(a){a=a.target||a.srcElement;a.tagName.toUpperCase()=="A"&&a.getAttribute("data-redirect")||(a=
$(a).closest("a[data-redirect]")[0]);var b=a;b.setAttribute("data-href",b.getAttribute("href"));b.setAttribute("href",b.getAttribute("data-redirect"));_.delay(function(){b.setAttribute("href",b.getAttribute("data-href"))},100)},renderAvatar:function(a){var b=this.$el.find("[data-role=discovery-avatar]");b.attr("src",a.avatar.cache);b.attr("alt",this.authorName(a));return this},authorName:function(a){return a.name||a.username},renderCommentSnippet:function(a){var b=this.$el.find("[data-role=discovery-top-comment]");
if(a.author){var c=this.authorName(a.author);b.find("[data-role=discovery-top-comment-author]").text(c)}a=_.strip(a.message);a=_.truncate(a,this.snippetLimit);b.find("[data-role=discovery-top-comment-snippet]").text(a);b.css({display:"block"});return this},renderTopComment:function(a){this.renderAvatar(a.author);this.renderCommentSnippet(a);this.trigger("resize");return this},render:function(){this.setElement(c.renderBlock(this.dtplBlock,{thread:_(this.model.toJSON()).extend({createdAgo:moment(c.assureOffset(this.model.get("createdAt")),
c.ISO_8601).fromNow()})}));return this}});d.RelatedThreadCollectionView=Backbone.View.extend({events:{"click [data-action=discovery-close]":"close","click [data-action=discovery-help]":"showHelp"},dtplBlock:"relatedThreads",initialize:function(a){this.snippetLimit=a.snippetLimit},close:function(a){a.preventDefault();this.remove();this.trigger("resize",0)},showHelp:function(a){a.preventDefault();$(a.currentTarget).hide();this.$el.find("#discovery-note").show();this.trigger("resize")},getTopComment:function(a){var b=
this;c.api.call("discovery/listTopPost.json",{method:"GET",data:{thread:a},success:function(a){a.response.length!==0&&_.each(a.response,function(a){b.collection.get(a.thread).trigger("fetchedTopComment",a)})}});return b},resize:_.debounce(function(){this.trigger("resize")},500),render:function(){this.setElement(c.renderBlock(this.dtplBlock,{forum:this.collection.mainThread.get("forum")}));this.collection.each(function(c){c=new a({model:c,snippetLimit:this.snippetLimit});c.on("resize",this.resize,
this);c.render();this.$el.find("section > ul").append(c.el)},this);this.getTopComment(this.collection.pluck("id"));return this}});return d}}});c.define("discovery.collections",function(){return{load:function(d,a){var e=c.discovery.collections;e.RelatedThreadCollection=Backbone.Collection.extend({model:d.RelatedThread,url:function(){return!c.debug?c.api.getURL("discovery/listRelated.json"):c.api.getURL("threads/list.json")},initialize:function(a,c){this.mainThread=c.thread;this.limit=c.limit;this.variant=
c.variant;this.impId=(new Date).getTime().toString(10)+Math.floor(Math.random()*1E6).toString(10)},fetch:function(a){var d={};d.data=!c.debug?{thread:this.mainThread.get("id")}:{forum:this.mainThread.get("forum").id};d.parse=!1;_.extend(d,a);Backbone.Collection.prototype.fetch.call(this,d)},parse:function(b){var d=[],e=b.response;a.log("Results (",e.length,"):",e);for(var f=0,l=e.length;f<l&&d.length<this.limit;f++)if(b=e[f].thread||e[f],b.id!=this.mainThread.id)!c.debug&&b.forum.id!=this.mainThread.get("forum").id?
a.log("Thread",b.id,"does not have same forum (",b.forum.id,") as source thread's:",this.mainThread.get("forum").id):b.posts===0?a.log("Thread",b.id,"does not have any comments."):b.title.indexOf("http://")===0?a.log("Thread",b.id,"has a title that starts with http."):(b.redirectUrl=c.serialize(e[f].signedUrl?"http://redirect.disqus.com/url":b.link+"#redirect",{url:e[f].signedUrl,thread:b.id,forum:b.forum,zone:"internal_discovery",variant:this.variant,imp:this.impId,source_thread_id:this.mainThread.id}),
b.score={score:e[f].score,k:e[f].k},d.push(b));a.log("Total results:",d.length);return d}});return e}}});c.define("discovery.models",function(){return{load:function(){var d=c.discovery.models,a=d.Thread=Backbone.Model.extend({defaults:{author:null,category:null,createdAt:null,forum:null,identifiers:[],ipAddress:null,isClosed:!1,isDeleted:!1,link:null,message:null,slug:null,title:null,userSubscription:!1,posts:0,reactions:0,likes:0,dislikes:0,userScore:0},url:c.api.getURL("threads/details"),parse:function(a){return a.response}});
d.RelatedThread=a.extend({defaults:_.extend({},a.prototype.defaults,{redirectUrl:null})});return d}}});c.define("discovery.utils",function(c,a){var e=!1;return{allowLog:function(b){if(b===a)return e;e=!!b},log:function(){if(!c.console)return function(){};return function(){e&&(c.console.log.apply?c.console.log.apply(c.console,arguments):c.console.log(_.toArray(arguments).join(" ")))}}()}});c.define("discovery",function(){return this.overwrites({init:function(d,a){function e(a){m("discovery_next:dark_promoted",
function(){j.log("Initiating dark request to discovery/listPromoted");c.api.call("discovery/listPromoted.json",{data:{thread:d.thread.id}})});k=new o(null,{thread:a,limit:l,variant:d.variant});k.fetch({success:b,error:i});k.on("error",i)}function b(b){if(b.length<2)return void i({display:!1});b=new p({id:"discovery",collection:b,snippetLimit:q});a(b);i({display:!0})}function i(a){a=a||{};n||(n=!0,c.juggler&&(a={major_version:"next_internal",variant:d.variant,internal_organic:k.length,external_organic:0,
promoted:0,display:!!a.display},j.log("Juggler init_discovery",a),c.juggler.emit("init_discovery",a)))}var g=d.switches,m=function(a,b,c){if(g)if(g.length)g.enabled(a)&&b();else{var d=function(){g.enabled(a)&&b();c&&g.off("reset",d)};return void g.on("reset",d)}};m("discovery_next:logging",function(){c.discovery.utils.allowLog(!0)});var l=d.variant=="top2"?2:4,q=100,j=c.discovery.utils,h=c.discovery.models.load(),r=c.discovery.collections.load(h,j),s=c.discovery.views.load(),h=h.Thread,o=r.RelatedThreadCollection,
p=s.RelatedThreadCollectionView,k;d.threadId?(j.log("Discovery: Making call to threads/details"),(new h).fetch({data:{thread:d.threadId,forum:d.forum,related:"forum"},success:e})):e(new h(_.extend(d.thread,{forum:d.forum})));var n=!1}})})};c.runThemeScript=c.registerActions})(this);