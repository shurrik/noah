/*!
 * B-JUI v1.0 (http://b-jui.com)
 * Git@OSC (http://git.oschina.net/xknaan/B-JUI)
 * Copyright 2014 K'naan (xknaan@163.com).
 * Licensed under Apache (http://www.apache.org/licenses/LICENSE-2.0)
 */
/* ========================================================================
 * B-JUI: bjui-all.js v1.0
 * @author K'naan (xknaan@163.com)
 * http://git.oschina.net/xknaan/B-JUI/blob/master/BJUI/js/bjui-all.js
 * ========================================================================
 * Copyright 2014 K'naan.
 * Licensed under Apache (http://www.apache.org/licenses/LICENSE-2.0)
 * ======================================================================== */
/**
 * B-JUI: bjui-core.js v1.0
 * @author K'naan (xknaan@163.com)
 * -- Modified from dwz.core.js (author:ZhangHuihua@msn.com)
 * http://git.oschina.net/xknaan/B-JUI/blob/master/BJUI/js/bjui-core.js
*/
+ function (a) {
  'use strict';
  var b = {
    JSPATH: 'BJUI/',
    PLUGINPATH: 'BJUI/plugins/',
    IS_DEBUG: !1,
    keyCode: {
      ENTER: 13,
      ESC: 27,
      END: 35,
      HOME: 36,
      SHIFT: 16,
      TAB: 9,
      LEFT: 37,
      RIGHT: 39,
      UP: 38,
      DOWN: 40,
      DELETE: 46,
      BACKSPACE: 8
    },
    eventType: {
      initUI: 'bjui.initUI',
      beforeInitUI: 'bjui.beforeInitUI',
      afterInitUI: 'bjui.afterInitUI',
      ajaxStatus: 'bjui.ajaxStatus',
      resizeGrid: 'bjui.resizeGrid',
      beforeAjaxLoad: 'bjui.beforeAjaxLoad',
      beforeLoadNavtab: 'bjui.beforeLoadNavtab',
      beforeLoadDialog: 'bjui.beforeLoadDialog',
      afterLoadNavtab: 'bjui.afterLoadNavtab',
      afterLoadDialog: 'bjui.afterLoadDialog',
      beforeCloseNavtab: 'bjui.beforeCloseNavtab',
      beforeCloseDialog: 'bjui.beforeCloseDialog',
      afterCloseNavtab: 'bjui.afterCloseNavtab',
      afterCloseDialog: 'bjui.afterCloseDialog'
    },
    pageInfo: {
      pageCurrent: 'pageCurrent',
      pageSize: 'pageSize',
      orderField: 'orderField',
      orderDirection: 'orderDirection'
    },
    ajaxTimeout: 3000,
    alertTimeout: 6000,
    statusCode: {
      ok: 200,
      error: 300,
      timeout: 301
    },
    keys: {
      statusCode: 'statusCode',
      message: 'message'
    },
    ui: {
      showSlidebar: !0,
      clientPaging: !0
    },
    debug: function (a) {
      this.IS_DEBUG && ('undefined' != typeof console ? console.log(a)  : alert(a))
    },
    loginInfo: {
      url: 'login.html',
      title: 'Login',
      width: 420,
      height: 260,
      mask: !0
    },
    loadLogin: function () {
      var b = this.loginInfo;
      a('body').dialog({
        id: 'bjui-login',
        url: b.url,
        title: b.title,
        width: b.width,
        height: b.height,
        mask: b.mask
      })
    },
    init: function (c) {
      var d = a.extend({
      }, c);
      a.extend(b.statusCode, d.statusCode),
      a.extend(b.pageInfo, d.pageInfo),
      a.extend(b.loginInfo, d.loginInfo),
      a.extend(b.ui, d.ui),
      d.JSPATH && (this.JSPATH = d.JSPATH),
      d.PLUGINPATH && (this.PLUGINPATH = d.PLUGINPATH),
      d.ajaxTimeout && (this.ajaxTimeout = d.ajaxTimeout),
      d.alertTimeout && (this.alertTimeout = d.alertTimeout),
      this.IS_DEBUG = d.debug || !1,
      this.initEnv(),
      a.cookie && a.cookie('bjui_theme') || !d.theme || a(this).theme('setTheme', d.theme)
    },
    initEnv: function () {
      a(window).resize(function () {
        b.initLayout(),
        a(this).trigger(b.eventType.resizeGrid)
      }),
      setTimeout(function () {
        b.initLayout(),
        a(document).initui()
      }, 10)
    },
    initLayout: function () {
      var h,
      i,
      j,
      k,
      l,
      m,
      n,
      o,
      p,
      q,
      r,
      s,
      c = a(window).width() - (b.ui.showSlidebar ? a('#bjui-sidebar').width() + 10 : 8) - 0,
      d = a(window).height() - a('#bjui-header').height() - a('#bjui-hnav').outerHeight() - a('#bjui-footer').outerHeight(),
      e = a('#bjui-navtab').find('.tabsPageHeader').height();
      a('#bjui-hnav').height() + a('#bjui-header').outerHeight() + 5,
      a('#bjui-hnav').find('.navbar-collapse').height(),
      a('#bjui-container').height(d),
      a('#bjui-navtab').width(c),
      a('#bjui-leftside, #bjui-sidebar, #bjui-sidebar-s, #bjui-splitBar, #bjui-splitBarProxy').css({
        height: '100%'
      }),
      a('#bjui-navtab .tabsPageContent').height(d - e),
      setTimeout(function () {
        a('#bjui-navtab .tabsPageContent').find('[data-layout-h]').not('.bjui-layout-h').layoutH()
      }, 10),
      h = a('body').data('bjui.navbar.width'),
      i = a('#bjui-header'),
      j = i.find('.bjui-navbar-toggle'),
      k = i.find('.bjui-navbar-logo'),
      l = a('#bjui-navbar-collapse'),
      m = l.find('.bjui-navbar-right'),
      h || (h = {
        logoW: k.outerWidth(),
        navW: m.outerWidth()
      }, a('body').data('bjui.navbar.width', h)),
      h && (a(window).width() - h.logoW < h.navW ? (j.show(), l.addClass('collapse menu'))  : (j.hide(), l.removeClass('collapse menu in'))),
      n = a('body').data('bjui.hnav.width'),
      o = a('body').data('bjui.hnav.cwidth'),
      p = a('#bjui-hnav'),
      q = p.find('.bjui-hnav-toggle'),
      r = a('#bjui-hnav-navbar'),
      s = p.find('.hnav-form'),
      n || (n = {
        barW: r.outerWidth(),
        formW: s.outerWidth()
      }, a('body').data('bjui.hnav.width', n)),
      n && ((o ? o : n.barW) + n.formW > a(window).width() ? (o || (r.addClass('condensed'), a('body').data('bjui.hnav.cwidth', r.outerWidth())), q.show(), r.addClass('collapse menu'), s.hide())  : (o && n.barW + n.formW < a(window).width() && (r.removeClass('condensed'), a('body').removeData('bjui.hnav.cwidth')), r.removeClass('collapse menu in'), s.show(), q.hide()))
    },
    regional: {
    },
    setRegional: function (a, c) {
      b.regional[a] = c
    }
  };
  window.BJUI = b
}(jQuery);
/**
 * B-JUI: bjui-regional.zh-CN.js v1.0
 * @author K'naan (xknaan@163.com)
 * http://git.oschina.net/xknaan/B-JUI/blob/master/BJUI/js/bjui-regional.zh-CN.js
 */
+ function (a) {
  'use strict';
  a(function () {
    BJUI.setRegional('alertmsg', {
      title: {
        error: '错误提示',
        info: '信息提示',
        warn: '警告信息',
        correct: '成功信息',
        confirm: '确认信息'
      },
      btnMsg: {
        ok: '确定',
        yes: '是',
        no: '否',
        cancel: '取消'
      }
    }),
    BJUI.setRegional('dialog', {
      close: '关闭',
      maximize: '最大化',
      restore: '还原',
      minimize: '最小化',
      title: '弹出窗口'
    }),
    BJUI.setRegional('orderby', {
      asc: '升序',
      desc: '降序'
    }),
    BJUI.setRegional('pagination', {
      first: '首页',
      last: '末页',
      prev: '上一页',
      next: '下一页',
      jumpto: '跳转页号',
      jump: '跳转'
    }),
    BJUI.setRegional('progressmsg', '正在努力加载数据，请稍等...'),
    BJUI.setRegional('datepicker', {
      close: '关闭',
      prev: '上月',
      next: '下月',
      clear: '清空',
      ok: '确定',
      dayNames: [
        '日',
        '一',
        '二',
        '三',
        '四',
        '五',
        '六'
      ],
      monthNames: [
        '一月',
        '二月',
        '三月',
        '四月',
        '五月',
        '六月',
        '七月',
        '八月',
        '九月',
        '十月',
        '十一月',
        '十二月'
      ]
    }),
    BJUI.setRegional('navtabCM', {
      refresh: '刷新本标签',
      close: '关闭本标签',
      closeother: '关闭其他标签',
      closeall: '关闭所有标签'
    }),
    BJUI.setRegional('dialogCM', {
      refresh: '刷新本窗口',
      close: '关闭本窗口',
      closeother: '关闭其他窗口',
      closeall: '关闭所有窗口'
    }),
    BJUI.setRegional('upload', {
      upConfirm: '开始上传',
      upPause: '暂停上传',
      upCancel: '取消上传'
    }),
    BJUI.setRegional('statusCode_503', '服务器当前负载过大或者正在维护！'),
    BJUI.setRegional('sessiontimeout', '会话超时，请重新登陆！'),
    BJUI.setRegional('plhmsg', '占位符对应的选择器无有效值！'),
    BJUI.setRegional('nocheckgroup', '未定义选中项的组名[复选框的"data-group"]！'),
    BJUI.setRegional('notchecked', '未选中任何一项！'),
    BJUI.setRegional('selectmsg', '请选择一个选项！'),
    BJUI.setRegional('validatemsg', '提交的表单中 [{0}] 个字段有错误，请更正后再提交！'),
    BJUI.setRegional('uititle', 'B-JUI'),
    BJUI.setRegional('maintab', '我的主页'),
    a.validator.config({
      defaultMsg: '{0}格式不正确',
      loadingMsg: '正在验证...',
      rules: {
        digits: [
          /^\d+$/,
          '请输入整数'
        ],
        number: [
          /^[\-\+]?((([0-9]{1,3})([,][0-9]{3})*)|([0-9]+))?([\.]([0-9]+))?$/,
          '请输入有效的数字'
        ],
        letters: [
          /^[a-z]+$/i,
          '{0}只能输入字母'
        ],
        tel: [
          /^(?:(?:0\d{2,3}[\- ]?[1-9]\d{6,7})|(?:[48]00[\- ]?[1-9]\d{6}))$/,
          '电话格式不正确'
        ],
        mobile: [
          /^1[3-9]\d{9}$/,
          '手机号格式不正确'
        ],
        email: [
          /^[\w\+\-]+(\.[\w\+\-]+)*@[a-z\d\-]+(\.[a-z\d\-]+)*\.([a-z]{2,4})$/i,
          '邮箱格式不正确'
        ],
        qq: [
          /^[1-9]\d{4,}$/,
          'QQ号格式不正确'
        ],
        date: [
          /^\d{4}[\/\-](0?[1-9]|1[012])[\/\-](0?[1-9]|[12][0-9]|3[01])$/,
          '请输入正确的日期，例：yyyy-MM-dd'
        ],
        time: [
          /^(2[0123]|(1|0?)[0-9]){1}:([0-5][0-9]){1}:([0-5][0-9]){1}$/,
          '请输入正确的时间，例：HH:mm:ss'
        ],
        datetime: [
          /^\d{4}[\/\-](0?[1-9]|1[012])[\/\-](0?[1-9]|[12][0-9]|3[01])\s+(2[0123]|(1|0?)[0-9]){1}:([0-5][0-9]){1}:([0-5][0-9]){1}$/,
          '请输入正确的日期时间，例：yyyy-MM-dd HH:mm:ss'
        ],
        ID_card: [
          /^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])((\d{4})|\d{3}[A-Z])$/,
          '请输入正确的身份证号码'
        ],
        url: [
          /^(https?|ftp):\/\/[^\s]+$/i,
          '网址格式不正确'
        ],
        postcode: [
          /^[1-9]\d{5}$/,
          '邮政编码格式不正确'
        ],
        chinese: [
          /^[\u0391-\uFFE5]+$/,
          '请输入中文'
        ],
        username: [
          /^\w{3,12}$/,
          '请输入3-12位数字、字母、下划线'
        ],
        password: [
          /^[0-9a-zA-Z]{6,16}$/,
          '密码由6-16位数字、字母组成'
        ],
        accept: function (a, b) {
          if (!b) return !0;
          var c = b[0];
          return '*' === c || new RegExp('.(?:' + (c || 'png|jpg|jpeg|gif') + ')$', 'i').test(a.value) || this.renderMsg('只接受{1}后缀', c.replace('|', ','))
        }
      }
    }),
    a.validator.config({
      messages: {
        required: '{0}不能为空',
        remote: '{0}已被使用',
        integer: {
          '*': '请输入整数',
          '+': '请输入正整数',
          '+0': '请输入正整数或0',
          '-': '请输入负整数',
          '-0': '请输入负整数或0'
        },
        match: {
          eq: '{0}与{1}不一致',
          neq: '{0}与{1}不能相同',
          lt: '{0}必须小于{1}',
          gt: '{0}必须大于{1}',
          lte: '{0}必须小于或等于{1}',
          gte: '{0}必须大于或等于{1}'
        },
        range: {
          rg: '请输入{1}到{2}的数',
          gte: '请输入大于或等于{1}的数',
          lte: '请输入小于或等于{1}的数'
        },
        checked: {
          eq: '请选择{1}项',
          rg: '请选择{1}到{2}项',
          gte: '请至少选择{1}项',
          lte: '请最多选择{1}项'
        },
        length: {
          eq: '请输入{1}个字符',
          rg: '请输入{1}到{2}个字符',
          gte: '请至少输入{1}个字符',
          lte: '请最多输入{1}个字符',
          eq_2: '',
          rg_2: '',
          gte_2: '',
          lte_2: ''
        }
      }
    })
  })
}(jQuery);
/**
 * B-JUI: bjui-frag.js v1.0
 * @author K'naan (xknaan@163.com)
 * -- Modified from dwz.frag.xml (author:ZhangHuihua@msn.com)
 * http://git.oschina.net/xknaan/B-JUI/blob/master/BJUI/js/bjui-frag.js
 */
+ function () {
  'use strict';
  BJUI.setRegional('alertmsg', {
    title: {
      error: 'Error',
      info: 'Info',
      warn: 'Warning',
      correct: 'Correct',
      confirm: 'Confirm'
    },
    btnMsg: {
      ok: 'OK',
      yes: 'YES',
      no: 'NO',
      cancel: 'Cancel'
    }
  }),
  BJUI.setRegional('dialog', {
    close: 'Close',
    maximize: 'Maximize',
    restore: 'Restore',
    minimize: 'Minimize',
    title: 'Popup window'
  }),
  BJUI.setRegional('orderby', {
    asc: 'Asc',
    desc: 'Desc'
  }),
  BJUI.setRegional('pagination', {
    first: 'First page',
    last: 'Last page',
    prev: 'Prev page',
    next: 'Next page',
    jumpto: 'Jump page number',
    jump: 'Jump'
  }),
  BJUI.setRegional('progressmsg', 'Data loading, please waiting...'),
  BJUI.setRegional('datepicker', {
    close: 'Close',
    prev: 'Prev month',
    next: 'Next month',
    clear: 'Clear',
    ok: 'OK',
    dayNames: [
      'Sun',
      'Mon',
      'Tue',
      'Wed',
      'Thu',
      'Fri',
      'Sat'
    ],
    monthNames: [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec'
    ]
  }),
  BJUI.setRegional('navtabCM', {
    refresh: 'Refresh navtab',
    close: 'Close navtab',
    closeother: 'Close other navtab',
    closeall: 'Close all navtab'
  }),
  BJUI.setRegional('dialogCM', {
    refresh: 'Refresh dialog',
    close: 'Close dialog',
    closeother: 'Close other dialog',
    closeall: 'Close all dialog'
  }),
  BJUI.setRegional('upload', {
    upConfirm: 'Start upload',
    upPause: 'Pause upload',
    upCancel: 'Cancel upload'
  }),
  BJUI.setRegional('statusCode_503', 'The current server load is too large or is down for maintenance!'),
  BJUI.setRegional('sessiontimeout', 'Session timeout, please login!'),
  BJUI.setRegional('plhmsg', 'Placeholder corresponding selector None Valid!'),
  BJUI.setRegional('nocheckgroup', 'Undefined group name selected item [check box "data-group"]!'),
  BJUI.setRegional('notchecked', 'Unchecked any one!'),
  BJUI.setRegional('selectmsg', 'Please select one option!'),
  BJUI.setRegional('validatemsg', 'Submitted form data has [{0}] field an error, please after modified submitting!'),
  BJUI.setRegional('uititle', 'B-JUI'),
  BJUI.setRegional('maintab', 'My home'),
  window.FRAG = {
    dialog: '<div class="bjui-dialog bjui-dialog-container" style="top:150px; left:300px;">    <div class="dialogHeader" onselectstart="return false;" oncopy="return false;" onpaste="return false;" oncut="return false;">        <a class="close" href="#close" title="#close#"><i class="fa fa-times-circle"></i></a>        <a class="maximize" href="#maximize" title="#maximize#"><i class="fa fa-plus-circle"></i></a>        <a class="restore" href="#restore" title="#restore#"><i class="fa fa-history"></i></a>        <a class="minimize" href="#minimize" title="#minimize#"><i class="fa fa-minus-circle"></i></a>        <h1><span><i class="fa fa-th-large"></i></span> <span class="title">#title#</span></h1>    </div>    <div class="dialogContent layoutBox unitBox"></div>    <div class="resizable_h_l" tar="nw"></div>    <div class="resizable_h_r" tar="ne"></div>    <div class="resizable_h_c" tar="n"></div>    <div class="resizable_c_l" tar="w" style="height:100%;"></div>    <div class="resizable_c_r" tar="e" style="height:100%;"></div>    <div class="resizable_f_l" tar="sw"></div>    <div class="resizable_f_r" tar="se"></div>    <div class="resizable_f_c" tar="s"></div></div>',
    dialogProxy: '<div id="bjui-dialogProxy" class="bjui-dialog dialogProxy" style="display:none;">    <div class="dialogHeader">        <a class="close" href="#close" title="#close#"><i class="fa fa-times-circle"></i></a>        <a class="maximize" href="#maximize" title="#maximize#"><i class="fa fa-plus-circle"></i></a>        <a class="minimize" href="#minimize" title="#minimize#"><i class="fa fa-minus-circle"></i></a>        <h1><span><i class="fa fa-th-large"></i></span> <span class="title">#title#</span></h1>    </div>    <div class="dialogContent"></div></div>',
    taskbar: '<div id="bjui-taskbar" style="left:0px; display:none;">    <div class="taskbarContent">        <ul></ul>    </div>    <div class="taskbarLeft taskbarLeftDisabled"><i class="fa fa-angle-double-left"></i></div>    <div class="taskbarRight"><i class="fa fa-angle-double-right"></i></div></div>',
    splitBar: '<div id="bjui-splitBar"></div>',
    splitBarProxy: '<div id="bjui-splitBarProxy"></div>',
    resizable: '<div id="bjui-resizable" class="bjui-resizable"></div>',
    alertBackground: '<div class="bjui-alertBackground"></div>',
    maskBackground: '<div class="bjui-maskBackground bjui-ajax-mask"></div>',
    maskProgress: '<div class="bjui-maskProgress bjui-ajax-mask"><i class="fa fa-cog fa-spin"></i>&nbsp;&nbsp;#msg#<div class="progressBg"><div class="progress"></div></div></div>',
    progressBar_custom: '<div id="bjui-progressBar-custom" class="progressBar"><i class="fa fa-cog fa-spin"></i> <span></span></div>',
    dialogMask: '<div class="bjui-dialogBackground"></div>',
    orderby: '<a href="javascript:;" class="order asc" data-order-direction="asc" title="#asc#"><i class="fa fa-angle-up"></i></a><a href="javascript:;" class="order desc" data-order-direction="desc" title="#desc#"><i class="fa fa-angle-down"></i></a>',
    pagination: '<ul class="pagination">    <li class="j-first">        <a class="first" href="javascript:;"><i class="fa fa-step-backward"></i> #first#</a>        <span class="first"><i class="fa fa-step-backward"></i> #first#</span>    </li>    <li class="j-prev">        <a class="previous" href="javascript:;"><i class="fa fa-backward"></i> #prev#</a>        <span class="previous"><i class="fa fa-backward"></i> #prev#</span>    </li>    #pageNumFrag#    <li class="j-next">        <a class="next" href="javascript:;">#next# <i class="fa fa-forward"></i></a>        <span class="next">#next# <i class="fa fa-forward"></i></span>    </li>    <li class="j-last">        <a class="last" href="javascript:;">#last# <i class="fa fa-step-forward"></i></a>        <span class="last">#last# <i class="fa fa-step-forward"></i></span>    </li>    <li class="jumpto"><span class="p-input"><input class="form-control input-sm-pages" type="text" size="2.6" value="#pageCurrent#" title="#jumpto#"></span><a class="goto" href="javascript:;" title="#jump#"><i class="fa fa-chevron-right"></i></a></li></ul>',
    alertBoxFrag: '<div id="bjui-alertMsgBox" class="bjui-alert"><div class="alertContent"><div class="#type#"><div class="alertInner"><h1><i class="fa #fa#"></i>#title#</h1><div class="msg">#message#</div></div><div class="toolBar"><ul>#btnFragment#</ul></div></div></div></div>',
    alertBtnFrag: '<li><button class="btn btn-#class#" rel="#callback#" type="button">#btnMsg#</button></li>',
    calendarFrag: '<div id="bjui-calendar">    <div class="main">        <a class="close" href="javascript:;" title="#close#"><i class="fa fa-times-circle"></i></a>        <div class="head">            <table width="100%" border="0" cellpadding="0" cellspacing="2">                <tr>                    <td width="20"><a class="prev" href="javascript:;" title="#prev#"><i class="fa fa-arrow-left"></i></a></td>                    <td><select name="year"></select></td>                    <td><select name="month"></select></td>                    <td width="20"><a class="next" href="javascript:;" title="#next#"><i class="fa fa-arrow-right"></i></a></td>                </tr>            </table>        </div>        <div class="body">            <dl class="dayNames"><dt>7</dt><dt>1</dt><dt>2</dt><dt>3</dt><dt>4</dt><dt>5</dt><dt>6</dt></dl>            <dl class="days"><!-- date list --></dl>            <div style="clear:both;height:0;line-height:0"></div>        </div>        <div class="foot">            <table class="time">                <tr>                    <td>                        <input type="text" class="hh" maxlength="2" data-type="hh" data-start="0" data-end="23">:<input                         type="text" class="mm" maxlength="2" data-type="mm" data-start="0" data-end="59">:<input                         type="text" class="ss" maxlength="2" data-type="ss" data-start="0" data-end="59">                    </td>                    <td><ul><li class="up" data-add="1">&and;</li><li class="down">&or;</li></ul></td>                </tr>            </table>            <button type="button" class="clearBtn btn btn-orange">#clear#</button>            <button type="button" class="okBtn btn btn-default">#ok#</button>        </div>        <div class="tm">            <ul class="hh">                <li>0</li>                <li>1</li>                <li>2</li>                <li>3</li>                <li>4</li>                <li>5</li>                <li>6</li>                <li>7</li>                <li>8</li>                <li>9</li>                <li>10</li>                <li>11</li>                <li>12</li>                <li>13</li>                <li>14</li>                <li>15</li>                <li>16</li>                <li>17</li>                <li>18</li>                <li>19</li>                <li>20</li>                <li>21</li>                <li>22</li>                <li>23</li>            </ul>            <ul class="mm">                <li>0</li>                <li>5</li>                <li>10</li>                <li>15</li>                <li>20</li>                <li>25</li>                <li>30</li>                <li>35</li>                <li>40</li>                <li>45</li>                <li>50</li>                <li>55</li>            </ul>            <ul class="ss">                <li>0</li>                <li>10</li>                <li>20</li>                <li>30</li>                <li>40</li>                <li>50</li>            </ul>        </div>    </div></div>',
    spinnerBtn: '<ul class="bjui-spinner"><li class="up" data-add="1">&and;</li><li class="down">&or;</li></ul>',
    lookupBtn: '<a class="bjui-lookup" href="javascript:;" data-toggle="lookupbtn"><i class="fa fa-search"></i></a>',
    dateBtn: '<a class="bjui-lookup" href="javascript:;" data-toggle="datepickerbtn"><i class="fa fa-calendar"></i></a>',
    navtabCM: '<ul id="bjui-navtabCM">    <li rel="reload">#refresh#</li>    <li rel="closeCurrent">#close#</li>    <li rel="closeOther">#closeother#</li>    <li rel="closeAll">#closeall#</li></ul>',
    dialogCM: '<ul id="bjui-dialogCM">    <li rel="reload">#refresh#</li>    <li rel="closeCurrent">#close#</li>    <li rel="closeOther">#closeother#</li>    <li rel="closeAll">#closeall#</li></ul>',
    externalFrag: '<iframe src="{url}" data-layout-h="0" style="width:100%;height:{height};" frameborder="no" border="0" marginwidth="0" marginheight="0"></iframe>',
    uploadTemp: '<div id="{fileId}" class="item">    <div class="info">        <span class="up_filename">{fileName}</span><span class="up_confirm" title="#upConfirm#"><i class="fa fa-play-circle-o"></i></span><span class="up_pause" title="#upPause#"><span class="glyphicon glyphicon-pause"></span></span><span class="up_cancel" title="#upCancel#"><i class="fa fa-times-circle-o"></i></span>    </div>    <div class="preview"><span class="img"></span></div>    <div class="progress"><div class="bar"></div></div>    <span class="percent">{percent}</span>    <span class="filesize"><span class="uploadedsize">{uploadedSize}</span>/<span class="totalsize">{fileSize}</span></span></div>',
    uploadFrag: '<input class="bjui-upload-select-file" style="display:none;" type="file" name="fileselect[]" #multi# accept="#accept#"><a href="javascript:void(0)" class="btn btn-default bjui-upload-select">#btnTxt#</a><div class="queue"></div>',
    statusCode_503: 'HTTP status 503, #statusCode_503#',
    sessionTimout: '#sessiontimeout#',
    alertPlhMsg: '#plhmsg#',
    alertNoCheckGroup: '#nocheckgroup#',
    alertNotChecked: '#notchecked#',
    alertSelectMsg: '#selectmsg#',
    validateErrorMsg: '#validatemsg#',
    uiTitle: '#uititle#',
    mainTabTitle: '#mynavtab#'
  }
}(jQuery);
/**
 * B-JUI: bjui-extends.js v1.0
 * @author K'naan (xknaan@163.com)
 * -- Modified from dwz.core.js (author:ZhangHuihua@msn.com)
 * http://git.oschina.net/xknaan/B-JUI/blob/master/BJUI/js/bjui-extends.js
 */
