<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/jsp/include/taglib.jsp"%>
<html>
<head>
    <%@include file="/WEB-INF/jsp/include/head.jsp"%>
    <script>
        window.onload = function() {
            document.getElementById("btnUpload").addEventListener('click', function () {
                location.href = "<c:url value='/video/upload'/>";
            });
        }

        function openPreview(url) {
            window.open(url, '_blank', 'width=960,height=540');
        }
    </script>
</head>
<body>
    <%@include file="/WEB-INF/jsp/include/nav.jsp"%>
    <div class="container">
      <table class="table table-bordered align-middle">
        <thead>
        <tr>
          <th scope="col">이미지</th>
          <th scope="col">파일명</th>
          <th scope="col">미리보기</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="item" items="${videos}" varStatus="status">
        <tr>
            <td><img src="/image/spring.png" width="80" height="45" alt="썸네일"></td>
            <td>${item.originFileNm}</td>
            <td><button id="btnPreview" type="button" class="btn btn-primary" onclick="openPreview('/video/preview/${item.fileId}');">미리보기</button></td>
        </tr>
        </c:forEach>

        </tbody>
      </table>
      <div class="d-grid gap-2 d-md-flex justify-content-md-end">
        <button id="btnUpload" type="button" class="btn btn-primary">업로드</button>
      </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>
