<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="head-search pull-left">
    <div id="_js_search" class="head-search-box">
        <form class="search-form" method="get" target="_blank" action="${pageContext.request.contextPath}/s">
            <%--<input name="c" type="hidden" value="so" />
            <input name="module" type="hidden" value="" />--%>
            <div class="head-search-input">
                <input id="_js_search_text" name="wd" type="text" placeholder="请输入内容..." autocomplete="off" class="ac_input" />
                <%--<a class="icons top" href="top/" target="_blank"></a>--%>
            </div>
            <button class="hjtvui-btn hjtvui-btn-radius" title="搜剧" type="submit">搜剧</button>
        </form>
    </div>
</div>