+ function (a) {
  'use strict';
  a.fn.extend({
    ajaxUrl: function (b) {
      var c = a(this);
      c.trigger(BJUI.eventType.beforeAjaxLoad),
      b.loadingmask && c.trigger(BJUI.eventType.ajaxStatus),
      a.ajax({
        type: b.type || 'GET',
        url: b.url,
        data: b.data || {
        },
        cache: !1,
        dataType: 'html',
        timeout: BJUI.ajaxTimeout,
        success: function (d) {
          var e = d.toJson(),
          f = c.find('> .bjui-ajax-mask');
          e[BJUI.keys.statusCode] ? (e[BJUI.keys.statusCode] == BJUI.statusCode.error ? e[BJUI.keys.message] && c.alertmsg('error', e[BJUI.keys.message])  : e[BJUI.keys.statusCode] == BJUI.statusCode.timeout && (f.length || (c.closest('.bjui-dialog').length && c.dialog('closeCurrent'), c.closest('.navtab-panel').length && c.navtab('closeCurrent')), a('body').alertmsg('error', e[BJUI.keys.message] || BJUI.regional.sessiontimeout, {
            okCall: function () {
              BJUI.loadLogin()
            }
          })), f.fadeOut('normal', function () {
            a(this).remove()
          }))  : (c.empty().html(d).append(f).initui(), a.isFunction(b.callback) && b.callback(d))
        },
        error: function (a, b, d) {
          c.bjuiajax('ajaxError', a, b, d),
          c.closest('.bjui-layout').length || (c.closest('.navtab-panel').length ? c.navtab('closeCurrentTab')  : c.dialog('closeCurrent'))
        },
        statusCode: {
          503: function (a, b, d) {
            c.alertmsg('error', FRAG.statusCode_503.replace('#statusCode_503#', BJUI.regional.statusCode_503) || d)
          }
        }
      })
    },
    loadUrl: function (b, c, d) {
      a(this).ajaxUrl({
        url: b,
        data: c,
        callback: d
      })
    },
    doAjax: function (b) {
      var d,
      e,
      c = a(this);
      return b.url ? b.callback ? (b.callback = b.callback.toFunc(), b.loadingmask && (d = c.getPageTarget(), d.trigger(BJUI.eventType.ajaxStatus), e = d.find('> .bjui-ajax-mask')), a.ajax({
        type: b.type || 'POST',
        url: b.url,
        data: b.data || {
        },
        files: b.files || null,
        iframe: b.ifrane || !1,
        contentType: b.contentType || 'application/x-www-form-urlencoded',
        processData: b.processData || !0,
        dataType: b.dataType || 'json',
        timeout: BJUI.ajaxTimeout,
        cache: b.cache || !1,
        success: function (c) {
          e ? b.callback ? a.when(b.callback(c)).done(function () {
            d.trigger('bjui.ajaxStop')
          })  : d.trigger('bjui.ajaxStop')  : b.callback(c)
        },
        error: b.error || function (a, b, d) {
          c.bjuiajax('ajaxError', a, b, d)
        }
      }), void 0)  : (BJUI.debug('The ajax callback is undefined!'), void 0)  : (BJUI.debug('The ajax url is undefined!'), void 0)
    },
    getPageTarget: function () {
      var b;
      return b = this.closest('.bjui-layout').length ? this.closest('.bjui-layout')  : this.closest('.navtab-panel').length ? a.CurrentNavtab : a.CurrentDialog
    },
    layoutH: function (b) {
      return this.each(function () {
        var g,
        h,
        i,
        j,
        k,
        l,
        d = a(this),
        e = null,
        f = null;
        b && b.length || (b = d.closest('.bjui-layout')),
        b && b.length || (b = d.closest('div.layoutBox')),
        g = b.height() || parseInt(b.css('height')),
        h = d.data('bjuiLayH') || parseInt(d.data('layoutH')) || 0,
        i = 0,
        h ? i = g - h > 50 ? g - h : 50 : (e = d.closest('div.bjui-layout'), e && e.length || (e = d.closest('div.unitBox')), e.find('.bjui-layout').find('[data-layout-fixed]').hide(), e.find('.bjui-layout').find('.bjui-tablefixed').hide(), j = 0, k = 0, l = 0, e.find('[data-layout-fixed]:visible').each(function () {
          j += a(this).outerHeight() || 0
        }), f = e.find('.bjui-tablefixed:visible'), !f.hasClass('fixedH') && f.length && ((f[0].scrollWidth > f[0].clientWidth || f[0].scrollWidth > f[0].offsetWidth) && (k = f[0].offsetHeight - f[0].clientHeight), l = f.find('.fixedtableHeader').outerHeight() || 0), e.find('.bjui-layout').find('[data-layout-fixed]').show(), e.find('.bjui-layout').find('.bjui-tablefixed').show(), i = g - j - k - l, d.data('bjuiLayH', j + k + l)),
        d.isTag('table') && !d.parent('[data-layout-h]').length ? d.removeAttr('data-layout-h').wrap('<div data-bjui-lay-h="' + d.data('bjuiLayH') + '" data-layout-h="' + h + '" style="overflow:auto;width:100%;height:' + i + 'px"></div>')  : d.animate({
          height: i
        }, 'fast', function () {
          d.css('overflow', 'auto'),
          d.find('.bjui-layout').find('[data-layout-h]').layoutH()
        })
      })
    },
    getMaxIndexObj: function (b) {
      var c = 0,
      d = 0;
      return b.each(function (b) {
        var e = parseInt(a(this).css('zIndex')) || 1;
        e > c && (c = e, d = b)
      }),
      b.eq(d)
    },
    serializeJson: function () {
      var b = {
      },
      c = this.serializeArray();
      return a.each(c, function () {
        void 0 !== b[this.name] ? (b[this.name].push || (b[this.name] = [
          b[this.name]
        ]), b[this.name].push(this.value || ''))  : b[this.name] = this.value || ''
      }),
      b
    },
    isTag: function (b) {
      return b ? a(this) [0].tagName.toLowerCase() == b ? !0 : !1 : !1
    },
    isBind: function (b) {
      var c = a(this).data('events');
      return c && b && c[b]
    },
    log: function (a) {
      return this.each(function () {
        console && console.log('%s: %o', a, this)
      })
    }
  }),
  a.extend(String.prototype, {
    isPositiveInteger: function () {
      return new RegExp(/^[1-9]\d*$/).test(this)
    },
    isInteger: function () {
      return new RegExp(/^\d+$/).test(this)
    },
    isNumber: function () {
      return new RegExp(/^-?(?:\d+|\d{1,3}(?:,\d{3})+)(?:\.\d+)?$/).test(this)
    },
    trim: function () {
      return this.replace(/(^\s*)|(\s*$)|\r|\n/g, '')
    },
    startsWith: function (a) {
      return 0 === this.indexOf(a)
    },
    endsWith: function (a) {
      var b = this.length - a.length;
      return b >= 0 && this.lastIndexOf(a) === b
    },
    replaceSuffix: function (a) {
      return this.replace(/\[[0-9]+\]/, '[' + a + ']').replace('#index#', a)
    },
    replaceSuffix2: function (a) {
      return this.replace(/\-(i)([0-9]+)$/, '-i' + a).replace('#index#', a)
    },
    trans: function () {
      return this.replace(/&lt;/g, '<').replace(/&gt;/g, '>').replace(/&quot;/g, '"')
    },
    encodeTXT: function () {
      return this.replaceAll('&', '&amp;').replaceAll('<', '&lt;').replaceAll('>', '&gt;').replaceAll(' ', '&nbsp;')
    },
    replaceAll: function (a, b) {
      return this.replace(new RegExp(a, 'gm'), b)
    },
    replacePlh: function (b) {
      return b = b || a(document),
      this.replace(/{\/?[^}]*}/g, function (a) {
        var c = b.find(a.replace(/[{}]+/g, ''));
        return c && c.val() ? c.val()  : a
      })
    },
    replaceMsg: function (a) {
      return this.replace(new RegExp('({.*})', 'g'), a)
    },
    replaceTm: function (a) {
      return a ? this.replace(RegExp('({[A-Za-z_]+[A-Za-z0-9_-]*})', 'g'), function (b) {
        return a[b.replace(/[{}]+/g, '')]
      })  : this
    },
    replaceTmById: function (b) {
      var c = b || a(document);
      return this.replace(RegExp('({[A-Za-z_]+[A-Za-z0-9_-]*})', 'g'), function (a) {
        var b = c.find('#' + a.replace(/[{}]+/g, ''));
        return b.val() ? b.val()  : a
      })
    },
    isFinishedTm: function () {
      return !new RegExp('{.*}').test(this)
    },
    skipChar: function (a) {
      return this && 0 !== this.length ? this.charAt(0) === a ? this.substring(1).skipChar(a)  : this : ''
    },
    isValidPwd: function () {
      return new RegExp(/^([_]|[a-zA-Z0-9]){6,32}$/).test(this)
    },
    isValidMail: function () {
      return new RegExp(/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/).test(this.trim())
    },
    isSpaces: function () {
      var a,
      b;
      for (a = 0; a < this.length; a += 1) if (b = this.charAt(a), ' ' != b && '\n' != b && ' ' != b && '\r' != b) return !1;
      return !0
    },
    isPhone: function () {
      return new RegExp(/(^([0-9]{3,4}[-])?\d{3,8}(-\d{1,6})?$)|(^\([0-9]{3,4}\)\d{3,8}(\(\d{1,6}\))?$)|(^\d{3,8}$)/).test(this)
    },
    isUrl: function () {
      return new RegExp(/^[a-zA-z]+:\/\/([a-zA-Z0-9\-\.]+)([-\w .\/?%&=:]*)$/).test(this)
    },
    isExternalUrl: function () {
      return this.isUrl() && - 1 == this.indexOf('://' + document.domain)
    },
    toBool: function () {
      return 'true' === this.toLowerCase() ? !0 : !1
    },
    toJson: function () {
      var a = this;
      try {
        return 'object' == typeof a && (a = a.toString()),
        a.trim().match('^{(.+:.+,*){1,}}$') ? JSON.parse(this)  : this
      } catch (b) {
        return this
      }
    },
    toFunc: function () {
      var a,
      b,
      c;
      if (!this || 0 == this.length) return void 0;
      if (this.startsWith('function')) return new Function('return ' + this) ();
      for (a = this.split('.'), b = window, c = 0; c < a.length; c++) b = b[a[c]];
      return 'function' == typeof b ? b : void 0
    },
    setUrlParam: function (a, b) {
      var g,
      e,
      f,
      h,
      c = '',
      d = this;
      if ( - 1 == d.indexOf('?')) return d + '?' + a + '=' + b;
      if (c = d.substr(d.indexOf('?') + 1), e = '', f = '', h = '0', - 1 != c.indexOf('&')) {
        g = c.split('&');
        for (i in g) g[i].split('=') [0] == a ? (f = b, h = '1')  : f = g[i].split('=') [1],
        e = e + g[i].split('=') [0] + '=' + f + '&';
        e = e.substr(0, e.length - 1),
        '0' == h && e == c && (e = e + '&' + a + '=' + b)
      } else - 1 != c.indexOf('=') ? (g = c.split('='), g[0] == a ? (f = b, h = '1')  : f = g[1], e = g[0] + '=' + f, '0' == h && e == c && (e = e + '&' + a + '=' + b))  : e = a + '=' + b;
      return d.substr(0, d.indexOf('?')) + '?' + e
    }
  }),
  a.extend(Function.prototype, {
    toFunc: function () {
      return this
    }
  })
}(jQuery);
/**
 * B-JUI: bjui-basedrag.js v1.0
 * @author K'naan (xknaan@163.com)
 * -- Modified from dwz.drag.js (author:Roger Wu)
 * http://git.oschina.net/xknaan/B-JUI/blob/master/BJUI/js/bjui-basedrag.js
 */
+ function (a) {
  'use strict';
  function c(c) {
    var d = arguments,
    e = c;
    return this.each(function () {
      var f = a(this),
      g = a.extend({
      }, f.data(), 'object' == typeof c && c),
      h = f.data('bjui.basedrag');
      h || f.data('bjui.basedrag', h = new b(this, g)),
      'string' == typeof e && a.isFunction(h[e]) ? ([].shift.apply(d), d ? h[e].apply(h, d)  : h[e]())  : h.init()
    })
  }
  var d,
  b = function (b, c) {
    this.$element = a(b),
    this.options = c
  };
  b.prototype.init = function () {
    var a = this;
    this.options.$obj = this.$element,
    this.options.obj && (this.options.$obj = this.options.obj),
    this.options.event ? this.start(this.options.event)  : this.$element.find(this.options.selector).bind('mousedown', function (b) {
      a.start.apply(a, [
        b
      ])
    })
  },
  b.prototype.start = function () {
    document.onselectstart = function () {
      return !1
    };
    var c = this;
    this.options.oleft = parseInt(this.$element.css('left')) || 0,
    this.options.otop = parseInt(this.$element.css('top')) || 0,
    a(document).bind('mouseup.bjui.basedrag', function (a) {
      c.stop.apply(c, [
        a
      ])
    }).bind('mousemove.bjui.basedrag', function (a) {
      c.drag.apply(c, [
        a
      ])
    })
  },
  b.prototype.drag = function (b) {
    var c,
    d,
    e,
    f;
    return b || (b = window.event),
    c = this.options,
    d = c.oleft + (b.pageX || b.clientX) - c.event.pageX,
    e = c.otop + (b.pageY || b.clientY) - c.event.pageY,
    1 > e && (e = 0),
    'horizontal' == c.move ? c.minW && d >= parseInt(this.options.$obj.css('left')) + c.minW && c.maxW && d <= parseInt(this.options.$obj.css('left')) + c.maxW ? this.$element.css('left', d)  : c.scop && c.relObj && (d - parseInt(c.relObj.css('left')) > c.cellMinW ? this.$element.css('left', d)  : this.$element.css('left', d))  : 'vertical' == c.move ? this.$element.css('top', e)  : (f = c.selector ? this.options.$obj.find(c.selector)  : this.options.$obj, d >= 2 * - f.outerWidth() / 3 && e >= 0 && d + f.outerWidth() / 3 < a(window).width() && e + f.outerHeight() < a(window).height() && this.$element.css({
      left: d,
      top: e
    })),
    c.drag && c.drag.apply(this.$element, [
      this.$element,
      b
    ]),
    this.preventEvent(b)
  },
  b.prototype.stop = function (b) {
    return a(document).unbind('mousemove.bjui.basedrag').unbind('mouseup.bjui.basedrag'),
    this.options.stop && this.options.stop.apply(this.$element, [
      this.$element,
      b
    ]),
    this.options.event && this.destroy(),
    document.onselectstart = function () {
      return !0
    },
    this.preventEvent(b)
  },
  b.prototype.preventEvent = function (a) {
    return a.stopPropagation && a.stopPropagation(),
    a.preventDefault && a.preventDefault(),
    !1
  },
  b.prototype.destroy = function () {
    this.$element.removeData('bjui.basedrag').unbind('mousedown')
  },
  d = a.fn.basedrag,
  a.fn.basedrag = c,
  a.fn.basedrag.Constructor = b,
  a.fn.basedrag.noConflict = function () {
    return a.fn.basedrag = d,
    this
  }
}(jQuery);
/**
 * B-JUI: bjui-slidebar.js v1.0
 * @author K'naan (xknaan@163.com)
 * -- Modified from dwz.barDrag.js (author:Roger Wu)
 * http://git.oschina.net/xknaan/B-JUI/blob/master/BJUI/js/bjui-slidebar.js
 */
+ function (a) {
  'use strict';
  function c(c) {
    var d = arguments,
    e = c;
    return this.each(function () {
      var f = a(this),
      g = a.extend({
      }, f.data(), 'object' == typeof c && c),
      h = f.data('bjui.slidebar');
      h || f.data('bjui.slidebar', h = new b(this, g)),
      'string' == typeof e && a.isFunction(h[e]) ? ([].shift.apply(d), d ? h[e].apply(h, d)  : h[e]())  : h.init()
    })
  }
  var b,
  d;
  a(function () {
    a('#bjui-leftside').after('<!-- Adjust the width of Left slide -->').after(FRAG.splitBar).after(FRAG.splitBarProxy)
  }),
  b = function (b, c) {
    this.$element = a(b),
    this.$bar = this.$element.find('#bjui-sidebar'),
    this.$sbar = this.$element.find('#bjui-sidebar-s'),
    this.$lock = this.$bar.find('> .toggleCollapse > .lock'),
    this.$navtab = a('#bjui-navtab'),
    this.$collapse = this.$sbar.find('.collapse'),
    this.$split = a('#bjui-splitBar'),
    this.$split2 = a('#bjui-splitBarProxy'),
    this.isfloat = !1,
    this.options = c
  },
  b.prototype.lock = function () {
    var b = this,
    c = b.$bar.outerWidth() + 6,
    d = b.$navtab.outerWidth() - c + 6;
    b.faLock(),
    b.hoverLock(),
    b.$sbar.animate({
      left: - 10
    }, 20),
    b.$bar.removeClass('shadown'),
    b.isfloat = !1,
    b.$navtab.animate({
      left: c,
      width: d
    }, 500, function () {
      a(window).trigger(BJUI.eventType.resizeGrid)
    }),
    b.$split.show()
  },
  b.prototype.unlock = function () {
    var b = this,
    c = 0 - b.$bar.outerWidth() - 2,
    d = (BJUI.ui.showSlidebar ? b.$bar.outerWidth()  : 0) + b.$navtab.outerWidth();
    b.faUnLock(),
    b.hoverUnLock(),
    b.$navtab.animate({
      left: 6,
      width: d
    }, 400),
    b.$bar.animate({
      left: c
    }, 500, function () {
      b.$sbar.animate({
        left: 0
      }, 200),
      b.$split.hide(),
      a(window).trigger(BJUI.eventType.resizeGrid)
    }),
    b.isfloat = !1
  },
  b.prototype.float = function () {
    var a = this;
    a.$sbar.animate({
      left: - 10
    }, 200),
    a.$bar.addClass('shadown').animate({
      left: 2
    }, 500),
    a.isfloat = !0
  },
  b.prototype.hideFloat = function () {
    var a = this,
    b = 0 - a.$bar.outerWidth() - 2;
    a.$bar.animate({
      left: b
    }, 500, function () {
      a.$sbar.animate({
        left: 0
      }, 100)
    }),
    a.isfloat = !1
  },
  b.prototype.hoverLock = function () {
    var a = this;
    a.$lock.hover(function () {
      a.tipUnLock(),
      a.faUnLock()
    }, function () {
      a.tipLock(),
      a.faLock()
    })
  },
  b.prototype.hoverUnLock = function () {
    var a = this;
    a.$lock.hover(function () {
      a.tipLock(),
      a.faLock()
    }, function () {
      a.tipUnLock(),
      a.faUnLock()
    })
  },
  b.prototype.tipLock = function () {
    this.$lock.tooltip('destroy').tooltip({
      title: '保持锁定，始终显示导航栏',
      container: 'body'
    })
  },
  b.prototype.tipUnLock = function () {
    this.$lock.tooltip('destroy').tooltip({
      title: '解除锁定，自动隐藏导航栏',
      container: 'body'
    })
  },
  b.prototype.faLock = function () {
    this.$lock.find('> i').attr('class', 'fa fa-lock')
  },
  b.prototype.faUnLock = function () {
    this.$lock.find('> i').attr('class', 'fa fa-unlock-alt')
  },
  b.prototype.init = function () {
    var c = this;
    BJUI.ui.showSlidebar ? c.hoverLock()  : c.unlock(),
    this.$lock.off('click.bjui.slidebar').on('click.bjui.slidebar', function () {
      c.isfloat ? c.lock()  : c.unlock(),
      BJUI.ui.showSlidebar = !BJUI.ui.showSlidebar
    }),
    this.$collapse.hover(function () {
      c.float(),
      c.$navtab.click(function () {
        c.isfloat && c.hideFloat()
      })
    }),
    this.$split.mousedown(function (b) {
      c.$split2.each(function () {
        var d = a(this);
        return setTimeout(function () {
          d.show()
        }, 100),
        d.css({
          visibility: 'visible',
          left: c.$split.css('left')
        }).basedrag(a.extend(c.options, {
          obj: c.$bar,
          move: 'horizontal',
          event: b,
          stop: function () {
            var b,
            d,
            e,
            f;
            a(this).css('visibility', 'hidden'),
            b = parseInt(a(this).css('left')) - parseInt(c.$split.css('left')),
            d = c.$bar.outerWidth() + b,
            e = parseInt(c.$navtab.css('left')) + b,
            f = c.$navtab.outerWidth() - b,
            c.$bar.css('width', d),
            c.$split.css('left', a(this).css('left')),
            c.$navtab.css({
              left: e,
              width: f
            })
          }
        })),
        !1
      })
    }),
    b.prototype.initHnav = function () {
      var h,
      b = this,
      c = b.$element.html(),
      d = b.$element.parent(),
      e = d.find('> ul.ztree'),
      f = a('#bjui-accordionmenu'),
      g = f.find('> .panel:first-child');
      e.length && (f.empty(), e.each(function (b) {
        var j,
        k,
        d = a(this).clone().attr('id', 'bjui-sidebar-tree' + b),
        e = g.clone();
        e.find('.panel-heading'),
        j = e.find('.panel-collapse').attr('id', 'bjui-accordionmenu-hnav-' + b).find('> .panel-body').empty(),
        k = e.find('.panel-heading > h4 > a').attr('href', '#bjui-accordionmenu-hnav-' + b).html(c),
        0 == b && (h = k),
        k.find('> i').attr('class', 'fa fa-caret-square-o-down'),
        d.removeAttr('data-noinit').css('display', 'block').appendTo(j),
        f.append(e)
      }), a('#bjui-sidebar').initui(), d.addClass('active').siblings().removeClass('active'), h && h.hasClass('collapsed') && h.trigger('click'))
    }
  },
  d = a.fn.slidebar,
  a.fn.slidebar = c,
  a.fn.slidebar.Constructor = b,
  a.fn.basedrag.noConflict = function () {
    return a.fn.slidebar = d,
    this
  },
  a(document).one(BJUI.eventType.afterInitUI, function () {
    a('#bjui-leftside').slidebar({
      minW: 150,
      maxW: 700
    })
  }),
  a(document).on('click.bjui.slidebar.data-api', '[data-toggle="slidebar"]', function (b) {
    c.call(a(this), 'initHnav'),
    b.preventDefault()
  })
}(jQuery);
/**
 * B-JUI: bjui-contextmenu.js v1.0
 * @author K'naan (xknaan@163.com)
 * -- Modified from dwz.contextmenu.js (author:ZhangHuihua@msn.com)
 * http://git.oschina.net/xknaan/B-JUI/blob/master/BJUI/js/bjui-contextmenu.js
 */
+ function (a) {
  'use strict';
  function f(b) {
    var c = arguments,
    d = b;
    return this.each(function () {
      var f = a(this),
      g = a.extend({
      }, e.DEFAULTS, f.data(), 'object' == typeof b && b),
      h = f.data('bjui.contextmenu');
      h || f.data('bjui.contextmenu', h = new e(this, g)),
      'string' == typeof d && a.isFunction(h[d]) ? ([].shift.apply(c), c ? h[d].apply(h, c)  : h[d]())  : h.init()
    })
  }
  var b,
  c,
  d,
  e,
  g;
  a(function () {
    var e = function () {
      b = a('<div id="bjui-contextmenu"></div>').hide(),
      c = a('<div id="bjui-contextmenuShadow"></div>').hide(),
      d = [
      ],
      a('body').append('<!-- contextmenu -->').append(b).append(c)
    };
    e()
  }),
  e = function (b, c) {
    this.$element = a(b),
    this.options = c
  },
  e.DEFAULTS = {
    id: void 0,
    shadow: !0,
    bindings: {
    },
    ctrSub: null
  },
  e.prototype.init = function () {
    var c,
    a = this,
    b = this.options;
    b.id && (d.push({
      id: b.id,
      shadow: b.shadow,
      bindings: b.bindings || {
      },
      ctrSub: b.ctrSub
    }), c = d.length - 1, this.$element.on('contextmenu', function (d) {
      return a.display(c, this, d, b),
      !1
    }))
  },
  e.prototype.display = function (e, f, g) {
    var m,
    n,
    i = this,
    j = d[e],
    k = BJUI.regional[j.id],
    l = FRAG[j.id];
    a.each(k, function (a) {
      l = l.replace('#' + a + '#', k[a])
    }),
    b.html(l),
    a.each(j.bindings, function (c, d) {
      a('[rel="' + c + '"]', b).on('click', function () {
        i.hide(),
        d(a(f), a('#bjui-' + j.id))
      })
    }),
    m = g.pageX,
    n = g.pageY,
    a(window).width() < m + b.width() && (m -= b.width()),
    a(window).height() < n + b.height() && (n -= b.height()),
    b.css({
      left: m,
      top: n
    }).show(),
    j.shadow && c.css({
      width: b.width(),
      height: b.height(),
      left: m + 3,
      top: n + 3
    }).show(),
    a(document).one('click', i.hide),
    a.isFunction(j.ctrSub) && j.ctrSub(a(f), a('#bjui-' + j.id))
  },
  e.prototype.hide = function () {
    b.hide(),
    c.hide()
  },
  e.prototype.show = function (a) {
    var b = this;
    a.items && a.items.length && b.$element.on('contextmenu', function (c) {
      return b.custom(a.items, c),
      !1
    })
  },
  e.prototype.custom = function (d, e) {
    var f,
    g,
    i,
    h,
    j,
    k;
    b.empty().html('<ul></ul>'),
    f = this,
    g = f.options,
    h = b.find('> ul'),
    a.each(d, function (b, c) {
      'diver' == c.title ? i = a('<li class="diver"></li>')  : (i = a('<li>' + c.title + '</li>'), c.func && i.on('click', function () {
        f.hide(),
        c.func(f.$element, i)
      })),
      i.appendTo(h)
    }),
    j = e.pageX,
    k = e.pageY,
    a(window).width() < j + b.width() && (j -= b.width()),
    a(window).height() < k + b.height() && (k -= b.height()),
    b.css({
      left: j,
      top: k
    }).show(),
    g.shadow && c.css({
      width: b.width(),
      height: b.height(),
      left: j + 3,
      top: k + 3
    }).show(),
    a(document).one('click', f.hide)
  },
  g = a.fn.contextmenu,
  a.fn.contextmenu = f,
  a.fn.contextmenu.Constructor = e,
  a.fn.contextmenu.noConflict = function () {
    return a.fn.contextmenu = g,
    this
  }
}(jQuery);
/**
 * B-JUI: bjui-navtab.js v1.0
 * @author K'naan (xknaan@163.com)
 * -- Modified from dwz.navTab.js (author:ZhangHuihua@msn.com)
 * http://git.oschina.net/xknaan/B-JUI/blob/master/BJUI/js/bjui-navtab.js
 */
