<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/jsp/include/taglib.jsp"%>
<html>
<head>
    <%@include file="/WEB-INF/jsp/include/head.jsp"%>
    <script>
        function openPreview(url) {
            window.open(url, '_blank', 'width=960,height=540');
        }
    </script>
</head>
<body>
    <%@include file="/WEB-INF/jsp/include/nav.jsp"%>
    <div class="container">
        <div class="row row-cols-1 row-cols-md-3 g-4">
            <c:forEach var="item" items="${videos}" varStatus="status">
                <div class="col" onclick="openPreview('/video/preview/${item.fileId}');">
                    <div class="card h-100">
                        <img src="/image/spring.png" width="358" height="215" class="card-img-top" alt="썸네일">
                        <div class="card-body">
                            <h5 class="card-title">${item.originFileNm}</h5>
<%--                            <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>--%>
                        </div>
<%--                        <div class="card-footer">--%>
<%--                            <small class="text-muted">Last updated 3 mins ago</small>--%>
<%--                        </div>--%>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>
