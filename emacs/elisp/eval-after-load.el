



<!DOCTYPE html>
<html>
<head>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" >
 <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" >
 
 <meta name="ROBOTS" content="NOARCHIVE">
 
 <link rel="icon" type="image/vnd.microsoft.icon" href="http://www.gstatic.com/codesite/ph/images/phosting.ico">
 
 
 <script type="text/javascript">
 
 
 
 
 var codesite_token = null;
 
 
 var CS_env = {"profileUrl":null,"token":null,"assetHostPath":"http://www.gstatic.com/codesite/ph","domainName":null,"assetVersionPath":"http://www.gstatic.com/codesite/ph/16186173366037945081","projectHomeUrl":"/p/dea","relativeBaseUrl":"","projectName":"dea","loggedInUserEmail":null};
 var _gaq = _gaq || [];
 _gaq.push(
 ['siteTracker._setAccount', 'UA-18071-1'],
 ['siteTracker._trackPageview']);
 
 _gaq.push(
 ['projectTracker._setAccount', 'UA-11322068-1'],
 ['projectTracker._trackPageview']);
 
 (function() {
 var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
 ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
 (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(ga);
 })();
 
 </script>
 
 
 <title>eval-after-load.el - 
 dea -
 
 
 Dot emacs of ahei - Google Project Hosting
 </title>
 <link type="text/css" rel="stylesheet" href="http://www.gstatic.com/codesite/ph/16186173366037945081/css/core.css">
 
 <link type="text/css" rel="stylesheet" href="http://www.gstatic.com/codesite/ph/16186173366037945081/css/ph_detail.css" >
 
 
 <link type="text/css" rel="stylesheet" href="http://www.gstatic.com/codesite/ph/16186173366037945081/css/d_sb.css" >
 
 
 
<!--[if IE]>
 <link type="text/css" rel="stylesheet" href="http://www.gstatic.com/codesite/ph/16186173366037945081/css/d_ie.css" >
<![endif]-->
 <style type="text/css">
 .menuIcon.off { background: no-repeat url(http://www.gstatic.com/codesite/ph/images/dropdown_sprite.gif) 0 -42px }
 .menuIcon.on { background: no-repeat url(http://www.gstatic.com/codesite/ph/images/dropdown_sprite.gif) 0 -28px }
 .menuIcon.down { background: no-repeat url(http://www.gstatic.com/codesite/ph/images/dropdown_sprite.gif) 0 0; }
 
 
 
  tr.inline_comment {
 background: #fff;
 vertical-align: top;
 }
 div.draft, div.published {
 padding: .3em;
 border: 1px solid #999; 
 margin-bottom: .1em;
 font-family: arial, sans-serif;
 max-width: 60em;
 }
 div.draft {
 background: #ffa;
 } 
 div.published {
 background: #e5ecf9;
 }
 div.published .body, div.draft .body {
 padding: .5em .1em .1em .1em;
 max-width: 60em;
 white-space: pre-wrap;
 white-space: -moz-pre-wrap;
 white-space: -pre-wrap;
 white-space: -o-pre-wrap;
 word-wrap: break-word;
 font-size: 1em;
 }
 div.draft .actions {
 margin-left: 1em;
 font-size: 90%;
 }
 div.draft form {
 padding: .5em .5em .5em 0;
 }
 div.draft textarea, div.published textarea {
 width: 95%;
 height: 10em;
 font-family: arial, sans-serif;
 margin-bottom: .5em;
 }

 
 .nocursor, .nocursor td, .cursor_hidden, .cursor_hidden td {
 background-color: white;
 height: 2px;
 }
 .cursor, .cursor td {
 background-color: darkblue;
 height: 2px;
 display: '';
 }
 
 
.list {
 border: 1px solid white;
 border-bottom: 0;
}

 
 </style>
</head>
<body class="t4">
<script type="text/javascript">
 window.___gcfg = {lang: 'en'};
 (function() 
 {var po = document.createElement("script");
 po.type = "text/javascript"; po.async = true;po.src = "https://apis.google.com/js/plusone.js";
 var s = document.getElementsByTagName("script")[0];
 s.parentNode.insertBefore(po, s);
 })();
</script>
<div class="headbg">

 <div id="gaia">
 

 <span>
 
 
 <a href="#" id="projects-dropdown" onclick="return false;"><u>My favorites</u> <small>&#9660;</small></a>
 | <a href="https://www.google.com/accounts/ServiceLogin?service=code&amp;ltmpl=phosting&amp;continue=http%3A%2F%2Fcode.google.com%2Fp%2Fdea%2Fsource%2Fbrowse%2Ftrunk%2Fmy-lisps%2Feval-after-load.el&amp;followup=http%3A%2F%2Fcode.google.com%2Fp%2Fdea%2Fsource%2Fbrowse%2Ftrunk%2Fmy-lisps%2Feval-after-load.el" onclick="_CS_click('/gb/ph/signin');"><u>Sign in</u></a>
 
 </span>

 </div>

 <div class="gbh" style="left: 0pt;"></div>
 <div class="gbh" style="right: 0pt;"></div>
 
 
 <div style="height: 1px"></div>
<!--[if lte IE 7]>
<div style="text-align:center;">
Your version of Internet Explorer is not supported. Try a browser that
contributes to open source, such as <a href="http://www.firefox.com">Firefox</a>,
<a href="http://www.google.com/chrome">Google Chrome</a>, or
<a href="http://code.google.com/chrome/chromeframe/">Google Chrome Frame</a>.
</div>
<![endif]-->



 <table style="padding:0px; margin: 0px 0px 10px 0px; width:100%" cellpadding="0" cellspacing="0"
 itemscope itemtype="http://schema.org/CreativeWork">
 <tr style="height: 58px;">
 
 
 
 <td id="plogo">
 <link itemprop="url" href="/p/dea">
 <a href="/p/dea/">
 
 
 <img src="/p/dea/logo?cct=1258098136"
 alt="Logo" itemprop="image">
 
 </a>
 </td>
 
 <td style="padding-left: 0.5em">
 
 <div id="pname">
 <a href="/p/dea/"><span itemprop="name">dea</span></a>
 </div>
 
 <div id="psum">
 <a id="project_summary_link"
 href="/p/dea/"><span itemprop="description">Dot emacs of ahei</span></a>
 
 </div>
 
 
 </td>
 <td style="white-space:nowrap;text-align:right; vertical-align:bottom;">
 
 <form action="/hosting/search">
 <input size="30" name="q" value="" type="text">
 
 <input type="submit" name="projectsearch" value="Search projects" >
 </form>
 
 </tr>
 </table>

</div>

 
<div id="mt" class="gtb"> 
 <a href="/p/dea/" class="tab ">Project&nbsp;Home</a>
 
 
 
 
 <a href="/p/dea/downloads/list" class="tab ">Downloads</a>
 
 
 
 
 
 <a href="/p/dea/w/list" class="tab ">Wiki</a>
 
 
 
 
 
 <a href="/p/dea/issues/list"
 class="tab ">Issues</a>
 
 
 
 
 
 <a href="/p/dea/source/checkout"
 class="tab active">Source</a>
 
 
 
 
 
 
 
 <div class=gtbc></div>
</div>
<table cellspacing="0" cellpadding="0" width="100%" align="center" border="0" class="st">
 <tr>
 
 
 
 
 
 
 
 <td class="subt">
 <div class="st2">
 <div class="isf">
 
 


 <span class="inst1"><a href="/p/dea/source/checkout">Checkout</a></span> &nbsp;
 <span class="inst2"><a href="/p/dea/source/browse/">Browse</a></span> &nbsp;
 <span class="inst3"><a href="/p/dea/source/list">Changes</a></span> &nbsp;
 
 &nbsp;
 
 
 <form action="/p/dea/source/search" method="get" style="display:inline"
 onsubmit="document.getElementById('codesearchq').value = document.getElementById('origq').value">
 <input type="hidden" name="q" id="codesearchq" value="">
 <input type="text" maxlength="2048" size="38" id="origq" name="origq" value="" title="Google Code Search" style="font-size:92%">&nbsp;<input type="submit" value="Search Trunk" name="btnG" style="font-size:92%">
 
 
 
 
 
 
 </form>
 <script type="text/javascript">
 
 function codesearchQuery(form) {
 var query = document.getElementById('q').value;
 if (query) { form.action += '%20' + query; }
 }
 </script>
 </div>
</div>

 </td>
 
 
 
 <td align="right" valign="top" class="bevel-right"></td>
 </tr>
</table>


<script type="text/javascript">
 var cancelBubble = false;
 function _go(url) { document.location = url; }
</script>
<div id="maincol"
 
>

 
<!-- IE -->




<div class="expand">
<div id="colcontrol">
<style type="text/css">
 #file_flipper { white-space: nowrap; padding-right: 2em; }
 #file_flipper.hidden { display: none; }
 #file_flipper .pagelink { color: #0000CC; text-decoration: underline; }
 #file_flipper #visiblefiles { padding-left: 0.5em; padding-right: 0.5em; }
</style>
<table id="nav_and_rev" class="list"
 cellpadding="0" cellspacing="0" width="100%">
 <tr>
 
 <td nowrap="nowrap" class="src_crumbs src_nav" width="33%">
 <strong class="src_nav">Source path:&nbsp;</strong>
 <span id="crumb_root">
 
 <a href="/p/dea/source/browse/">svn</a>/&nbsp;</span>
 <span id="crumb_links" class="ifClosed"><a href="/p/dea/source/browse/trunk/">trunk</a><span class="sp">/&nbsp;</span><a href="/p/dea/source/browse/trunk/my-lisps/">my-lisps</a><span class="sp">/&nbsp;</span>eval-after-load.el</span>
 
 

 </td>
 
 
 <td nowrap="nowrap" width="33%" align="right">
 <table cellpadding="0" cellspacing="0" style="font-size: 100%"><tr>
 
 
 <td class="flipper">
 <ul class="leftside">
 
 <li><a href="/p/dea/source/browse/trunk/my-lisps/eval-after-load.el?r=1391" title="Previous">&lsaquo;r1391</a></li>
 
 </ul>
 </td>
 
 <td class="flipper"><b>r1424</b></td>
 
 </tr></table>
 </td> 
 </tr>
</table>

<div class="fc">
 
 
 
<style type="text/css">
.undermouse span {
 background-image: url(http://www.gstatic.com/codesite/ph/images/comments.gif); }
</style>
<table class="opened" id="review_comment_area"
><tr>
<td id="nums">
<pre><table width="100%"><tr class="nocursor"><td></td></tr></table></pre>
<pre><table width="100%" id="nums_table_0"><tr id="gr_svn1424_1"

><td id="1"><a href="#1">1</a></td></tr
><tr id="gr_svn1424_2"

><td id="2"><a href="#2">2</a></td></tr
><tr id="gr_svn1424_3"

><td id="3"><a href="#3">3</a></td></tr
><tr id="gr_svn1424_4"

><td id="4"><a href="#4">4</a></td></tr
><tr id="gr_svn1424_5"

><td id="5"><a href="#5">5</a></td></tr
><tr id="gr_svn1424_6"

><td id="6"><a href="#6">6</a></td></tr
><tr id="gr_svn1424_7"

><td id="7"><a href="#7">7</a></td></tr
><tr id="gr_svn1424_8"

><td id="8"><a href="#8">8</a></td></tr
><tr id="gr_svn1424_9"

><td id="9"><a href="#9">9</a></td></tr
><tr id="gr_svn1424_10"

><td id="10"><a href="#10">10</a></td></tr
><tr id="gr_svn1424_11"

><td id="11"><a href="#11">11</a></td></tr
><tr id="gr_svn1424_12"

><td id="12"><a href="#12">12</a></td></tr
><tr id="gr_svn1424_13"

><td id="13"><a href="#13">13</a></td></tr
><tr id="gr_svn1424_14"

><td id="14"><a href="#14">14</a></td></tr
><tr id="gr_svn1424_15"

><td id="15"><a href="#15">15</a></td></tr
><tr id="gr_svn1424_16"

><td id="16"><a href="#16">16</a></td></tr
><tr id="gr_svn1424_17"

><td id="17"><a href="#17">17</a></td></tr
><tr id="gr_svn1424_18"

><td id="18"><a href="#18">18</a></td></tr
><tr id="gr_svn1424_19"

><td id="19"><a href="#19">19</a></td></tr
><tr id="gr_svn1424_20"

><td id="20"><a href="#20">20</a></td></tr
><tr id="gr_svn1424_21"

><td id="21"><a href="#21">21</a></td></tr
><tr id="gr_svn1424_22"

><td id="22"><a href="#22">22</a></td></tr
><tr id="gr_svn1424_23"

><td id="23"><a href="#23">23</a></td></tr
><tr id="gr_svn1424_24"

><td id="24"><a href="#24">24</a></td></tr
><tr id="gr_svn1424_25"

><td id="25"><a href="#25">25</a></td></tr
><tr id="gr_svn1424_26"

><td id="26"><a href="#26">26</a></td></tr
><tr id="gr_svn1424_27"

><td id="27"><a href="#27">27</a></td></tr
><tr id="gr_svn1424_28"

><td id="28"><a href="#28">28</a></td></tr
><tr id="gr_svn1424_29"

><td id="29"><a href="#29">29</a></td></tr
><tr id="gr_svn1424_30"

><td id="30"><a href="#30">30</a></td></tr
><tr id="gr_svn1424_31"

><td id="31"><a href="#31">31</a></td></tr
><tr id="gr_svn1424_32"

><td id="32"><a href="#32">32</a></td></tr
><tr id="gr_svn1424_33"

><td id="33"><a href="#33">33</a></td></tr
><tr id="gr_svn1424_34"

><td id="34"><a href="#34">34</a></td></tr
><tr id="gr_svn1424_35"

><td id="35"><a href="#35">35</a></td></tr
><tr id="gr_svn1424_36"

><td id="36"><a href="#36">36</a></td></tr
><tr id="gr_svn1424_37"

><td id="37"><a href="#37">37</a></td></tr
><tr id="gr_svn1424_38"

><td id="38"><a href="#38">38</a></td></tr
><tr id="gr_svn1424_39"

><td id="39"><a href="#39">39</a></td></tr
><tr id="gr_svn1424_40"

><td id="40"><a href="#40">40</a></td></tr
><tr id="gr_svn1424_41"

><td id="41"><a href="#41">41</a></td></tr
><tr id="gr_svn1424_42"

><td id="42"><a href="#42">42</a></td></tr
><tr id="gr_svn1424_43"

><td id="43"><a href="#43">43</a></td></tr
><tr id="gr_svn1424_44"

><td id="44"><a href="#44">44</a></td></tr
><tr id="gr_svn1424_45"

><td id="45"><a href="#45">45</a></td></tr
><tr id="gr_svn1424_46"

><td id="46"><a href="#46">46</a></td></tr
><tr id="gr_svn1424_47"

><td id="47"><a href="#47">47</a></td></tr
><tr id="gr_svn1424_48"

><td id="48"><a href="#48">48</a></td></tr
><tr id="gr_svn1424_49"

><td id="49"><a href="#49">49</a></td></tr
><tr id="gr_svn1424_50"

><td id="50"><a href="#50">50</a></td></tr
><tr id="gr_svn1424_51"

><td id="51"><a href="#51">51</a></td></tr
><tr id="gr_svn1424_52"

><td id="52"><a href="#52">52</a></td></tr
><tr id="gr_svn1424_53"

><td id="53"><a href="#53">53</a></td></tr
><tr id="gr_svn1424_54"

><td id="54"><a href="#54">54</a></td></tr
><tr id="gr_svn1424_55"

><td id="55"><a href="#55">55</a></td></tr
><tr id="gr_svn1424_56"

><td id="56"><a href="#56">56</a></td></tr
><tr id="gr_svn1424_57"

><td id="57"><a href="#57">57</a></td></tr
><tr id="gr_svn1424_58"

><td id="58"><a href="#58">58</a></td></tr
><tr id="gr_svn1424_59"

><td id="59"><a href="#59">59</a></td></tr
><tr id="gr_svn1424_60"

><td id="60"><a href="#60">60</a></td></tr
><tr id="gr_svn1424_61"

><td id="61"><a href="#61">61</a></td></tr
><tr id="gr_svn1424_62"

><td id="62"><a href="#62">62</a></td></tr
><tr id="gr_svn1424_63"

><td id="63"><a href="#63">63</a></td></tr
><tr id="gr_svn1424_64"

><td id="64"><a href="#64">64</a></td></tr
><tr id="gr_svn1424_65"

><td id="65"><a href="#65">65</a></td></tr
><tr id="gr_svn1424_66"

><td id="66"><a href="#66">66</a></td></tr
><tr id="gr_svn1424_67"

><td id="67"><a href="#67">67</a></td></tr
><tr id="gr_svn1424_68"

><td id="68"><a href="#68">68</a></td></tr
><tr id="gr_svn1424_69"

><td id="69"><a href="#69">69</a></td></tr
><tr id="gr_svn1424_70"

><td id="70"><a href="#70">70</a></td></tr
><tr id="gr_svn1424_71"

><td id="71"><a href="#71">71</a></td></tr
><tr id="gr_svn1424_72"

><td id="72"><a href="#72">72</a></td></tr
><tr id="gr_svn1424_73"

><td id="73"><a href="#73">73</a></td></tr
><tr id="gr_svn1424_74"

><td id="74"><a href="#74">74</a></td></tr
><tr id="gr_svn1424_75"

><td id="75"><a href="#75">75</a></td></tr
><tr id="gr_svn1424_76"

><td id="76"><a href="#76">76</a></td></tr
><tr id="gr_svn1424_77"

><td id="77"><a href="#77">77</a></td></tr
><tr id="gr_svn1424_78"

><td id="78"><a href="#78">78</a></td></tr
><tr id="gr_svn1424_79"

><td id="79"><a href="#79">79</a></td></tr
><tr id="gr_svn1424_80"

><td id="80"><a href="#80">80</a></td></tr
><tr id="gr_svn1424_81"

><td id="81"><a href="#81">81</a></td></tr
><tr id="gr_svn1424_82"

><td id="82"><a href="#82">82</a></td></tr
><tr id="gr_svn1424_83"

><td id="83"><a href="#83">83</a></td></tr
><tr id="gr_svn1424_84"

><td id="84"><a href="#84">84</a></td></tr
><tr id="gr_svn1424_85"

><td id="85"><a href="#85">85</a></td></tr
><tr id="gr_svn1424_86"

><td id="86"><a href="#86">86</a></td></tr
><tr id="gr_svn1424_87"

><td id="87"><a href="#87">87</a></td></tr
><tr id="gr_svn1424_88"

><td id="88"><a href="#88">88</a></td></tr
><tr id="gr_svn1424_89"

><td id="89"><a href="#89">89</a></td></tr
><tr id="gr_svn1424_90"

><td id="90"><a href="#90">90</a></td></tr
><tr id="gr_svn1424_91"

><td id="91"><a href="#91">91</a></td></tr
><tr id="gr_svn1424_92"

><td id="92"><a href="#92">92</a></td></tr
><tr id="gr_svn1424_93"

><td id="93"><a href="#93">93</a></td></tr
><tr id="gr_svn1424_94"

><td id="94"><a href="#94">94</a></td></tr
><tr id="gr_svn1424_95"

><td id="95"><a href="#95">95</a></td></tr
><tr id="gr_svn1424_96"

><td id="96"><a href="#96">96</a></td></tr
><tr id="gr_svn1424_97"

><td id="97"><a href="#97">97</a></td></tr
><tr id="gr_svn1424_98"

><td id="98"><a href="#98">98</a></td></tr
><tr id="gr_svn1424_99"

><td id="99"><a href="#99">99</a></td></tr
><tr id="gr_svn1424_100"

><td id="100"><a href="#100">100</a></td></tr
><tr id="gr_svn1424_101"

><td id="101"><a href="#101">101</a></td></tr
><tr id="gr_svn1424_102"

><td id="102"><a href="#102">102</a></td></tr
><tr id="gr_svn1424_103"

><td id="103"><a href="#103">103</a></td></tr
><tr id="gr_svn1424_104"

><td id="104"><a href="#104">104</a></td></tr
><tr id="gr_svn1424_105"

><td id="105"><a href="#105">105</a></td></tr
><tr id="gr_svn1424_106"

><td id="106"><a href="#106">106</a></td></tr
><tr id="gr_svn1424_107"

><td id="107"><a href="#107">107</a></td></tr
><tr id="gr_svn1424_108"

><td id="108"><a href="#108">108</a></td></tr
><tr id="gr_svn1424_109"

><td id="109"><a href="#109">109</a></td></tr
><tr id="gr_svn1424_110"

><td id="110"><a href="#110">110</a></td></tr
><tr id="gr_svn1424_111"

><td id="111"><a href="#111">111</a></td></tr
><tr id="gr_svn1424_112"

><td id="112"><a href="#112">112</a></td></tr
><tr id="gr_svn1424_113"

><td id="113"><a href="#113">113</a></td></tr
><tr id="gr_svn1424_114"

><td id="114"><a href="#114">114</a></td></tr
><tr id="gr_svn1424_115"

><td id="115"><a href="#115">115</a></td></tr
><tr id="gr_svn1424_116"

><td id="116"><a href="#116">116</a></td></tr
><tr id="gr_svn1424_117"

><td id="117"><a href="#117">117</a></td></tr
><tr id="gr_svn1424_118"

><td id="118"><a href="#118">118</a></td></tr
><tr id="gr_svn1424_119"

><td id="119"><a href="#119">119</a></td></tr
><tr id="gr_svn1424_120"

><td id="120"><a href="#120">120</a></td></tr
><tr id="gr_svn1424_121"

><td id="121"><a href="#121">121</a></td></tr
><tr id="gr_svn1424_122"

><td id="122"><a href="#122">122</a></td></tr
><tr id="gr_svn1424_123"

><td id="123"><a href="#123">123</a></td></tr
><tr id="gr_svn1424_124"

><td id="124"><a href="#124">124</a></td></tr
><tr id="gr_svn1424_125"

><td id="125"><a href="#125">125</a></td></tr
><tr id="gr_svn1424_126"

><td id="126"><a href="#126">126</a></td></tr
><tr id="gr_svn1424_127"

><td id="127"><a href="#127">127</a></td></tr
><tr id="gr_svn1424_128"

><td id="128"><a href="#128">128</a></td></tr
><tr id="gr_svn1424_129"

><td id="129"><a href="#129">129</a></td></tr
><tr id="gr_svn1424_130"

><td id="130"><a href="#130">130</a></td></tr
><tr id="gr_svn1424_131"

><td id="131"><a href="#131">131</a></td></tr
><tr id="gr_svn1424_132"

><td id="132"><a href="#132">132</a></td></tr
><tr id="gr_svn1424_133"

><td id="133"><a href="#133">133</a></td></tr
><tr id="gr_svn1424_134"

><td id="134"><a href="#134">134</a></td></tr
><tr id="gr_svn1424_135"

><td id="135"><a href="#135">135</a></td></tr
><tr id="gr_svn1424_136"

><td id="136"><a href="#136">136</a></td></tr
><tr id="gr_svn1424_137"

><td id="137"><a href="#137">137</a></td></tr
><tr id="gr_svn1424_138"

><td id="138"><a href="#138">138</a></td></tr
><tr id="gr_svn1424_139"

><td id="139"><a href="#139">139</a></td></tr
><tr id="gr_svn1424_140"

><td id="140"><a href="#140">140</a></td></tr
><tr id="gr_svn1424_141"

><td id="141"><a href="#141">141</a></td></tr
><tr id="gr_svn1424_142"

><td id="142"><a href="#142">142</a></td></tr
><tr id="gr_svn1424_143"

><td id="143"><a href="#143">143</a></td></tr
><tr id="gr_svn1424_144"

><td id="144"><a href="#144">144</a></td></tr
><tr id="gr_svn1424_145"

><td id="145"><a href="#145">145</a></td></tr
><tr id="gr_svn1424_146"

><td id="146"><a href="#146">146</a></td></tr
><tr id="gr_svn1424_147"

><td id="147"><a href="#147">147</a></td></tr
><tr id="gr_svn1424_148"

><td id="148"><a href="#148">148</a></td></tr
><tr id="gr_svn1424_149"

><td id="149"><a href="#149">149</a></td></tr
><tr id="gr_svn1424_150"

><td id="150"><a href="#150">150</a></td></tr
><tr id="gr_svn1424_151"

><td id="151"><a href="#151">151</a></td></tr
><tr id="gr_svn1424_152"

><td id="152"><a href="#152">152</a></td></tr
><tr id="gr_svn1424_153"

><td id="153"><a href="#153">153</a></td></tr
><tr id="gr_svn1424_154"

><td id="154"><a href="#154">154</a></td></tr
><tr id="gr_svn1424_155"

><td id="155"><a href="#155">155</a></td></tr
><tr id="gr_svn1424_156"

><td id="156"><a href="#156">156</a></td></tr
><tr id="gr_svn1424_157"

><td id="157"><a href="#157">157</a></td></tr
><tr id="gr_svn1424_158"

><td id="158"><a href="#158">158</a></td></tr
><tr id="gr_svn1424_159"

><td id="159"><a href="#159">159</a></td></tr
><tr id="gr_svn1424_160"

><td id="160"><a href="#160">160</a></td></tr
><tr id="gr_svn1424_161"

><td id="161"><a href="#161">161</a></td></tr
><tr id="gr_svn1424_162"

><td id="162"><a href="#162">162</a></td></tr
><tr id="gr_svn1424_163"

><td id="163"><a href="#163">163</a></td></tr
><tr id="gr_svn1424_164"

><td id="164"><a href="#164">164</a></td></tr
><tr id="gr_svn1424_165"

><td id="165"><a href="#165">165</a></td></tr
><tr id="gr_svn1424_166"

><td id="166"><a href="#166">166</a></td></tr
><tr id="gr_svn1424_167"

><td id="167"><a href="#167">167</a></td></tr
><tr id="gr_svn1424_168"

><td id="168"><a href="#168">168</a></td></tr
><tr id="gr_svn1424_169"

><td id="169"><a href="#169">169</a></td></tr
><tr id="gr_svn1424_170"

><td id="170"><a href="#170">170</a></td></tr
><tr id="gr_svn1424_171"

><td id="171"><a href="#171">171</a></td></tr
><tr id="gr_svn1424_172"

><td id="172"><a href="#172">172</a></td></tr
><tr id="gr_svn1424_173"

><td id="173"><a href="#173">173</a></td></tr
><tr id="gr_svn1424_174"

><td id="174"><a href="#174">174</a></td></tr
><tr id="gr_svn1424_175"

><td id="175"><a href="#175">175</a></td></tr
><tr id="gr_svn1424_176"

><td id="176"><a href="#176">176</a></td></tr
><tr id="gr_svn1424_177"

><td id="177"><a href="#177">177</a></td></tr
><tr id="gr_svn1424_178"

><td id="178"><a href="#178">178</a></td></tr
><tr id="gr_svn1424_179"

><td id="179"><a href="#179">179</a></td></tr
><tr id="gr_svn1424_180"

><td id="180"><a href="#180">180</a></td></tr
><tr id="gr_svn1424_181"

><td id="181"><a href="#181">181</a></td></tr
><tr id="gr_svn1424_182"

><td id="182"><a href="#182">182</a></td></tr
><tr id="gr_svn1424_183"

><td id="183"><a href="#183">183</a></td></tr
><tr id="gr_svn1424_184"

><td id="184"><a href="#184">184</a></td></tr
><tr id="gr_svn1424_185"

><td id="185"><a href="#185">185</a></td></tr
><tr id="gr_svn1424_186"

><td id="186"><a href="#186">186</a></td></tr
><tr id="gr_svn1424_187"

><td id="187"><a href="#187">187</a></td></tr
><tr id="gr_svn1424_188"

><td id="188"><a href="#188">188</a></td></tr
><tr id="gr_svn1424_189"

><td id="189"><a href="#189">189</a></td></tr
><tr id="gr_svn1424_190"

><td id="190"><a href="#190">190</a></td></tr
><tr id="gr_svn1424_191"

><td id="191"><a href="#191">191</a></td></tr
><tr id="gr_svn1424_192"

><td id="192"><a href="#192">192</a></td></tr
><tr id="gr_svn1424_193"

><td id="193"><a href="#193">193</a></td></tr
><tr id="gr_svn1424_194"

><td id="194"><a href="#194">194</a></td></tr
><tr id="gr_svn1424_195"

><td id="195"><a href="#195">195</a></td></tr
><tr id="gr_svn1424_196"

><td id="196"><a href="#196">196</a></td></tr
><tr id="gr_svn1424_197"

><td id="197"><a href="#197">197</a></td></tr
><tr id="gr_svn1424_198"

><td id="198"><a href="#198">198</a></td></tr
><tr id="gr_svn1424_199"

><td id="199"><a href="#199">199</a></td></tr
><tr id="gr_svn1424_200"

><td id="200"><a href="#200">200</a></td></tr
><tr id="gr_svn1424_201"

><td id="201"><a href="#201">201</a></td></tr
><tr id="gr_svn1424_202"

><td id="202"><a href="#202">202</a></td></tr
><tr id="gr_svn1424_203"

><td id="203"><a href="#203">203</a></td></tr
><tr id="gr_svn1424_204"

><td id="204"><a href="#204">204</a></td></tr
><tr id="gr_svn1424_205"

><td id="205"><a href="#205">205</a></td></tr
><tr id="gr_svn1424_206"

><td id="206"><a href="#206">206</a></td></tr
><tr id="gr_svn1424_207"

><td id="207"><a href="#207">207</a></td></tr
><tr id="gr_svn1424_208"

><td id="208"><a href="#208">208</a></td></tr
><tr id="gr_svn1424_209"

><td id="209"><a href="#209">209</a></td></tr
><tr id="gr_svn1424_210"

><td id="210"><a href="#210">210</a></td></tr
><tr id="gr_svn1424_211"

><td id="211"><a href="#211">211</a></td></tr
><tr id="gr_svn1424_212"

><td id="212"><a href="#212">212</a></td></tr
><tr id="gr_svn1424_213"

><td id="213"><a href="#213">213</a></td></tr
><tr id="gr_svn1424_214"

><td id="214"><a href="#214">214</a></td></tr
><tr id="gr_svn1424_215"

><td id="215"><a href="#215">215</a></td></tr
><tr id="gr_svn1424_216"

><td id="216"><a href="#216">216</a></td></tr
><tr id="gr_svn1424_217"

><td id="217"><a href="#217">217</a></td></tr
><tr id="gr_svn1424_218"

><td id="218"><a href="#218">218</a></td></tr
><tr id="gr_svn1424_219"

><td id="219"><a href="#219">219</a></td></tr
><tr id="gr_svn1424_220"

><td id="220"><a href="#220">220</a></td></tr
><tr id="gr_svn1424_221"

><td id="221"><a href="#221">221</a></td></tr
><tr id="gr_svn1424_222"

><td id="222"><a href="#222">222</a></td></tr
><tr id="gr_svn1424_223"

><td id="223"><a href="#223">223</a></td></tr
><tr id="gr_svn1424_224"

><td id="224"><a href="#224">224</a></td></tr
><tr id="gr_svn1424_225"

><td id="225"><a href="#225">225</a></td></tr
><tr id="gr_svn1424_226"

><td id="226"><a href="#226">226</a></td></tr
><tr id="gr_svn1424_227"

><td id="227"><a href="#227">227</a></td></tr
><tr id="gr_svn1424_228"

><td id="228"><a href="#228">228</a></td></tr
><tr id="gr_svn1424_229"

><td id="229"><a href="#229">229</a></td></tr
><tr id="gr_svn1424_230"

><td id="230"><a href="#230">230</a></td></tr
><tr id="gr_svn1424_231"

><td id="231"><a href="#231">231</a></td></tr
><tr id="gr_svn1424_232"

><td id="232"><a href="#232">232</a></td></tr
><tr id="gr_svn1424_233"

><td id="233"><a href="#233">233</a></td></tr
><tr id="gr_svn1424_234"

><td id="234"><a href="#234">234</a></td></tr
><tr id="gr_svn1424_235"

><td id="235"><a href="#235">235</a></td></tr
><tr id="gr_svn1424_236"

><td id="236"><a href="#236">236</a></td></tr
><tr id="gr_svn1424_237"

><td id="237"><a href="#237">237</a></td></tr
><tr id="gr_svn1424_238"

><td id="238"><a href="#238">238</a></td></tr
><tr id="gr_svn1424_239"

><td id="239"><a href="#239">239</a></td></tr
><tr id="gr_svn1424_240"

><td id="240"><a href="#240">240</a></td></tr
><tr id="gr_svn1424_241"

><td id="241"><a href="#241">241</a></td></tr
><tr id="gr_svn1424_242"

><td id="242"><a href="#242">242</a></td></tr
><tr id="gr_svn1424_243"

><td id="243"><a href="#243">243</a></td></tr
><tr id="gr_svn1424_244"

><td id="244"><a href="#244">244</a></td></tr
><tr id="gr_svn1424_245"

><td id="245"><a href="#245">245</a></td></tr
><tr id="gr_svn1424_246"

><td id="246"><a href="#246">246</a></td></tr
><tr id="gr_svn1424_247"

><td id="247"><a href="#247">247</a></td></tr
><tr id="gr_svn1424_248"

><td id="248"><a href="#248">248</a></td></tr
><tr id="gr_svn1424_249"

><td id="249"><a href="#249">249</a></td></tr
><tr id="gr_svn1424_250"

><td id="250"><a href="#250">250</a></td></tr
><tr id="gr_svn1424_251"

><td id="251"><a href="#251">251</a></td></tr
><tr id="gr_svn1424_252"

><td id="252"><a href="#252">252</a></td></tr
><tr id="gr_svn1424_253"

><td id="253"><a href="#253">253</a></td></tr
><tr id="gr_svn1424_254"

><td id="254"><a href="#254">254</a></td></tr
><tr id="gr_svn1424_255"

><td id="255"><a href="#255">255</a></td></tr
></table></pre>
<pre><table width="100%"><tr class="nocursor"><td></td></tr></table></pre>
</td>
<td id="lines">
<pre><table width="100%"><tr class="cursor_stop cursor_hidden"><td></td></tr></table></pre>
<pre class="prettyprint lang-el"><table id="src_table_0"><tr
id=sl_svn1424_1

><td class="source">;;; eval-after-load.el --- `eval-after-load&#39; by mode, map, hook<br></td></tr
><tr
id=sl_svn1424_2

><td class="source"><br></td></tr
><tr
id=sl_svn1424_3

><td class="source">;; Author: ahei &lt;ahei0802@gmail.com&gt;<br></td></tr
><tr
id=sl_svn1424_4

><td class="source">;; Keywords: eval-after-load, autoload<br></td></tr
><tr
id=sl_svn1424_5

><td class="source">;; URL: http://code.google.com/p/dea/source/browse/trunk/my-lisps/eval-after-load.el<br></td></tr
><tr
id=sl_svn1424_6

><td class="source">;; Time-stamp: &lt;2011-04-28 15:41:47 Thursday by taoshanwen&gt;<br></td></tr
><tr
id=sl_svn1424_7

><td class="source"><br></td></tr
><tr
id=sl_svn1424_8

><td class="source">;; This  file is free  software; you  can redistribute  it and/or<br></td></tr
><tr
id=sl_svn1424_9

><td class="source">;; modify it under the terms of the GNU General Public License as<br></td></tr
><tr
id=sl_svn1424_10

><td class="source">;; published by  the Free Software Foundation;  either version 3,<br></td></tr
><tr
id=sl_svn1424_11

><td class="source">;; or (at your option) any later version.<br></td></tr
><tr
id=sl_svn1424_12

><td class="source"><br></td></tr
><tr
id=sl_svn1424_13

><td class="source">;; This file is  distributed in the hope that  it will be useful,<br></td></tr
><tr
id=sl_svn1424_14

><td class="source">;; but WITHOUT ANY WARRANTY; without even the implied warranty of<br></td></tr
><tr
id=sl_svn1424_15

><td class="source">;; MERCHANTABILITY or FITNESS FOR  A PARTICULAR PURPOSE.  See the<br></td></tr
><tr
id=sl_svn1424_16

><td class="source">;; GNU General Public License for more details.<br></td></tr
><tr
id=sl_svn1424_17

><td class="source"><br></td></tr
><tr
id=sl_svn1424_18

><td class="source">;; You  should have  received a  copy of  the GNU  General Public<br></td></tr
><tr
id=sl_svn1424_19

><td class="source">;; License along with  GNU Emacs; see the file  COPYING.  If not,<br></td></tr
><tr
id=sl_svn1424_20

><td class="source">;; write  to  the Free  Software  Foundation,  Inc., 51  Franklin<br></td></tr
><tr
id=sl_svn1424_21

><td class="source">;; Street, Fifth Floor, Boston, MA 02110-1301, USA.<br></td></tr
><tr
id=sl_svn1424_22

><td class="source"><br></td></tr
><tr
id=sl_svn1424_23

><td class="source">;;; Commentary:<br></td></tr
><tr
id=sl_svn1424_24

><td class="source">;;<br></td></tr
><tr
id=sl_svn1424_25

><td class="source">;; This package make you can `eval-after-load&#39; by modes, keymaps,<br></td></tr
><tr
id=sl_svn1424_26

><td class="source">;; by    use    `eal-eval-by-modes&#39;,   `eal-eval-by-maps&#39;,    and<br></td></tr
><tr
id=sl_svn1424_27

><td class="source">;; `define-key&#39;  more convenient  use  function `eal-define-key&#39;,<br></td></tr
><tr
id=sl_svn1424_28

><td class="source">;; `eal-define-key&#39;,    `eal-define-keys-commonly&#39;.    For   more<br></td></tr
><tr
id=sl_svn1424_29

><td class="source">;; details, see article http://emacser.com/eval-after-load.htm<br></td></tr
><tr
id=sl_svn1424_30

><td class="source"><br></td></tr
><tr
id=sl_svn1424_31

><td class="source">;;; History:<br></td></tr
><tr
id=sl_svn1424_32

><td class="source">;;<br></td></tr
><tr
id=sl_svn1424_33

><td class="source">;; 2010-4-5<br></td></tr
><tr
id=sl_svn1424_34

><td class="source">;;      * initial version 1.0.<br></td></tr
><tr
id=sl_svn1424_35

><td class="source"><br></td></tr
><tr
id=sl_svn1424_36

><td class="source">;;; Code:<br></td></tr
><tr
id=sl_svn1424_37

><td class="source"><br></td></tr
><tr
id=sl_svn1424_38

><td class="source">(eval-when-compile<br></td></tr
><tr
id=sl_svn1424_39

><td class="source">  (require &#39;cl))<br></td></tr
><tr
id=sl_svn1424_40

><td class="source"><br></td></tr
><tr
id=sl_svn1424_41

><td class="source">(defgroup eal nil<br></td></tr
><tr
id=sl_svn1424_42

><td class="source">  &quot;Package use `eval-after-load&#39; technique.&quot;<br></td></tr
><tr
id=sl_svn1424_43

><td class="source">  :prefix &quot;eal-&quot;)<br></td></tr
><tr
id=sl_svn1424_44

><td class="source"><br></td></tr
><tr
id=sl_svn1424_45

><td class="source">;;;###autoload<br></td></tr
><tr
id=sl_svn1424_46

><td class="source">(defcustom eal-loadfile-mode-maps<br></td></tr
><tr
id=sl_svn1424_47

><td class="source">  `((&quot;cc-mode&quot;         nil                    c-mode-base-map)<br></td></tr
><tr
id=sl_svn1424_48

><td class="source">    (&quot;cc-mode&quot;         c-mode                 c-mode-map)<br></td></tr
><tr
id=sl_svn1424_49

><td class="source">    (&quot;cc-mode&quot;         c++-mode               c++-mode-map)<br></td></tr
><tr
id=sl_svn1424_50

><td class="source">    (&quot;cc-mode&quot;         java-mode              java-mode-map)<br></td></tr
><tr
id=sl_svn1424_51

><td class="source">    (&quot;cc-mode&quot;         awk-mode               awk-mode-map)<br></td></tr
><tr
id=sl_svn1424_52

><td class="source">    &quot;lisp-mode&quot;<br></td></tr
><tr
id=sl_svn1424_53

><td class="source">    (&quot;lisp-mode&quot;       emacs-lisp-mode        emacs-lisp-mode-map)<br></td></tr
><tr
id=sl_svn1424_54

><td class="source">    &quot;help-mode&quot;<br></td></tr
><tr
id=sl_svn1424_55

><td class="source">    (&quot;man&quot;             Man-mode               Man-mode-map)<br></td></tr
><tr
id=sl_svn1424_56

><td class="source">    &quot;log-view&quot;<br></td></tr
><tr
id=sl_svn1424_57

><td class="source">    (&quot;compile&quot;         compilation-mode       compilation-mode-map)<br></td></tr
><tr
id=sl_svn1424_58

><td class="source">    (&quot;gud&quot;)<br></td></tr
><tr
id=sl_svn1424_59

><td class="source">    (&quot;lisp-mode&quot;       lisp-interaction-mode  lisp-interaction-mode-map)<br></td></tr
><tr
id=sl_svn1424_60

><td class="source">    &quot;browse-kill-ring&quot;<br></td></tr
><tr
id=sl_svn1424_61

><td class="source">    (&quot;simple&quot;          completion-list-mode   completion-list-mode-map)<br></td></tr
><tr
id=sl_svn1424_62

><td class="source">    (&quot;inf-ruby&quot;        inferior-ruby-mode     inferior-ruby-mode-map)<br></td></tr
><tr
id=sl_svn1424_63

><td class="source">    &quot;ruby-mode&quot;<br></td></tr
><tr
id=sl_svn1424_64

><td class="source">    (&quot;cus-edit&quot;        custom-mode            custom-mode-map)<br></td></tr
><tr
id=sl_svn1424_65

><td class="source">    (&quot;info&quot;            Info-mode              Info-mode-map)<br></td></tr
><tr
id=sl_svn1424_66

><td class="source">    (&quot;psvn&quot;            svn-log-edit-mode      svn-log-edit-mode-map)<br></td></tr
><tr
id=sl_svn1424_67

><td class="source">    (&quot;psvn&quot;            svn-status-mode        svn-status-mode-map)<br></td></tr
><tr
id=sl_svn1424_68

><td class="source">    (&quot;psvn&quot;            svn-info-mode          svn-info-mode-map)<br></td></tr
><tr
id=sl_svn1424_69

><td class="source">    (&quot;package&quot;         package-menu-mode      package-menu-mode-map)<br></td></tr
><tr
id=sl_svn1424_70

><td class="source">    &quot;dired&quot;<br></td></tr
><tr
id=sl_svn1424_71

><td class="source">    &quot;apropos&quot;<br></td></tr
><tr
id=sl_svn1424_72

><td class="source">    &quot;emaci&quot;<br></td></tr
><tr
id=sl_svn1424_73

><td class="source">    &quot;cflow-mode&quot;<br></td></tr
><tr
id=sl_svn1424_74

><td class="source">    (&quot;psvn&quot;            svn-log-view-mode      svn-log-view-mode-map)<br></td></tr
><tr
id=sl_svn1424_75

><td class="source">    (&quot;vc-svn&quot;          vc-svn-log-view-mode   vc-svn-log-view-mode-map)<br></td></tr
><tr
id=sl_svn1424_76

><td class="source">    (&quot;log-view&quot;        log-view-mode          log-view-mode-map)<br></td></tr
><tr
id=sl_svn1424_77

><td class="source">    &quot;diff-mode&quot;<br></td></tr
><tr
id=sl_svn1424_78

><td class="source">    (&quot;sgml-mode&quot;       html-mode              html-mode-map)<br></td></tr
><tr
id=sl_svn1424_79

><td class="source">    &quot;sgml-mode&quot;<br></td></tr
><tr
id=sl_svn1424_80

><td class="source">    &quot;w3m&quot;<br></td></tr
><tr
id=sl_svn1424_81

><td class="source">    (&quot;data-debug&quot;      data-debug-mode)<br></td></tr
><tr
id=sl_svn1424_82

><td class="source">    (&quot;debug&quot;           debugger-mode          debugger-mode-map)<br></td></tr
><tr
id=sl_svn1424_83

><td class="source">    &quot;text-mode&quot;<br></td></tr
><tr
id=sl_svn1424_84

><td class="source">    &quot;color-theme&quot;<br></td></tr
><tr
id=sl_svn1424_85

><td class="source">    &quot;woman&quot;<br></td></tr
><tr
id=sl_svn1424_86

><td class="source">    &quot;doxymacs&quot;<br></td></tr
><tr
id=sl_svn1424_87

><td class="source">    &quot;grep&quot;<br></td></tr
><tr
id=sl_svn1424_88

><td class="source">    &quot;view&quot;<br></td></tr
><tr
id=sl_svn1424_89

><td class="source">    (&quot;hi-lock&quot;         hi-lock-mode           hi-lock-map)<br></td></tr
><tr
id=sl_svn1424_90

><td class="source">    &quot;autoconf&quot;<br></td></tr
><tr
id=sl_svn1424_91

><td class="source">    &quot;tcl&quot;<br></td></tr
><tr
id=sl_svn1424_92

><td class="source">    &quot;sgml-mode&quot;<br></td></tr
><tr
id=sl_svn1424_93

><td class="source">    &quot;image-mode&quot;<br></td></tr
><tr
id=sl_svn1424_94

><td class="source">    &quot;shell&quot;<br></td></tr
><tr
id=sl_svn1424_95

><td class="source">    &quot;sql&quot;<br></td></tr
><tr
id=sl_svn1424_96

><td class="source">    &quot;rhtml-mode&quot;<br></td></tr
><tr
id=sl_svn1424_97

><td class="source">    &quot;senator&quot;<br></td></tr
><tr
id=sl_svn1424_98

><td class="source">    &quot;org&quot;<br></td></tr
><tr
id=sl_svn1424_99

><td class="source">    &quot;org-agenda&quot;<br></td></tr
><tr
id=sl_svn1424_100

><td class="source">    &quot;python&quot;<br></td></tr
><tr
id=sl_svn1424_101

><td class="source">    (&quot;python-mode&quot;     nil                     py-mode-map)<br></td></tr
><tr
id=sl_svn1424_102

><td class="source">    &quot;groovy-mode&quot;<br></td></tr
><tr
id=sl_svn1424_103

><td class="source">    &quot;nxml-mode&quot;<br></td></tr
><tr
id=sl_svn1424_104

><td class="source">    &quot;perl-mode&quot;<br></td></tr
><tr
id=sl_svn1424_105

><td class="source">    &quot;cperl-mode&quot;<br></td></tr
><tr
id=sl_svn1424_106

><td class="source">    &quot;artist&quot;<br></td></tr
><tr
id=sl_svn1424_107

><td class="source">    &quot;calendar&quot;<br></td></tr
><tr
id=sl_svn1424_108

><td class="source">    &quot;outline&quot;<br></td></tr
><tr
id=sl_svn1424_109

><td class="source">    &quot;google-maps-static&quot;<br></td></tr
><tr
id=sl_svn1424_110

><td class="source">    &quot;flymake&quot;<br></td></tr
><tr
id=sl_svn1424_111

><td class="source">    &quot;ezbl&quot;<br></td></tr
><tr
id=sl_svn1424_112

><td class="source">    &quot;markdown-mode&quot;<br></td></tr
><tr
id=sl_svn1424_113

><td class="source">    &quot;graphviz-dot-mode&quot;<br></td></tr
><tr
id=sl_svn1424_114

><td class="source">    (&quot;speedbar&quot;        speedbar-mode          speedbar-key-map)<br></td></tr
><tr
id=sl_svn1424_115

><td class="source">    (&quot;speedbar&quot;        speedbar-mode          speedbar-file-key-map)<br></td></tr
><tr
id=sl_svn1424_116

><td class="source">    (&quot;yasnippet&quot;       nil                    yas/keymap)<br></td></tr
><tr
id=sl_svn1424_117

><td class="source">    (&quot;yasnippet&quot;       yas/minor-mode         yas/minor-mode-map)<br></td></tr
><tr
id=sl_svn1424_118

><td class="source">    (&quot;chart&quot;           chart-mode             chart-map)<br></td></tr
><tr
id=sl_svn1424_119

><td class="source">    (&quot;recentf&quot;         recentf-dialog-mode    recentf-dialog-mode-map)<br></td></tr
><tr
id=sl_svn1424_120

><td class="source">    (&quot;conf-mode&quot;       conf-javaprop-mode     conf-javaprop-mode-map)<br></td></tr
><tr
id=sl_svn1424_121

><td class="source">    (&quot;conf-mode&quot;       conf-space-mode        conf-space-mode-map)<br></td></tr
><tr
id=sl_svn1424_122

><td class="source">    (&quot;cua-base&quot;        nil                    cua--rectangle-keymap)<br></td></tr
><tr
id=sl_svn1424_123

><td class="source">    (&quot;make-mode&quot;       makefile-gmake-mode    makefile-gmake-mode-map)<br></td></tr
><tr
id=sl_svn1424_124

><td class="source">    (&quot;make-mode&quot;       makefile-mode          makefile-mode-map)<br></td></tr
><tr
id=sl_svn1424_125

><td class="source">    (&quot;make-mode&quot;       makefile-automake-mode makefile-automake-mode-map)<br></td></tr
><tr
id=sl_svn1424_126

><td class="source">    (&quot;sh-script&quot;       sh-mode                sh-mode-map)<br></td></tr
><tr
id=sl_svn1424_127

><td class="source">    (&quot;auto-complete&quot;   auto-complete-mode     ac-completing-map)<br></td></tr
><tr
id=sl_svn1424_128

><td class="source">    (&quot;auto-complete&quot;   nil                    ac-mode-map)<br></td></tr
><tr
id=sl_svn1424_129

><td class="source">    (&quot;list-processes+&quot; nil                    list-processes-mode-map)<br></td></tr
><tr
id=sl_svn1424_130

><td class="source">    (&quot;semantic-decoration-on-include&quot; nil semantic-decoration-on-include-map)<br></td></tr
><tr
id=sl_svn1424_131

><td class="source">    (&quot;semantic-symref-list&quot; semantic-symref-results-mode semantic-symref-results-mode-map))<br></td></tr
><tr
id=sl_svn1424_132

><td class="source">  &quot;*List used to find load file by mode or map.<br></td></tr
><tr
id=sl_svn1424_133

><td class="source"><br></td></tr
><tr
id=sl_svn1424_134

><td class="source">Every element of list is or a list consisted by load file, mode and map,<br></td></tr
><tr
id=sl_svn1424_135

><td class="source">or just one load file, or nil. If element is a list, and its last element is nil,<br></td></tr
><tr
id=sl_svn1424_136

><td class="source">it will be ignored.&quot;<br></td></tr
><tr
id=sl_svn1424_137

><td class="source">  :type &#39;alist<br></td></tr
><tr
id=sl_svn1424_138

><td class="source">  :group &#39;eal)<br></td></tr
><tr
id=sl_svn1424_139

><td class="source"><br></td></tr
><tr
id=sl_svn1424_140

><td class="source">;;;###autoload<br></td></tr
><tr
id=sl_svn1424_141

><td class="source">(defun eal-eval-by-modes (modes fun)<br></td></tr
><tr
id=sl_svn1424_142

><td class="source">  &quot;Run `eval-after-load&#39; on function FUN by MODES.<br></td></tr
><tr
id=sl_svn1424_143

><td class="source"><br></td></tr
><tr
id=sl_svn1424_144

><td class="source">FUN will be called by `eval&#39; with argument mode of MODES.<br></td></tr
><tr
id=sl_svn1424_145

><td class="source">Example:<br></td></tr
><tr
id=sl_svn1424_146

><td class="source">\(eal-eval-by-modes<br></td></tr
><tr
id=sl_svn1424_147

><td class="source"> ac-modes<br></td></tr
><tr
id=sl_svn1424_148

><td class="source"> (lambda (mode)<br></td></tr
><tr
id=sl_svn1424_149

><td class="source">   (let ((mode-name (symbol-name mode)))<br></td></tr
><tr
id=sl_svn1424_150

><td class="source">     (when (and (intern-soft mode-name) (intern-soft (concat mode-name \&quot;-map\&quot;)))<br></td></tr
><tr
id=sl_svn1424_151

><td class="source">       (define-key (symbol-value (am-intern mode-name \&quot;-map\&quot;)) (kbd \&quot;C-c a\&quot;) &#39;ac-start)))))&quot;<br></td></tr
><tr
id=sl_svn1424_152

><td class="source">  (if (listp modes)<br></td></tr
><tr
id=sl_svn1424_153

><td class="source">      (eal-eval-by-symbols modes 1 fun)<br></td></tr
><tr
id=sl_svn1424_154

><td class="source">    (eal-eval-by-symbol modes 1 fun)))<br></td></tr
><tr
id=sl_svn1424_155

><td class="source"><br></td></tr
><tr
id=sl_svn1424_156

><td class="source">;;;###autoload<br></td></tr
><tr
id=sl_svn1424_157

><td class="source">(defun eal-eval-by-maps (maps fun)<br></td></tr
><tr
id=sl_svn1424_158

><td class="source">  &quot;Run `eval-after-load&#39; on function FUN by MAPS.<br></td></tr
><tr
id=sl_svn1424_159

><td class="source"><br></td></tr
><tr
id=sl_svn1424_160

><td class="source">FUN will be call by `eval&#39; with argument mode of MAPS.&quot;<br></td></tr
><tr
id=sl_svn1424_161

><td class="source">  (if (listp maps)<br></td></tr
><tr
id=sl_svn1424_162

><td class="source">      (eal-eval-by-symbols maps 2 fun)<br></td></tr
><tr
id=sl_svn1424_163

><td class="source">    (eal-eval-by-symbol maps 2 fun)))<br></td></tr
><tr
id=sl_svn1424_164

><td class="source"><br></td></tr
><tr
id=sl_svn1424_165

><td class="source">;;;###autoload<br></td></tr
><tr
id=sl_svn1424_166

><td class="source">(defun eal-eval-by-symbols (symbols pos fun)<br></td></tr
><tr
id=sl_svn1424_167

><td class="source">  &quot;Run `eval-after-load&#39; on function FUN by SYMBOLS.<br></td></tr
><tr
id=sl_svn1424_168

><td class="source"><br></td></tr
><tr
id=sl_svn1424_169

><td class="source">FUN will be call by `eval&#39; with argument mode of SYMBOLS. &quot;<br></td></tr
><tr
id=sl_svn1424_170

><td class="source">  (mapc<br></td></tr
><tr
id=sl_svn1424_171

><td class="source">   `(lambda (symbol)<br></td></tr
><tr
id=sl_svn1424_172

><td class="source">      (eal-eval-by-symbol symbol ,pos ,fun))<br></td></tr
><tr
id=sl_svn1424_173

><td class="source">   symbols))<br></td></tr
><tr
id=sl_svn1424_174

><td class="source"><br></td></tr
><tr
id=sl_svn1424_175

><td class="source">;;;###autoload<br></td></tr
><tr
id=sl_svn1424_176

><td class="source">(defun eal-eval-by-symbol (symbol pos fun)<br></td></tr
><tr
id=sl_svn1424_177

><td class="source">  &quot;Run `eval-after-load&#39; on function FUN by SYMBOL.&quot;<br></td></tr
><tr
id=sl_svn1424_178

><td class="source">  (let ((file (eal-find-loadfile-by-symbol symbol pos))<br></td></tr
><tr
id=sl_svn1424_179

><td class="source">        (form `(,fun &#39;,symbol)))<br></td></tr
><tr
id=sl_svn1424_180

><td class="source">    (if file<br></td></tr
><tr
id=sl_svn1424_181

><td class="source">        (eval-after-load file form)<br></td></tr
><tr
id=sl_svn1424_182

><td class="source">      (eval form))))<br></td></tr
><tr
id=sl_svn1424_183

><td class="source"><br></td></tr
><tr
id=sl_svn1424_184

><td class="source">;;;###autoload<br></td></tr
><tr
id=sl_svn1424_185

><td class="source">(defun eal-find-loadfile-by-mode (mode)<br></td></tr
><tr
id=sl_svn1424_186

><td class="source">  &quot;Find load file by mode MODE.&quot;<br></td></tr
><tr
id=sl_svn1424_187

><td class="source">  (eal-find-loadfile-by-symbol mode 1))<br></td></tr
><tr
id=sl_svn1424_188

><td class="source"><br></td></tr
><tr
id=sl_svn1424_189

><td class="source">;;;###autoload<br></td></tr
><tr
id=sl_svn1424_190

><td class="source">(defun eal-find-loadfile-by-map (map)<br></td></tr
><tr
id=sl_svn1424_191

><td class="source">  &quot;Find load file by map MAP.&quot;<br></td></tr
><tr
id=sl_svn1424_192

><td class="source">  (eal-find-loadfile-by-symbol map 2))<br></td></tr
><tr
id=sl_svn1424_193

><td class="source"><br></td></tr
><tr
id=sl_svn1424_194

><td class="source">;;;###autoload<br></td></tr
><tr
id=sl_svn1424_195

><td class="source">(defun eal-find-loadfile-by-symbol (symbol pos)<br></td></tr
><tr
id=sl_svn1424_196

><td class="source">  &quot;Find load file by symbol SYMBOL, its position is POS.&quot;<br></td></tr
><tr
id=sl_svn1424_197

><td class="source">  (let* ((symbol-name (symbol-name symbol))<br></td></tr
><tr
id=sl_svn1424_198

><td class="source">         (first<br></td></tr
><tr
id=sl_svn1424_199

><td class="source">          (find-if<br></td></tr
><tr
id=sl_svn1424_200

><td class="source">           (lambda (pair)<br></td></tr
><tr
id=sl_svn1424_201

><td class="source">             (if (stringp pair)<br></td></tr
><tr
id=sl_svn1424_202

><td class="source">                 (if (string= symbol-name (eal-get-name-by-loadfile pair pos))<br></td></tr
><tr
id=sl_svn1424_203

><td class="source">                     pair<br></td></tr
><tr
id=sl_svn1424_204

><td class="source">                   (let ((file (and (string-match &quot;^\\(.+\\)-mode$&quot; pair)<br></td></tr
><tr
id=sl_svn1424_205

><td class="source">                                    (match-string 1 pair))))<br></td></tr
><tr
id=sl_svn1424_206

><td class="source">                     (if file<br></td></tr
><tr
id=sl_svn1424_207

><td class="source">                         (if (string= symbol-name (eal-get-name-by-loadfile file pos))<br></td></tr
><tr
id=sl_svn1424_208

><td class="source">                             pair))))<br></td></tr
><tr
id=sl_svn1424_209

><td class="source">               (if pair<br></td></tr
><tr
id=sl_svn1424_210

><td class="source">                   (if (eq (nth pos pair) symbol)<br></td></tr
><tr
id=sl_svn1424_211

><td class="source">                       (car pair)))))<br></td></tr
><tr
id=sl_svn1424_212

><td class="source">           eal-loadfile-mode-maps)))<br></td></tr
><tr
id=sl_svn1424_213

><td class="source">    (if (listp first) (car first) first)))<br></td></tr
><tr
id=sl_svn1424_214

><td class="source"><br></td></tr
><tr
id=sl_svn1424_215

><td class="source">;;;###autoload<br></td></tr
><tr
id=sl_svn1424_216

><td class="source">(defun eal-get-name-by-loadfile (file pos)<br></td></tr
><tr
id=sl_svn1424_217

><td class="source">  &quot;Get `symbol-name&#39; by load file FILE and position POS.&quot;<br></td></tr
><tr
id=sl_svn1424_218

><td class="source">  (concat file &quot;-&quot; (if (= pos 1) &quot;mode&quot; &quot;mode-map&quot;)))<br></td></tr
><tr
id=sl_svn1424_219

><td class="source"><br></td></tr
><tr
id=sl_svn1424_220

><td class="source">;;;###autoload<br></td></tr
><tr
id=sl_svn1424_221

><td class="source">(defun eal-define-keys (keymaps key-defs)<br></td></tr
><tr
id=sl_svn1424_222

><td class="source">  &quot;Execute `define-key&#39; on KEYMAPS by `eval-after-load&#39; technique use arguments from element of list KEY-DEFS.<br></td></tr
><tr
id=sl_svn1424_223

><td class="source"><br></td></tr
><tr
id=sl_svn1424_224

><td class="source">KEY-DEFS should be one list, every element of it is a list<br></td></tr
><tr
id=sl_svn1424_225

><td class="source">whose first element is key like argument of `define-key&#39;, and second element is command<br></td></tr
><tr
id=sl_svn1424_226

><td class="source">like argument of `define-key&#39;.&quot;<br></td></tr
><tr
id=sl_svn1424_227

><td class="source">  (eal-eval-by-maps<br></td></tr
><tr
id=sl_svn1424_228

><td class="source">   keymaps<br></td></tr
><tr
id=sl_svn1424_229

><td class="source">   `(lambda (keymap)<br></td></tr
><tr
id=sl_svn1424_230

><td class="source">      (eal-define-keys-commonly (symbol-value keymap) &#39;,key-defs))))<br></td></tr
><tr
id=sl_svn1424_231

><td class="source"><br></td></tr
><tr
id=sl_svn1424_232

><td class="source">;;;###autoload<br></td></tr
><tr
id=sl_svn1424_233

><td class="source">(defun eal-define-keys-commonly (keymap key-defs)<br></td></tr
><tr
id=sl_svn1424_234

><td class="source">  &quot;Execute `define-key&#39; on KEYMAP use arguments from KEY-DEFS.<br></td></tr
><tr
id=sl_svn1424_235

><td class="source"><br></td></tr
><tr
id=sl_svn1424_236

><td class="source">KEY-DEFS should be one list, every element of it is a list<br></td></tr
><tr
id=sl_svn1424_237

><td class="source">whose first element is key like argument of `define-key&#39;, and second element is command<br></td></tr
><tr
id=sl_svn1424_238

><td class="source">like argument of `define-key&#39;.&quot;<br></td></tr
><tr
id=sl_svn1424_239

><td class="source">   (dolist (key-def key-defs)<br></td></tr
><tr
id=sl_svn1424_240

><td class="source">     (when key-def<br></td></tr
><tr
id=sl_svn1424_241

><td class="source">       (define-key keymap (eval `(kbd ,(car key-def))) (nth 1 key-def)))))<br></td></tr
><tr
id=sl_svn1424_242

><td class="source"><br></td></tr
><tr
id=sl_svn1424_243

><td class="source">;;;###autoload<br></td></tr
><tr
id=sl_svn1424_244

><td class="source">(defun eal-define-key (keymap key def)<br></td></tr
><tr
id=sl_svn1424_245

><td class="source">  &quot;Execute `define-key&#39; use arguments KEYMAP, KEY, DEF by `eval-after-load&#39; technique.<br></td></tr
><tr
id=sl_svn1424_246

><td class="source"><br></td></tr
><tr
id=sl_svn1424_247

><td class="source">*Note*: KEYMAP should be quoted, this is diference between argument of `define-key&#39;.&quot;<br></td></tr
><tr
id=sl_svn1424_248

><td class="source">  (eal-eval-by-maps<br></td></tr
><tr
id=sl_svn1424_249

><td class="source">   keymap<br></td></tr
><tr
id=sl_svn1424_250

><td class="source">   `(lambda (keymap)<br></td></tr
><tr
id=sl_svn1424_251

><td class="source">      (define-key (symbol-value keymap) ,key &#39;,def))))<br></td></tr
><tr
id=sl_svn1424_252

><td class="source"><br></td></tr
><tr
id=sl_svn1424_253

><td class="source">(provide &#39;eval-after-load)<br></td></tr
><tr
id=sl_svn1424_254

><td class="source"><br></td></tr
><tr
id=sl_svn1424_255

><td class="source">;;; eval-after-load.el ends here<br></td></tr
></table></pre>
<pre><table width="100%"><tr class="cursor_stop cursor_hidden"><td></td></tr></table></pre>
</td>
</tr></table>

 
<script type="text/javascript">
 var lineNumUnderMouse = -1;
 
 function gutterOver(num) {
 gutterOut();
 var newTR = document.getElementById('gr_svn1424_' + num);
 if (newTR) {
 newTR.className = 'undermouse';
 }
 lineNumUnderMouse = num;
 }
 function gutterOut() {
 if (lineNumUnderMouse != -1) {
 var oldTR = document.getElementById(
 'gr_svn1424_' + lineNumUnderMouse);
 if (oldTR) {
 oldTR.className = '';
 }
 lineNumUnderMouse = -1;
 }
 }
 var numsGenState = {table_base_id: 'nums_table_'};
 var srcGenState = {table_base_id: 'src_table_'};
 var alignerRunning = false;
 var startOver = false;
 function setLineNumberHeights() {
 if (alignerRunning) {
 startOver = true;
 return;
 }
 numsGenState.chunk_id = 0;
 numsGenState.table = document.getElementById('nums_table_0');
 numsGenState.row_num = 0;
 if (!numsGenState.table) {
 return; // Silently exit if no file is present.
 }
 srcGenState.chunk_id = 0;
 srcGenState.table = document.getElementById('src_table_0');
 srcGenState.row_num = 0;
 alignerRunning = true;
 continueToSetLineNumberHeights();
 }
 function rowGenerator(genState) {
 if (genState.row_num < genState.table.rows.length) {
 var currentRow = genState.table.rows[genState.row_num];
 genState.row_num++;
 return currentRow;
 }
 var newTable = document.getElementById(
 genState.table_base_id + (genState.chunk_id + 1));
 if (newTable) {
 genState.chunk_id++;
 genState.row_num = 0;
 genState.table = newTable;
 return genState.table.rows[0];
 }
 return null;
 }
 var MAX_ROWS_PER_PASS = 1000;
 function continueToSetLineNumberHeights() {
 var rowsInThisPass = 0;
 var numRow = 1;
 var srcRow = 1;
 while (numRow && srcRow && rowsInThisPass < MAX_ROWS_PER_PASS) {
 numRow = rowGenerator(numsGenState);
 srcRow = rowGenerator(srcGenState);
 rowsInThisPass++;
 if (numRow && srcRow) {
 if (numRow.offsetHeight != srcRow.offsetHeight) {
 numRow.firstChild.style.height = srcRow.offsetHeight + 'px';
 }
 }
 }
 if (rowsInThisPass >= MAX_ROWS_PER_PASS) {
 setTimeout(continueToSetLineNumberHeights, 10);
 } else {
 alignerRunning = false;
 if (startOver) {
 startOver = false;
 setTimeout(setLineNumberHeights, 500);
 }
 }
 }
 function initLineNumberHeights() {
 // Do 2 complete passes, because there can be races
 // between this code and prettify.
 startOver = true;
 setTimeout(setLineNumberHeights, 250);
 window.onresize = setLineNumberHeights;
 }
 initLineNumberHeights();
</script>

 
 
 <div id="log">
 <div style="text-align:right">
 <a class="ifCollapse" href="#" onclick="_toggleMeta(this); return false">Show details</a>
 <a class="ifExpand" href="#" onclick="_toggleMeta(this); return false">Hide details</a>
 </div>
 <div class="ifExpand">
 
 
 <div class="pmeta_bubble_bg" style="border:1px solid white">
 <div class="round4"></div>
 <div class="round2"></div>
 <div class="round1"></div>
 <div class="box-inner">
 <div id="changelog">
 <p>Change log</p>
 <div>
 <a href="/p/dea/source/detail?spec=svn1424&amp;r=1404">r1404</a>
 by taoshanwen
 on Oct 5, 2011
 &nbsp; <a href="/p/dea/source/diff?spec=svn1424&r=1404&amp;format=side&amp;path=/trunk/my-lisps/eval-after-load.el&amp;old_path=/trunk/my-lisps/eval-after-load.el&amp;old=1391">Diff</a>
 </div>
 <pre>Some changes.
</pre>
 </div>
 
 
 
 
 
 
 <script type="text/javascript">
 var detail_url = '/p/dea/source/detail?r=1404&spec=svn1424';
 var publish_url = '/p/dea/source/detail?r=1404&spec=svn1424#publish';
 // describe the paths of this revision in javascript.
 var changed_paths = [];
 var changed_urls = [];
 
 changed_paths.push('/trunk/emacser.com/about.htm');
 changed_urls.push('/p/dea/source/browse/trunk/emacser.com/about.htm?r\x3d1404\x26spec\x3dsvn1424');
 
 
 changed_paths.push('/trunk/emacser.com/emacs_graphviz_ds.org');
 changed_urls.push('/p/dea/source/browse/trunk/emacser.com/emacs_graphviz_ds.org?r\x3d1404\x26spec\x3dsvn1424');
 
 
 changed_paths.push('/trunk/my-lisps/doxymacs-settings.el');
 changed_urls.push('/p/dea/source/browse/trunk/my-lisps/doxymacs-settings.el?r\x3d1404\x26spec\x3dsvn1424');
 
 
 changed_paths.push('/trunk/my-lisps/edit-settings.el');
 changed_urls.push('/p/dea/source/browse/trunk/my-lisps/edit-settings.el?r\x3d1404\x26spec\x3dsvn1424');
 
 
 changed_paths.push('/trunk/my-lisps/eval-after-load.el');
 changed_urls.push('/p/dea/source/browse/trunk/my-lisps/eval-after-load.el?r\x3d1404\x26spec\x3dsvn1424');
 
 var selected_path = '/trunk/my-lisps/eval-after-load.el';
 
 
 changed_paths.push('/trunk/my-lisps/python-settings.el');
 changed_urls.push('/p/dea/source/browse/trunk/my-lisps/python-settings.el?r\x3d1404\x26spec\x3dsvn1424');
 
 
 changed_paths.push('/trunk/my-lisps/svn-settings.el');
 changed_urls.push('/p/dea/source/browse/trunk/my-lisps/svn-settings.el?r\x3d1404\x26spec\x3dsvn1424');
 
 
 changed_paths.push('/trunk/my-lisps/template-settings.el');
 changed_urls.push('/p/dea/source/browse/trunk/my-lisps/template-settings.el?r\x3d1404\x26spec\x3dsvn1424');
 
 
 changed_paths.push('/trunk/snippets/text-mode/python-mode/headx');
 changed_urls.push('/p/dea/source/browse/trunk/snippets/text-mode/python-mode/headx?r\x3d1404\x26spec\x3dsvn1424');
 
 
 function getCurrentPageIndex() {
 for (var i = 0; i < changed_paths.length; i++) {
 if (selected_path == changed_paths[i]) {
 return i;
 }
 }
 }
 function getNextPage() {
 var i = getCurrentPageIndex();
 if (i < changed_paths.length - 1) {
 return changed_urls[i + 1];
 }
 return null;
 }
 function getPreviousPage() {
 var i = getCurrentPageIndex();
 if (i > 0) {
 return changed_urls[i - 1];
 }
 return null;
 }
 function gotoNextPage() {
 var page = getNextPage();
 if (!page) {
 page = detail_url;
 }
 window.location = page;
 }
 function gotoPreviousPage() {
 var page = getPreviousPage();
 if (!page) {
 page = detail_url;
 }
 window.location = page;
 }
 function gotoDetailPage() {
 window.location = detail_url;
 }
 function gotoPublishPage() {
 window.location = publish_url;
 }
</script>

 
 <style type="text/css">
 #review_nav {
 border-top: 3px solid white;
 padding-top: 6px;
 margin-top: 1em;
 }
 #review_nav td {
 vertical-align: middle;
 }
 #review_nav select {
 margin: .5em 0;
 }
 </style>
 <div id="review_nav">
 <table><tr><td>Go to:&nbsp;</td><td>
 <select name="files_in_rev" onchange="window.location=this.value">
 
 <option value="/p/dea/source/browse/trunk/emacser.com/about.htm?r=1404&amp;spec=svn1424"
 
 >/trunk/emacser.com/about.htm</option>
 
 <option value="/p/dea/source/browse/trunk/emacser.com/emacs_graphviz_ds.org?r=1404&amp;spec=svn1424"
 
 >...macser.com/emacs_graphviz_ds.org</option>
 
 <option value="/p/dea/source/browse/trunk/my-lisps/doxymacs-settings.el?r=1404&amp;spec=svn1424"
 
 >...nk/my-lisps/doxymacs-settings.el</option>
 
 <option value="/p/dea/source/browse/trunk/my-lisps/edit-settings.el?r=1404&amp;spec=svn1424"
 
 >/trunk/my-lisps/edit-settings.el</option>
 
 <option value="/p/dea/source/browse/trunk/my-lisps/eval-after-load.el?r=1404&amp;spec=svn1424"
 selected="selected"
 >/trunk/my-lisps/eval-after-load.el</option>
 
 <option value="/p/dea/source/browse/trunk/my-lisps/python-settings.el?r=1404&amp;spec=svn1424"
 
 >/trunk/my-lisps/python-settings.el</option>
 
 <option value="/p/dea/source/browse/trunk/my-lisps/svn-settings.el?r=1404&amp;spec=svn1424"
 
 >/trunk/my-lisps/svn-settings.el</option>
 
 <option value="/p/dea/source/browse/trunk/my-lisps/template-settings.el?r=1404&amp;spec=svn1424"
 
 >...nk/my-lisps/template-settings.el</option>
 
 <option value="/p/dea/source/browse/trunk/snippets/text-mode/python-mode/headx?r=1404&amp;spec=svn1424"
 
 >...pets/text-mode/python-mode/headx</option>
 
 </select>
 </td></tr></table>
 
 
 



 <div style="white-space:nowrap">
 Project members,
 <a href="https://www.google.com/accounts/ServiceLogin?service=code&amp;ltmpl=phosting&amp;continue=http%3A%2F%2Fcode.google.com%2Fp%2Fdea%2Fsource%2Fbrowse%2Ftrunk%2Fmy-lisps%2Feval-after-load.el&amp;followup=http%3A%2F%2Fcode.google.com%2Fp%2Fdea%2Fsource%2Fbrowse%2Ftrunk%2Fmy-lisps%2Feval-after-load.el"
 >sign in</a> to write a code review</div>


 
 </div>
 
 
 </div>
 <div class="round1"></div>
 <div class="round2"></div>
 <div class="round4"></div>
 </div>
 <div class="pmeta_bubble_bg" style="border:1px solid white">
 <div class="round4"></div>
 <div class="round2"></div>
 <div class="round1"></div>
 <div class="box-inner">
 <div id="older_bubble">
 <p>Older revisions</p>
 
 
 <div class="closed" style="margin-bottom:3px;" >
 <img class="ifClosed" onclick="_toggleHidden(this)" src="http://www.gstatic.com/codesite/ph/images/plus.gif" >
 <img class="ifOpened" onclick="_toggleHidden(this)" src="http://www.gstatic.com/codesite/ph/images/minus.gif" >
 <a href="/p/dea/source/detail?spec=svn1424&r=1391">r1391</a>
 by taoshanwen
 on Apr 29, 2011
 &nbsp; <a href="/p/dea/source/diff?spec=svn1424&r=1391&amp;format=side&amp;path=/trunk/my-lisps/eval-after-load.el&amp;old_path=/trunk/my-lisps/eval-after-load.el&amp;old=1386">Diff</a>
 <br>
 <pre class="ifOpened">Add vimrc-generic-mode.
</pre>
 </div>
 
 <div class="closed" style="margin-bottom:3px;" >
 <img class="ifClosed" onclick="_toggleHidden(this)" src="http://www.gstatic.com/codesite/ph/images/plus.gif" >
 <img class="ifOpened" onclick="_toggleHidden(this)" src="http://www.gstatic.com/codesite/ph/images/minus.gif" >
 <a href="/p/dea/source/detail?spec=svn1424&r=1386">r1386</a>
 by taoshanwen
 on Mar 25, 2011
 &nbsp; <a href="/p/dea/source/diff?spec=svn1424&r=1386&amp;format=side&amp;path=/trunk/my-lisps/eval-after-load.el&amp;old_path=/trunk/my-lisps/eval-after-load.el&amp;old=1378">Diff</a>
 <br>
 <pre class="ifOpened">Small changes.
</pre>
 </div>
 
 <div class="closed" style="margin-bottom:3px;" >
 <img class="ifClosed" onclick="_toggleHidden(this)" src="http://www.gstatic.com/codesite/ph/images/plus.gif" >
 <img class="ifOpened" onclick="_toggleHidden(this)" src="http://www.gstatic.com/codesite/ph/images/minus.gif" >
 <a href="/p/dea/source/detail?spec=svn1424&r=1378">r1378</a>
 by taoshanwen
 on Feb 10, 2011
 &nbsp; <a href="/p/dea/source/diff?spec=svn1424&r=1378&amp;format=side&amp;path=/trunk/my-lisps/eval-after-load.el&amp;old_path=/trunk/my-lisps/eval-after-load.el&amp;old=1366">Diff</a>
 <br>
 <pre class="ifOpened">Fix a small bug.
</pre>
 </div>
 
 
 <a href="/p/dea/source/list?path=/trunk/my-lisps/eval-after-load.el&start=1404">All revisions of this file</a>
 </div>
 </div>
 <div class="round1"></div>
 <div class="round2"></div>
 <div class="round4"></div>
 </div>
 
 <div class="pmeta_bubble_bg" style="border:1px solid white">
 <div class="round4"></div>
 <div class="round2"></div>
 <div class="round1"></div>
 <div class="box-inner">
 <div id="fileinfo_bubble">
 <p>File info</p>
 
 <div>Size: 9216 bytes,
 255 lines</div>
 
 <div><a href="//dea.googlecode.com/svn/trunk/my-lisps/eval-after-load.el">View raw file</a></div>
 </div>
 
 </div>
 <div class="round1"></div>
 <div class="round2"></div>
 <div class="round4"></div>
 </div>
 </div>
 </div>


</div>

</div>
</div>

<script src="http://www.gstatic.com/codesite/ph/16186173366037945081/js/prettify/prettify.js"></script>
<script type="text/javascript">prettyPrint();</script>


<script src="http://www.gstatic.com/codesite/ph/16186173366037945081/js/source_file_scripts.js"></script>

 <script type="text/javascript" src="http://www.gstatic.com/codesite/ph/16186173366037945081/js/kibbles.js"></script>
 <script type="text/javascript">
 var lastStop = null;
 var initialized = false;
 
 function updateCursor(next, prev) {
 if (prev && prev.element) {
 prev.element.className = 'cursor_stop cursor_hidden';
 }
 if (next && next.element) {
 next.element.className = 'cursor_stop cursor';
 lastStop = next.index;
 }
 }
 
 function pubRevealed(data) {
 updateCursorForCell(data.cellId, 'cursor_stop cursor_hidden');
 if (initialized) {
 reloadCursors();
 }
 }
 
 function draftRevealed(data) {
 updateCursorForCell(data.cellId, 'cursor_stop cursor_hidden');
 if (initialized) {
 reloadCursors();
 }
 }
 
 function draftDestroyed(data) {
 updateCursorForCell(data.cellId, 'nocursor');
 if (initialized) {
 reloadCursors();
 }
 }
 function reloadCursors() {
 kibbles.skipper.reset();
 loadCursors();
 if (lastStop != null) {
 kibbles.skipper.setCurrentStop(lastStop);
 }
 }
 // possibly the simplest way to insert any newly added comments
 // is to update the class of the corresponding cursor row,
 // then refresh the entire list of rows.
 function updateCursorForCell(cellId, className) {
 var cell = document.getElementById(cellId);
 // we have to go two rows back to find the cursor location
 var row = getPreviousElement(cell.parentNode);
 row.className = className;
 }
 // returns the previous element, ignores text nodes.
 function getPreviousElement(e) {
 var element = e.previousSibling;
 if (element.nodeType == 3) {
 element = element.previousSibling;
 }
 if (element && element.tagName) {
 return element;
 }
 }
 function loadCursors() {
 // register our elements with skipper
 var elements = CR_getElements('*', 'cursor_stop');
 var len = elements.length;
 for (var i = 0; i < len; i++) {
 var element = elements[i]; 
 element.className = 'cursor_stop cursor_hidden';
 kibbles.skipper.append(element);
 }
 }
 function toggleComments() {
 CR_toggleCommentDisplay();
 reloadCursors();
 }
 function keysOnLoadHandler() {
 // setup skipper
 kibbles.skipper.addStopListener(
 kibbles.skipper.LISTENER_TYPE.PRE, updateCursor);
 // Set the 'offset' option to return the middle of the client area
 // an option can be a static value, or a callback
 kibbles.skipper.setOption('padding_top', 50);
 // Set the 'offset' option to return the middle of the client area
 // an option can be a static value, or a callback
 kibbles.skipper.setOption('padding_bottom', 100);
 // Register our keys
 kibbles.skipper.addFwdKey("n");
 kibbles.skipper.addRevKey("p");
 kibbles.keys.addKeyPressListener(
 'u', function() { window.location = detail_url; });
 kibbles.keys.addKeyPressListener(
 'r', function() { window.location = detail_url + '#publish'; });
 
 kibbles.keys.addKeyPressListener('j', gotoNextPage);
 kibbles.keys.addKeyPressListener('k', gotoPreviousPage);
 
 
 }
 </script>
<script src="http://www.gstatic.com/codesite/ph/16186173366037945081/js/code_review_scripts.js"></script>
<script type="text/javascript">
 function showPublishInstructions() {
 var element = document.getElementById('review_instr');
 if (element) {
 element.className = 'opened';
 }
 }
 var codereviews;
 function revsOnLoadHandler() {
 // register our source container with the commenting code
 var paths = {'svn1424': '/trunk/my-lisps/eval-after-load.el'}
 codereviews = CR_controller.setup(
 {"profileUrl":null,"token":null,"assetHostPath":"http://www.gstatic.com/codesite/ph","domainName":null,"assetVersionPath":"http://www.gstatic.com/codesite/ph/16186173366037945081","projectHomeUrl":"/p/dea","relativeBaseUrl":"","projectName":"dea","loggedInUserEmail":null}, '', 'svn1424', paths,
 CR_BrowseIntegrationFactory);
 
 codereviews.registerActivityListener(CR_ActivityType.REVEAL_DRAFT_PLATE, showPublishInstructions);
 
 codereviews.registerActivityListener(CR_ActivityType.REVEAL_PUB_PLATE, pubRevealed);
 codereviews.registerActivityListener(CR_ActivityType.REVEAL_DRAFT_PLATE, draftRevealed);
 codereviews.registerActivityListener(CR_ActivityType.DISCARD_DRAFT_COMMENT, draftDestroyed);
 
 
 
 
 
 
 
 var initialized = true;
 reloadCursors();
 }
 window.onload = function() {keysOnLoadHandler(); revsOnLoadHandler();};

</script>
<script type="text/javascript" src="http://www.gstatic.com/codesite/ph/16186173366037945081/js/dit_scripts.js"></script>

 
 
 
 <script type="text/javascript" src="http://www.gstatic.com/codesite/ph/16186173366037945081/js/ph_core.js"></script>
 
 
 
 
</div> 

<div id="footer" dir="ltr">
 <div class="text">
 <a href="/projecthosting/terms.html">Terms</a> -
 <a href="http://www.google.com/privacy.html">Privacy</a> -
 <a href="/p/support/">Project Hosting Help</a>
 </div>
</div>
 <div class="hostedBy" style="margin-top: -20px;">
 <span style="vertical-align: top;">Powered by <a href="http://code.google.com/projecthosting/">Google Project Hosting</a></span>
 </div>

 
 


 
 </body>
</html>