+ function (a) {
  'use strict';
  function o(b) {
    var c = arguments,
    d = b;
    return this.each(function () {
      var e = a(this),
      f = a.extend({
      }, n.DEFAULTS, e.data(), 'object' == typeof b && b),
      g = e.data('bjui.navtab');
      g ? f.fresh && e.data('bjui.navtab', g = new n(this, f))  : e.data('bjui.navtab', g = new n(this, f)),
      'string' == typeof d && a.isFunction(g[d]) ? ([].shift.apply(c), c ? g[d].apply(g, c)  : g[d]())  : g.openTab()
    })
  }
  var b,
  c,
  d,
  e,
  f,
  g,
  h,
  i,
  j,
  k,
  l,
  m,
  n,
  p;
  a(function () {
    var c = function () {
      b = 1,
      e = a('#bjui-navtab'),
      f = e.find('.navtab-tab'),
      g = e.find('.navtab-panel'),
      h = e.find('.tabsLeft'),
      i = e.find('.tabsRight'),
      j = e.find('.tabsMore'),
      k = e.find('.tabsMoreList'),
      l = f.find('li.main'),
      m = k.find('li:first'),
      h.click(function () {
        a(this).navtab('scrollPrev')
      }),
      i.click(function () {
        a(this).navtab('scrollNext')
      }),
      j.click(function () {
        k.show()
      }),
      a(document).on('click.bjui.navtab.switchtab', function (b) {
        var c = 'I' == b.target.tagName ? a(b.target).parent()  : a(b.target);
        j[0] != c[0] && k.hide()
      }),
      l.navtab('contextmenu', l).click(function () {
        a(this).navtab('switchTab', 'main')
      }).find('> a').html(function (a, b) {
        return b.replace('#maintab#', BJUI.regional.maintab)
      }),
      l.attr('data-url') && a(document).one(BJUI.eventType.initUI, function () {
        l.navtab({
          id: 'main',
          url: l.data('url'),
          fresh: !0
        })
      }),
      m.click(function () {
        a(this).hasClass('active') ? k.hide()  : a(this).navtab('switchTab', 'main')
      }).find('> a').html(function (a, b) {
        return b.replace('#maintab#', BJUI.regional.maintab)
      })
    };
    c()
  }),
  n = function (b, c) {
    this.$element = a(b),
    this.options = c,
    this.tools = this.TOOLS()
  },
  n.DEFAULTS = {
    id: void 0,
    title: 'New tab',
    url: void 0,
    type: 'GET',
    data: {
    },
    loadingmask: !0,
    fresh: !1,
    onLoad: null,
    beforeClose: null,
    onClose: null
  },
  n.prototype.TOOLS = function () {
    var j = this,
    l = {
      getDefaults: function () {
        return n.DEFAULTS
      },
      getTabs: function () {
        return f.find('> li')
      },
      getPanels: function () {
        return g.find('> div')
      },
      getMoreLi: function () {
        return k.find('> li')
      },
      getTab: function (a) {
        var b = this.indexTabId(a);
        return b >= 0 ? this.getTabs().eq(b)  : void 0
      },
      getPanel: function (a) {
        var b = this.indexTabId(a);
        return b >= 0 ? this.getPanels().eq(b)  : void 0
      },
      getTabsW: function (a, b) {
        return this.tabsW(this.getTabs().slice(a, b))
      },
      tabsW: function (b) {
        var c = 0;
        return b.each(function () {
          c += a(this).outerWidth(!0)
        }),
        c
      },
      indexTabId: function (b) {
        if (!b) return - 1;
        if ('main' == b) return 0;
        var c = - 1;
        return this.getTabs().each(function (d) {
          return a(this).data('options') && a(this).data('options').id == b ? (c = d, void 0)  : void 0
        }),
        c
      },
      getLeft: function () {
        return f.position().left
      },
      getScrollBarW: function () {
        return e.width() - 55
      },
      visibleStart: function () {
        var d,
        a = this.getLeft(),
        b = 0,
        c = this.getTabs();
        for (d = 0; d < c.size(); d++) {
          if (b + a >= 0) return d;
          b += c.eq(d).outerWidth(!0)
        }
        return 0
      },
      visibleEnd: function () {
        var d,
        a = this.getLeft(),
        b = 0,
        c = this.getTabs();
        for (d = 0; d < c.size(); d++) if (b += c.eq(d).outerWidth(!0), b + a > this.getScrollBarW()) return d;
        return c.size()
      },
      scrollPrev: function () {
        var a = this.visibleStart();
        a > 0 && this.scrollTab( - this.getTabsW(0, a - 1))
      },
      scrollNext: function () {
        var a = this.visibleEnd();
        a < this.getTabs().size() && this.scrollTab( - this.getTabsW(0, a + 1) + this.getScrollBarW())
      },
      scrollTab: function (a) {
        f.animate({
          left: a
        }, 200, function () {
          j.tools.ctrlScrollBtn()
        })
      },
      scrollCurrent: function () {
        var a = this.tabsW(this.getTabs());
        a <= this.getScrollBarW() ? this.scrollTab(0)  : this.getLeft() < this.getScrollBarW() - a ? this.scrollTab(this.getScrollBarW() - a)  : b < this.visibleStart() ? this.scrollTab( - this.getTabsW(0, b))  : b >= this.visibleEnd() && this.scrollTab(this.getScrollBarW() - this.getTabs().eq(b).outerWidth(!0) - this.getTabsW(0, b))
      },
      ctrlScrollBtn: function () {
        var a = this.tabsW(this.getTabs());
        this.getScrollBarW() > a ? (h.hide(), i.hide(), f.parent().removeClass('tabsPageHeaderMargin'))  : (h.show().removeClass('tabsLeftDisabled'), i.show().removeClass('tabsRightDisabled'), f.parent().addClass('tabsPageHeaderMargin'), this.getLeft() >= 0 ? h.addClass('tabsLeftDisabled')  : this.getLeft() <= this.getScrollBarW() - a && i.addClass('tabsRightDisabled'))
      },
      switchTab: function (e) {
        var f = this.getTabs().removeClass('active').eq(e).addClass('active'),
        g = this.getPanels(),
        h = g.eq(e);
        f.data('reloadFlag') ? (g.hide(), h.show(), j.refresh(f.data('options').id))  : (g.hide(), h.find('.bjui-ajax-mask').length ? h.show()  : (h.addClass('fade').removeClass('in').show(), a.support.transition ? h.one('bsTransitionEnd', function () {
          h.addClass('in')
        }).emulateTransitionEnd(10)  : h.removeClass('fade'))),
        h.find('.bjui-layout [data-layout-h]').layoutH(),
        this.getMoreLi().removeClass('active').eq(e).addClass('active'),
        b = e,
        this.scrollCurrent(),
        c = f,
        a.CurrentNavtab = d = h
      },
      closeTab: function (a, c) {
        var l,
        d = this.getTabs().eq(a),
        e = this.getMoreLi().eq(a),
        f = this.getPanels().eq(a),
        g = d.data('options'),
        h = g.beforeClose ? g.beforeClose.toFunc()  : null,
        i = g.onClose ? g.onClose.toFunc()  : null,
        k = !0;
        return h && (k = h.apply(j, [
          f
        ])),
        k ? (d.remove(), e.remove(), f.trigger(BJUI.eventType.beforeCloseNavtab).remove(), i && i.apply(j), b >= a && b--, c && (l = this.indexTabId(c), l > 0 && (b = l)), this.scrollCurrent(), this.switchTab(b), void 0)  : (j.tools.switchTab(a), void 0)
      },
      closeOtherTab: function (c) {
        c = c || b,
        this.getTabs().each(function (b) {
          b > 0 && c != b && a(this).find('> .close').trigger('click')
        })
      },
      loadUrlCallback: function (a) {
        a.find(':button.btn-close').click(function () {
          j.closeCurrentTab()
        })
      },
      reload: function (a, b) {
        var c,
        d;
        b = b || a.data('reloadFlag'),
        c = a.data('options'),
        b && (a.data('reloadFlag', !1), d = j.tools.getPanel(c.id), a.hasClass('external') ? j.openExternal(c.url, d)  : j.tools.reloadTab(d, c))
      },
      reloadTab: function (a, b) {
        var c = b.onLoad ? b.onLoad.toFunc()  : null;
        a.trigger(BJUI.eventType.beforeLoadNavtab).ajaxUrl({
          type: b.type || 'GET',
          url: b.url,
          data: b.data || {
          },
          loadingmask: b.loadingmask,
          callback: function () {
            j.tools.loadUrlCallback(a),
            c && c.apply(j, [
              a
            ]),
            BJUI.ui.clientPaging && a.data('bjui.clientPaging') && a.pagination('setPagingAndOrderby', a)
          }
        })
      }
    };
    return l
  },
  n.prototype.contextmenu = function (a) {
    var c = this;
    a.contextmenu({
      id: 'navtabCM',
      bindings: {
        reload: function (a) {
          a.data('tabid') ? a.data('url') && c.refresh(a)  : c.refresh(a.data('initOptions').id)
        },
        closeCurrent: function (a) {
          if (!a.data('tabid')) {
            var d = a.data('initOptions').id;
            d ? c.closeTab(d)  : c.closeCurrentTab()
          }
        },
        closeOther: function (a) {
          if ('main' == a.data('tabid')) c.closeAllTab();
           else {
            var e = c.tools.indexTabId(a.data('initOptions').id);
            c.tools.closeOtherTab(e > 0 ? e : b)
          }
        },
        closeAll: function () {
          c.closeAllTab()
        }
      },
      ctrSub: function (a, b) {
        var d = b.find('[rel="reload"]'),
        e = b.find('[rel="closeCurrent"]');
        b.find('[rel="closeOther"]'),
        b.find('[rel="closeAll"]'),
        c.tools.getTabs(),
        'main' == a.data('tabid') && (e.addClass('disabled'), a.data('url') || d.addClass('disabled'))
      }
    })
  },
  n.prototype.openTab = function () {
    var i,
    j,
    l,
    m,
    n,
    o,
    c = this,
    d = this.$element,
    e = this.options,
    h = this.tools;
    return e.url ? (e.url = decodeURI(e.url).replacePlh(d.closest('.unitBox')), e.url.isFinishedTm() ? (e.url = encodeURI(e.url), e.id ? (i = h.indexTabId(e.id), i >= 0 ? (j = h.getTabs().eq(i), l = h.getPanels().eq(i), m = j.data('initOptions') || e, (m.fresh || e.fresh || m.url != e.url) && (c.reload(e), j.data('initOptions', e)), b = i)  : (n = '<li><a href="javascript:" title="#title#"><span>#title#</span></a><span class="close">&times;</span></li>', j = a(n.replaceAll('#title#', e.title)), l = a('<div class="page unitBox"></div>'), o = a('<li><a href="javascript:" title="#title#">#title#</a></li>'.replaceAll('#title#', e.title)), j.appendTo(f), l.appendTo(g), o.appendTo(k), e.external || e.url && e.url.isExternalUrl() ? (j.addClass('external'), this.openExternal(e.url, l))  : (j.removeClass('external'), h.reloadTab(l, e)), b = h.getTabs().length - 1, this.contextmenu(j), j.on('click', function (b) {
      var d = a(b.target);
      if (d.hasClass('close')) c.closeTab(e.id);
       else {
        if (d.closest('li').hasClass('active')) return !1;
        c.switchTab(e.id)
      }
    }), o.on('click', function () {
      c.switchTab(e.id)
    }), j.data('options', e).data('initOptions', e)), h.switchTab(b), h.scrollCurrent(), void 0)  : (BJUI.debug('Navtab Plugin: Error trying to open a navtab, the id is undefined!'), void 0))  : (d.alertmsg('error', e.warn || FRAG.alertPlhMsg.replace('#plhmsg#', BJUI.regional.plhmsg)), BJUI.debug('Navtab Plugin: The new navtab\'s url is incorrect, url: ' + e.url), void 0))  : (BJUI.debug('Navtab Plugin: Error trying to open a navtab, url is undefined!'), void 0)
  },
  n.prototype.closeTab = function (a) {
    var b = this.tools.indexTabId(a);
    b > 0 && this.tools.closeTab(b)
  },
  n.prototype.closeCurrentTab = function (a) {
    b > 0 && this.tools.closeTab(b, a)
  },
  n.prototype.closeAllTab = function () {
    this.tools.getTabs().find('> .close').each(function () {
      a(this).trigger('click')
    })
  },
  n.prototype.reloadFlag = function (a) {
    var d,
    e,
    c = a.split(',');
    for (d = 0; d < c.length; d++) e = this.tools.getTab(c[d].trim()),
    e && (this.tools.indexTabId(c[d]) == b ? this.tools.reload(e, !0)  : e.data('reloadFlag', !0))
  },
  n.prototype.switchTab = function (a) {
    var b = this.tools.indexTabId(a);
    this.tools.switchTab(b)
  },
  n.prototype.scrollPrev = function () {
    this.tools.scrollPrev()
  },
  n.prototype.scrollNext = function () {
    this.tools.scrollNext()
  },
  n.prototype.refresh = function (a) {
    var b,
    d;
    b = a ? 'string' == typeof a ? this.tools.getTab(a)  : a : c,
    b && b.length && (d = this.tools.getPanel(b.data('initOptions').id), d.removeData('bjui.clientPaging'), this.reload(b.data('initOptions')))
  },
  n.prototype.reload = function (c, d) {
    var h,
    i,
    j,
    e = this,
    f = a.extend({
    }, 'object' == typeof c && c),
    g = f.id ? this.tools.getTab(f.id)  : this.tools.getTabs().eq(b);
    g && (h = g.data('initOptions') || {
    }, i = a.extend({
    }, h, f), j = function () {
      !g.data('tabid') && i.title && h.title != i.title && g.find('> a').attr('title', i.title).find('> span').html(i.title),
      g.data('options', i),
      d || g.data('initOptions', i),
      e.tools.reload(g, !0)
    }, f.reloadWarn ? this.$element.alertmsg('confirm', f.reloadWarn, {
      okCall: function () {
        j()
      }
    })  : j())
  },
  n.prototype.reloadForm = function (c, d) {
    var f,
    g,
    h,
    i,
    j,
    k,
    l,
    e = a.extend({
    }, 'object' == typeof d && d);
    if ('string' == typeof d ? (f = this.tools.getTab(d), g = this.tools.getPanel(d))  : (f = e.id ? this.tools.getTab(e.id)  : this.tools.getTabs().eq(b), g = e.id ? this.tools.getPanel(e.id)  : this.tools.getPanels().eq(b)), f && g) {
      if (!f.hasClass('external') && (h = g.find('#pagerForm'), i = {
      }, j = {
      }, h.attr('action') && (e.url = h.attr('action')), h && h.length)) {
        if (j = h.serializeJson(), d && d.type || (e.type = h.attr('method') || 'POST'), c) {
          k = BJUI.pageInfo;
          for (l in k) i[k[l]] = j[k[l]]
        } else i = j;
        e.data = a.extend({
        }, e.data || {
        }, i)
      }
      this.reload(e, !0)
    }
  },
  n.prototype.getCurrentPanel = function () {
    return this.tools.getPanels().eq(b)
  },
  n.prototype.checkTimeout = function () {
    var a = JSON.parse(d.html());
    a && a[BJUI.keys.statusCode] == BJUI.statusCode.timeout && this.closeCurrentTab()
  },
  n.prototype.openExternal = function (a, b) {
    var c = b.closest('.navtab-panel').height();
    b.html(FRAG.externalFrag.replaceAll('{url}', a).replaceAll('{height}', c + 'px'))
  },
  p = a.fn.navtab,
  a.fn.navtab = o,
  a.fn.navtab.Constructor = n,
  a.fn.navtab.noConflict = function () {
    return a.fn.navtab = p,
    this
  },
  a(document).on('click.bjui.navtab.data-api', '[data-toggle="navtab"]', function (b) {
    var c = a(this),
    d = c.attr('href'),
    e = c.data();
    e.title || (e.title = c.text()),
    d && (e.url || (e.url = d), e.url && e.url != d && (e.url = d)),
    o.call(c, e),
    b.preventDefault()
  })
}(jQuery);
/**
 * B-JUI: bjui-dialog.js v1.0
 * @author K'naan (xknaan@163.com)
 * -- Modified from dwz.dialog.js, dwz.dialogDrag.js, dwz.resize.js (author:Roger Wu)
 * http://git.oschina.net/xknaan/B-JUI/blob/master/BJUI/js/bjui-dialog.js
 */
+ function (a) {
  'use strict';
  function g(b) {
    var c = arguments,
    d = b;
    return this.each(function () {
      var e = a(this),
      g = a.extend({
      }, f.DEFAULTS, e.data(), 'object' == typeof b && b),
      h = e.data('bjui.dialog');
      h ? g.fresh && e.data('bjui.dialog', h = new f(this, g))  : e.data('bjui.dialog', h = new f(this, g)),
      'string' == typeof d && a.isFunction(h[d]) ? ([].shift.apply(c), c ? h[d].apply(h, c)  : h[d]())  : h.open()
    })
  }
  var b,
  c,
  d,
  e,
  f,
  h;
  a(function () {
    var c = function () {
      var c,
      g;
      b = a('#bjui-resizable'),
      d = 'dialogShadow',
      e = f.ZINDEX,
      c = BJUI.regional.dialog,
      g = FRAG.dialogProxy.replace('#close#', c.close).replace('#maximize#', c.maximize).replace('#restore#', c.restore).replace('#minimize#', c.minimize).replace('#title#', c.title),
      a('body').append('<!-- dialog resizable -->').append(FRAG.resizable).append('<!-- dialog drag  -->').append(g).append('<!-- dialog mask -->').append(FRAG.dialogMask)
    };
    c()
  }),
  f = function (b, c) {
    this.$element = a(b),
    this.options = c,
    this.tools = this.TOOLS()
  },
  f.DEFAULTS = {
    id: 'dialog',
    title: 'New Dialog',
    url: void 0,
    type: 'GET',
    data: {
    },
    loadingmask: !0,
    width: 500,
    height: 300,
    minW: 65,
    minH: 40,
    max: !1,
    mask: !1,
    resizable: !0,
    drawable: !0,
    maxable: !0,
    minable: !0,
    fresh: !1,
    onLoad: null,
    beforeClose: null,
    onClose: null
  },
  f.ZINDEX = 30,
  f.prototype.TOOLS = function () {
    var b = this,
    c = {
      getDefaults: function () {
        return f.DEFAULTS
      },
      init: function (c) {
        var e = b.options.width > b.options.minW ? b.options.width : b.options.minW,
        f = b.options.height > b.options.minH ? b.options.height : b.options.minH,
        g = a(window).width(),
        h = a(window).height(),
        i = b.options.max ? 0 : (h - f) / 2;
        e > g && (e = g),
        f > h && (f = h),
        c.height(f).width(e).show().css({
          left: (g - e) / 2,
          top: 0,
          opacity: 0.1
        }).animate({
          top: i > 0 ? i : 0,
          opacity: 1
        }).addClass(d).find('> .dialogContent').height(f - a('> .dialogHeader', c).outerHeight() - 6),
        a('body').find('> .bjui-dialog-container').not(c).removeClass(d)
      },
      reload: function (c, d) {
        var f,
        g,
        e = c.find('> .dialogContent');
        d = d || c.data('initOptions'),
        f = d.onLoad ? d.onLoad.toFunc()  : null,
        c.trigger(BJUI.eventType.beforeLoadDialog),
        d.url ? e.ajaxUrl({
          type: d.type || 'GET',
          url: d.url,
          data: d.data || {
          },
          loadingmask: d.loadingmask,
          callback: function () {
            f && f.apply(b, [
              c
            ]),
            BJUI.ui.clientPaging && c.data('bjui.clientPaging') && c.pagination('setPagingAndOrderby', c)
          }
        })  : d.target && (g = a(d.target).html() || c.data('bjui.dialog.target'), a(d.target).empty(), c.data('bjui.dialog.target', g), e.trigger(BJUI.eventType.beforeAjaxLoad).html(g).initui(), f && f.apply(b, [
          c
        ]))
      },
      resizeContent: function (b, c, d) {
        var e = b.find('> .dialogContent');
        e.css({
          width: c - 0,
          height: d - b.find('> .dialogHeader').outerHeight() - 6
        }).find('[data-layout-h]').layoutH(e),
        a(window).trigger(BJUI.eventType.resizeGrid)
      }
    };
    return c
  },
  f.prototype.open = function () {
    var h,
    i,
    j,
    b = this,
    d = b.options,
    f = a('body'),
    g = f.data(d.id);
    if (d.target && a(d.target).length) d.url = void 0;
     else {
      if (!d.url) return BJUI.debug('Dialog Plugin: Error trying to open a dialog, url is undefined!'),
      void 0;
      if (d.url = decodeURI(d.url).replacePlh(b.$element.closest('.unitBox')), !d.url.isFinishedTm()) return b.$element.alertmsg('error', d.warn || FRAG.alertPlhMsg.replace('#plhmsg#', BJUI.regional.plhmsg)),
      BJUI.debug('Dialog Plugin: The new dialog\'s url is incorrect, url: ' + d.url),
      void 0;
      d.url = encodeURI(d.url)
    }
    g ? (h = g.data('initOptions') || d, this.switchDialog(g), g.is(':hidden') && g.show(), (h.fresh || d.fresh || !h.url || h.url != d.url) && (b.reload(d), g.data('initOptions', d)))  : (i = BJUI.regional.dialog, j = FRAG.dialog.replace('#close#', i.close).replace('#maximize#', i.maximize).replace('#restore#', i.restore).replace('#minimize#', i.minimize).replace('#title#', i.title), g = a(j).data('options', d).data('initOptions', d).css('zIndex', e += 2).hide().appendTo(f), g.find('> .dialogHeader > h1 > span.title').html(d.title), this.tools.init(g), d.maxable ? g.find('a.maximize').show()  : g.find('a.maximize').hide(), d.minable ? g.find('a.minimize').show()  : g.find('a.minimize').hide(), d.max && b.maxsize(g), d.mask ? this.addMask(g)  : d.minable && a.fn.taskbar && this.$element.taskbar({
      id: d.id,
      title: d.title
    }), g.on('click', function (d) {
      a(d.target).data('bjui.dialog') || c && c[0] != g[0] && b.switchDialog(g)
    }).on('click', '.btn-close', function (a) {
      b.close(g),
      a.preventDefault()
    }).on('click', '.dialogHeader > a', function (c) {
      var d = a(this);
      d.hasClass('close') && b.close(g),
      d.hasClass('minimize') && b.minimize(g),
      d.hasClass('maximize') && (b.switchDialog(g), b.maxsize(g)),
      d.hasClass('restore') && b.restore(g),
      c.preventDefault(),
      c.stopPropagation()
    }).on('dblclick', '.dialogHeader > h1', function () {
      d.maxable && (g.find('> .dialogHeader > a.restore').is(':hidden') ? g.find('a.maximize').trigger('click')  : g.find('> .dialogHeader > a.restore').trigger('click'))
    }).on('mousedown.bjui.dialog.drag', '.dialogHeader > h1', function (c) {
      b.switchDialog(g),
      d.drawable && !g.data('max') && (g.data('bjui.dialog.task', !0), setTimeout(a.proxy(function () {
        g.data('bjui.dialog.task') && b.drag(c, g)
      }, b), 150), c.preventDefault())
    }).on('mouseup.bjui.dialog.drag', '.dialogHeader > h1', function () {
      g.data('bjui.dialog.task', !1)
    }).on('mousedown.bjui.dialog.resize', 'div[class^="resizable"]', function (c) {
      if (d.drawable && !g.data('max')) {
        var e = a(this);
        b.switchDialog(g),
        b.resizeInit(c, a('#bjui-resizable'), g, e),
        e.show(),
        c.preventDefault()
      }
    }).on('mouseup.bjui.dialog.resize', 'div[class^="resizable"]', function (a) {
      a.preventDefault()
    }), f.data(d.id, g), this.tools.reload(g, d)),
    a.CurrentDialog = c = g
  },
  f.prototype.addMask = function (b) {
    var c = b.data('bjui.dialog.mask');
    c && c.length || (c = a(FRAG.dialogMask), c.appendTo('body').css('zIndex', e - 1).show(), b.data('bjui.dialog.mask', c)),
    b.find('> .dialogHeader > a.minimize').hide()
  },
  f.prototype.refresh = function (b) {
    var d,
    e,
    f;
    if (b && 'string' == typeof b) for (d = b.split(','), e = 0; e < d.length; e++) f = a('body').data(d[e].trim()),
    f && (f.removeData('bjui.clientPaging'), this.tools.reload(f));
     else c.removeData('bjui.clientPaging'),
    this.tools.reload(c)
  },
  f.prototype.reload = function (b, c) {
    var g,
    h,
    i,
    d = this,
    e = a.extend({
    }, 'object' == typeof b && b),
    f = e.id && a('body').data(e.id) || d.getCurrent();
    f && f.length && (g = f.data('initOptions'), h = a.extend({
    }, g, e), i = function () {
      var b = f.find('> .dialogContent');
      g.width != h.width && (h.max ? (f.width(h.width), b.width(h.width))  : f.animate({
        width: h.width
      }, 'normal', function () {
        b.width(h.width)
      })),
      g.height != h.height && (h.max ? (f.height(h.height), b.height(h.height - f.find('> .dialogHeader').outerHeight() - 6))  : f.animate({
        height: h.height
      }, 'normal', function () {
        b.height(h.height - f.find('> .dialogHeader').outerHeight() - 6).find('[data-layout-h]').layoutH(b)
      })),
      g.maxable != h.maxable && (h.maxable ? f.find('a.maximize').show()  : f.find('a.maximize').hide()),
      g.minable != h.minable && (h.minable ? f.find('a.minimize').show()  : f.find('a.minimize').hide()),
      g.max != h.max && h.max && setTimeout(d.maxsize(f), 10),
      g.mask != h.mask && (h.mask ? (d.addMask(f), a.fn.taskbar && d.$element.taskbar('closeDialog', h.id))  : h.minable && a.fn.taskbar && d.$element.taskbar({
        id: h.id,
        title: h.title
      })),
      g.title != h.title && (f.find('> .dialogHeader > h1 > span.title').html(h.title), f.taskbar('changeTitle', h.id, h.title)),
      f.data('options', h),
      c || f.data('initOptions', h),
      d.tools.reload(f, h)
    }, h.reloadWarn ? f.alertmsg('confirm', h.reloadWarn, {
      okCall: function () {
        i()
      }
    })  : i())
  },
  f.prototype.reloadForm = function (b, c) {
    var d,
    e,
    f,
    g,
    h,
    i,
    j;
    if ('string' == typeof c ? (d = a('body').data(c), e = d.data('options'))  : 'object' == typeof c && (d = c.id && a('body').data(c.id) || this.getCurrent()), d) {
      if ('object' == typeof c && (c.title && d.find('> .dialogHeader > h1 > span.title').html(c.title), e = a.extend({
      }, c, d.data('options'))), f = d.find('#pagerForm'), g = {
      }, h = {
      }, f.attr('action') && (e.url = f.attr('action')), f && f.length) {
        if (h = f.serializeJson(), c && c.type || (e.type = f.attr('method') || 'POST'), b) {
          i = BJUI.pageInfo;
          for (j in i) g[i[j]] = h[i[j]]
        } else g = h;
        e.data = a.extend({
        }, e.data || {
        }, g)
      }
      this.reload(e, !0)
    }
  },
  f.prototype.getCurrent = function () {
    return c
  },
  f.prototype.switchDialog = function (b) {
    var f,
    e = b.css('zIndex');
    c && c != b && (f = c.css('zIndex'), c.css('zIndex', e), b.css('zIndex', f), a.CurrentDialog = c = b, a.fn.taskbar && this.$element.taskbar('switchTask', b.data('options').id)),
    b.addClass(d),
    a('body').find('> .bjui-dialog-container').not(b).removeClass(d)
  },
  f.prototype.close = function (b) {
    var d = this,
    g = 'string' == typeof b ? a('body').data(b)  : b,
    h = g.data('bjui.dialog.mask'),
    i = g.data('options'),
    j = g.data('bjui.dialog.target'),
    k = i.beforeClose ? i.beforeClose.toFunc()  : null,
    l = i.onClose ? i.onClose.toFunc()  : null,
    m = !0;
    if (g && i) {
      if (k && (m = k.apply(d, [
        g
      ])), !m) return d.switchDialog(g),
      void 0;
      i.target && j && a(i.target).html(j),
      h && h.length ? h.remove()  : a.fn.taskbar && this.$element.taskbar('closeDialog', i.id),
      g.animate({
        top: - g.outerHeight(),
        opacity: 0.1
      }, 'normal', function () {
        var b,
        h;
        a('body').removeData(i.id),
        g.trigger(BJUI.eventType.beforeCloseDialog).remove(),
        l && l.apply(d),
        b = a('body').find('> .bjui-dialog-container'),
        h = void 0,
        b.length ? h = d.$element.getMaxIndexObj(b)  : (e = f.ZINDEX, c = null),
        h && h.is(':visible') && d.switchDialog(h)
      })
    }
  },
  f.prototype.closeCurrent = function () {
    this.close(c)
  },
  f.prototype.checkTimeout = function () {
    var a = c.find('> .dialogContent'),
    b = JSON.parse(a.html());
    b && b[BJUI.keys.statusCode] == BJUI.statusCode.timeout && this.closeCurrent()
  },
  f.prototype.maxsize = function (b) {
    var c,
    d;
    b.data('original', {
      top: b.css('top'),
      left: b.css('left'),
      width: b.css('width'),
      height: b.css('height')
    }).data('max', !0),
    b.find('> .dialogHeader > a.maximize').hide(),
    b.find('> .dialogHeader > a.restore').show(),
    c = a(window).width(),
    d = a(window).height() - a('#bjui-taskbar').height() - 1,
    b.css({
      top: 0,
      left: 0,
      width: c,
      height: d
    }),
    this.tools.resizeContent(b, c, d)
  },
  f.prototype.restore = function (a) {
    var b = a.data('original'),
    c = parseInt(b.width),
    d = parseInt(b.height);
    a.css({
      top: b.top,
      left: b.left,
      width: c,
      height: d
    }),
    this.tools.resizeContent(a, c, d),
    a.find('> .dialogHeader > a.maximize').show(),
    a.find('> .dialogHeader > a.restore').hide(),
    a.data('max', !1)
  },
  f.prototype.minimize = function (b) {
    b.hide(),
    a.fn.taskbar && this.$element.taskbar('minimize', b)
  },
  f.prototype.drag = function (b, c) {
    var d = a('#bjui-dialogProxy');
    d.size() || (d = a(FRAG.dialogProxy).appendTo(a('body'))),
    d.find('> div.dialogHeader > h1').html(c.find('> div.dialogHeader > h1').html()),
    d.find('> div.dialogContent').css('height', c.find('> div.dialogContent').css('height')),
    d.css({
      left: c.css('left'),
      top: c.css('top'),
      height: c.css('height'),
      width: c.css('width'),
      zIndex: parseInt(c.css('zIndex'))
    }).show(),
    c.css({
      left: '-10000px',
      top: '-10000px'
    }),
    d.basedrag({
      selector: '> .dialogHeader',
      stop: function () {
        c.css({
          left: d.css('left'),
          top: d.css('top')
        }),
        d.hide()
      },
      event: b
    })
  },
  f.prototype.resizeDialog = function (b, c, d) {
    var e,
    j,
    f = parseInt(b.css('left')),
    g = parseInt(b.css('top')),
    h = parseInt(b.css('height')),
    i = parseInt(b.css('width'));
    e = 'n' == d || 'nw' == d ? parseInt(c.css('top')) - g : h - parseInt(c.css('height')),
    c.css({
      top: g,
      left: f,
      width: i + 2,
      height: h + 1
    }).find('> .dialogContent').css('width', i - 0),
    'w' != d && 'e' != d && (j = c.find('> .dialogContent'), j.css({
      height: h - c.find('> .dialogHeader').outerHeight() - 6
    }).find('[data-layout-h]').layoutH(j)),
    a(window).trigger(BJUI.eventType.resizeGrid)
  },
  f.prototype.resizeInit = function (b, c, d, e) {
    var f = this,
    g = e.attr('tar');
    a('body').css('cursor', g + '-resize'),
    c.css({
      top: d.css('top'),
      left: d.css('left'),
      height: d.outerHeight(),
      width: d.css('width')
    }).show(),
    this.options.dragCurrent || (this.options.dragCurrent = {
      $resizable: c,
      $dialog: d,
      target: g,
      oleft: parseInt(c.css('left')) || 0,
      owidth: parseInt(c.css('width')) || 0,
      otop: parseInt(c.css('top')) || 0,
      oheight: parseInt(c.css('height')) || 0,
      ox: b.pageX || b.screenX,
      oy: b.pageY || b.clientY
    }, a(document).on('mouseup.bjui.dialog.resize', a.proxy(f.resizeStop, f)), a(document).on('mousemove.bjui.dialog.resize', a.proxy(f.resizeStart, f)))
  },
  f.prototype.resizeStart = function (b) {
    var d,
    e,
    f,
    g,
    h,
    c = this.options.dragCurrent;
    c && (b || (b = window.event), d = (b.pageX || b.screenX) - c.ox, e = (b.pageY || b.clientY) - c.oy, (b.pageY || b.clientY) <= 0 || (b.pageY || b.clientY) >= a(window).height() - c.$dialog.find('> .dialogHeader').outerHeight() || (f = c.target, g = c.owidth, h = c.oheight, 'n' != f && 's' != f && (g += f.indexOf('w') >= 0 ? - d : d), g >= this.options.minW && (f.indexOf('w') >= 0 && c.$resizable.css('left', c.oleft + d), 'n' != f && 's' != f && c.$resizable.css('width', g)), 'w' != f && 'e' != f && (h += f.indexOf('n') >= 0 ? - e : e), h >= this.options.minH && (f.indexOf('n') >= 0 && c.$resizable.css('top', c.otop + e), 'w' != f && 'e' != f && c.$resizable.css('height', h))))
  },
  f.prototype.resizeStop = function () {
    var c = this.options.dragCurrent;
    return c ? (a(document).off('mouseup.bjui.dialog.resize'), a(document).off('mousemove.bjui.dialog.resize'), this.options.dragCurrent = null, this.resizeDialog(c.$resizable, c.$dialog, c.target), a('body').css('cursor', ''), c.$resizable.hide(), void 0)  : !1
  },
  h = a.fn.dialog,
  a.fn.dialog = g,
  a.fn.dialog.Constructor = f,
  a.fn.dialog.noConflict = function () {
    return a.fn.dialog = h,
    this
  },
  a(document).on('click.bjui.dialog.data-api', '[data-toggle="dialog"]', function (b) {
    var c = a(this),
    d = c.attr('href'),
    e = c.data();
    e.title || (e.title = c.text()),
    d && (e.url || (e.url = d), e.url && e.url != d && (e.url = d)),
    g.call(c, e),
    b.preventDefault()
  })
}(jQuery);
/**
 * B-JUI: bjui-taskbar.js v1.0
 * reference: bjui-dialog.js
 * @author K'naan (xknaan@163.com)
 * -- Modified from dwz.taskBar.js (author:Roger Wu)
 * http://git.oschina.net/xknaan/B-JUI/blob/master/BJUI/js/bjui-taskbar.js
 */
