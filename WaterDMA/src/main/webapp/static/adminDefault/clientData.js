$.fn.Tab = function (options) {
    var cfg = {
        items: [],
        width: 500,
        height: 500,
        tabcontentWidth: 498,
        tabWidth: 100,
        tabHeight: 32,
        tabScroll: true,
        tabScrollWidth: 19,
        tabClass: 'tab',
        tabContentClass: 'tab-div-content',
        tabClassOn: 'on',
        tabClassOff: 'off',
        tabClassClose: 'tab_close',
        tabClassInner: 'inner',
        tabClassInnerLeft: 'innerLeft',
        tabClassInnerMiddle: 'innerMiddle',
        tabClassInnerRight: 'innerRight',
        tabClassText: 'text',
        tabClassScrollLeft: 'scroll-left',
        tabClassScrollRight: 'scroll-right',
        tabClassDiv: 'tab-div',
        addEvent: null,
        currentEvent: null
    };
    //默认显示第一个li
    var displayLINum = 0;
    $.extend(cfg, options);
    //判断是不是有隐藏的tab
    var tW = cfg.tabWidth * cfg.items.length;
    cfg.tabScroll ? tW -= cfg.tabScrollWidth * 2 : null;
    //tabDiv,该div是自动增加的
    var tab = $('<div />').attr('id', 'jquery_tab_div').height(cfg.tabHeight).addClass(cfg.tabClass).append('<ul />');
    //tab target content
    var tabContent = $('<div />').attr('id', 'jquery_tab_div_content').height(cfg.height - cfg.tabHeight).addClass(cfg.tabContentClass);
    var ccW = (cfg.items.length * cfg.tabWidth) - cfg.width;
    var tabH = '';
    //增加一个tab下的li得模板
    var tabTemplate = '';
    tabTemplate = '<table class="' + cfg.tabClassInner + '"  id="{0}" data-value="{3}" border="0" cellpadding="0" cellspacing="0"><tr>' + '<td class="' + cfg.tabClassInnerLeft + '"></td>'
        + '<td class="' + cfg.tabClassInnerMiddle + '"><span class="' + cfg.tabClassText + '"><i class="fa {2}"></i>&nbsp;{1}</span></td>' + '<td class="' + cfg.tabClassInnerMiddle + '"><div class="' + cfg.tabClassClose + ' ' + cfg.tabClassClose + '_noselected"></div></td>' + '<td class="' + cfg.tabClassInnerRight + '"></td>'
        + '</tr></table>';
    var scrollTab = function (o, flag) {
        //当前的left
        var displayWidth = Number(tab.css('left').replace('px', ''));
        !displayWidth ? displayWidth = 0 : null;
        //显示第几个LI
        var displayNum = 0;
        var DW = 0;
        var left = 0;
        if (flag && displayWidth === 0) {
            return;
        }
        if (flag) {
            displayLINum--;
            left = displayWidth + tab.find('li').eq(displayLINum).width();
            left > 0 ? left = 0 : null;
        } else {
            var _rigth = $(".tab ul").width() - parseInt(tab.offset().left) * -1 - cfg.tabcontentWidth - 82;
            var _step = tab.find('li').eq(displayLINum).width();
            if (_rigth > 0) {
                if (_rigth < _step) {
                    _step = _rigth;
                }
            } else {
                return;
            }
            left = displayWidth - _step;
            displayLINum++;
        }
        if (left === 0) {
            tab.animate({ 'left': parseInt(-19) });
        } else {
            tab.animate({ 'left': parseInt(left) });
        }
    }
    function removeTab(item) {
        tab.find("#" + item.id).parents('li').remove();
        tabContent.find('#tabs_iframe_' + item.id).remove();
    }
    function addTab(item) {
        if (item.replace === true) {
            removeTab(item);
        }
        if (tab.find("#" + item.id).length === 0) {
            Loading(true);
            var innerString = tabTemplate.replace("{0}", item.id).replace("{1}", item.title).replace("{2}", item.icon).replace("{3}", item.dataValue);
            var liObj = $('<li class="off"></li>');
            liObj.append(innerString).appendTo(tab.find('ul')).find('table td:eq(1)').click(function () {
                liObj.Contextmenu();
                //判断当前是不是处于激活状态
                if (liObj.hasClass(cfg.tabClassOn)) return;

                var activeLi = liObj.parent().find('li.' + cfg.tabClassOn);
                activeLi.removeClass().addClass(cfg.tabClassOff);

                $(this).next().find('div').removeClass().addClass(cfg.tabClassClose);
                liObj.removeClass().addClass(cfg.tabClassOn);

                tabContent.find('iframe').hide().removeClass(cfg.tabClassOn);
                tabContent.find('#tabs_iframe_' + liObj.find('table').attr('id')).show().addClass(cfg.tabClassOn);
                cfg.currentEvent(liObj.find('.inner').attr('data-value'));
            })
            if (item.url) {
                var $iframe = $("<iframe id=\"tabs_iframe_" + item.id + "\" height=\"100%\" width=\"100%\" src=\"" + item.url + "\" frameBorder=\"0\"></iframe>")
                tabContent.append($iframe);
                $iframe.load(function () {
                    window.setTimeout(function () {
                        Loading(false);
                    }, 200);
                });
            }
            if (item.closed) {
                liObj.find('td:eq(2)').find('div').click(function () {
                    var li_index = tab.find('li').length;
                    removeTab(item);
                    tab.find('li:eq(' + (li_index - 2) + ')').find('table td:eq(1)').trigger("click");
                }).hover(function () {
                    if (liObj.hasClass(cfg.tabClassOn)) return;
                    $(this).removeClass().addClass(cfg.tabClassClose);
                }, function () {
                    if (liObj.hasClass(cfg.tabClassOn)) return;
                    $(this).addClass(cfg.tabClassClose + '_noselected');
                });
            }
            else {
                liObj.find('td:eq(2)').html('');
            }
            tab.find('li:eq(' + (tab.find('li').length - 1) + ')').find('table td:eq(1)').trigger("click");
            cfg.addEvent(item);
        } else {
            tab.find('li').removeClass('on').addClass('off');
            tab.find("#" + item.id).parent().removeClass('off').addClass('on');
            tabContent.find('iframe').hide().removeClass('on');
            tabContent.find('#tabs_iframe_' + item.id).show().addClass('on');
        }
    }
    function newTab(item) {
        if (item.moduleIdCookie === true) {
            top.$.cookie('currentmoduleId', item.id, { path: "/" });
            item.dataValue = item.id;
        }
        else {
            item.dataValue = top.$.cookie('currentmoduleId');
        }
        addTab(item);
        var nW = $(".tab ul").width() - 4;
        if (nW > cfg.width) {
            if (!cfg.tabScroll) {
                cfg.tabScroll = true;
                scrollLeft = $('<div class="' + cfg.tabClassScrollLeft + '"><i></i></div>').click(function () {
                    scrollTab(scrollLeft, true);
                });
                srcollRight = $('<div class="' + cfg.tabClassScrollRight + '"><i></i></div>').click(function () {
                    scrollTab(srcollRight, false);
                });
                cW -= cfg.tabScrollWidth * 2;
                tabContenter.width(cW);
                scrollLeft.insertBefore(tabContenter);
                srcollRight.insertBefore(tabContenter);
            }
            var _left = cfg.width - nW;
            tab.animate({ 'left': _left - 43 });
            displaylicount = tab.find('li').length;
        }
    }
    $.each(cfg.items, function (i, item) {
        addTab(item);
    });
    var scrollLeft, srcollRight;
    if (cfg.tabScroll) {
        scrollLeft = $('<div class="' + cfg.tabClassScrollLeft + '"><i></i></div>').click(function () {
            scrollTab($(this), true);
        });
        srcollRight = $('<div class="' + cfg.tabClassScrollRight + '"><i></i></div>').click(function () {
            scrollTab($(this), false);
        });
        cfg.width -= cfg.tabScrollWidth * 2;
    }
    var container = $('<div />').css({
        'position': 'relative',
        // 'width': cfg.width,
        'height': cfg.tabHeight
    }).append(scrollLeft).append(srcollRight).addClass(cfg.tabClassDiv);
    var tabContenter = $('<div />').css({
        // 'width': cfg.width,
        'height': cfg.tabHeight,
        'float': 'left'
    }).append(tab);
    var obj = $(this).append(tabH).append(container.append(tabContenter)).append(tabContent);
    $(window).resize(function () {
        cfg.width = $(window).width() - ($('#side').is(":hidden") ? 20 : 100);
        cfg.height = $(window).height() - 56;
        cfg.tabcontentWidth = $(window).width() - ($('#side').is(":hidden") ? 0 : 80);
        container.width(cfg.width);
        tabContent.width(cfg.tabcontentWidth).height(cfg.height - cfg.tabHeight);
    });
    //点击第一
    tab.find('li:first td:eq(1)').click();
    return obj.extend({ 'addTab': addTab, 'newTab': newTab });
};
function loadnav(data) {
    var navJson = {};
    //系统首页
    var _html = '';
    $.each(data, function (i) {
        var row = data[i];
        _html +=
            '<li class="item">'+
            '<a id=' + row.id + '  href="javascript:void(0);" class="main-nav">'+
            '<div class="main-nav-icon"><i class="' + row.img + '"></i></div>'+
            '<div class="main-nav-text">' + row.text + '</div>'+
            '<span class="arrow"></span>'+
            '</a>';
        if(row.hasChildren) _html += getsubnav(row.ChildNodes, navJson);
        _html += '</li>';
        navJson[row.id] = row;
    });
    $("#nav").html(_html);
    $('#nav li a').click(function (e) {
        var id = $(this).attr('id');
        var data = navJson[id];
        if(data.url !== "#" || data.url !== "" && data.url !== " " || typeof data.url !== "undefined"){
            tablist.newTab({ moduleIdCookie: true, id: id, title: data.text, closed: true, icon: data.img, url: data.url });
        }
    });
    $("#nav li.item").hover(function (e) {
        var $sub = $(this).find('.sub-nav-wrap');
        var length = $sub.find('.sub-nav').find('li').length;
        if (length > 0) {
            $(this).addClass('on');
            $sub.show();
            var sub_top = $sub.offset().top + $sub.height();
            var body_height = $(window).height();
            if (sub_top > body_height) {
                $sub.css('bottom', '0');
            }
        }
    }, function (e) {
        $(this).removeClass('on');
        $(this).find('.sub-nav-wrap').hide();
    });
    $("#nav li.sub").hover(function (e) {
        var $ul = $(this).find('ul');
        if($ul.length === 0) return false;
        $ul.show();
        var top = $(this).find('ul').offset().top;
        var height = $ul.height();
        var wheight = $(window).height();
        if (top + height > wheight) {
            $ul.css('top', parseInt('-' + (height - 11))).css('left', '130px')
        } else {
            $ul.css('top', '0').css('left', '130px');
        }
    }, function (e) {
        $(this).find('ul').hide();
        $(this).find('ul').css('top', '0');
    });
}
function getsubnav(children, navJson) {
    if(children.length === 0) return '';
    var _html = '<div class="sub-nav-wrap"><ul class="sub-nav">';
    $.each(children, function (i) {
        var row = children[i];
        _html +=
            '<li class="sub" title=' + row.text + '>' +
                '<a id=' + row.id + '>' +
                    '<i class="' + row.img + '"></i>' + row.text +
                '</a>';
        if(row.hasChildren) _html += getchildnav(row.ChildNodes, navJson);
        _html += '</li>';
        navJson[row.id] = row;
    });
    _html += '</ul></div>';
    return _html
}
function getchildnav(children, navJson) {
    if(children.length === 0) return '';
    var _html = '<div class="sub-child"><ul>';
    $.each(children, function (i) {
        var row = children[i];
        _html +=
            '<li title=' + row.text + '>' +
                '<a id=' + row.id + '>' +
                    '<i class="' + row.img + '"></i>' + row.text +
                '</a>' +
            '</li>';
        navJson[row.id] = row;
    });
    _html += '</ul></div>';
    return _html;
}
//安全退出
function IndexOut() {
    dialogConfirm("注：您确定要安全退出本次登录吗？", function (r) {
        if (r) {
            Loading(true, "正在安全退出...");
            window.setTimeout(function () {
                $.ajax({
                    url:  "/loginOut",
                    type: "post",
                    dataType: "json",
                    success: function (data) {
                        window.location.href = "/login";
                    }
                });
            }, 500);
        }
    });
}
//移除Tab
$.removeTab = function (type) {
    var Id = tabiframeId().substr(12);
    var $tab = $(".tab-div");
    var $tabContent = $(".tab-div-content");
    switch (type) {
        case "reloadCurrent":
            $.currentIframe().reload();
            break;
        case "closeCurrent":
            remove(Id);
            break;
        case "closeAll":
            $tab.find("div.tab_close").each(function () {
                var id = $(this).parents('.inner').attr('id');
                remove(id);
            });
            break;
        case "closeOther":
            $tab.find("div.tab_close").each(function () {
                var id = $(this).parents('.inner').attr('id');
                if (Id != id) {
                    remove(id);
                }
            });
            break;
        case "fullscreenchange":
            eleRequestFullscreen($('#tabs_iframe_' + Id)[0]);
            break;
        default:
            break;
    }
    function remove(id) {
        var li_index = $tab.find('li').length;
        $tab.find("#" + id).parents('li').remove();
        $tabContent.find('#tabs_iframe_' + id).remove();
        $tab.find('li:eq(' + (li_index - 2) + ')').find('table td:eq(1)').trigger("click");
    }
};
function eleRequestFullscreen(element) {

    if(element.requestFullscreen){

        return element.requestFullscreen();

    }else if(element.webkitRequestFullScreen){

        return element.webkitRequestFullScreen();

    }else if(element.mozRequestFullScreen){

        return element.mozRequestFullScreen();

    }else if(element.msRequestFullscreen){

        return element.msRequestFullscreen();

    }else{

    }
}
