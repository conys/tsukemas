var data = require("sdk/self").data;
var pageMod = require("sdk/page-mod");

pageMod.PageMod({
    include: "*",
    contentScriptFile: [data.url("idollist.js"), data.url("tsukemas_main.js")]
});