+ function (a) {
  'use strict';
  function l(b) {
    var c = arguments,
    d = b;
    return this.each(function () {
      var e = a(this),
      f = a.extend({
      }, k.DEFAULTS, e.data(), 'object' == typeof b && b),
      g = e.data('bjui.taskbar');
      g ? g.options.id != f.id && e.data('bjui.taskbar', g = new k(this, f))  : e.data('bjui.taskbar', g = new k(this, f)),
      'string' == typeof d && a.isFunction(g[d]) ? ([].shift.apply(c), c ? g[d].apply(g, c)  : g[d]())  : g.init()
    })
  }
  var b,
  c,
  d,
  e,
  f,
  g,
  h,
  i,
  j,
  k,
  m;
  a(function () {
    var k = function () {
      b = a('#bjui-resizable'),
      c = a(FRAG.taskbar),
      d = c.find('.taskbarContent'),
      e = d.find('> ul'),
      f = c.find('.taskbarLeft'),
      g = c.find('.taskbarRight'),
      h = 'disabled',
      i = 'selected',
      j = 'taskbarMargin',
      a('body').append('<!-- dialog task bar -->').append(c),
      f.click(function () {
        a(this).taskbar('scrollLeft')
      }),
      g.click(function () {
        a(this).taskbar('scrollRight')
      })
    };
    k()
  }),
  k = function (b, c) {
    this.$element = a(b),
    this.$task = null,
    this.options = c,
    this.tools = this.TOOLS()
  },
  k.DEFAULTS = {
    id: void 0,
    title: void 0
  },
  k.prototype.init = function () {
    var d,
    b = this,
    c = e.find('#' + this.options.id);
    this.show(),
    c.length ? c.find('> div > span.title').html(this.options.title)  : (d = '<li id="#taskid#"><div class="taskbutton"><span><i class="fa fa-th-large"></i></span> <span class="title">#title#</span></div><div class="close"><i class="fa fa-times-circle"></i></div></li>', c = a(d.replace('#taskid#', this.options.id).replace('#title#', this.options.title)), c.appendTo(e)),
    this.contextmenu(c),
    this.switchTask(c),
    this.tools.scrollTask(c),
    c.click(function (d) {
      if (a(d.target).closest('div').hasClass('close') || a(d.target).hasClass('close')) c.dialog('close', b.options.id);
       else {
        var e = a('body').data(b.options.id);
        c.hasClass('selected') ? e.find('.dialogHeader a.minimize').trigger('click')  : e.is(':hidden') ? b.restoreDialog(e)  : (e.trigger('click'), c.addClass(i)),
        b.scrollCurrent(c)
      }
      return !1
    })
  },
  k.prototype.TOOLS = function () {
    var k = {
      scrollCurrent: function () {
        var b,
        c,
        d,
        a = this.tasksW(this.getTasks());
        a > this.getTaskBarW() ? (b = this, c = e.find('> li:last-child'), d = this.getTaskBarW() - c.position().left - c.outerWidth(!0), e.animate({
          left: d
        }, 200, function () {
          b.ctrlScrollBtn()
        }))  : this.ctrlScrollBtn()
      },
      getTaskBarW: function () {
        return d.width() - (f.is(':hidden') ? f.width() + 2 : 0) - (g.is(':hidden') ? g.width() + 2 : 0)
      },
      scrollTask: function (a) {
        var c,
        b = this;
        a.position().left + this.getLeft() + a.outerWidth() > this.getBarWidth() ? (c = this.getTaskBarW() - a.position().left - a.outerWidth(!0) - 2, e.animate({
          left: c
        }, 200, function () {
          b.ctrlScrollBtn()
        }))  : a.position().left + this.getLeft() < 0 && (c = this.getLeft() - (a.position().left + this.getLeft()), e.animate({
          left: c
        }, 200, function () {
          b.ctrlScrollBtn()
        }))
      },
      ctrlScrollBtn: function () {
        var a = this.tasksW(this.getTasks());
        this.getTaskBarW() > a ? (d.removeClass(j), g.hide(), f.hide(), this.getTasks().eq(0).length && this.scrollTask(this.getTasks().eq(0)))  : (d.addClass(j), g.show().removeClass(h), f.show().removeClass(h), this.getLeft() >= 0 && f.addClass(h), this.getLeft() <= this.getTaskBarW() - a && g.addClass(h))
      },
      getLeft: function () {
        return e.position().left
      },
      visibleStart: function () {
        var c,
        a = this.getLeft(),
        b = this.getTasks();
        for (c = 0; c < b.size(); c++) if (b.eq(c).position().left + b.eq(c).outerWidth(!0) + a >= 0) return b.eq(c);
        return b.eq(0)
      },
      visibleEnd: function () {
        var c,
        a = this.getLeft(),
        b = this.getTasks();
        for (c = 0; c < b.size(); c++) if (b.eq(c).position().left + b.eq(c).outerWidth(!0) + a > this.getBarWidth()) return b.eq(c);
        return b.eq(b.size() - 1)
      },
      getTasks: function () {
        return e.find('> li')
      },
      tasksW: function (b) {
        var c = 0;
        return b.each(function () {
          c += a(this).outerWidth(!0)
        }),
        c
      },
      getBarWidth: function () {
        return c.innerWidth()
      },
      getCurrent: function () {
        return e.find('li.' + i)
      }
    };
    return k
  },
  k.prototype.contextmenu = function (b) {
    var c = this;
    b.contextmenu({
      id: 'dialogCM',
      bindings: {
        reload: function (a) {
          a.dialog('refresh', c.options.id)
        },
        closeCurrent: function (a) {
          var d = a.isTag('li') ? a : c.tools.getCurrent();
          d.find('.close').trigger('click')
        },
        closeOther: function (b) {
          var d = e.find('> li').not(b);
          d.each(function () {
            a(this).find('.close').trigger('click')
          })
        },
        closeAll: function () {
          var e = c.tools.getTasks();
          e.each(function () {
            a(this).find('.close').trigger('click')
          })
        }
      },
      ctrSub: function (a, b) {
        var d = b.find('[rel="closeCurrent"]'),
        e = b.find('[rel="closeOther"]');
        c.tools.getCurrent().length ? 1 == c.tools.getTasks().size() && e.addClass(h)  : (d.addClass(h), e.addClass(h))
      }
    })
  },
  k.prototype.closeDialog = function (a) {
    var b = 'string' == typeof a ? this.getTask(a)  : a;
    b && b.length && (b.remove(), 0 == this.tools.getTasks().size() && this.hide(), this.tools.scrollCurrent(), this.$element.removeData('bjui.taskbar'))
  },
  k.prototype.minimize = function (c) {
    var d = this,
    e = 'string' == typeof c ? a('body').data('dialog')  : c,
    f = this.getTask(e.data('options').id);
    b.css({
      top: e.css('top'),
      left: e.css('left'),
      height: e.css('height'),
      width: e.css('width')
    }).show().animate({
      top: a(window).height() - 60,
      left: f.position().left,
      width: f.outerWidth(),
      height: f.outerHeight()
    }, 250, function () {
      a(this).hide(),
      d.inactive(f)
    })
  },
  k.prototype.restoreDialog = function (c) {
    var d = this.getTask(c.data('options').id);
    b.css({
      top: a(window).height() - 60,
      left: d.position().left,
      height: d.outerHeight(),
      width: d.outerWidth()
    }).show().animate({
      top: c.css('top'),
      left: c.css('left'),
      width: c.css('width'),
      height: c.css('height')
    }, 250, function () {
      a(this).hide(),
      c.show()
    }),
    this.switchTask(d)
  },
  k.prototype.inactive = function (a) {
    var b = 'string' == typeof a ? this.getTask(a)  : a;
    b.removeClass(i)
  },
  k.prototype.scrollLeft = function () {
    var a = this.tools.visibleStart();
    this.tools.scrollTask(a)
  },
  k.prototype.scrollRight = function () {
    var a = this.tools.visibleEnd();
    this.tools.scrollTask(a)
  },
  k.prototype.scrollCurrent = function (a) {
    this.tools.scrollTask(a)
  },
  k.prototype.switchTask = function (a) {
    this.tools.getCurrent().removeClass(i);
    var b = 'string' == typeof a ? this.getTask(a)  : a;
    b.addClass(i)
  },
  k.prototype.getTask = function (a) {
    return e.find('#' + a)
  },
  k.prototype.changeTitle = function (a, b) {
    var c = this.getTask(a);
    c && b && c.find('.title').html(b)
  },
  k.prototype.show = function () {
    c.is(':hidden') && c.show().animate({
      bottom: 0
    }, 500)
  },
  k.prototype.hide = function () {
    c.is(':visible') && c.animate({
      bottom: - 50
    }, 500, function () {
      c.hide()
    })
  },
  m = a.fn.taskbar,
  a.fn.taskbar = l,
  a.fn.taskbar.Constructor = k,
  a.fn.taskbar.noConflict = function () {
    return a.fn.taskbar = m,
    this
  }
}(jQuery);
/**
 * B-JUI: bjui-ajax.js v1.0
 * @author K'naan (xknaan@163.com) 
 * -- Modified from dwz.ajax.js (author:ZhangHuihua@msn.com)
 * http://git.oschina.net/xknaan/B-JUI/blob/master/BJUI/js/bjui-ajax.js
 */
+ function (a) {
  'use strict';
  function c(c) {
    var d = arguments,
    e = c;
    return this.each(function () {
      var f = a(this),
      g = a.extend({
      }, b.DEFAULTS, f.data(), 'object' == typeof c && c),
      h = f.data('bjui.bjuiajax');
      h || f.data('bjui.bjuiajax', h = new b(this, g)),
      'string' == typeof e && a.isFunction(h[e]) && ([].shift.apply(d), d ? h[e].apply(h, d)  : h[e]())
    })
  }
  var d,
  b = function (b, c) {
    this.$element = a(b),
    this.options = c,
    this.tools = this.TOOLS()
  };
  b.DEFAULTS = {
    reload: !0,
    loadingmask: !0
  },
  b.NAVTAB = 'navtab',
  b.prototype.TOOLS = function () {
    var c = this,
    d = {
      getPagerForm: function (b, c) {
        var f,
        g,
        d = b.isTag('form') ? b[0] : b.find('#pagerForm:first') [0],
        e = a.extend({
        }, BJUI.pageInfo);
        if (b.data('bjui.clientPaging') && (c = b.data('bjui.clientPaging')), d) for (f in e) g = '',
        c && c[f] && (g = c[f]),
        d[e[f]] ? g && (d[e[f]].value = g)  : a('<input type="hidden" name="' + e[f] + '" value="' + g + '">').appendTo(a(d));
        return d
      },
      getTarget: function () {
        return c.$element.closest('.navtab-panel').length ? b.NAVTAB : 'dialog'
      }
    };
    return d
  },
  b.prototype.ajaxForm = function (b) {
    var g,
    h,
    c = this,
    d = this.$element,
    e = b && b.callback,
    f = d.attr('enctype');
    b = a.extend({
    }, c.options, 'object' == typeof b && b),
    e && (e = e.toFunc()),
    g = function (b) {
      e ? e.apply(c, [
        b,
        d
      ])  : a.proxy(c.ajaxCallback(b), c)
    },
    h = function () {
      var e = {
        loadingmask: b.loadingmask,
        type: d.attr('method'),
        url: d.attr('action'),
        callback: g,
        error: a.proxy(c.ajaxError, c)
      };
      f && 'multipart/form-data' == f ? window.FormData ? a.extend(e, {
        data: new FormData(d[0]),
        contentType: !1,
        processData: !1
      })  : a.extend(e, {
        data: d.serializeArray(),
        files: d.find(':file'),
        iframe: !0,
        processData: !1
      })  : a.extend(e, {
        data: d.serializeArray()
      }),
      d.doAjax(e)
    },
    b.confirmMsg ? d.alertmsg('confirm', b.confirmMsg, {
      okCall: h
    })  : h()
  },
  b.prototype.ajaxDone = function (a) {
    var b = this.$element;
    a[BJUI.keys.statusCode] == BJUI.statusCode.error ? a[BJUI.keys.message] && b.alertmsg('error', a[BJUI.keys.message])  : a[BJUI.keys.statusCode] == BJUI.statusCode.timeout ? b.alertmsg('error', a[BJUI.keys.message] || FRAG.sessionTimout, {
      okCall: BJUI.loadLogin
    })  : a[BJUI.keys.message] && b.alertmsg('correct', a[BJUI.keys.message])
  },
  b.prototype.ajaxError = function (a, b, c) {
    this.$element.alertmsg('error', '<div>Http status: ' + a.status + ' ' + a.statusText + '</div>' + '<div>ajaxOptions: ' + b + ' </div>' + '<div>thrownError: ' + c + ' </div>' + '<div>' + a.responseText + '</div>')
  },
  b.prototype.ajaxCallback = function (a) {
    var c = this,
    d = c.$element,
    e = d.closest('.bjui-layout');
    c.ajaxDone(a),
    a[BJUI.keys.statusCode] == BJUI.statusCode.ok && (e && e.length ? c.divCallback(a, e)  : c.tools.getTarget() == b.NAVTAB ? c.navtabCallback(a)  : c.dialogCallback(a))
  },
  b.prototype.divCallback = function (a, b) {
    var d,
    e,
    f,
    g,
    c = this;
    a.tabid && setTimeout(function () {
      c.$element.navtab('reloadFlag', a.tabid)
    }, 100),
    a.dialogid && setTimeout(function () {
      c.$element.dialog('refresh', a.dialogid)
    }, 100),
    a.divid && setTimeout(function () {
      c.$element.bjuiajax('refreshDiv', a.divid)
    }, 100),
    c.options.reload && (d = c.tools.getPagerForm(b), e = null, f = null, d ? (e = d.attr('action'), f = d.attr('method') || 'GET')  : (e = b.data('url'), f = b.data('type') || 'GET'), e && b.ajaxUrl({
      url: e,
      type: f
    })),
    c.options.reloadNavtab && setTimeout(function () {
      c.$element.navtab('refresh')
    }, 100),
    a.forward && (g = function () {
      b.ajaxUrl({
        url: a.forward
      })
    }, a.forwardConfirm ? c.$element.alertmsg('confirm', a.forwardConfirm, {
      okCall: function () {
        g()
      }
    })  : g())
  },
  b.prototype.navtabCallback = function (a) {
    var c,
    b = this;
    a.tabid && setTimeout(function () {
      b.$element.navtab('reloadFlag', a.tabid)
    }, 100),
    a.dialogid && setTimeout(function () {
      b.$element.dialog('refresh', a.dialogid)
    }, 100),
    a.divid && setTimeout(function () {
      b.$element.bjuiajax('refreshDiv', a.divid)
    }, 100),
    a.closeCurrent && !a.forward ? b.$element.navtab('closeCurrentTab')  : b.options.reload && setTimeout(function () {
      b.$element.navtab('refresh')
    }, 100),
    a.forward && (c = function () {
      b.$element.navtab('reload', {
        url: a.forward
      })
    }, a.forwardConfirm ? b.$element.alertmsg('confirm', a.forwardConfirm, {
      okCall: function () {
        c()
      },
      cancelCall: function () {
        a.closeCurrent && b.$element.navtab('closeCurrentTab')
      }
    })  : c())
  },
  b.prototype.dialogCallback = function (a) {
    var c,
    b = this;
    a.tabid && setTimeout(function () {
      b.$element.navtab('reloadFlag', a.tabid)
    }, 100),
    a.dialogid && setTimeout(function () {
      b.$element.dialog('refresh', a.dialogid)
    }, 100),
    a.divid && setTimeout(function () {
      b.$element.bjuiajax('refreshDiv', a.divid)
    }, 100),
    a.closeCurrent && !a.forward ? b.$element.dialog('closeCurrent')  : b.options.reload && setTimeout(function () {
      b.$element.dialog('refresh')
    }, 100),
    b.options.reloadNavtab && setTimeout(function () {
      b.$element.navtab('refresh')
    }, 100),
    a.forward && (c = function () {
      b.$element.dialog('reload', {
        url: a.forward
      })
    }, a.forwardConfirm ? b.$element.alertmsg('confirm', a.forwardConfirm, {
      okCall: function () {
        c()
      }
    })  : c())
  },
  b.prototype.pageCallback = function (c, d) {
    var e = this,
    f = a.extend({
    }, b.DEFAULTS, c),
    g = d || null,
    h = null;
    g && g.length ? (h = e.tools.getPagerForm(g, f), h && (a.extend(f, a(h).data()), e.reloadDiv(g, {
      type: a(h).attr('method') || 'POST',
      url: a(h).attr('action'),
      data: a(h).serializeArray(),
      loadingmask: f.loadingmask
    })))  : e.tools.getTarget() == b.NAVTAB ? (g = a.CurrentNavtab, h = e.tools.getPagerForm(g, f), h && a.extend(f, a(h).data()), e.$element.navtab('reloadForm', !1, f))  : (g = a.CurrentDialog, h = e.tools.getPagerForm(g, f), h && a.extend(f, a(h).data()), e.$element.dialog('reloadForm', !1, f))
  },
  b.prototype.doSearch = function (c) {
    var i,
    j,
    k,
    l,
    d = this,
    e = d.$element,
    f = null,
    g = {
      pageCurrent: 1
    },
    h = e.closest('.bjui-layout');
    if (c = a.extend({
    }, b.DEFAULTS, 'object' == typeof c && c), c.url || (c.url = e.attr('action')), !c.url) return BJUI.debug('Error trying to submit form action: action url is undefined!'),
    void 0;
    if (c.url = decodeURI(c.url).replacePlh(e.closest('.unitBox')), !c.url.isFinishedTm()) return e.alertmsg('error', c.warn || FRAG.alertPlhMsg.replace('#plhmsg#', BJUI.regional.plhmsg)),
    BJUI.debug('The submit form action is incorrect: ' + c.url),
    void 0;
    if (c.url = encodeURI(c.url), h && h.length) {
      if (f = d.tools.getPagerForm(h, g), i = e.serializeJson(), j = {
      }, c.clearQuery) {
        k = BJUI.pageInfo;
        for (l in k) j[k[l]] = i[k[l]];
        i = j
      }
      d.reloadDiv(h, {
        type: e.attr('method') || 'POST',
        url: c.url,
        data: i,
        loadingmask: c.loadingmask
      })
    } else d.tools.getTarget() == b.NAVTAB ? (h = a.CurrentNavtab, f = d.tools.getPagerForm(h, g), e.navtab('reloadForm', c.clearQuery, c))  : (h = a.CurrentDialog, f = d.tools.getPagerForm(h, g), e.dialog('reloadForm', c.clearQuery, c))
  },
  b.prototype.doLoad = function (c) {
    var d = this,
    e = d.$element,
    f = c.target ? a(c.target)  : null;
    return c = a.extend({
    }, b.DEFAULTS, 'object' == typeof c && c),
    c.url ? (c.url = decodeURI(c.url).replacePlh(e.closest('.unitBox')), c.url.isFinishedTm() ? (c.url = encodeURI(c.url), f && f.length ? (f && f.length && (f.removeData('bjui.clientPaging'), d.reloadDiv(f, c)), void 0)  : (BJUI.debug('Not set loaded \'ajax\' content container, like [data-target].'), void 0))  : (e.alertmsg('error', c.warn || FRAG.alertPlhMsg.replace('#plhmsg#', BJUI.regional.plhmsg)), BJUI.debug('The ajax link incorrect: ' + c.url), void 0))  : (BJUI.debug('Error trying to open a ajax link: The url is undefined!'), void 0)
  },
  b.prototype.refreshLayout = function (c) {
    var d = this,
    f = (d.$element, c.target ? a(c.target)  : null);
    return c = a.extend({
    }, b.DEFAULTS, 'object' == typeof c && c),
    f && f.length ? (f && f.length && (f.removeData('bjui.clientPaging'), d.reloadDiv(f, a.extend({
    }, f.data('options') || {
    }, c))), void 0)  : (BJUI.debug('Not set loaded \'ajax\' content container, like [data-target].'), void 0)
  },
  b.prototype.reloadDiv = function (a, b) {
    a.addClass('bjui-layout').data('options', b).ajaxUrl({
      type: b.type,
      url: b.url,
      data: b.data,
      loadingmask: b.loadingmask,
      callback: function () {
        BJUI.ui.clientPaging && a.data('bjui.clientPaging') && a.pagination('setPagingAndOrderby', a),
        b.callback && b.callback.apply(this, [
          a
        ]),
        a.find('[data-layout-h]').addClass('bjui-layout-h')
      }
    })
  },
  b.prototype.refreshDiv = function (a) {
    var b,
    c;
    if (a && 'string' == typeof a) for (b = a.split(','), c = 0; c < b.length; c++) this.refreshLayout({
      target: '#' + b[c]
    })
  },
  b.prototype.doAjax = function (c) {
    var f,
    g,
    d = this,
    e = d.$element;
    return c = a.extend({
    }, b.DEFAULTS, 'object' == typeof c && c),
    c.url ? (c.url = decodeURI(c.url).replacePlh(e.closest('.unitBox')), c.url.isFinishedTm() ? (c.url = encodeURI(c.url), f = c.callback && c.callback.toFunc(), g = function () {
      e.doAjax({
        type: c.type,
        url: c.url,
        data: c.data,
        callback: f ? f : a.proxy(function (a) {
          d.ajaxCallback(a)
        }, d)
      })
    }, c.confirmMsg ? e.alertmsg('confirm', c.confirmMsg, {
      okCall: function () {
        g()
      }
    })  : g(), void 0)  : (e.alertmsg('error', c.warn || FRAG.alertPlhMsg.replace('#plhmsg#', BJUI.regional.plhmsg)), BJUI.debug('The ajax url is incorrect: ' + c.url), void 0))  : (BJUI.debug('Error trying to open a ajax link: url is undefined!'), void 0)
  },
  b.prototype.doExport = function (c) {
    var g,
    h,
    d = this,
    e = d.$element,
    f = c.target ? a(c.target)  : null;
    return c.url ? (c.url = decodeURI(c.url).replacePlh(e.closest('.unitBox')), c.url.isFinishedTm() ? (h = function () {
      f && f.length || (f = d.tools.getTarget() == b.NAVTAB ? a.CurrentNavtab : a.CurrentDialog),
      g = d.tools.getPagerForm(f),
      g && (c.url = encodeURI(c.url + ( - 1 == c.url.indexOf('?') ? '?' : '&') + a(g).serialize())),
      window.location = c.url
    }, c.confirmMsg ? e.alertmsg('confirm', c.confirmMsg, {
      okCall: function () {
        h()
      }
    })  : h(), void 0)  : (e.alertmsg('error', c.warn || FRAG.alertPlhMsg.replace('#plhmsg#', BJUI.regional.plhmsg)), BJUI.debug('The ajax url is incorrect: ' + c.url), void 0))  : (BJUI.debug('Error trying to open a ajax link: url is undefined!'), void 0)
  },
  b.prototype.doExportChecked = function (c) {
    var g,
    d = this,
    e = d.$element,
    f = c.target ? a(c.target)  : null;
    return c.url ? (c.url = decodeURI(c.url).replacePlh(e.closest('.unitBox')), c.url.isFinishedTm() ? (g = function () {
      var e,
      g;
      return c.group ? (f && f.length || (f = d.tools.getTarget() == b.NAVTAB ? a.CurrentNavtab : a.CurrentDialog), e = [
      ], g = f.find(':checkbox[name=' + c.group + ']:checked'), 0 == g.length ? (d.$element.alertmsg('error', FRAG.alertNotChecked.replace('#notchecked#', BJUI.regional.notchecked)), void 0)  : (g.each(function () {
        e.push(a(this).val())
      }), c.url = c.url.setUrlParam(c.idname ? c.idname : 'ids', e.join(',')), window.location = c.url, void 0))  : (d.$element.alertmsg('error', c.warn || FRAG.alertNoCheckGroup.replace('#nocheckgroup#', BJUI.regional.nocheckgroup)), void 0)
    }, c.confirmMsg ? e.alertmsg('confirm', c.confirmMsg, {
      okCall: function () {
        g()
      }
    })  : g(), void 0)  : (e.alertmsg('error', c.warn || FRAG.alertPlhMsg.replace('#plhmsg#', BJUI.regional.plhmsg)), BJUI.debug('The ajax url is incorrect: ' + c.url), void 0))  : (BJUI.debug('Error trying to open a export link: url is undefined!'), void 0)
  },
  b.prototype.doAjaxChecked = function (c) {
    var g,
    d = this,
    e = d.$element,
    f = c.target ? a(c.target)  : null;
    return c = a.extend({
    }, b.DEFAULTS, 'object' == typeof c && c),
    c.url ? (c.url = decodeURI(c.url).replacePlh(e.closest('.unitBox')), c.url.isFinishedTm() ? (g = function () {
      var g,
      h,
      i;
      return c.group ? (f && f.length || (f = d.tools.getTarget() == b.NAVTAB ? a.CurrentNavtab : a.CurrentDialog), g = [
      ], h = f.find(':checkbox[name=' + c.group + ']:checked'), i = c.callback && c.callback.toFunc(), 0 == h.length ? (e.alertmsg('error', FRAG.alertNotChecked.replace('#notchecked#', BJUI.regional.notchecked)), void 0)  : (h.each(function () {
        g.push(a(this).val())
      }), c.url = c.url.setUrlParam(c.idname ? c.idname : 'ids', g.join(',')), e.doAjax({
        type: c.type,
        url: c.url,
        data: c.data,
        callback: i ? i : a.proxy(function (a) {
          d.ajaxCallback(a)
        }, d)
      }), void 0))  : (e.alertmsg('error', c.warn || FRAG.alertNoCheckGroup.replace('#nocheckgroup#', BJUI.regional.nocheckgroup)), void 0)
    }, c.confirmMsg ? e.alertmsg('confirm', c.confirmMsg, {
      okCall: function () {
        g()
      }
    })  : g(), void 0)  : (e.alertmsg('error', c.warn || FRAG.alertPlhMsg.replace('#plhmsg#', BJUI.regional.plhmsg)), BJUI.debug('The ajax url is incorrect: ' + c.url), void 0))  : (BJUI.debug('Error trying to open a del link: url is undefined!'), void 0)
  },
  d = a.fn.bjuiajax,
  a.fn.bjuiajax = c,
  a.fn.bjuiajax.Constructor = b,
  a.fn.bjuiajax.noConflict = function () {
    return a.fn.bjuiajax = d,
    this
  },
  a(document).on('submit.bjui.bjuiajax.data-api', '[data-toggle="ajaxform"]', function (b) {
    var d = a(this);
    d.isTag('form') && (c.call(d, 'ajaxForm'), b.preventDefault())
  }),
  a(document).on('submit.bjui.bjuiajax.data-api', '[data-toggle="ajaxsearch"]', function (b) {
    var d = a(this),
    e = d.data();
    d.isTag('form') && (c.call(d, 'doSearch', e), b.preventDefault())
  }),
  a(document).on('click.bjui.bjuiajax.data-api', '[data-toggle="reloadsearch"]', function (b) {
    var e,
    d = a(this),
    f = d.closest('form');
    f && f.length && (e = f.data(), e.clearQuery = d.data('clearQuery') || !0, c.call(f, 'doSearch', e), b.preventDefault())
  }),
  a(document).on('click.bjui.bjuiajax.data-api', '[data-toggle="ajaxload"]', function (b) {
    var d = a(this),
    e = d.data();
    e.url || (e.url = d.attr('href')),
    c.call(d, 'doLoad', e),
    b.preventDefault()
  }),
  a(document).on(BJUI.eventType.initUI, function (b) {
    var d = a(b.target).find('[data-toggle="autoajaxload"]');
    d.each(function () {
      var b = a(this),
      d = b.data();
      d.target = this,
      c.call(b, 'doLoad', d)
    })
  }),
  a(document).on('click.bjui.bjuiajax.data-api', '[data-toggle="refreshlayout"]', function () {
    var d = a(this),
    e = d.data();
    c.call(d, 'refreshLayout', e)
  }),
  a(document).on('click.bjui.bjuiajax.data-api', '[data-toggle="doajax"]', function (b) {
    var d = a(this),
    e = d.data();
    e.url || (e.url = d.attr('href')),
    c.call(d, 'doAjax', e),
    b.preventDefault()
  }),
  a(document).on('click.bjui.bjuiajax.data-api', '[data-toggle="doexport"]', function (b) {
    var d = a(this),
    e = d.data();
    e.url || (e.url = d.attr('href')),
    c.call(d, 'doExport', e),
    b.preventDefault()
  }),
  a(document).on('click.bjui.bjuiajax.data-api', '[data-toggle="doexportchecked"]', function (b) {
    var d = a(this),
    e = d.data();
    e.url || (e.url = d.attr('href')),
    c.call(d, 'doExportChecked', e),
    b.preventDefault()
  }),
  a(document).on('click.bjui.bjuiajax.data-api', '[data-toggle="doajaxchecked"]', function (b) {
    var d = a(this),
    e = d.data();
    e.url || (e.url = d.attr('href')),
    c.call(d, 'doAjaxChecked', e),
    b.preventDefault()
  })
}(jQuery);
/**
 * B-JUI: bjui-alertmsg.js v1.0
 * @author K'naan (xknaan@163.com)
 * -- Modified from dwz.alertMsg.js (author:ZhangHuihua@msn.com)
 * http://git.oschina.net/xknaan/B-JUI/blob/master/BJUI/js/bjui-alertmsg.js
 */
+ function (a) {
  'use strict';
  function f(b) {
    var c = arguments,
    d = b;
    return this.each(function () {
      var f = a(this),
      g = a.extend({
      }, e.DEFAULTS, f.data(), 'object' == typeof b && b),
      h = f.data('bjui.alertmsg');
      h || f.data('bjui.alertmsg', h = new e(this, g)),
      'string' == typeof d && a.isFunction(h[d]) && ([].shift.apply(c), c ? h[d].apply(h, c)  : h[d]())
    })
  }
  var b,
  c,
  d,
  e,
  g;
  a(function () {
    var d = function () {
      b = a(FRAG.alertBoxFrag).hide().html(''),
      c = a(FRAG.alertBackground).hide().html(''),
      a('body').append('<!-- alert msg box -->').append(b).append('<!-- alert msg box mask bg -->').append(c)
    };
    d()
  }),
  e = function (b, c) {
    this.$element = a(b),
    this.options = c,
    this.tools = this.TOOLS(),
    this.clearTime = null
  },
  e.DEFAULTS = {
    closeTimer: null,
    types: {
      error: 'error',
      info: 'info',
      warn: 'warn',
      correct: 'correct',
      confirm: 'confirm'
    },
    fas: {
      error: 'fa-times-circle',
      info: 'fa-info-circle',
      warn: 'fa-exclamation-circle',
      correct: 'fa-check-circle',
      confirm: 'fa-question-circle'
    }
  },
  e.prototype.TOOLS = function () {
    var e = this,
    f = {
      getTitle: function (a) {
        return BJUI.regional.alertmsg.title[a]
      },
      keydownOk: function (a) {
        return a.which == BJUI.keyCode.ENTER ? (a.data.target.trigger('click'), !1)  : !0
      },
      keydownEsc: function (a) {
        a.which == BJUI.keyCode.ESC && a.data.target.trigger('click')
      },
      open: function (f, g, h) {
        var l,
        m,
        n,
        o,
        p,
        q,
        i = this,
        j = e.options,
        k = '';
        if (h) for (l = 0; l < h.length; l++) m = h[l].call ? 'callback' : '',
        n = h[l].cls ? h[l].cls : 'default',
        o = h[l].cls && 'green' == h[l].cls ? 'check' : 'close',
        k += FRAG.alertBtnFrag.replace('#btnMsg#', '<i class="fa fa-' + o + '"></i> ' + h[l].name).replace('#callback#', m).replace('#class#', n);
        p = a(FRAG.alertBoxFrag.replace('#type#', f).replace('#fa#', j.fas[f]).replace('#title#', this.getTitle(f)).replace('#message#', g).replace('#btnFragment#', k)).hide().appendTo('body'),
        b && b.length && b.remove(),
        b = p,
        b.css({
          top: - b.outerHeight()
        }).show().animate({
          top: '0px'
        }, 500),
        d && (clearTimeout(d), d = null),
        j.types.info == f || j.types.correct == f ? d = setTimeout(function () {
          i.close()
        }, BJUI.alertTimeout)  : c.show(),
        q = b.find('.btn'),
        q.each(function (b) {
          a(this).on('click', a.proxy(function () {
            e.tools.close(),
            h[b].call && h[b].call()
          }, e)),
          h[b].keyCode == BJUI.keyCode.ENTER && a(document).on('keydown.bjui.alertmsg.ok', {
            target: q.eq(b)
          }, i.keydownOk),
          h[b].keyCode == BJUI.keyCode.ESC && a(document).on('keydown.bjui.alertmsg.esc', {
            target: q.eq(b)
          }, i.keydownEsc)
        })
      },
      alert: function (b, c, d) {
        var e = a.extend({
        }, {
          okName: BJUI.regional.alertmsg.btnMsg.ok,
          okCall: null
        }, d),
        f = [
          {
            name: e.okName,
            call: e.okCall,
            cls: 'default',
            keyCode: BJUI.keyCode.ENTER
          }
        ];
        this.open(b, c, f)
      },
      close: function () {
        a(document).off('keydown.bjui.alertmsg.ok').off('keydown.bjui.alertmsg.esc'),
        b.animate({
          top: - b.height()
        }, 500, function () {
          c.hide(),
          a(this).hide().empty()
        })
      }
    };
    return f
  },
  e.prototype.error = function (a, b) {
    this.tools.alert(this.options.types.error, a, b)
  },
  e.prototype.info = function (a, b) {
    this.tools.alert(this.options.types.info, a, b)
  },
  e.prototype.warn = function (a, b) {
    this.tools.alert(this.options.types.warn, a, b)
  },
  e.prototype.correct = function (a, b) {
    this.tools.alert(this.options.types.correct, a, b)
  },
  e.prototype.confirm = function (b, c) {
    var e,
    d = {
      okName: BJUI.regional.alertmsg.btnMsg.ok,
      okCall: null,
      cancelName: BJUI.regional.alertmsg.btnMsg.cancel,
      cancelCall: null
    };
    a.extend(d, c),
    e = [
      {
        name: d.okName,
        call: d.okCall,
        cls: 'green',
        keyCode: BJUI.keyCode.ENTER
      },
      {
        name: d.cancelName,
        call: d.cancelCall,
        cls: 'red',
        keyCode: BJUI.keyCode.ESC
      }
    ],
    this.tools.open(this.options.types.confirm, b, e)
  },
  g = a.fn.alertmsg,
  a.fn.alertmsg = f,
  a.fn.alertmsg.Constructor = e,
  a.fn.alertmsg.noConflict = function () {
    return a.fn.alertmsg = g,
    this
  },
  a(document).on('click.bjui.alertmsg.data-api', '[data-toggle="alertmsg"]', function (b) {
    var c = a(this),
    d = c.data(),
    e = d.type,
    g = d.msg;
    return e && g ? (f.call(c, e, g, d), b.preventDefault(), void 0)  : !1
  })
}(jQuery);
/**
 * B-JUI: bjui-pagination.js v1.0
 * @author K'naan (xknaan@163.com)
 * -- Modified from dwz.pagination.js (author:ZhangHuihua@msn.com)
 * http://git.oschina.net/xknaan/B-JUI/blob/master/BJUI/js/bjui-pagination.js
 */
