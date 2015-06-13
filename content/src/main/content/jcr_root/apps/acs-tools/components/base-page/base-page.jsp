<%--
  ~ #%L
  ~ ACS AEM Tools Bundle
  ~ %%
  ~ Copyright (C) 2015 Adobe
  ~ %%
  ~ Licensed under the Apache License, Version 2.0 (the "License");
  ~ you may not use this file except in compliance with the License.
  ~ You may obtain a copy of the License at
  ~
  ~   http://www.apache.org/licenses/LICENSE-2.0
  ~
  ~ Unless required by applicable law or agreed to in writing, software
  ~ distributed under the License is distributed on an "AS IS" BASIS,
  ~ WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  ~ See the License for the specific language governing permissions and
  ~ limitations under the License.
  ~ #L%
  --%>
<%@include file="/libs/foundation/global.jsp" %><%

    String favicon = component.getProperties().get("favicon", String.class);
    if (favicon != null) {
        pageContext.setAttribute("favicon",  xssAPI.getValidHref(resourceResolver.map(favicon)));
    }

%><c:set var="pageTitle"
       value="<%= xssAPI.encodeForHTML(currentPage.getTitle()) %>" />

<c:set var="pagePath"
       value="<%= xssAPI.getValidHref(resourceResolver.map(currentPage.getPath())) %>"
       scope="request"/>

<c:set var="resourcePath"
       value="<%= xssAPI.getValidHref(resourceResolver.map(resource.getPath())) %>"
       scope="request"/>

<c:set var="clientLib"
       value="<%= xssAPI.encodeForHTMLAttr("acs-tools." + component.getName() + ".app") %>"
       scope="request"/>

<c:set var="app"
       value="<%= xssAPI.encodeForHTMLAttr("acs-tools-" + component.getName() + "-app") %>"
       scope="request"/>

<!doctype html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

        <title>${pageTitle} | ACS AEM Tools</title>

        <c:if test="${not empty favicon}">
            <link rel="shortcut icon" href="${favicon}"/>
        </c:if>

        <cq:include script="includes/head-libs.jsp"/>
    </head>

    <body class="acs-tools-page">
        <header class="top">
            <div class="logo">
                <a href="/"><i class="icon-marketingcloud medium"></i></a>
            </div>

            <nav class="crumbs">
                <a href="/miscadmin">Tools</a>
                <a href="${pagePath}.html">${pageTitle}</a>
            </nav>
        </header>

        <div id="acs-tools-${component.name}-app">
            <cq:include script="includes/notifications.jsp"/>

            <div class="page" role="main">
                <div class="content">
                    <div class="content-container">
                        <div class="content-container-inner">

                            <h1>${pageTitle}</h1>

                            <cq:include script="content.jsp"/>
                        </div>
                    </div>
                </div>
            </div>

            <cq:include script="includes/footer-libs.jsp"/>
        </div>
    </body>
</html>