+ function (a) {
  'use strict';
  function c(c) {
    var d = arguments,
    e = c;
    return this.each(function () {
      var f = a(this),
      g = a.extend({
      }, b.DEFAULTS, f.data(), 'object' == typeof c && c),
      h = f.data('bjui.pagination');
      h || f.data('bjui.pagination', h = new b(this, g)),
      'string' == typeof e && a.isFunction(h[e]) ? ([].shift.apply(d), d ? h[e].apply(h, d)  : h[e]())  : h.init()
    })
  }
  var d,
  b = function (b, c) {
    this.$element = a(b),
    this.options = c,
    this.tools = this.TOOLS()
  };
  b.DEFAULTS = {
    first: 'li.j-first',
    prev: 'li.j-prev',
    next: 'li.j-next',
    last: 'li.j-last',
    nums: 'li.j-num > a',
    jump: 'li.jumpto',
    pageNumFrag: '<li class="#liClass#"><a href="javascript:;">#pageNum#</a></li>',
    total: 0,
    pageSize: 10,
    pageNum: 10,
    pageCurrent: 1,
    callback: function () {
      return !1
    }
  },
  b.prototype.TOOLS = function () {
    var b = this.options,
    c = {
      pageNums: function () {
        return Math.ceil(b.total / b.pageSize)
      },
      getInterval: function () {
        var a = Math.ceil(b.pageNum / 2),
        c = this.pageNums(),
        d = c - b.pageNum,
        e = this.getCurrentPage() > a ? Math.max(Math.min(this.getCurrentPage() - a, d), 0)  : 0,
        f = this.getCurrentPage() > a ? Math.min(this.getCurrentPage() + a, c)  : Math.min(b.pageNum, c);
        return {
          start: e + 1,
          end: f + 1
        }
      },
      getCurrentPage: function () {
        var a = parseInt(b.pageCurrent);
        return isNaN(a) ? 1 : a
      },
      hasPrev: function () {
        return this.getCurrentPage() > 1
      },
      hasNext: function () {
        return this.getCurrentPage() < this.pageNums()
      }
    };
    return c
  },
  b.prototype.init = function () {
    function n(c, d) {
      c.on('click', function (c) {
        var e = {
          pageCurrent: d,
          pageSize: b.options.pageSize
        };
        b.setClientPaging(e),
        a(this).bjuiajax('pageCallback', e, b.$element.closest('.bjui-layout')),
        c.preventDefault()
      })
    }
    var b,
    c,
    d,
    e,
    f,
    g,
    h,
    i,
    j,
    k,
    l,
    m;
    for (BJUI.ui.clientPaging && !this.getClientPaging() && this.setClientPaging({
      pageCurrent: this.options.pageCurrent,
      pageSize: this.options.pageSize
    }), b = this, c = this.options, d = this.tools, e = d.getInterval(), f = '', g = FRAG.pagination, h = BJUI.regional.pagination, i = e.start; i < e.end; i++) f += c.pageNumFrag.replaceAll('#pageNum#', i).replaceAll('#liClass#', i == d.getCurrentPage() ? 'selected j-num' : 'j-num');
    g = g.replaceAll('#pageNumFrag#', f).replaceAll('#pageCurrent#', d.getCurrentPage()).replaceAll('#first#', h.first).replaceAll('#last#', h.last).replaceAll('#prev#', h.prev).replaceAll('#next#', h.next).replaceAll('#jumpto#', h.jumpto).replaceAll('#jump#', h.jump),
    this.$element.html(g),
    j = this.$element.find(c.first),
    k = this.$element.find(c.prev),
    l = this.$element.find(c.next),
    m = this.$element.find(c.last),
    d.hasPrev() ? (j.add(k).find('> span').hide(), n(k, d.getCurrentPage() - 1), n(j, 1))  : j.add(k).addClass('disabled').find('> a').hide(),
    d.hasNext() ? (l.add(m).find('> span').hide(), n(l, d.getCurrentPage() + 1), n(m, d.pageNums()))  : l.add(m).addClass('disabled').find('> a').hide(),
    this.$element.find(c.nums).each(function (b) {
      n(a(this), b + e.start)
    }),
    this.$element.find(c.jump).each(function () {
      var d = a(this).find(':text'),
      e = a(this).find('.goto');
      e.on('click', function () {
        var e = d.val(),
        f = {
          pageCurrent: e,
          pageSize: c.pageSize
        };
        e && e.isPositiveInteger() && (b.setClientPaging(f), a(this).bjuiajax('pageCallback', f, b.$element.closest('.bjui-layout')))
      }),
      d.keyup(function (a) {
        a.keyCode == BJUI.keyCode.ENTER && e.trigger('click')
      })
    })
  },
  b.prototype.changePagesize = function () {
    var a = this,
    b = a.$element.val(),
    c = {
      pageSize: b
    };
    isNaN(b) || (a.setClientPaging(c), a.$element.bjuiajax('pageCallback', c, a.$element.closest('.bjui-layout')))
  },
  b.prototype.orderBy = function () {
    var c = this;
    c.$element.css({
      cursor: 'pointer'
    }).click(function () {
      var b = a(this).data('orderField'),
      d = a(this).data('orderDirection'),
      e = {
        orderField: b,
        orderDirection: d
      };
      c.setClientPaging(e),
      a(this).bjuiajax('pageCallback', e, c.$element.closest('.bjui-layout'))
    })
  },
  b.prototype.destroy = function () {
    this.$element.removeData('bjui.pagination').empty()
  },
  b.prototype.getTarget = function () {
    var c,
    b = this;
    return c = b.$element.closest('.bjui-layout').length ? b.$element.closest('.bjui-layout')  : b.$element.closest('.navtab-panel').length ? a.CurrentNavtab : a.CurrentDialog
  },
  b.prototype.getClientPaging = function () {
    return this.getTarget().data('bjui.clientPaging')
  },
  b.prototype.setClientPaging = function (b) {
    if (BJUI.ui.clientPaging) {
      var c = this.getTarget();
      c.data('bjui.clientPaging', a.extend({
      }, c.data('bjui.clientPaging') || {
      }, b))
    }
  },
  b.prototype.setClientOrder = function (a) {
    if (BJUI.ui.clientPaging) {
      var b = this.getClientPaging();
      b && b.orderField || this.setClientPaging(a)
    }
  },
  b.prototype.setPagingAndOrderby = function (a) {
    var b = a.data('bjui.clientPaging');
    a.find('[data-toggle="pagination"]').pagination('destroy').pagination(b),
    b.pageSize && a.find('select[data-toggle-change="changepagesize"]').selectpicker('val', b.pageSize),
    b.orderField && a.find('th[data-order-field="' + b.orderField + '"]').addClass(b.orderDirection).siblings().removeClass('asc desc')
  },
  d = a.fn.pagination,
  a.fn.pagination = c,
  a.fn.pagination.Constructor = b,
  a.fn.pagination.noConflict = function () {
    return a.fn.pagination = d,
    this
  },
  a(document).on(BJUI.eventType.initUI, function (b) {
    var d = a(b.target).find('[data-toggle="pagination"]');
    d.length && c.call(d)
  }),
  a(document).on('change.bjui.pagination.data-api', 'select[data-toggle-change="changepagesize"]', function (b) {
    var d = a(this);
    d.data(),
    c.call(d, 'changePagesize'),
    b.preventDefault()
  })
}(jQuery);
/**
 * B-JUI: bjui-util.date.js v1.0
 * @author K'naan (xknaan@163.com)
 * -- Modified from dwz.util.date.js (author:ZhangHuihua@msn.com)
 * http://git.oschina.net/xknaan/B-JUI/blob/master/BJUI/js/bjui-util.date.js
 */
+ function ($) {
  'use strict';
  function LZ(a) {
    return (0 > a || a > 9 ? '' : '0') + a
  }
  function formatDate(a, b) {
    var c,
    d,
    e,
    f,
    g,
    h,
    i,
    j,
    k,
    l,
    m,
    C;
    for (b += '', c = '', d = 0, e = '', f = '', g = a.getYear() + '', h = a.getMonth() + 1, i = a.getDate(), j = a.getDay(), k = a.getHours(), l = a.getMinutes(), m = a.getSeconds(), C = {
    }, g.length < 4 && (g = '' + (g - 0 + 1900)), C['y'] = '' + g, C['yyyy'] = g, C['yy'] = g.substring(2, 4), C['M'] = h, C['MM'] = LZ(h), C['MMM'] = MONTH_NAMES[h - 1], C['NNN'] = MONTH_NAMES[h + 11], C['d'] = i, C['dd'] = LZ(i), C['E'] = DAY_NAMES[j + 7], C['EE'] = DAY_NAMES[j], C['H'] = k, C['HH'] = LZ(k), C['h'] = 0 == k ? 12 : k > 12 ? k - 12 : k, C['hh'] = LZ(C['h']), C['K'] = k > 11 ? k - 12 : k, C['k'] = k + 1, C['KK'] = LZ(C['K']), C['kk'] = LZ(C['k']), C['a'] = k > 11 ? 'PM' : 'AM', C['m'] = l, C['mm'] = LZ(l), C['s'] = m, C['ss'] = LZ(m); d < b.length; ) {
      for (e = b.charAt(d), f = ''; b.charAt(d) == e && d < b.length; ) f += b.charAt(d++);
      c += null != C[f] ? C[f] : f
    }
    return c
  }
  function _isInteger(a) {
    return new RegExp(/^\d+$/).test(a)
  }
  function _getInt(a, b, c, d) {
    var e,
    f;
    for (e = d; e >= c; e--) {
      if (f = a.substring(b, b + e), f.length < c) return null;
      if (_isInteger(f)) return f
    }
    return null
  }
  function parseDate(a, b) {
    var c,
    d,
    e,
    f,
    h,
    i,
    j,
    k,
    l,
    m,
    n,
    o,
    p,
    q,
    r,
    s,
    t;
    for (a += '', b += '', c = 0, d = 0, e = '', f = '', j = new Date(1900, 0, 1), k = j.getYear(), l = j.getMonth() + 1, m = 1, n = j.getHours(), o = j.getMinutes(), p = j.getSeconds(), q = ''; d < b.length; ) {
      for (e = b.charAt(d), f = ''; b.charAt(d) == e && d < b.length; ) f += b.charAt(d++);
      if ('yyyy' == f || 'yy' == f || 'y' == f) {
        if ('yyyy' == f && (h = 4, i = 4), 'yy' == f && (h = 2, i = 2), 'y' == f && (h = 2, i = 4), k = _getInt(a, c, h, i), null == k) return 0;
        c += k.length,
        2 == k.length && (k = k > 70 ? 1900 + (k - 0)  : 2000 + (k - 0))
      } else if ('MMM' == f || 'NNN' == f) {
        for (l = 0, r = 0; r < MONTH_NAMES.length; r++) if (s = MONTH_NAMES[r], a.substring(c, c + s.length).toLowerCase() == s.toLowerCase() && ('MMM' == f || 'NNN' == f && r > 11)) {
          l = r + 1,
          l > 12 && (l -= 12),
          c += s.length;
          break
        }
        if (1 > l || l > 12) return 0
      } else if ('EE' == f || 'E' == f) {
        for (r = 0; r < DAY_NAMES.length; r++) if (t = DAY_NAMES[r], a.substring(c, c + t.length).toLowerCase() == t.toLowerCase()) {
          c += t.length;
          break
        }
      } else if ('MM' == f || 'M' == f) {
        if (l = _getInt(a, c, f.length, 2), null == l || 1 > l || l > 12) return 0;
        c += l.length
      } else if ('dd' == f || 'd' == f) {
        if (m = _getInt(a, c, f.length, 2), null == m || 1 > m || m > 31) return 0;
        c += m.length
      } else if ('hh' == f || 'h' == f) {
        if (n = _getInt(a, c, f.length, 2), null == n || 1 > n || n > 12) return 0;
        c += n.length
      } else if ('HH' == f || 'H' == f) {
        if (n = _getInt(a, c, f.length, 2), null == n || 0 > n || n > 23) return 0;
        c += n.length
      } else if ('KK' == f || 'K' == f) {
        if (n = _getInt(a, c, f.length, 2), null == n || 0 > n || n > 11) return 0;
        c += n.length
      } else if ('kk' == f || 'k' == f) {
        if (n = _getInt(a, c, f.length, 2), null == n || 1 > n || n > 24) return 0;
        c += n.length,
        n--
      } else if ('mm' == f || 'm' == f) {
        if (o = _getInt(a, c, f.length, 2), null == o || 0 > o || o > 59) return 0;
        c += o.length
      } else if ('ss' == f || 's' == f) {
        if (p = _getInt(a, c, f.length, 2), null == p || 0 > p || p > 59) return 0;
        c += p.length
      } else if ('a' == f) {
        if ('am' == a.substring(c, c + 2).toLowerCase()) q = 'AM';
         else {
          if ('pm' != a.substring(c, c + 2).toLowerCase()) return 0;
          q = 'PM'
        }
        c += 2
      } else {
        if (a.substring(c, c + f.length) != f) return 0;
        c += f.length
      }
    }
    if (c != a.length) return 0;
    if (2 == l) if (0 == k % 4 && 0 != k % 100 || 0 == k % 400) {
      if (m > 29) return 0
    } else if (m > 28) return 0;
    return (4 == l || 6 == l || 9 == l || 11 == l) && m > 30 ? 0 : (12 > n && 'PM' == q ? n = n - 0 + 12 : n > 11 && 'AM' == q && (n -= 12), new Date(k, l - 1, m, n, o, p))
  }
  function replaceTmEval(data) {
    return data.replace(RegExp('({[A-Za-z0-9_+-]*})', 'g'), function ($1) {
      return eval('(' + $1.replace(/[{}]+/g, '') + ')')
    })
  }
  var MONTH_NAMES = new Array('January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December', 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'),
  DAY_NAMES = new Array('Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat');
  Date.prototype.formatDate = function (a) {
    return formatDate(this, a)
  },
  String.prototype.parseDate = function (a) {
    return this.length < a.length && (a = a.slice(0, this.length)),
    parseDate(this, a)
  },
  Date.prototype.formatDateTm = function (a) {
    var f,
    g,
    h,
    i,
    b = this.getFullYear(),
    c = this.getMonth() + 1,
    d = this.getDate(),
    e = a.replaceAll('%y', b).replaceAll('%M', c).replaceAll('%d', d);
    return e = replaceTmEval(e),
    f = 1900,
    g = 0,
    h = 1,
    i = e.split('-'),
    i.length > 0 && (f = i[0]),
    i.length > 1 && (g = i[1] - 1),
    i.length > 2 && (h = i[2]),
    new Date(f, g, h).formatDate('yyyy-MM-dd')
  }
}(jQuery);
/**
 * B-JUI: bjui-datepicker.js v1.0
 * reference: util.date.js
 * @author K'naan (xknaan@163.com)
 * -- Modified from dwz.datepicker.js (author:ZhangHuihua@msn.com)
 * http://git.oschina.net/xknaan/B-JUI/blob/master/BJUI/js/bjui-datepicker.js
 */
+ function (a) {
  'use strict';
  function u(b) {
    var c = arguments,
    d = b;
    return this.each(function () {
      var e = a(this),
      f = a.extend({
      }, t.DEFAULTS, e.data(), 'object' == typeof b && b),
      g = e.data('bjui.datepicker');
      g || e.data('bjui.datepicker', g = new t(this, f)),
      'string' == typeof d && a.isFunction(g[d]) ? ([].shift.apply(c), c ? g[d].apply(g, c)  : g[d]())  : g.init()
    })
  }
  var b,
  c,
  d,
  e,
  f,
  g,
  h,
  i,
  j,
  k,
  l,
  m,
  n,
  o,
  p,
  q,
  r,
  s,
  t,
  v;
  a(function () {
    var t = function () {
      var v,
      w,
      t = BJUI.regional.datepicker,
      u = FRAG.calendarFrag.replace('#close#', t.close).replace('#prev#', t.prev).replace('#next#', t.next).replace('#clear#', t.clear).replace('#ok#', t.ok);
      b = a(u).hide(),
      a('body').append('<!-- datepicker -->').append(b),
      c = b.find('> .main'),
      d = b.find('a.prev'),
      e = b.find('a.next'),
      f = b.find('select[name=year]'),
      g = b.find('select[name=month]'),
      h = b.find('.time'),
      i = h.find(':text'),
      j = h.find('ul > li'),
      k = h.find('.hh'),
      l = h.find('.mm'),
      m = h.find('.ss'),
      n = c.find('> .tm'),
      o = b.find('.close'),
      p = c.find('> .body > .days'),
      q = c.find('> .body > .dayNames'),
      r = b.find('.clearBtn'),
      s = b.find('.okBtn'),
      v = '',
      w = BJUI.regional.datepicker,
      a.each(w.dayNames, function (a, b) {
        v += '<dt>' + b + '</dt>'
      }),
      q.html(v),
      a.each(w.monthNames, function (a, b) {
        var c = a + 1;
        g.append('<option value="' + c + '">' + b + '</option>')
      }),
      b.on('selectstart', function () {
        return !1
      })
    };
    t()
  }),
  t = function (b, c) {
    this.$element = a(b),
    this.options = c,
    this.tools = this.TOOLS(),
    this.$dateBtn = null;
    var d = new Date;
    this.options.minDate = d.formatDateTm(this.options.minDate),
    this.options.maxDate = d.formatDateTm(this.options.maxDate),
    this.events = {
      focus_time: 'focus.bjui.datepicker.time',
      click_prev: 'click.bjui.datepicker.prev',
      click_next: 'click.bjui.datepicker.next',
      click_ok: 'click.bjui.datepicker.ok',
      click_days: 'click.bjui.datepicker.days',
      click_clear: 'click.bjui.datepicker.clear',
      click_close: 'click.bjui.datepicker.close',
      click_tm: 'click.bjui.datepicker.tm',
      click_spinner: 'click.bjui.datepicker.spinner',
      mousedown_sp: 'mousedown.bjui.datepicker.spinner',
      mouseup_sp: 'mouseup.bjui.datepicker.spinner',
      change_ym: 'change.bjui.datepicker.ym',
      click_time: 'click.bjui.datepicker.time',
      keydown_time: 'keydown.bjui.datepicker.time',
      keyup_time: 'keyup.bjui.datepicker.time'
    }
  },
  t.DEFAULTS = {
    pattern: 'yyyy-MM-dd',
    minDate: '1900-01-01',
    maxDate: '2099-12-31',
    mmStep: 1,
    ssStep: 1
  },
  t.EVENTS = {
    afterChange: 'afterchange.bjui.datepicker'
  },
  t.prototype.TOOLS = function () {
    var c = this,
    d = {
      changeTmMenu: function (a) {
        n.removeClass('hh').removeClass('mm').removeClass('ss'),
        a && (n.addClass(a), i.removeClass('slt').filter('.' + a).addClass('slt'))
      },
      clickTmMenu: function (b, d) {
        n.find('> ul').hide().filter('.' + d).show().find('> li').off(c.events.click_tm).on(c.events.click_tm, function () {
          var c = a(this),
          d = parseInt(c.text()) < 10 ? '0' + c.text()  : c.text();
          b.val(d)
        })
      },
      keydownInt: function (a) {
        return a.keyCode >= 48 && a.keyCode <= 57 || a.keyCode == BJUI.keyCode.DELETE || a.keyCode == BJUI.keyCode.BACKSPACE ? void 0 : !1
      },
      changeTm: function (a, b) {
        var c = parseInt(a.val()),
        d = parseInt(a.data('start')) || 0,
        e = parseInt(a.data('end')),
        f = parseInt(a.data('step') || 1),
        g = b ? b.data('add') ? b.data('add')  : - 1 : 0,
        h = c;
        1 == g ? e - f >= c && (h = c + f)  : - 1 == g ? c >= d + f && (h = c - f)  : c > e ? h = e : d > c && (h = d),
        10 > h && (h = '0' + h),
        a.val(h)
      },
      closeCalendar: function (e) {
        d.changeTmMenu(),
        e && (a(document).off(c.events.click_close), b.hide())
      },
      get: function (a) {
        return c.options[a]
      },
      getDays: function (a, b) {
        return 2 == b ? a % 4 || !(a % 100) && a % 400 ? 28 : 29 : /4|6|9|11/.test(b) ? 30 : 31
      },
      minMaxDate: function (a) {
        var b = a.split('-').length - 1,
        c = 'y-M-d';
        return 1 == b ? c = 'y-M' : 0 == b && (c = 'y'),
        a.parseDate(c)
      },
      getMinDate: function () {
        return this.minMaxDate(c.options.minDate)
      },
      getMaxDate: function () {
        var e,
        a = c.options.maxDate,
        b = a.split('-').length - 1,
        d = this.minMaxDate(a);
        return 2 > b && (e = this.getDays(d.getFullYear(), d.getMonth() + 1), d.setDate(e), 0 == b && d.setMonth(11)),
        d
      },
      getDateWrap: function (a) {
        var b,
        d,
        e;
        return a || (a = this.parseDate(c.sDate) || new Date),
        b = a.getFullYear(),
        d = a.getMonth() + 1,
        e = this.getDays(b, d),
        {
          year: b,
          month: d,
          day: a.getDate(),
          hour: a.getHours(),
          minute: a.getMinutes(),
          second: a.getSeconds(),
          days: e,
          date: a
        }
      },
      changeDate: function (a, b, d) {
        var e = new Date(a, b - 1, d || 1);
        return c.sDate = this.formatDate(e),
        e
      },
      changeDateTime: function (a, b, d, e, f, g) {
        var h = new Date(a, b - 1, d, e, f, g);
        return c.sDate = this.formatDate(h),
        h
      },
      changeDay: function (a, b) {
        b || (b = 0);
        var c = this.getDateWrap();
        return this.changeDate(c.year, c.month + parseInt(b), a)
      },
      changeMonth: function (a) {
        var b = f.get(0).selectedIndex,
        c = f.find('option').length,
        d = 1 * g.val() + a;
        0 == d ? 0 == b ? d = 1 : (d = 12, b--, f.get(0).selectedIndex = b)  : 13 == d && (b == c - 1 ? d = 12 : (d = 1, b++, f.get(0).selectedIndex = b)),
        g.val(d).change()
      },
      parseDate: function (a) {
        return a ? a.parseDate(c.options.pattern)  : null
      },
      formatDate: function (a) {
        return a.formatDate(c.options.pattern)
      },
      hasHour: function () {
        return - 1 != c.options.pattern.indexOf('H')
      },
      hasMinute: function () {
        return - 1 != c.options.pattern.indexOf('m')
      },
      hasSecond: function () {
        return - 1 != c.options.pattern.indexOf('s')
      },
      hasTime: function () {
        return this.hasHour() || this.hasMinute() || this.hasSecond()
      },
      hasDate: function () {
        var b,
        a = [
          'y',
          'M',
          'd',
          'E'
        ];
        for (b = 0; b < a.length; b++) if ( - 1 != c.options.pattern.indexOf(a[b])) return !0;
        return !1
      },
      afterChange: function (a) {
        c.$element.trigger(t.EVENTS.afterChange, {
          value: a
        })
      }
    };
    return d
  },
  t.prototype.addBtn = function () {
    var d,
    e,
    b = this,
    c = b.$element;
    this.$dateBtn || this.options.addbtn || c.parent().hasClass('wrap_bjui_btn_box') || (this.$dateBtn = a(FRAG.dateBtn), this.$element.css({
      paddingRight: '15px'
    }).wrap('<span class="wrap_bjui_btn_box"></span>'), d = this.$element.parent(), e = this.$element.addClass('form-control').innerHeight(), d.css({
      position: 'relative',
      display: 'inline-block'
    }), this.$dateBtn.css({
      height: e,
      lineHeight: e + 'px'
    }).appendTo(d), this.$dateBtn.on('selectstart', function () {
      return !1
    }))
  },
  t.prototype.init = function () {
    var b,
    h,
    i,
    j,
    n,
    q,
    t,
    u;
    for (this.$element.val() && (this.sDate = this.$element.val().trim()), b = this, this.options, h = this.tools, i = h.getDateWrap(), j = h.getMinDate(), n = h.getMaxDate(), q = j.getFullYear(), t = n.getFullYear(), f.empty(), u = q; t >= u; u++) f.append('<option value="' + u + '"' + (i.year == u ? ' selected' : '') + '>' + u + '</option>');
    g.val(i.month),
    f.add(g).off(this.events.change_ym).on(this.events.change_ym, function () {
      var a,
      c;
      h.hasTime() ? (a = p.find('.slt'), c = h.changeDateTime(f.val(), g.val(), a.data('day'), i.hour, i.minute, i.second), b.create(h.getDateWrap(c), j, n))  : (a = p.find('.slt'), c = h.changeDate(f.val(), g.val(), a.data('day')), b.create(h.getDateWrap(c), j, n))
    }),
    d.off(this.events.click_prev).on(this.events.click_prev, function () {
      b.tools.changeMonth( - 1)
    }),
    e.off(this.events.click_prev).on(this.events.click_prev, function () {
      b.tools.changeMonth(1)
    }),
    r.off(this.events.click_clear).on(this.events.click_clear, function () {
      b.$element.val(''),
      h.closeCalendar(!0)
    }),
    s.off(this.events.click_ok).on(this.events.click_ok, function () {
      var c,
      a = p.find('dd.slt');
      return a.hasClass('disabled') ? !1 : (c = h.changeDay(a.data('day'), a.data('month')), h.hasTime() && (c.setHours(parseInt(k.val())), c.setMinutes(parseInt(l.val())), c.setSeconds(parseInt(m.val()))), h.closeCalendar(!0), b.$element.val(h.formatDate(c)).focus(), h.afterChange(c), void 0)
    }),
    o.off(this.events.click_close).on(this.events.click_close, function () {
      h.closeCalendar(!0)
    }),
    a(document).on(this.events.click_close, function (c) {
      var d = a(c.target);
      c.target != b.$element.get(0) && (d.closest('#calendar').length || ('datepicker' == d.data('toggle') || 'datepickerbtn' == d.parent().data('toggle') || 'datepickerbtn' == d.data('toggle') ? h.closeCalendar(!1)  : h.closeCalendar(!0)))
    }),
    this.create(i, j, n)
  },
  t.prototype.create = function (d, e, f) {
    var u,
    v,
    w,
    x,
    y,
    z,
    A,
    g = this,
    o = this.options,
    q = this.tools,
    r = new Date(d.year, d.month - 1, 1),
    s = r.getDay(),
    t = '';
    if (s > 0) for (r.setMonth(r.getMonth() - 1), u = q.getDateWrap(r), v = u.days - s + 1; v <= u.days; v++) w = new Date(d.year, d.month - 2, v),
    x = w >= e && f >= w ? '' : ' disabled',
    t += '<dd class="other' + x + '" data-month="-1" data-day="' + v + '">' + v + '</dd>';
    for (v = 1; v <= d.days; v++) w = new Date(d.year, d.month - 1, v),
    x = w >= e && f >= w ? '' : 'disabled',
    v == d.day && (x += ' slt'),
    t += '<dd class="' + x + '" data-day="' + v + '">' + v + '</dd>';
    for (v = 1; v <= 42 - s - d.days; v++) w = new Date(d.year, d.month, v),
    x = w >= e && f >= w ? '' : ' disabled',
    t += '<dd class="other' + x + '" data-month="1" data-day="' + v + '">' + v + '</dd>';
    y = p.html(t).find('dd'),
    y.not('.disabled').off(this.events.click_days).on(this.events.click_days, function () {
      var c,
      b = a(this);
      q.hasTime() ? (y.removeClass('slt'), b.addClass('slt'))  : (c = q.changeDay(b.data('day'), b.data('month')), q.closeCalendar(!0), g.$element.val(q.formatDate(c)).focus(), q.afterChange(c))
    }),
    q.hasDate() ? c.removeClass('nodate')  : c.addClass('nodate'),
    q.hasTime() ? (h.show(), k.val(d.hour < 10 ? '0' + d.hour : d.hour).off(this.events.focus_time).on(this.events.focus_time, function () {
      q.changeTmMenu('hh')
    }), z = parseInt(d.minute / o.mmStep) * o.mmStep, l.val(10 > z ? '0' + z : z).data('step', o.mmStep).off(this.events.focus_time).on(this.events.focus_time, function () {
      q.changeTmMenu('mm')
    }), m.val(q.hasSecond() ? d.second < 10 ? '0' + d.second : d.second : '00').data('step', o.ssStep).off(this.events.focus_time).on(this.events.focus_time, function () {
      q.changeTmMenu('ss')
    }), b.off('click').on('click', function (b) {
      a(b.target).closest('.time').length || (n.find('> ul').hide(), q.changeTmMenu())
    }), i.off(this.events.keydown_time).on(this.events.keydown_time, q.keydownInt).each(function () {
      var b = a(this);
      b.off(g.events.keyup_time).on(g.events.keyup_time, function () {
        q.changeTm(b)
      })
    }).off(this.events.click_time).on(this.events.click_time, function () {
      q.clickTmMenu(a(this), a(this).data('type'))
    }), A = null, j.off(this.events.click_spinner).on(this.events.click_spinner, function (b) {
      var c = a(this);
      i.filter('.slt').each(function () {
        q.changeTm(a(this), c)
      }),
      b.preventDefault()
    }).off(this.events.mousedown_sp).on(this.events.mousedown_sp, function () {
      var c = a(this);
      A = setInterval(function () {
        i.filter('.slt').each(function () {
          q.changeTm(a(this), c)
        })
      }, 150)
    }).off(this.events.mouseup_sp).on(this.events.mouseup_sp, function () {
      clearTimeout(A)
    }), q.hasHour() || k.attr('disabled', !0), q.hasMinute() || l.attr('disabled', !0), q.hasSecond() || m.attr('disabled', !0))  : h.hide(),
    this.show()
  },
  t.prototype.show = function () {
    var c = this.$element.offset(),
    d = c.top + this.$element.get(0).offsetHeight,
    e = b.outerHeight(!0);
    d > e && d > a(window).height() - e && (d = c.top - e),
    b.css({
      left: c.left,
      top: d
    }).show().click(function (a) {
      a.stopPropagation()
    })
  },
  v = a.fn.datepicker,
  a.fn.datepicker = u,
  a.fn.datepicker.Constructor = t,
  a.fn.datepicker.noConflict = function () {
    return a.fn.datepicker = v,
    this
  },
  a(document).on(BJUI.eventType.initUI, function (b) {
    var c = a(b.target).find('[data-toggle="datepicker"]');
    c.length && (c.data('nobtn') || u.call(c, 'addBtn'))
  }),
  a(document).on('click.bjui.datepicker.data-api', '[data-toggle="datepickerbtn"]', function (b) {
    var c = a(this).prevAll('[data-toggle="datepicker"]');
    c && c.is(':text') && (u.call(c, c.data()), b.preventDefault())
  }),
  a(document).on('click.bjui.datepicker.data-api', '[data-toggle="datepicker"]', function (b) {
    var c = a(this);
    c.data('onlybtn') || c.is(':text') && (u.call(c, c.data()), b.preventDefault())
  })
}(jQuery);
/**
 * B-JUI: bjui-ajaxtab.js v1.0
 * @author K'naan (xknaan@163.com)
 * http://git.oschina.net/xknaan/B-JUI/blob/master/BJUI/js/bjui-ajaxtab.js
 */
+ function (a) {
  'use strict';
  function c(c) {
    var d = arguments,
    e = c;
    return this.each(function () {
      var f = a(this),
      g = a.extend({
      }, b.DEFAULTS, f.data(), 'object' == typeof c && c),
      h = f.data('bjui.ajaxtab');
      h || f.data('bjui.ajaxtab', h = new b(this, g)),
      'string' == typeof e && a.isFunction(h[e]) ? ([].shift.apply(d), d ? h[e].apply(h, d)  : h[e]())  : h.init()
    })
  }
  var d,
  b = function (b, c) {
    this.$element = a(b),
    this.options = c
  };
  b.DEFAULTS = {
    url: void 0,
    target: void 0,
    reload: !1
  },
  b.prototype.init = function () {
    var b,
    a = this.options;
    return a.url ? (a.url = decodeURI(a.url).replacePlh(this.$element.closest('.unitBox')), a.url.isFinishedTm() ? (a.url = encodeURI(a.url), a.target ? (a.reload ? this.load()  : (b = this.$element.data('bjui.ajaxtab.reload'), b ? this.$element.tab('show')  : this.load()), void 0)  : (BJUI.debug('Ajaxtab Plugin: Attribute \'target\' is not defined!'), void 0))  : (this.$element.alertmsg('error', a.warn || FRAG.alertPlhMsg.replace('#plhmsg#', BJUI.regional.plhmsg)), BJUI.debug('Ajaxtab Plugin: The new ajaxtab\'s url is incorrect, url: ' + a.url), void 0))  : (BJUI.debug('Ajaxtab Plugin: Error trying to open a tab, url is undefined!'), void 0)
  },
  b.prototype.load = function () {
    var b = this.$element,
    c = this.options;
    a(c.target).ajaxUrl({
      url: c.url,
      data: {
      },
      callback: function () {
        b.data('bjui.ajaxtab.reload', !0).tab('show')
      }
    })
  },
  d = a.fn.ajaxtab,
  a.fn.ajaxtab = c,
  a.fn.ajaxtab.Constructor = b,
  a.fn.ajaxtab.noConflict = function () {
    return a.fn.ajaxtab = d,
    this
  },
  a(document).on('click.bjui.ajaxtab.data-api', '[data-toggle="ajaxtab"]', function (b) {
    var d = a(this),
    e = d.data();
    e.url || (e.url = d.attr('href')),
    c.call(d, e),
    b.preventDefault()
  })
}(jQuery);
/**
 * B-JUI: bjui-tablefixed.js v1.0
 * @author K'naan (xknaan@163.com)
 * -- Modified from dwz.stable.js (author:ZhangHuihua@msn.com, Roger Wu)
 * http://git.oschina.net/xknaan/B-JUI/blob/master/BJUI/js/bjui-tablefixed.js
 */
+ function (a) {
  'use strict';
  function c(c) {
    var d = arguments,
    e = c;
    return this.each(function () {
      var f = a(this),
      g = a.extend({
      }, b.DEFAULTS, f.data(), 'object' == typeof c && c),
      h = f.data('bjui.tablefixed');
      h || f.data('bjui.tablefixed', h = new b(this, g)),
      'string' == typeof e && a.isFunction(h[e]) ? ([].shift.apply(d), d ? h[e].apply(h, d)  : h[e]())  : h.init()
    })
  }
  var d,
  b = function (b, c) {
    this.$element = a(b),
    this.options = c,
    this.tools = this.TOOLS()
  };
  b.SCROLLW = 18,
  b.DEFAULTS = {
    width: '100%'
  },
  b.prototype.TOOLS = function () {
    var c = {
      getLeft: function (b) {
        var c = 0;
        return b.prevAll().each(function () {
          c += a(this).outerWidth()
        }),
        c
      },
      getRight: function (b) {
        var c = 0;
        return b.prevAll().andSelf().each(function () {
          c += a(this).outerWidth()
        }),
        c - 1
      },
      getCellNum: function (a) {
        return a.prevAll().andSelf().size()
      },
      getColspan: function (a) {
        return a.attr('colspan') || 1
      },
      getStart: function (b) {
        var c = 1;
        return b.prevAll().each(function () {
          c += parseInt(a(this).attr('colspan') || 1)
        }),
        c
      },
      getPageCoord: function (a) {
        for (var b = {
          x: 0,
          y: 0
        }; a; ) b.x += a.offsetLeft,
        b.y += a.offsetTop,
        a = a.offsetParent;
        return b
      },
      getOffset: function (b, c) {
        var d,
        e,
        f,
        g,
        h,
        i;
        return a.support.leadingWhitespace ? (g = c.target, void 0 == g.offsetLeft && (g = g.parentNode), h = this.getPageCoord(g), i = {
          x: window.pageXOffset + c.clientX,
          y: window.pageYOffset + c.clientY
        }, f = {
          offsetX: i.x - h.x,
          offsetY: i.y - h.y
        })  : (d = b.offset(), e = {
          offsetX: c.pageX || c.screenX,
          offsetY: c.pageY || c.screenY
        }, f = {
          offsetX: e.offsetX - d.left,
          offsetY: e.offsetY - d.top
        })
      }
    };
    return c
  },
  b.prototype.resetWidth = function () {
    var i,
    c = this.$element,
    d = c.width(),
    e = c.find('table'),
    f = e && e.width(),
    g = e.eq(0) && e.eq(0).find('tr:first-child > th'),
    h = e.eq(1) && e.eq(1).find('tr:first-child > td');
    e && d - f < b.SCROLLW && (i = parseInt((d - f) / g.length), e.width(d - b.SCROLLW), g.each(function (b) {
      var c = parseInt(a(this).css('width'));
      a(this).width(c + i),
      h.eq(b) && h.eq(b).width(c + i)
    }))
  },
  b.prototype.init = function () {
    var a,
    b;
    this.$element.isTag('table') && (this.$container = this.$element.parent().addClass('bjui-resizeGrid'), this.$fixed = void 0, a = this.$container.innerWidth(), b = this.options.height, this.$container.hasClass('tab-pane') && (a = this.$container.parent().innerWidth() - 20), this.options.newWidth = 'string' == typeof this.options.width && this.options.width.indexOf('%') ? a * (this.options.width.replace('%', '') / 100)  : parseInt(this.options.width), this.options.styles = [
    ], this.$element.wrap('<div class="bjui-tablefixed clearfix"></div>'), this.$fixed = this.$element.parent(), this.initHead(), this.initBody(), this.resizeCol(), this.resizeGrid(), b && !this.$fixed.closest('.tab-content').length && this.$fixed.height(b).addClass('fixedH'))
  },
  b.prototype.initHead = function () {
    var g,
    h,
    i,
    j,
    k,
    l,
    m,
    n,
    o,
    c = this.options.styles = [
    ],
    d = this.$element.find('thead > tr'),
    e = d.eq(0).find('> th');
    this.$element,
    g = 0,
    h = [
    ],
    i = [
    ],
    j = - 1,
    e.each(function (b) {
      var k,
      c = a(this),
      d = parseInt(c.attr('colspan') || 1),
      e = c.attr('width'),
      f = c.attr('align'),
      g = '';
      for (k = 0; d > k; k++) 1 == d && e && (g = ' width="' + e + '"'),
      f && c.removeAttr('align').addClass(f),
      h.push('<th' + g + '></th>');
      c.attr('colsNum', j += d),
      i[b] = d
    }),
    k = h.length,
    l = a('<tr class="resize-head">' + h.join('') + '</tr>'),
    d.length > 1 && (j = 0, m = d.eq(1).find('> th'), a.each(i, function (a, b) {
      var c,
      d,
      f,
      g,
      h,
      i,
      k;
      if (b = parseInt(b), b > 1) for (c = parseInt(e.eq(a).attr('colsnum')), d = b - 1; d >= 0; d--) f = m.eq(j++),
      g = c - d,
      h = f.attr('width'),
      i = f.attr('align'),
      k = l.find('> th').eq(g),
      f && f.length && f.attr('colsnum', g),
      h && k.attr('width', h),
      i && f.addClass(i).removeAttr('align')
    })),
    this.$fixed.html(this.$element.html()),
    n = this.$fixed.find('thead'),
    n.prepend(l),
    l.find('> th').each(function () {
      var d = a(this),
      e = [
      ],
      f = d.innerWidth();
      e[0] = parseInt(f),
      g += e[0],
      c[c.length] = e
    }),
    g = parseInt((this.options.newWidth - b.SCROLLW - g) / k),
    o = n.find('> tr:eq(0) > th'),
    this.options.$ths = o,
    o.each(function (b) {
      var d = a(this),
      e = c[b],
      f = d.attr('width');
      d.removeAttr('align').width(e[0] + g),
      e[0] = e[0] + g,
      f && (e[0] = parseInt(f), d.width(f).removeAttr('width'))
    }),
    n.find('> tr:gt(0) > th').each(function () {
      var b = a(this);
      b.html('<div class="fixedtableCol">' + b.html() + '</div>')
    }),
    n.wrap('<div class="fixedtableHeader" style="width:' + (this.options.newWidth - b.SCROLLW) + 'px;overflow:hidden;"><div class="fixedtableThead"><table class="table table-bordered" style="width:' + (this.options.newWidth - b.SCROLLW) + 'px; max-width:' + (this.options.newWidth - b.SCROLLW) + 'px;"></table></div></div>'),
    this.$fixed.append('<div class="resizeMarker" style="display:none; height:300px; left:57px;"></div><div class="resizeProxy" style="left:377px; display:none; height:300px;"></div>')
  },
  b.prototype.initBody = function () {
    var c = this.$fixed.find('> tbody'),
    d = ' data-layout-h="' + (this.options.layoutH || 0) + '"';
    this.options.styles,
    this.options.height && (d = 'style="height:' + (this.options.height - this.$fixed.find('.fixedtableHeader').height()) + 'px; overflow-y:auto;"'),
    c.wrap('<div class="fixedtableScroller"' + d + ' style="width:' + this.options.newWidth + 'px;"><div class="fixedtableTbody"><table style="width:' + (this.options.newWidth - b.SCROLLW) + 'px; max-width:' + (this.options.newWidth - b.SCROLLW) + 'px;"></table></div></div>'),
    this.$element.attr('class') ? c.parent().addClass(this.$element.attr('class'))  : c.parent().addClass('table table-striped table-bordered table-hover'),
    'undefined' != typeof this.$element.attr('data-selected-multi') && c.parent().attr('data-selected-multi', this.$element.attr('data-selected-multi')),
    c.before('<thead><tr class="resize-head">' + this.$fixed.find('thead > tr').html() + '</tr></thead>'),
    this.options.$tds = c.prev().find('> tr:first-child > th'),
    this.options.nowrap && c.parent().addClass('nowrap'),
    c.closest('.fixedtableScroller').scroll(function () {
      var c = a(this),
      d = c.scrollLeft(),
      e = c.prev().find('> .fixedtableThead');
      return e.css({
        position: 'relative',
        left: - d
      }),
      !1
    })
  },
  b.prototype.resizeCol = function () {
    var c = this,
    d = this.$fixed,
    e = this.options.$ths,
    f = this.options.$tds,
    g = this.tools;
    d.find('thead > tr:gt(0) > th').each(function () {
      var i = a(this);
      i.mouseover(function (a) {
        var h = parseInt(d.find('.fixedtableThead').css('left')) || 0,
        j = g.getOffset(i, a).offsetX,
        k = e.eq(i.attr('colsnum'));
        return i.outerWidth() - j < 5 ? i.css('cursor', 'col-resize').off('mousedown.bjui.tablefixed.resize').on('mousedown.bjui.tablefixed.resize', function (a) {
          d.find('> .resizeProxy').show().css({
            left: g.getRight(k) + h + d.position().left,
            top: d.position().top,
            height: d.height(),
            cursor: 'col-resize'
          }).basedrag({
            scop: !0,
            cellMinW: 20,
            relObj: d.find('.resizeMarker'),
            move: 'horizontal',
            event: a,
            stop: function () {
              var a = d.find('.resizeProxy').position().left,
              e = d.find('.resizeMarker').position().left,
              h = a - e - k.outerWidth() - 9,
              i = g.getCellNum(k),
              l = (k.width(), k.width() + h),
              m = f.eq(i - 1),
              n = d.find('> .fixedtableHeader .table').width();
              k.width(l),
              m.width(l),
              d.find('.table').width(n + h),
              d.find('.resizeMarker, .resizeProxy').hide(),
              n + h + b.SCROLLW < c.options.newWidth ? d.find('.fixedtableScroller').width(n + h + b.SCROLLW)  : (l = d.closest('.bjui-resizeGrid').innerWidth(), n + h + b.SCROLLW < l && (l = n + h + b.SCROLLW), d.find('.fixedtableHeader').width(l - b.SCROLLW), d.find('.fixedtableScroller').width(l), d.width(l)),
              d.data('resizeGrid', !0)
            }
          }),
          d.find('> .resizeMarker').show().css({
            left: g.getLeft(k) + h + d.position().left,
            top: d.position().top,
            height: d.height()
          })
        })  : i.css('cursor', 'default').off('mousedown.bjui.tablefixed.resize'),
        !1
      })
    })
  },
  b.prototype.setOrderBy = function (b) {
    var c = this.$element,
    d = c.find('.fixedtableCol'),
    e = a(FRAG.orderby.replace('#asc#', BJUI.regional.orderby.asc).replace('#desc#', BJUI.regional.orderby.desc));
    b = b || this.options,
    c.addClass('orderby'),
    b.orderDirection && (BJUI.ui.clientPaging || c.addClass(b.orderDirection), c.pagination('setClientOrder', {
      orderField: b.orderField,
      orderDirection: b.orderDirection
    })),
    d.length || (d = a('<div class="fixedtableCol">' + c.html() + '</div>').appendTo(c.empty())),
    e.data('orderField', b.orderField).appendTo(d).pagination('orderBy')
  },
  b.prototype.resizeGrid = function () {
    var c = this,
    d = function () {
      a('div.bjui-resizeGrid').each(function () {
        var g,
        d = a(this),
        e = a(this).innerWidth(),
        f = c.options.newWidth;
        e && d.find('.bjui-tablefixed').each(function () {
          var c = a(this);
          g = c.data('resizeGrid') ? f : e,
          c.width(g),
          c.find('.table').width(g - b.SCROLLW),
          c.find('.fixedtableHeader').width(g - b.SCROLLW),
          c.find('.fixedtableScroller').width(g)
        })
      })
    };
    a(window).off(BJUI.eventType.resizeGrid).on(BJUI.eventType.resizeGrid, d)
  },
  d = a.fn.tablefixed,
  a.fn.tablefixed = c,
  a.fn.tablefixed.Constructor = b,
  a.fn.tablefixed.noConflict = function () {
    return a.fn.tablefixed = d,
    this
  },
  a(document).on(BJUI.eventType.initUI, function (b) {
    var d = a(b.target).find('table[data-toggle="tablefixed"]');
    d.length && c.call(d)
  }),
  a(document).on(BJUI.eventType.afterInitUI, function (b) {
    var d = a(b.target).find('th[data-order-field]');
    d.length && c.call(d, 'setOrderBy')
  }),
  a(document).on('click.bjui.tr.data-api', 'tr[data-id]', function () {
    var c = a(this),
    d = c.closest('table'),
    e = d.data('selectedMulti'),
    f = c.data('id'),
    g = 'selected',
    h = d.closest('.unitBox').find('#bjui-selected');
    c.toggleClass(g),
    e ? (f = [
    ], c.siblings('.' + g).add(c.hasClass(g) ? c : '').each(function () {
      f.push(a(this).data('id'))
    }), f = f.join(','))  : c.siblings().removeClass(g),
    h && h.length ? h.val(f)  : (h = a('<input type="hidden" id="bjui-selected" value="' + f + '">'), h.appendTo(d.closest('.unitBox')))
  })
}(jQuery);
/**
 * B-JUI: bjui-tabledit.js v1.0
 * @author K'naan (xknaan@163.com)
 * -- Modified from dwz.database.js (author:ZhangHuihua@msn.com)
 * http://git.oschina.net/xknaan/B-JUI/blob/master/BJUI/js/bjui-tabledit.js
 */
+ function (a) {
  'use strict';
  function c(c) {
    var d = arguments,
    e = c;
    return this.each(function () {
      var f = a(this),
      g = a.extend({
      }, b.DEFAULTS, f.data(), 'object' == typeof c && c),
      h = f.data('bjui.tabledit');
      h || f.data('bjui.tabledit', h = new b(this, g)),
      'string' == typeof e && a.isFunction(h[e]) ? ([].shift.apply(d), d ? h[e].apply(h, d)  : h[e]())  : h.init()
    })
  }
  var d,
  b = function (b, c) {
    this.$element = a(b),
    this.options = c,
    this.tools = this.TOOLS(),
    this.$tbody = this.$element.find('> tbody'),
    this.$tbody.length || (this.$tbody = a('<tbody></tbody'), this.$element.append(this.$tbody)),
    this.$numAdd = this.$btnAdd = null
  };
  b.DEFAULTS = {
  },
  b.EVENTS = {
    afterDelete: 'afterdelete.bjui.tabledit'
  },
  b.prototype.TOOLS = function () {
    var c = this,
    d = {
      initSuffix: function (b) {
        var c = b.find('> tr');
        c.each(function (b) {
          var c = a(this);
          c.find(':input, :file, a, label, div').each(function () {
            var k,
            c = a(this),
            d = c.attr('name'),
            e = c.val(),
            f = c.attr('for'),
            g = c.attr('id'),
            h = c.attr('href'),
            i = c.attr('data-group'),
            j = c.attr('data-suffix');
            d && c.attr('name', d.replaceSuffix(b)),
            f && c.attr('for', f.replaceSuffix(b)),
            g && c.attr('id', g.replaceSuffix(b).replaceSuffix2(b)),
            h && c.attr('href', h.replaceSuffix(b)),
            i && c.attr('data-group', i.replaceSuffix(b)),
            j && c.attr('data-suffix', j.replaceSuffix(b)),
            e && e.indexOf('#index#') >= 0 && c.val(e.replace('#index#', b + 1)),
            c.hasClass('no') && (k = c.data('prefix') ? c.data('prefix')  : '', c.val(k + (b + 1)))
          })
        })
      },
      initEnter: function (b) {
        var c = b.find(':text');
        c.each(function (b) {
          a(this).bind('keydown', function (a) {
            if (a.which == BJUI.keyCode.ENTER) {
              var d = b + 1;
              c.eq(d) && c.eq(d).focus(),
              a.preventDefault()
            }
          })
        }),
        this.initInput(b)
      },
      initInput: function (b) {
        b.find('> tr > td').each(function () {
          var b = a(this).find('.input-hold');
          b.length || (b = a('<span class="input-hold" style="display:block; padding:0 4px; height:0px; font-size:12px; visibility:hidden;"></span>'), a(this).append(b)),
          a.support.leadingWhitespace ? a(this).on('input', ':text', function () {
            b.text(a(this).val())
          })  : a(this).on('propertychange', ':text', function () {
            b.text(a(this).val())
          })
        })
      },
      initTbody: function () {
        function e(b) {
          b.removeClass('readonly').find('> td *').each(function () {
            var b = a(this),
            c = b.closest('td'),
            d = c.data('val'),
            e = b.attr('data-toggle-old');
            if ('undefined' == typeof d && (d = c.html()), c.data('notread')) return !0;
            if (b.isTag('select') && b.val(c.attr('data-val')).selectpicker('refresh').nextAll('.bootstrap-select').removeClass('readonly').find('button').removeClass('disabled'), b.is(':checkbox') && (b.val(c.attr('data-val')).closest('.icheckbox_minimal-purple').removeClass('disabled'), b.closest('.icheckbox_minimal-purple').find('ins').removeClass('readonly')), b.is(':radio') && (b.val(c.attr('data-val')).closest('.iradio_minimal-purple').removeClass('disabled'), b.closest('.iradio_minimal-purple').find('ins').removeClass('readonly')), e) {
              if ('dosave' == e) return !0;
              b.removeAttr('data-toggle-old').attr('data-toggle', e),
              'spinner' == e && b.spinner('destroy').spinner()
            }(b.is(':text') || b.is('textarea')) && b.off('keydown.readonly'),
            b.find('.bjui-lookup, .bjui-spinner, .bjui-upload').show()
          }),
          b.find('[data-toggle="doedit"]').attr('data-toggle', 'dosave').text('完成')
        }
        function f(b) {
          b.addClass('readonly').find('> td *').each(function () {
            var b = a(this),
            c = b.closest('td'),
            d = b.attr('data-toggle');
            if (c.data('notread')) return !0;
            if (b.isTag('select') && b.nextAll('.bootstrap-select').addClass('readonly').find('button').addClass('disabled'), b.is(':checkbox') && (b.closest('.icheckbox_minimal-purple').addClass('disabled'), b.closest('.icheckbox_minimal-purple').find('ins').addClass('readonly')), b.is(':radio') && (b.closest('.iradio_minimal-purple').addClass('disabled'), b.closest('.iradio_minimal-purple').find('ins').addClass('readonly')), d) {
              if ('doedit' == d || 'dosave' == d) return !0;
              b.removeAttr('data-toggle').attr('data-toggle-old', d)
            }(b.is(':text') || b.is('textarea')) && b.on('keydown.readonly', function (a) {
              a.preventDefault()
            }),
            b.find('.bjui-lookup, .bjui-spinner, .bjui-upload').hide()
          }),
          b.find('[data-toggle="dosave"]').attr('data-toggle', 'doedit').text('编辑')
        }
        var b = c.$element,
        d = c.$tbody;
        d.find('> tr').each(function () {
          var g = a(this),
          h = g.find('> td'),
          i = b.data('bjui.tabledit.tr').clone().find('> th');
          g.data('bjui.tabledit.oldTds', g.html()),
          i.each(function (b) {
            var c = h.eq(b),
            d = c.data('val'),
            e = a(this),
            f = e.children(),
            g = e.find('.pic-box');
            'undefined' == typeof d && (d = c.html()),
            c.data('noedit') || f.length && (f.is('input:checkbox') || f.is('input:radio') ? f.filter('[value="' + d + '"]').attr('checked', 'checked')  : f.isTag('select') ? f.find('option[value="' + c.data('val') + '"]').attr('selected', 'selected')  : g.length ? (c.data('val') && e.find('.pic-name').val(c.data('val')), g.html(c.html()))  : f.hasClass('wrap_bjui_btn_box') ? f.find('input[data-toggle]').attr('value', d + '')  : f.attr('value', d + ''), c.html(e.html()))
          }),
          g.on('dblclick', a.proxy(function () {
            e(g)
          }, c)).initui(),
          c.tools.initSuffix(d),
          f(g)
        }),
        d.on('click.bjui.tabledit.readonly', '[data-toggle="doedit"]', function () {
          e(a(this).closest('tr'))
        }).on('click.bjui.tabledit.readonly', '[data-toggle="dosave"]', function () {
          var h,
          i,
          e = a(this).closest('tr'),
          g = c.options.callback;
          c.options.action ? (e.wrap('<form action="" method="POST"></form>'), e.attr('data-id') && (h = b.find('> thead > tr:eq(0)').data('idname') || 'id', e.before('<input type="hidden" name="' + h.replaceSuffix(e.index()) + '" value="' + e.attr('data-id') + '">')), i = e.parent().serializeArray(), e.prev('input').remove(), e.unwrap().isValid(function (a) {
            a && (g = g ? g.toFunc()  : function (a) {
              a[BJUI.keys.statusCode] == BJUI.statusCode.ok ? f(e)  : e.bjuiajax('ajaxDone', a)
            }, e.bjuiajax('doAjax', {
              url: c.options.action,
              data: i,
              type: c.options.type || 'POST',
              callback: g
            }))
          }))  : f(e)
        }),
        c.tools.initEnter(d)
      },
      doAdd: function () {
        var b = c.$element;
        c.$numAdd && c.$btnAdd && b.on('keydown.bjui.tabledit.add', 'thead .num-add', function (a) {
          a.which == BJUI.keyCode.ENTER && (c.$btnAdd.trigger('click.bjui.tabledit.add'), a.preventDefault())
        }).on('click.bjui.tabledit.add', 'thead .row-add', function (a) {
          var d = 1;
          isNaN(c.$numAdd.val()) || (d = parseInt(c.$numAdd.val())),
          c.add(b, d),
          a.preventDefault()
        })
      },
      doDel: function (b) {
        var c = this,
        d = 'click.bjui.tabledit.del';
        b.off(d).on(d, '.row-del', function (b) {
          var d = a(this);
          d.data('confirmMsg') ? d.alertmsg('confirm', d.data('confirmMsg'), {
            okCall: function () {
              c.delData(d)
            }
          })  : c.delData(d),
          b.preventDefault()
        })
      },
      delData: function (a) {
        var b = this,
        d = a.closest('tbody'),
        e = a.data(),
        f = function (f) {
          a.closest('tr').remove(),
          b.initSuffix(d),
          b.afterDelete(d),
          e.callback && e.callback.toFunc().apply(c, [
            f
          ])
        };
        a.is('[href^=javascript:]') || a.is('[href^="#"]') ? a.data('confirmMsg') ? a.alertmsg('confirm', a.data('confirmMsg'), {
          okCall: function () {
            f()
          }
        })  : f()  : a.bjuiajax('doAjax', {
          url: a.attr('href'),
          data: e.data,
          callback: f
        })
      },
      afterDelete: function (d) {
        var e = a.Event(b.EVENTS.afterDelete, {
          relatedTarget: d[0]
        });
        c.$element.trigger(e),
        e.isDefaultPrevented()
      }
    };
    return d
  },
  b.prototype.init = function () {
    var b = this,
    c = this.tools,
    d = this.$element.addClass('bjui-tabledit'),
    e = d.find('> thead > tr:first'),
    f = this.$tbody,
    g = d.find('> thead > tr:first').html();
    e.find('> th').each(function () {
      var f,
      c = a(this),
      d = c.attr('title'),
      e = c.data('addtool');
      d && c.html(d),
      e && (f = a('<span style="position:relative;"></span>'), c.empty(), b.$numAdd = a('<input type="text" value="1" class="form-control num-add" size="2" title="待添加的行数">'), b.$btnAdd = a('<a href="javascript:;" class="row-add" title="添加行"><i class="fa fa-plus-square"></i></a>'), f.append(b.$numAdd).append(b.$btnAdd).appendTo(c))
    }),
    d.data('bjui.tabledit.tr', a('<tr>' + g + '</tr>')),
    c.initTbody(),
    c.doAdd(),
    c.doDel(f)
  },
  b.prototype.add = function (b, c) {
    var f,
    h,
    i,
    j,
    d = this.tools,
    e = b.find('> tbody'),
    g = b.data('bjui.tabledit.tr');
    for (h = 0; c > h; h++) g.find('> th').each(function () {
      a(this).replaceWith('<td>' + a(this).html() + '</td>')
    }),
    i = g.clone(),
    0 == h && (f = i),
    i.hide().appendTo(e),
    d.initSuffix(e),
    d.initEnter(e),
    i.show().css('display', '').initui();
    f && f.length && (j = f.find(':text'), j.each(function () {
      var b = a(this);
      return b.prop('readonly') ? void 0 : (b.focus(), !1)
    }))
  },
  d = a.fn.tabledit,
  a.fn.tabledit = c,
  a.fn.tabledit.Constructor = b,
  a.fn.tabledit.noConflict = function () {
    return a.fn.tabledit = d,
    this
  },
  a(document).on(BJUI.eventType.initUI, function (b) {
    var d = a(b.target).find('table[data-toggle="tabledit"]');
    d.length && c.call(d)
  }),
  a(document).on(BJUI.eventType.afterInitUI, function (b) {
    var d = a(b.target).find('table[data-toggle="tabledit"]');
    d.each(function () {
      if (a(this).is('[data-initnum]')) {
        var b = a(this).data('initnum');
        b > 0 && c.call(a(this), 'add', a(this), b)
      }
    })
  }),
  a(document).on('click.bjui.tabledit.data-api', '[data-toggle="tableditadd"]', function (b) {
    var d = a(this),
    e = d.data('num') || 1,
    f = d.data('target');
    f && a(f).length && a(f).isTag('table') && (c.call(d, 'add', a(f), e), b.preventDefault())
  })
}(jQuery);
/**
 * B-JUI: bjui-spinner.js v1.0
 * @author K'naan (xknaan@163.com)
 * http://git.oschina.net/xknaan/B-JUI/blob/master/BJUI/js/bjui-spinner.js
 */
+ function (a) {
  'use strict';
  function c(c) {
    var d = arguments,
    e = c;
    return this.each(function () {
      var f = a(this),
      g = a.extend({
      }, b.DEFAULTS, f.data(), 'object' == typeof c && c),
      h = f.data('bjui.spinner');
      h || f.data('bjui.spinner', h = new b(this, g)),
      'string' == typeof e && a.isFunction(h[e]) ? ([].shift.apply(d), d ? h[e].apply(h, d)  : h[e]())  : h.init()
    })
  }
  var d,
  b = function (b, c) {
    this.$element = a(b),
    this.options = c,
    this.tools = this.TOOLS(),
    this.$spinner = null,
    this.height = this.$element.addClass('form-control').innerHeight(),
    this.ivalue = Number(this.$element.val()) || 0
  };
  b.DEFAULTS = {
    min: 0,
    max: 100,
    step: 1,
    decimalPlace: 0
  },
  b.EVENTS = {
    afterChange: 'afterchange.bjui.spinner'
  },
  b.prototype.TOOLS = function () {
    var a = this,
    c = {
      changeVal: function (c) {
        var d = a.$element,
        e = Number(d.val()) || Number(a.ivalue),
        f = c.data('add') || - 1,
        g = a.options.min,
        h = a.options.max,
        i = a.options.step;
        1 == f ? h - i >= e && (e += i)  : - 1 == f ? e >= g + i && (e -= i)  : e > h ? e = h : g > e && (e = g),
        a.options.decimalPlace && (e = new String(e.toFixed(a.options.decimalPlace))),
        a.ivalue = e,
        d.val(e).trigger(b.EVENTS.afterChange, {
          value: e
        })
      }
    };
    return c
  },
  b.prototype.init = function () {
    return this.$element,
    this.options,
    isNaN(this.options.min) || isNaN(this.options.max) || isNaN(this.options.step) ? (BJUI.debug('Spinner Plugin: Parameter is non-numeric type!'), void 0)  : (this.addBtn(), void 0)
  },
  b.prototype.addBtn = function () {
    var d,
    e,
    b = this,
    c = b.$element;
    this.$lookBtn || c.parent().hasClass('wrap_bjui_btn_box') || (this.$spinner = a(FRAG.spinnerBtn), c.css({
      paddingRight: '13px'
    }).wrap('<span class="wrap_bjui_btn_box"></span>'), d = c.parent(), d.css('position', 'relative'), this.$spinner.css({
      height: this.height
    }).appendTo(d), this.$spinner.on('selectstart', function () {
      return !1
    }), e = null, b.$spinner.find('li').on('click', function () {
      b.tools.changeVal(a(this))
    }).on('mousedown', function () {
      var c = a(this);
      e = setInterval(function () {
        b.tools.changeVal(c)
      }, 150)
    }).on('mouseup', function () {
      clearTimeout(e)
    }))
  },
  b.prototype.destroy = function () {
    this.$element.parent().hasClass('wrap_bjui_btn_box') && (this.$element.parent().find('.bjui-spinner').remove(), this.$element.unwrap())
  },
  d = a.fn.spinner,
  a.fn.spinner = c,
  a.fn.spinner.Constructor = b,
  a.fn.spinner.noConflict = function () {
    return a.fn.spinner = d,
    this
  },
  a(document).on(BJUI.eventType.initUI, function (b) {
    var d = a(b.target).find('input[data-toggle="spinner"]');
    d.length && c.call(d)
  })
}(jQuery);
/**
 * B-JUI: bjui-lookup.js v1.0
 * @author K'naan (xknaan@163.com)
 * -- Modified from dwz.database.js (author:ZhangHuihua@msn.com)
 * http://git.oschina.net/xknaan/B-JUI/blob/master/BJUI/js/bjui-lookup.js
 */
+ function (a) {
  'use strict';
  function f(b) {
    var c = arguments,
    d = b;
    return this.each(function () {
      var f = a(this),
      g = a.extend({
      }, e.DEFAULTS, f.data(), 'object' == typeof b && b),
      h = f.data('bjui.lookup');
      h ? f.data('newurl') && (h.options.url = f.data('newurl'), f.data('bjui.dialog', null))  : f.data('bjui.lookup', h = new e(this, g)),
      'string' == typeof d && a.isFunction(h[d]) ? ([].shift.apply(c), c ? h[d].apply(h, c)  : h[d]())  : h.init()
    })
  }
  var b,
  c,
  d,
  g,
  e = function (b, c) {
    this.$element = a(b),
    this.options = c,
    this.$lookBtn = null
  };
  e.DEFAULTS = {
    url: null,
    id: null,
    mask: !0,
    width: 600,
    height: 400,
    title: 'Lookup',
    maxable: !0,
    resizable: !0
  },
  e.EVENTS = {
    afterChange: 'afterchange.bjui.lookup'
  },
  e.prototype.init = function () {
    var a = this,
    e = this.options;
    return this.tools,
    e.url ? (e.url = decodeURI(e.url).replacePlh(a.$element.closest('.unitBox')), e.url.isFinishedTm() ? (e.url = encodeURI(e.url), b = this.options.group || null, c = this.options.suffix || null, d = this.$element, c && (c = c.trim()), this.open(a.$element), void 0)  : (a.$element.alertmsg('error', e.warn || FRAG.alertPlhMsg.replace('#plhmsg#', BJUI.regional.plhmsg)), BJUI.debug('Lookup Plugin: The lookup\'s url is incorrect, url:' + e.url), !1))  : (BJUI.debug('Lookup Plugin: Error trying open a lookup dialog, url is undefined!'), !1)
  },
  e.prototype.addBtn = function () {
    var d,
    e,
    b = this,
    c = b.$element;
    this.$lookBtn || c.parent().hasClass('wrap_bjui_btn_box') || (this.$lookBtn = a(FRAG.lookupBtn), this.$element.css({
      paddingRight: '15px'
    }).wrap('<span class="wrap_bjui_btn_box"></span>'), d = this.$element.parent(), e = this.$element.addClass('form-control').innerHeight(), d.css({
      position: 'relative',
      display: 'inline-block'
    }), a.each(b.options, function (a, c) {
      'toggle' != a && b.$lookBtn.attr('data-' + a, c)
    }), this.$lookBtn.css({
      height: e,
      lineHeight: e + 'px'
    }).appendTo(d), this.$lookBtn.on('selectstart', function () {
      return !1
    }))
  },
  e.prototype.open = function (a) {
    var c = this.options;
    a.dialog({
      id: c.id || 'lookup_dialog',
      url: c.url,
      title: c.title,
      width: c.width,
      height: c.height,
      mask: c.mask,
      maxable: c.maxable,
      resizable: c.resizable
    })
  },
  e.prototype.getField = function (a) {
    return (b ? b + '.' : '') + a + (c ? c : '')
  },
  e.prototype.setSingle = function (a, b) {
    'string' == typeof a && (a = new Function('return ' + a) ()),
    this.setVal(a, b)
  },
  e.prototype.setMult = function (b, c) {
    var d = {
    },
    e = this.$element.closest('.unitBox');
    return e.find('[name="' + b + '"]').filter(':checked').each(function () {
      var c,
      e,
      b = new Function('return ' + a(this).val()) ();
      for (c in b) e = d[c] ? d[c] + ',' : '',
      d[c] = e + b[c]
    }),
    a.isEmptyObject(d) ? (this.$element.alertmsg('error', this.$element.data('warn') || FRAG.alertSelectMsg), void 0)  : (this.setVal(d, c), void 0)
  },
  e.prototype.setVal = function (b, c) {
    var h,
    f = this,
    g = d.closest('.unitBox');
    g.find(':input').each(function () {
      var i,
      j,
      d = a(this),
      g = d.attr('name');
      for (i in b) if (j = f.getField(i), j == g) {
        h = 1 == c ? d.val() ? d.val() + ',' + b[i] : b[i] : b[i],
        d.val(h).trigger(e.EVENTS.afterChange, {
          value: b[i]
        });
        break
      }
    }),
    this.$element.dialog('closeCurrent')
  },
  g = a.fn.lookup,
  a.fn.lookup = f,
  a.fn.lookup.Constructor = e,
  a.fn.lookup.noConflict = function () {
    return a.fn.lookup = g,
    this
  },
  a(document).on(BJUI.eventType.initUI, function (b) {
    var c = a(b.target).find('[data-toggle="lookup"]');
    c.length && f.call(c, 'addBtn')
  }),
  a(document).on('click.bjui.lookup.data-api', '[data-toggle="lookupbtn"]', function (b) {
    var c = a(this);
    c.attr('href') && !c.data('url') && c.attr('data-url', c.attr('href')),
    c.data('title') || c.attr('data-title', c.text()),
    f.call(c),
    b.preventDefault()
  }),
  a(document).on('click.bjui.lookupback.data-api', '[data-toggle="lookupback"]', function (b) {
    var c = a(this),
    d = c.data('args'),
    e = c.data('lookupid'),
    g = a('input[name="lookupType"]:checked').val();
    d ? f.call(c, 'setSingle', d, g)  : e && f.call(c, 'setMult', e, g),
    b.preventDefault()
  })
}(jQuery);
/**
 * B-JUI: bjui-tags.js v1.0
 * @author K'naan (xknaan@163.com)
 * http://git.oschina.net/xknaan/B-JUI/blob/master/BJUI/js/bjui-tags.js
 */
+ function (a) {
  'use strict';
  function c(c) {
    var d = arguments,
    e = c;
    return this.each(function () {
      var f = a(this),
      g = a.extend({
      }, b.DEFAULTS, f.data(), 'object' == typeof c && c),
      h = f.data('bjui.tags');
      h || f.data('bjui.tags', h = new b(this, g)),
      'string' == typeof e && a.isFunction(h[e]) ? ([].shift.apply(d), d ? h[e].apply(h, d)  : h[e]())  : h.init()
    })
  }
  var d,
  b = function (b, c) {
    this.$element = a(b).addClass('tag-input'),
    this.options = c,
    this.tools = this.TOOLS(),
    this.$box = a(this.$element.wrap('<div class="bjui-tags"></div>')).parent(),
    this.timeout = null,
    this.$tagsArr = {
    },
    this.tags = [
    ]
  };
  b.DEFAULTS = {
    width: 300,
    url: '',
    global: !1,
    type: 'GET',
    tagname: 'tag',
    max: 0,
    clear: !1,
    lightCls: 'tags-highlight'
  },
  b.EVENTS = {
    afterCreated: 'aftercreated.bjui.tags'
  },
  b.prototype.TOOLS = function () {
    var c = this,
    d = this.options,
    e = {
      keyDown: function (a) {
        return 13 == a.which ? !1 : void 0
      },
      keyUp: function (b) {
        var e,
        f,
        g,
        h,
        i,
        j,
        k,
        l,
        m,
        n;
        switch (b.which) {
          case BJUI.keyCode.BACKSPACE:
            if (0 == a.trim(c.$element.val()).length) return c.tools.removeMenu(),
            !1;
            break;
          case BJUI.keyCode.ESC:
            c.tools.removeMenu();
            break;
          case BJUI.keyCode.DOWN:
            if (!c.$menu || !c.$menu.length) return;
            return e = c.$menu.find('> .' + d.lightCls),
            f = c.$menu.find('> li:first-child'),
            e.length ? (g = e.removeClass(d.lightCls).next(), g.length ? g.addClass(d.lightCls)  : f.addClass(d.lightCls))  : f.addClass(d.lightCls),
            !1;
          case BJUI.keyCode.UP:
            if (!c.$menu || !c.$menu.length) return;
            return e = c.$menu.find('> .' + d.lightCls),
            h = c.$menu.find('> li:last-child'),
            e.length ? (i = e.removeClass(d.lightCls).prev(), i.length ? i.addClass(d.lightCls)  : h.addClass(d.lightCls))  : h.addClass(d.lightCls),
            !1;
          case BJUI.keyCode.ENTER:
            if (d.max > 0 && c.$tagsArr.length >= d.max) return !1;
            if (j = !1, k = !1, l = null, m = c.$menu && c.$menu.find('> .' + d.lightCls), m && m.length) j = m.text(),
            l = m.data('item'),
            k = l.value;
             else {
              if (j = a.trim(c.$element.val()), !j.length) return !1;
              if (d.clear && - 1 == a.inArray(j, c.tags)) return c.$element.val(''),
              !1;
              k = j
            }
            if (!j) return;
            return n = !1,
            c.$tagsArr.length && c.$tagsArr.each(function () {
              return a(this).val() == k ? (n = !0, void 0)  : void 0
            }),
            n ? (c.$element.val(''), !1)  : (c.tools.createTag(j, k), c.tools.removeMenu(), c.$element.val(''), a.proxy(c.tools.onAfterCreated(l, k), c), !1)
        }
      },
      query: function () {
        c.timeout && clearTimeout(c.timeout),
        c.timeout = setTimeout(c.tools.doQuery, 300)
      },
      doQuery: function () {
        var b,
        e,
        f,
        g,
        h;
        d.max > 0 && c.$tagsArr.length >= d.max || (b = c.$element.val(), e = c.$box.find('> .tags-menu'), f = [
        ], g = null, h = c.$element.closest('.navtab-panel').length ? a.CurrentNavtab : a.CurrentDialog, c.$element.closest('.bjui-layout').length && (h = c.$element.closest('.bjui-layout')), 0 != b.length && (c.$element.one('ajaxStart', function () {
          h.trigger('bjui.ajaxStart')
        }).one('ajaxStop', function () {
          h.trigger('bjui.ajaxStop')
        }), a.ajax({
          url: d.url,
          global: d.global,
          type: d.type,
          data: {
            term: b
          },
          dataType: 'json',
          success: function (b) {
            if (0 != b.length) {
              e.length || (e = a('<ul class="tags-menu"></ul>')),
              e.empty().hide().appendTo(c.$box);
              for (var h = 0; h < b.length; h++) g = a('<li class="tags-item">' + b[h].label + '</li>').data('item', b[h]),
              g.appendTo(e),
              f.push(b[h].label);
              c.tags = f,
              e.css({
                top: c.$element.position().top + c.$element.outerHeight(),
                left: c.$element.position().left
              }).fadeIn().find('> li').hover(function () {
                a(this).addClass(d.lightCls).siblings().removeClass(d.lightCls)
              }, function () {
                a(this).removeClass(d.lightCls)
              }).click(function () {
                var b = a(this).text(),
                d = a(this).data('item'),
                f = d.value,
                g = !1;
                return c.$box.find('input:hidden').each(function () {
                  return a(this).val() == f ? (g = !0, void 0)  : void 0
                }),
                g ? (c.$element.val(''), e.remove(), void 0)  : (a.proxy(c.tools.createTag(b, f), c), e.remove(), c.$element.val(''), a.proxy(c.tools.onAfterCreated(d, f), c), void 0)
              }),
              c.$menu = e
            }
          }
        })))
      },
      createTag: function (b, d) {
        var f,
        e = a('<span class="label label-tag" data-value="' + d + '" style="margin-left: 1px; margin-top: 1px;"><i class="fa fa-tag"></i> ' + b + '&nbsp;&nbsp;<a href="#" class="close">&times;</a></span>');
        e.insertBefore(c.$element).find('a.close').click(function () {
          var b = e.data('value');
          c.$box.find('input:hidden').each(function () {
            a(this).val() == b && a(this).remove()
          }),
          e.remove(),
          c.$tagsArr = c.$box.find('input[name="' + c.options.tagname + '"]')
        }),
        f = a('<input type="hidden" name="' + c.options.tagname + '">').val(d),
        f.appendTo(c.$box),
        c.$tagsArr = c.$box.find('input[name="' + c.options.tagname + '"]')
      },
      removeMenu: function () {
        c.$menu && c.$menu.remove()
      },
      onAfterCreated: function (d, e) {
        var f = [
        ];
        c.$tagsArr.length && c.$tagsArr.each(function () {
          f.push(a(this).val())
        }),
        c.$element.trigger(b.EVENTS.afterCreated, {
          item: d,
          value: e,
          tags: f.join(',')
        })
      }
    };
    return e
  },
  b.prototype.init = function () {
    var b = this,
    c = this.$element,
    d = this.options;
    return d.url ? (d.url = decodeURI(d.url).replacePlh(c.closest('.unitBox')), d.url.isFinishedTm() ? (d.url = encodeURI(d.url), isNaN(this.options.max) ? (BJUI.debug('Tags Plugin: Parameter \'max\' is non-numeric type!'), void 0)  : (b.$box.width(d.width).on('click', function () {
      c.focus()
    }), c.on('keydown', a.proxy(this.tools.keyDown, this)).on('keyup', a.proxy(this.tools.keyUp, this)), a.support.leadingWhitespace ? c.on('input', a.proxy(this.tools.query, this))  : c.on('propertychange', a.proxy(this.tools.query, this)), a(document).on('click.bjui.tags', a.proxy(function (b) {
      a(b.target).closest(this.$box).length || this.tools.removeMenu()
    }, this)), void 0))  : (c.alertmsg('error', d.warn || FRAG.alertPlhMsg.replace('#plhmsg#', BJUI.regional.plhmsg)), BJUI.debug('Tags Plugin: The query tags url is incorrect, url: ' + d.url), void 0))  : (BJUI.debug('Tags Plugin: Do query tags, url is undefined!'), void 0)
  },
  b.prototype.destroy = function () {
    this.$tags && (this.$element.upwrap(), $tags.remove())
  },
  d = a.fn.tags,
  a.fn.tags = c,
  a.fn.tags.Constructor = b,
  a.fn.tags.noConflict = function () {
    return a.fn.tags = d,
    this
  },
  a(document).on(BJUI.eventType.initUI, function (b) {
    var d = a(b.target).find('input[data-toggle="tags"]');
    d.length && c.call(d)
  })
}(jQuery);
/**
 * B-JUI: bjui-upload.js v1.0
 * @author K'naan (xknaan@163.com)
 * -- Modified from Huploadify 2.0 (author:吕大豹)
 * http://git.oschina.net/xknaan/B-JUI/blob/master/BJUI/js/bjui-upload.js
 */
+ function (a) {
  'use strict';
  function c(c) {
    var d = arguments,
    e = c;
    return window.FileReader ? this.each(function () {
      var f = a(this),
      g = a.extend({
      }, b.DEFAULTS, f.data(), 'object' == typeof c && c),
      h = f.data('bjui.upload');
      h || f.data('bjui.upload', h = new b(this, g)),
      'string' == typeof e && a.isFunction(h[e]) ? ([].shift.apply(d), d ? h[e].apply(h, d)  : h[e]())  : h.init()
    })  : (this.each(function () {
      var b,
      c,
      d,
      e,
      f;
      if (a.fn.uploadify) {
        if (b = {
          swf: BJUI.PLUGINPATH + 'uploadify/scripts/uploadify.swf',
          fileTypeExts: '*.jpg;*.png',
          id: 'fileInput',
          fileObjName: 'file',
          fileSizeLimit: 204800,
          buttonText: '选择上传文件',
          auto: !1,
          multi: !1,
          height: 24
        }, c = a(this), d = c.data(), d.id || (d.id = c.attr('id')), a.extend(b, d), !b.uploader) return BJUI.debug('Upload Plugin: The options uploader is undefined!'),
        void 0;
        if (b.uploader = decodeURI(b.uploader).replacePlh(c.closest('.unitBox')), !b.uploader.isFinishedTm()) return c.alertmsg('error', b.warn || FRAG.alertPlhMsg.replace('#plhmsg#', BJUI.regional.plhmsg)),
        BJUI.debug('Upload Plugin: The options uploader is incorrect: ' + b.uploader),
        void 0;
        b.uploader = encodeURI(b.uploader),
        'fileInput' == b.id && (b.id = b.id + (new Date).getTime()),
        e = a('<input type="file" name="' + b.name + '" id="' + b.id + '">'),
        b.onInit && 'string' == typeof b.onInit && (b.onInit = b.onInit.toFunc()),
        b.onCancel && 'string' == typeof b.onCancel && (b.onCancel = b.onCancel.toFunc()),
        b.onSelect && 'string' == typeof b.onSelect && (b.onSelect = b.onSelect.toFunc()),
        b.onUploadSuccess && 'string' == typeof b.onUploadSuccess && (b.onUploadSuccess = b.onUploadSuccess.toFunc()),
        b.onUploadComplete && 'string' == typeof b.onUploadComplete && (b.onUploadComplete = b.onUploadComplete.toFunc()),
        b.onUploadError && 'string' == typeof b.onUploadError && (b.onUploadError = b.onUploadError.toFunc()),
        e.appendTo(c),
        b.auto || (f = a('<button class="btn btn-orange" data-icon="cloud-upload">开始上传</button>'), f.hide().insertAfter(c).click(function () {
          e.uploadify('upload', '*'),
          a(this).hide()
        }), b.onSelect = function () {
          f.show()
        }),
        e.uploadify(b)
      }
    }), void 0)
  }
  var d,
  b = function (b, c) {
    this.$element = a(b),
    this.options = c,
    this.tools = this.TOOLS()
  };
  b.DEFAULTS = {
    fileTypeExts: '*.jpg;*.png',
    uploader: '',
    auto: !1,
    method: 'POST',
    multi: !1,
    formData: {
    },
    fileObjName: 'file',
    fileSizeLimit: 204800,
    previewImg: !0,
    previewLoadimg: null,
    dragDrop: !1,
    showUploadedPercent: !0,
    showUploadedSize: !0,
    buttonText: '选择上传文件',
    removeTimeout: 1000,
    itemTemplate: FRAG.uploadTemp,
    breakPoints: !1,
    fileSplitSize: 1048576,
    onUploadStart: null,
    onUploadSuccess: null,
    onUploadComplete: null,
    onUploadError: null,
    onInit: null,
    onCancel: null,
    onSelect: null
  },
  b.MIMETYPES = {
    zip: [
      'application/x-zip-compressed'
    ],
    jpg: [
      'image/jpeg'
    ],
    png: [
      'image/png'
    ],
    gif: [
      'image/gif'
    ],
    swf: [
      'application/x-shockwave-flash'
    ],
    doc: [
      'application/msword'
    ],
    xls: [
      'application/vnd.ms-excel'
    ],
    docx: [
      'application/vnd.openxmlformats-officedocument.wordprocessingml.document'
    ],
    xlsx: [
      'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet'
    ],
    ppt: [
      'application/vnd.ms-powerpoint'
    ],
    pptx: [
      'application/vnd.openxmlformats-officedocument.presentationml.presentation'
    ],
    mp3: [
      'audio/mpeg'
    ],
    mp4: [
      'video/mp4'
    ],
    pdf: [
      'application/pdf'
    ],
    txt: [
      'text/plain'
    ],
    xml: [
      'text/xml'
    ]
  },
  b.prototype.TOOLS = function () {
    var c = this,
    d = this.options,
    e = {
      formatFileSize: function (a, b) {
        return a = a > 1048576 && !b ? (Math.round(100 * a / 1048576) / 100).toString() + 'MB' : (Math.round(100 * a / 1024) / 100).toString() + 'KB'
      },
      getFile: function (a, b) {
        for (var c = 0; c < b.length; c++) if (b[c].index == a) return b[c];
        return !1
      },
      getFileTypes: function (a) {
        var d,
        b = [
        ],
        c = a.split(';');
        for (d = 0; d < c.length; d++) b.push(c[d].split('.').pop());
        return b
      },
      getMimetype: function (a) {
        return b.MIMETYPES[a]
      },
      getAcceptString: function (a) {
        var d,
        e,
        b = this.getFileTypes(a),
        c = [
        ];
        for (d = 0; d < b.length; d++) e = this.getMimetype(b[d]),
        e ? c.push(e)  : c.push('.' + b[d]);
        return c.join(',')
      },
      filter: function (b) {
        var g,
        h,
        e = [
        ],
        f = this.getFileTypes(d.fileTypeExts);
        if (f.length > 0) for (g = 0; g < b.length; g++) h = b[g],
        parseInt(this.formatFileSize(h.size, !0)) > d.fileSizeLimit ? c.$element.alertmsg('error', '文件"' + h.name + '"大小超出限制！')  : a.inArray(h.name.split('.').pop().toLowerCase(), f) >= 0 ? e.push(h)  : c.$element.alertmsg('error', '文件"' + h.name + '"类型不允许！');
        return e
      },
      getFiles: function (a) {
        var d,
        b = a.target.files || a.dataTransfer.files;
        for (b = this.filter(b), d = 0; d < b.length; d++) b[d].id = b[d].lastModifiedDate.getTime() + '_' + b[d].size + '_' + (b[d].type || '').replace(/\W/g, ''),
        this.renderQueueItem(b[d]),
        c.queueData.files++;
        return b
      },
      renderQueueItem: function (b) {
        var g,
        h,
        e = 0,
        f = a(d.itemTemplate.replace('{fileId}', b.id).replace('{fileName}', b.name).replace('#upConfirm#', BJUI.regional.upload.upConfirm).replace('#upPause#', BJUI.regional.upload.upPause).replace('#upCancel#', BJUI.regional.upload.upCancel).replace('{percent}', '0.00%').replace('{uploadedSize}', '0KB').replace('{fileSize}', this.formatFileSize(b.size)));
        d.auto && f.find('> .info > .up_confirm').remove(),
        f.data('upfile', b),
        c.$uploadFileList.append(f),
        d.breakPoints && (e = this.getUploadedSize(b.id), e > b.size && (e = b.size)),
        this.showProgress(b.id, e, b.size),
        d.previewImg && - 1 != b.type.indexOf('image') ? (g = f.find('> .preview > .img'), d.previewLoadimg && g.html('<img src="' + d.previewLoadimg + '" height="114">'), this.previewImg(b, g))  : f.find('> .preview').remove(),
        d.showUploadedSize ? (h = f.find('> .filesize'), h.find('> .uploadedsize').html(this.formatFileSize(e)), h.find('> .filesize').html(this.formatFileSize(b.size)))  : f.find('> .filesize').remove(),
        d.showUploadedPercent ? f.find('> .percent').html((100 * (e / b.size)).toFixed(2) + '%')  : f.find('> .percent').remove(),
        d.onSelect && d.onSelect(files),
        d.auto && c.fileUpload(b, e),
        f.on('click.bjui.upload.confirm', '.up_confirm', function () {
          var d = a(this),
          f = d.closest('.item');
          d.hide().next().show(),
          c.fileUpload(f.data('upfile'), e)
        }),
        f.on('click.bjui.upload.cancel', '.up_cancel', this.removeQueueItem)
      },
      successQueueItem: function (b, f) {
        e.showProgress(b.id, b.size, b.size),
        d.onUploadSuccess && d.onUploadSuccess.toFunc().call(c, b, f.responseText, c.$element),
        setTimeout(function () {
          c.$element.find('#' + b.id).fadeOut('normal', function () {
            a(this).remove();
            var b = c.$element.find('> .queue > .item:visible').length;
            0 == b && (c.$element.find('> .queue').hide(), c.$file.val(''))
          })
        }, d.removeTimeout)
      },
      removeQueueItem: function (b, d) {
        d && d.abort(),
        a(this).closest('.item').fadeOut('normal', function () {
          a(this).remove();
          var b = c.$element.find('> .queue > .item:visible').length;
          0 == b && c.$element.find('> .queue').hide()
        }),
        b.preventDefault()
      },
      previewImg: function (a, b) {
        if (a && b.length) {
          var c = new FileReader;
          c.onload = function (a) {
            b.html('<img src="' + a.target.result + '">')
          },
          c.readAsDataURL(a)
        }
      },
      showProgress: function (a, b, d) {
        var e = 100 * (b / d) + '%';
        c.tools.formatFileSize(b),
        (100 * (b / d)).toFixed(2) + '%',
        c.$element.find('#' + a + ' > .progress > .bar').css('width', e)
      },
      getUploadedSize: function (a) {
        return 1 * localStorage.getItem(a)
      },
      saveUploadedSize: function (a, b) {
        localStorage.setItem(a, b)
      },
      sendBlob: function (a, b, c, e) {
        var g,
        f = new FormData;
        if (b.open(d.method, a, !0), b.setRequestHeader('X-Requested-With', 'XMLHttpRequest'), f.append(d.fileObjName, c), e) for (g in e) f.append(g, e[g]);
        b.send(f)
      }
    };
    return e
  },
  b.prototype.init = function () {
    var e,
    b = this,
    c = this.$element,
    d = this.options;
    return d.uploader ? (d.uploader = decodeURI(d.uploader).replacePlh(c.closest('.unitBox')), d.uploader.isFinishedTm() ? (d.uploader = encodeURI(d.uploader), c.hasClass('bjui-upload') || (e = a(FRAG.uploadFrag.replaceAll('#multi#', d.multi ? 'multiple' : '').replaceAll('#accept#', b.tools.getAcceptString(d.fileTypeExts)).replaceAll('#btnTxt#', (d.icon ? '<i class="fa fa-' + d.icon + '">&nbsp;&nbsp;' : '') + d.buttonText)), c.addClass('bjui-upload').append(e), this.$file = c.find('> .bjui-upload-select-file'), this.$uploadFileList = c.find('> .queue'), this.queueData = {
      files: 0,
      success: 0,
      error: 0
    }, c.on('change.bjui.upload', '.bjui-upload-select-file', function (a) {
      b.fileSelect(a)
    }).on('click.bjui.upload', '.bjui-upload-select', function () {
      b.$file.trigger('click')
    }), d.onInit && d.onInit(), d.dragDrop && (c[0].ondragover = function (a) {
      return a.preventDefault(),
      !0
    }, c[0].ondrop = function (a) {
      b.fileSelect(a),
      a.stopPropagation(),
      a.preventDefault()
    })), void 0)  : (c.alertmsg('error', d.warn || FRAG.alertPlhMsg.replace('#plhmsg#', BJUI.regional.plhmsg)), BJUI.debug('Upload Plugin: The options uploader is incorrect: ' + d.uploader), void 0))  : (BJUI.debug('Upload Plugin: The options uploader is undefined!'), void 0)
  },
  b.prototype.fileSelect = function (a) {
    this.$uploadFileList.show(),
    this.tools.getFiles(a)
  },
  b.prototype.fileUpload = function (b, c) {
    var d = this,
    e = d.$element,
    f = d.options,
    g = d.tools,
    h = !1,
    i = b;
    h = new XMLHttpRequest,
    f.breakPoints && (b = i.slice(c, c + f.fileSplitSize)),
    h.upload && (h.upload.onprogress = function (a) {
      d.onProgress(b, a.loaded, i.size)
    }, h.onreadystatechange = function () {
      if (4 == h.readyState && 200 == h.status) {
        var j = (JSON.parse(h.responseText), !1);
        f.breakPoints ? (c += f.fileSplitSize, g.saveUploadedSize(i.id, c), c < i.size ? (b = i.slice(c, c + f.fileSplitSize), g.sendBlob(f.uploader, h, b, f.formData))  : j = !0)  : j = !0,
        j && (d.queueData.success++, g.successQueueItem(i, h), f.onUploadComplete && f.onUploadComplete(i, h.responseText))
      } else d.queueData.error++,
      f.onUploadError && f.onUploadError(i, h.responseText);
      f.onQueueComplete && (d.queueData.files = d.queueData.success + d.queueData.error) && option.onQueueComplete(d.queueData)
    }, f.onUploadStart && f.onUploadStart(), f.formData.fileName = i.name, f.formData.lastModifiedDate = i.lastModifiedDate.getTime(), g.sendBlob(f.uploader, h, b, f.formData)),
    e.find('#' + i.id + ' > .info > .up_pause').on('click.bjui.upload.pause', function () {
      h.abort(),
      a(this).hide().prev().show()
    }),
    e.find('#' + i.id + ' > .info > .up_cancel').off('click.bjui.upload.cancel').on('click.bjui.upload.cancel', a.proxy(function (a) {
      this.tools.removeQueueItem(a, h)
    }, this))
  },
  b.prototype.onProgress = function (a, b, c) {
    var i,
    j,
    k,
    l,
    d = this,
    e = d.options,
    f = d.$element.find('#' + a.id + ' .progress'),
    g = b,
    h = f.attr('lastLoaded') || 0;
    b -= parseInt(h),
    b > a.size && (b = a.size),
    d.$progressBar = f.children('.bar'),
    i = e.breakPoints ? parseFloat(d.$progressBar.get(0).style.width || 0)  : 0,
    j = (100 * (b / c) + i).toFixed(2),
    k = j > 100 ? '100%' : j + '%',
    e.showUploadedSize && (l = f.nextAll('.filesize'), l.find('> .uploadedsize').text(d.tools.formatFileSize(b))),
    e.showUploadedPercent && f.nextAll('.up_percent').text(k),
    d.$progressBar.css('width', k),
    g < e.fileSplitSize ? f.attr('lastLoaded', g)  : f.removeAttr('lastLoaded')
  },
  b.prototype.destroy = function () {
  },
  d = a.fn.upload,
  a.fn.upload = c,
  a.fn.upload.Constructor = b,
  a.fn.upload.noConflict = function () {
    return a.fn.upload = d,
    this
  },
  a(document).on(BJUI.eventType.initUI, function (b) {
    var d = a(b.target).find('[data-toggle="upload"]');
    d.length && c.call(d)
  })
}(jQuery);
/**
 * B-JUI: bjui-theme.js v1.0
 * @author K'naan (xknaan@163.com)
 * http://git.oschina.net/xknaan/B-JUI/blob/master/BJUI/js/bjui-theme.js
 */
+ function (a) {
  'use strict';
  function e(b) {
    var c = arguments,
    e = b;
    return this.each(function () {
      var f = a(this),
      g = a.extend({
      }, d.DEFAULTS, f.data(), 'object' == typeof b && b),
      h = f.data('bjui.theme');
      h || f.data('bjui.theme', h = new d(this, g)),
      'string' == typeof e && a.isFunction(h[e]) ? ([].shift.apply(c), c ? h[e].apply(h, c)  : h[e]())  : h.init()
    })
  }
  var b,
  c,
  d,
  f;
  a(function () {
    var d = function () {
      var d,
      e;
      b = a('#bjui-link-theme'),
      c = a('#bjui-themes'),
      a.cookie && (d = a.cookie('bjui_theme') || 'purple', e = c.find('a.theme_' + d), e.theme({
      }))
    };
    d()
  }),
  d = function (b, c) {
    this.$element = a(b),
    this.options = c
  },
  d.DEFAULTS = {
    theme: 'purple'
  },
  d.prototype.init = function () {
    var a,
    d,
    e;
    b.length && (a = b.attr('href'), a = a.substring(0, a.lastIndexOf('/')), a = a.substring(0, a.lastIndexOf('/')), a += '/' + this.options.theme + '/core.css', b.attr('href', a), d = this.$element.closest('ul').prev(), e = d.attr('class'), e = e.replace(/(theme[\s][a-z]*)/g, ''), d.removeClass().addClass(e).addClass('theme').addClass(this.options.theme), c.find('li').removeClass('active'), this.$element.parent().addClass('active'), this.cookie())
  },
  d.prototype.setTheme = function (a) {
    c.find('a.theme_' + a).trigger('click')
  },
  d.prototype.cookie = function () {
    var b = this.options.theme;
    a.cookie && a.cookie('bjui_theme', b, {
      path: '/',
      expires: 30
    })
  },
  f = a.fn.theme,
  a.fn.theme = e,
  a.fn.theme.Constructor = d,
  a.fn.theme.noConflict = function () {
    return a.fn.theme = f,
    this
  },
  a(document).on('click.bjui.theme.data-api', '[data-toggle="theme"]', function (b) {
    e.call(a(this)),
    b.preventDefault()
  })
}(jQuery);
/**
 * B-JUI: bjui-initui.js v1.0
 * @author K'naan (xknaan@163.com)
 * http://git.oschina.net/xknaan/B-JUI/blob/master/BJUI/js/bjui-initui.js
 */
+ function (a) {
  'use strict';
  function c(c) {
    var d = arguments,
    e = c;
    return this.each(function () {
      var f = a(this),
      g = a.extend({
      }, b.DEFAULTS, f.data(), 'object' == typeof c && c),
      h = f.data('bjui.initui');
      h || f.data('bjui.initui', h = new b(this, g)),
      'string' == typeof e && a.isFunction(h[e]) ? ([].shift.apply(d), d ? h[e].apply(h, d)  : h[e]())  : h.init()
    })
  }
  var d,
  e,
  f,
  b = function (b, c) {
    this.$element = a(b),
    this.options = c
  };
  b.DEFAULTS = {
  },
  b.prototype.init = function () {
    var b = this,
    c = b.$element;
    a.when(b.initUI()).done(function () {
      c.trigger(BJUI.eventType.afterInitUI)
    })
  },
  b.prototype.initUI = function () {
    var b = this.$element;
    a.when(b.trigger(BJUI.eventType.beforeInitUI)).done(function () {
      b.trigger(BJUI.eventType.initUI)
    })
  },
  d = a.fn.initui,
  a.fn.initui = c,
  a.fn.initui.Constructor = b,
  a.fn.initui.noConflict = function () {
    return a.fn.initui = d,
    this
  },
  a(document).on('click.bjui.initui.data-api', '[data-toggle="initui"]', function (a) {
    c.call($this, $this.data()),
    a.preventDefault()
  }),
  a(document).on('click.bjui.lnav.data-api', '[data-toggle="leftbar"]', function (b) {
    var c = a(this),
    d = a(c.attr('href')),
    e = a('#bjui-hnav');
    d.length && (a('#bjui-sidebar').find('.panel-group').addClass('hide'), d.removeClass('hide'), c.parent().addClass('active').siblings().removeClass('active'), e.find('button[data-toggle="collapse"]').is(':visible') && c.closest('.navbar-collapse').removeClass('in')),
    b.preventDefault()
  }),
  a(document).on(BJUI.eventType.beforeInitUI, function (b) {
    var c = a(b.target),
    d = [
    ],
    e = c.find('[data-noinit]');
    c.find('> .bjui-maskProgress').find('.progress').animate({
      width: '70%'
    }, 'fast'),
    e.each(function () {
      var c = a(this),
      e = {
      };
      e.$target = c,
      e.$next = c.next(),
      e.$prev = c.prev(),
      e.$parent = c.parent(),
      e.visible = c.is(':visible') ? !0 : !1,
      d.push(e),
      c.remove()
    }),
    c.data('bjui.noinit', d)
  }),
  a(document).on(BJUI.eventType.initUI, function (b) {
    var c = a(b.target);
    c.find('> .bjui-maskProgress').find('.progress').animate({
      width: '80%'
    }, 'fast')
  }),
  a(document).on(BJUI.eventType.afterInitUI, function (b) {
    var c = a(b.target),
    d = c.data('bjui.noinit');
    d && a.each(d, function (a, b) {
      b.$next.length ? b.$next.before(b.$target)  : b.$prev.length ? b.$prev.after(b.$target)  : b.$parent.length && b.$parent.append(b.$target),
      b.visible && b.$target.show(),
      c.removeData('bjui.noinit')
    }),
    c.find('.bjui-pageHeader, .bjui-headBar, .bjui-footBar').attr('data-layout-fixed', !0),
    c.find('[data-layout-h]').layoutH(),
    c.find('.bjui-maskProgress').find('.progress').animate({
      width: '100%'
    }, 'fast', function () {
      c.find('.bjui-ajax-mask').fadeOut('normal', function () {
        a(this).remove()
      })
    })
  }),
  e = function (b) {
    var f,
    g,
    h,
    c = b,
    d = c,
    e = c.css('position');
    return 'static' == e && (d = c.offsetParent()),
    f = parseInt(d.css('zIndex')) || 0,
    g = c.find('> .bjui-maskBackground'),
    h = c.find('> .bjui-maskProgress'),
    g.length || (g = a(FRAG.maskBackground), h = a(FRAG.maskProgress.replace('#msg#', BJUI.regional.progressmsg)), c.append(g).append(h)),
    parseInt(g.css('zIndex')) || 0,
    parseInt(h.css('zIndex')) || 0,
    g.css('zIndex', f + 1),
    h.css('zIndex', f + 2),
    {
      $bg: g,
      $pr: h
    }
  },
  a(document).on('bjui.ajaxStart', function (b) {
    var c = e(a(b.target));
    c.$bg.fadeIn(),
    c.$pr.fadeIn(),
    c.$pr.find('.progress').animate({
      width: '5%'
    }, 'fast')
  }).on('bjui.ajaxStop', function (b) {
    var c = e(a(b.target));
    c.$pr.find('.progress').animate({
      width: '100%'
    }, 'fast', function () {
      c.$bg.remove(),
      c.$pr.remove()
    })
  }).on('bjui.ajaxError', function (b) {
    var c = e(a(b.target));
    c.$bg.remove(),
    c.$pr.remove()
  }),
  a(document).on(BJUI.eventType.ajaxStatus, function (b) {
    var c = a(b.target),
    d = e(c);
    c.one('ajaxStart', function () {
      d.$bg.fadeIn(),
      d.$pr.fadeIn(),
      d.$pr.find('.progress').animate({
        width: '5%'
      }, 'fast')
    }).one('ajaxStop', function () {
    }).one('ajaxError', function () {
      d.$bg.remove(),
      d.$pr.remove()
    })
  }),
  f = function (a) {
    a.find('select[data-toggle="selectpicker"]').selectpicker('destroyMenu'),
    a.find('[data-toggle="selectztree"]').trigger('destroy.bjui.selectztree')
  },
  a(document).on(BJUI.eventType.beforeLoadDialog, function () {
  }).on(BJUI.eventType.beforeAjaxLoad, function (b) {
    f(a(b.target))
  }).on(BJUI.eventType.beforeCloseNavtab, function (b) {
    f(a(b.target))
  }).on(BJUI.eventType.beforeCloseDialog, function (b) {
    f(a(b.target))
  })
}(jQuery);
/**
 * B-JUI: bjui-plugins.js v1.0
 * @author K'naan (xknaan@163.com)
 * http://git.oschina.net/xknaan/B-JUI/blob/master/BJUI/js/bjui-plugins.js
 */
+ function (a) {
  'use strict';
  a(document).on(BJUI.eventType.initUI, function (b) {
    var e,
    f,
    g,
    h,
    i,
    c = a(b.target),
    d = c.find('[data-toggle="icheck"]');
    d.each(function () {
      var c = a(this),
      d = c.attr('id'),
      e = c.attr('name'),
      f = c.data('label');
      f && c.after('<label for="' + d + '" class="ilabel">' + f + '</label>'),
      c.on('ifCreated', function () {
        var c = a(this).closest('div'),
        f = c.next('[for="' + d + '"]');
        c.attr('data-icheck', e),
        f.attr('data-icheck', e)
      }).iCheck({
        checkboxClass: 'icheckbox_minimal-purple',
        radioClass: 'iradio_minimal-purple',
        increaseArea: '20%'
      }).on('ifChanged', function () {
        a(this).trigger('validate')
      }),
      c.prop('disabled') && c.iCheck('disable')
    }),
    d.filter('.checkboxCtrl').on('ifChanged', function (b) {
      var d = 1 == b.target.checked ? 'check' : 'uncheck',
      e = a(this).data('group');
      c.find(':checkbox[name="' + e + '"]').iCheck(d)
    }),
    c.find(':text, :password, textarea, :button, a.btn').each(function () {
      var d,
      f,
      g,
      h,
      i,
      j,
      b = a(this),
      c = b.closest('table.bjui-tabledit');
      if ((b.is(':text') || b.is(':password') || b.isTag('textarea')) && !b.hasClass('form-control') && b.addClass('form-control'), b.is(':button') && (d = b.data('icon'), b.data('large'), f = b.attr('class'), b.hasClass('btn') || b.removeClass().addClass('btn').addClass(f), d && (g = 'fa-' + d.replace('fa-', ''), b.data('bjui.icon') || b.html('<i class="fa ' + g + '"></i> ' + b.html()).data('bjui.icon', !0))), b.isTag('a') && (d = b.data('icon'), b.data('large'), d && (g = 'fa-' + d.replace('fa-', ''), b.data('bjui.icon') || b.html('<i class="fa ' + g + '"></i> ' + b.html()).data('bjui.icon', !0))), b.isTag('textarea') && (h = b.data('toggle'), h && 'autoheight' == h && a.fn.autosize && b.addClass('autosize').autosize()), !c.length) {
        if (i = b.attr('size') || b.attr('cols'), j = 10 * i, !i) return;
        j && b.css('width', j)
      }
    }),
    c.find('form[data-toggle="validate"]').each(function () {
      var b = a(this),
      c = 'undefined' == typeof b.data('alertmsg') ? !0 : b.data('alertmsg');
      a(this).validator({
        valid: function (b) {
          a(b).bjuiajax('ajaxForm', a(b).data())
        },
        validClass: 'ok',
        theme: 'red_right_effect'
      }).on('invalid.form', function (b, d, e) {
        c && a(d).alertmsg('error', FRAG.validateErrorMsg.replace('#validatemsg#', BJUI.regional.validatemsg).replaceMsg(e.length))
      })
    }),
    c.find('[data-toggle="moresearch"]').each(function () {
      var b = a(this),
      c = b.closest('.bjui-pageHeader'),
      d = c && c.find('.bjui-moreSearch'),
      e = b.data('name');
      b.attr('title') || b.attr('title', '更多查询条件'),
      b.click(function (f) {
        return d.length ? (d.css('top', c.outerHeight() - 1), d.is(':visible') ? (b.html('<i class="fa fa-angle-double-down"></i>'), e && a('body').data('moresearch.' + e, !1))  : (b.html('<i class="fa fa-angle-double-up"></i>'), e && a('body').data('moresearch.' + e, !0)), d.fadeToggle('slow', 'linear'), f.preventDefault(), void 0)  : (BJUI.debug('Not created \'moresearch\' box[class="bjui-moreSearch"]!'), void 0)
      }),
      e && a('body').data('moresearch.' + e) && (d.css('top', c.outerHeight() - 1).fadeIn(), b.html('<i class="fa fa-angle-double-up"></i>'))
    }),
    e = c.find('select[data-toggle="selectpicker"]'),
    f = function (b, c) {
      var f,
      g,
      d = b.data('refurl'),
      e = function (b) {
        var d,
        c = a(b.data('nextselect'));
        c && c.length && (d = c.data('emptytxt') || '&nbsp;', c.html('<option>' + d + '</option>').selectpicker('refresh'), e(c))
      };
      c && c.length && d && (f = b.data('val'), g = c.data('val'), 'undefined' == typeof f && (f = b.val()), a.ajax({
        type: 'POST',
        dataType: 'json',
        url: d.replace('{value}', encodeURIComponent(f)),
        cache: !1,
        data: {
        },
        success: function (d) {
          if (d) {
            var f = '',
            h = '';
            a.each(d, function (a) {
              var b,
              c;
              d[a] && d[a].length ? (b = d[a][0], c = d[a][1])  : (b = d[a].value, c = d[a].label),
              'undefined' != typeof g && (h = b == g ? ' selected' : ''),
              f += '<option value="' + b + '"' + h + '>' + c + '</option>'
            }),
            b.removeAttr('data-val').removeData('val'),
            c.removeAttr('data-val').removeData('val'),
            f || (f = c.data('emptytxt') || '&nbsp;', f = '<option>' + f + '</option>'),
            c.html(f).selectpicker('refresh'),
            e(c)
          }
        },
        error: BJUI.ajaxError
      }))
    },
    e.each(function () {
      var b = a(this),
      c = b.data(),
      d = a(c.nextselect);
      b.addClass('show-tick'),
      c.style || b.data('style', 'btn-default'),
      c.width || b.data('width', 'auto'),
      c.container || b.data('container', 'body'),
      b.selectpicker(),
      d && d.length && 'undefined' != typeof d.data('val') && f(b, d)
    }),
    e.change(function () {
      var b = a(this),
      c = a(b.data('nextselect'));
      f(b, c),
      b.attr('aria-required') && b.trigger('validate')
    }),
    c.find('[data-toggle="ztree"]').each(function () {
      function g(b, d) {
        var g = d.level,
        h = a('#' + d.tId + e),
        i = a('#diyBtn_add_' + d.id),
        j = a('#diyBtn_del_' + d.id);
        i.length || g < c.maxAddLevel && (i = a('<span class="tree_add" id="diyBtn_add_' + d.id + '" title="添加"></span>'), i.appendTo(h), i.on('click', function () {
          f.addNodes(d, {
            name: '新增Item'
          })
        })),
        j.length || (j = a('<span class="tree_del" id="diyBtn_del_' + d.id + '" title="删除"></span>'), j.appendTo(h).on('click', function (a) {
          var g,
          h,
          e = function () {
            j.alertmsg('confirm', '确认要删除 ' + d.name + ' 吗？', {
              okCall: function () {
                if (f.removeNode(d), c.onRemove) {
                  var e = c.onRemove.toFunc();
                  e && e.call(this, a, b, d)
                }
              },
              cancelCall: function () {
              }
            })
          };
          c.beforeRemove ? (g = c.beforeRemove.toFunc(), g && (h = g.call(g, b, d), h && 1 == h && e()))  : e()
        }))
      }
      function h(b, c) {
        var d = a('#diyBtn_add_' + c.id),
        e = a('#diyBtn_del_' + c.id);
        d && d.length && d.off('click').remove(),
        e && e.length && e.off('click').remove()
      }
      function i(a, b) {
        for (var c = 0; c < b.length; c++) if (b[c].drag === !1) return !1;
        return !0
      }
      function j(a, b, c) {
        return c ? c.drop !== !1 : !0
      }
      var d,
      e,
      f,
      b = a(this),
      c = b.data();
      c.nodes || (c.nodes = [
      ], b.find('> li').each(function () {
        var b = a(this),
        d = b.data();
        d.pid && (d.pId = d.pid),
        d.name = b.html(),
        c.nodes.push(d)
      }), b.empty()),
      c.showRemoveBtn || (c.showRemoveBtn = !1),
      c.showRenameBtn || (c.showRenameBtn = !1),
      c.addHoverDom && 'function' != typeof c.addHoverDom && (c.addHoverDom = 'edit' == c.addHoverDom ? g : c.addHoverDom.toFunc()),
      c.removeHoverDom && 'function' != typeof c.removeHoverDom && (c.removeHoverDom = 'edit' == c.removeHoverDom ? h : c.removeHoverDom.toFunc()),
      c.maxAddLevel || (c.maxAddLevel = 2),
      d = {
        view: {
          addHoverDom: c.addHoverDom || null,
          removeHoverDom: c.removeHoverDom || null,
          addDiyDom: null != c.addDiyDom ? c.addDiyDom.toFunc()  : null
        },
        edit: {
          enable: c.editEnable,
          showRemoveBtn: c.showRemoveBtn,
          showRenameBtn: c.showRenameBtn
        },
        check: {
          enable: c.checkEnable,
          chkStyle: c.chkStyle,
          radioType: c.radioType
        },
        callback: {
          onClick: null != c.onClick ? c.onClick.toFunc()  : null,
          beforeDrag: null != c.beforeDrag ? c.beforeDrag.toFunc()  : i,
          beforeDrop: null != c.beforeDrop ? c.beforeDrop.toFunc()  : j,
          onDrop: null != c.onDrop ? c.onDrop.toFunc()  : null,
          onCheck: null != c.onCheck ? c.onCheck.toFunc()  : null,
          beforeRemove: null != c.beforeRemove ? c.beforeRemove.toFunc()  : null,
          onRemove: null != c.onRemove ? c.onRemove.toFunc()  : null
        },
        data: {
          simpleData: {
            enable: c.simpleData || !0
          },
          key: {
            title: c.title || ''
          }
        }
      },
      a.fn.zTree.init(b, d, c.nodes),
      e = '_a',
      f = a.fn.zTree.getZTreeObj(b.attr('id')),
      c.expandAll && f.expandAll(!0)
    }),
    g = c.find('[data-toggle="selectztree"]'),
    g.each(function () {
      var g,
      h,
      i,
      j,
      b = a(this),
      c = b.data(),
      d = a(c.tree),
      f = (parseFloat(b.css('width')), b.outerHeight());
      c.width = c.width || b.outerWidth(),
      c.height = c.height || 'auto',
      d && d.length && (g = d.attr('id'), h = a('#' + g + '_select_box'), i = function (e) {
        var k,
        l,
        g = b.offset().top,
        h = b.offset().left,
        i = d.clone().appendTo(a('body')),
        j = i.outerHeight();
        i.remove(),
        k = a(window).height() - j - g - f,
        l = a(window).height() - g - f,
        'auto' == c.height && 0 > k && (l += k),
        e.css({
          top: g + f,
          left: h,
          'max-height': l
        })
      }, b.click(function () {
        var e,
        f;
        return h && h.length ? (i(h), h.show(), void 0)  : (e = 2, f = a.CurrentDialog, f && f.length && (e = f.css('zIndex') + 1), h = a('<div id="' + g + '_select_box" class="tree-box"></div>').css({
          position: 'absolute',
          zIndex: e,
          'min-width': c.width,
          height: c.height,
          overflow: 'auto',
          background: '#FAFAFA',
          border: '1px #EEE solid'
        }).hide().appendTo(a('body')), d.appendTo(h).css('width', '100%').data('fromObj', b).removeClass('hide').show(), i(h), h.show(), void 0)
      }), a('body').on('mousedown', function (c) {
        var d = a(c.target);
        b[0] == c.target || h && h.length > 0 && d.closest('.tree-box').length > 0 || h.hide()
      }), j = b.closest('[data-layout-h]'), j && j.length && j.scroll(function () {
        h && h.length && i(h)
      }), b.on('destroy.bjui.selectztree', function () {
        h.remove()
      }))
    }),
    c.find('[data-toggle="accordion"]').each(function () {
      var b = a(this),
      c = function (c, d) {
        var f,
        g,
        e = b.data('offsety') || 0;
        d = d || a(c).outerHeight() - 1 * e,
        f = b.find('.panel-heading'),
        g = f.outerHeight(),
        g = g * f.length + parseInt(f.last().parent().css('marginTop')) * (f.length - 1),
        b.css('height', d),
        d = d - g - 2 * f.length,
        b.find('.panel-collapse').find('.panel-body').css('height', d)
      },
      d = b.data('heightbox'),
      e = b.data('height');
      (d || e) && (c(d, e), a(window).resize(function () {
        c(d, e)
      })),
      b.on('shown.bs.collapse', function () {
        var a = b.find('[data-toggle=collapse]');
        a.find('i').removeClass('fa-caret-square-o-down').addClass('fa-caret-square-o-right'),
        a.removeClass('active').not('.collapsed').addClass('active').find('i').removeClass('fa-caret-square-o-right').addClass('fa-caret-square-o-down')
      })
    }),
    c.find('[data-toggle="kindeditor"]').each(function () {
      var d,
      b = a(this),
      c = b.data();
      c.items && (c.items = c.items.replaceAll('\'', '').replaceAll(' ', '').split(',')),
      c.afterUpload && (c.afterUpload = c.afterUpload.toFunc()),
      c.afterSelectFile && (c.afterSelectFile = c.afterSelectFile.toFunc()),
      c.confirmSelect && (c.confirmSelect = c.confirmSelect.toFunc()),
      d = {
        font: [
        ],
        span: [
          '.color',
          '.background-color',
          '.font-size',
          '.font-family'
        ],
        div: [
          '.margin',
          '.padding',
          '.text-align'
        ],
        table: [
          'align',
          'width'
        ],
        'td,th': [
          'align',
          'valign',
          'width',
          'height',
          'colspan',
          'rowspan'
        ],
        a: [
          'href',
          'target',
          'name'
        ],
        embed: [
          'src',
          'width',
          'height',
          'type',
          'loop',
          'autostart',
          'quality',
          '.width',
          '.height',
          'align',
          'allowscriptaccess'
        ],
        img: [
          'src',
          'width',
          'height',
          'border',
          'alt',
          'title',
          'align',
          '.width',
          '.height',
          '.border'
        ],
        'p,ol,ul,li,blockquote,h1,h2,h3,h4,h5,h6': [
          'class',
          'align',
          '.text-align',
          '.color',
          '.font-weight',
          '.font-style',
          '.text-decoration',
          '.vertical-align',
          '.text-indent',
          '.margin-left'
        ],
        pre: [
          'class'
        ],
        hr: [
          'class',
          '.page-break-after'
        ],
        'br,tbody,tr,strong,b,sub,sup,em,i,u,strike,s,del': [
        ]
      },
      KindEditor.create(b, {
        pasteType: c.pasteType,
        minHeight: c.minHeight || 260,
        autoHeightMode: c.autoHeight || !1,
        items: c.items || KindEditor.options.items,
        uploadJson: c.uploadJson,
        fileManagerJson: c.fileManagerJson,
        allowFileManager: c.allowFileManager || !0,
        fillDescAfterUploadImage: c.fillDescAfterUploadImage || !0,
        afterUpload: c.afterUpload,
        afterSelectFile: c.afterSelectFile,
        X_afterSelect: c.confirmSelect,
        htmlTags: d,
        cssPath: [
          BJUI.PLUGINPATH + 'kindeditor_4.1.10/editor-content.css',
          BJUI.PLUGINPATH + 'kindeditor_4.1.10/plugins/code/prettify.css'
        ],
        afterBlur: function () {
          this.sync()
        }
      })
    }),
    c.find('[data-toggle="colorpicker"]').each(function () {
      var b = a(this),
      c = b.data('bgcolor');
      b.colorpicker(),
      c && b.on('changeColor', function (a) {
        b.css('background-color', a.color.toHex())
      })
    }),
    c.find('[data-toggle="clearcolor"]').each(function () {
      var b = a(this),
      c = b.data('target') ? a(b.data('target'))  : null;
      c && c.length && b.click(function () {
        c.val(''),
        c.data('bgcolor') && c.css('background-color', '')
      })
    }),
    c.find('[data-toggle="tooltip"]').each(function () {
      a(this).tooltip()
    }),
    c.find('[data-toggle="dropdown"]').parent().on('show.bs.dropdown', function () {
      var c = a(this),
      d = c.outerWidth(),
      e = c.find('> .dropdown-menu'),
      f = e.outerWidth();
      d > f && e.css('min-width', d)
    }),
    c.find('form[data-toggle="ajaxform"]').each(function () {
      a(this).validator({
        ignore: ':input'
      }),
      a(this).validator('destroy')
    }),
    h = c.find('[data-toggle="highcharts"]'),
    h.each(function () {
      var b = a(this),
      c = b.data();
      a.get(c.url, function (a) {
        b.highcharts(a)
      }, 'json')
    }),
    i = c.find('[data-toggle="echarts"]'),
    i.each(function () {
      var b = a(this),
      c = b.data(),
      d = c.theme ? c.theme : 'default',
      e = c.type.split(',');
      require.config({
        paths: {
          echarts: BJUI.PLUGINPATH + 'echarts'
        }
      }),
      require(['echarts',
      'echarts/theme/' + d,
      'echarts/chart/' + e[0],
      e[1] ? 'echarts/chart/' + e[1] : 'echarts'], function (d, e) {
        var f = d.init(b[0], e);
        a.get(c.url, function (a) {
          f.setOption(a)
        }, 'json')
      })
    })
  })
}(jQuery);
