<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/jsp/include/taglib.jsp"%>
<html>
<head>
    <%@include file="/WEB-INF/jsp/include/head.jsp"%>
    <script>
        window.onload = function() {
            document.getElementById("btnList").addEventListener('click', function () {
                location.href = "<c:url value='/video/list'/>";
            });

            document.getElementById("btnUpload").addEventListener('click', function () {
                document.getElementById("frm").submit();
            });
        }
    </script>
</head>
<body>
    <%@include file="/WEB-INF/jsp/include/nav.jsp"%>
    <div class="container">
        <form id="frm" method="post" action="<c:url value='/video/upload'/>" enctype="multipart/form-data">
            <table class="table table-bordered align-middle">
                <tbody>
                <tr>
                    <td>동영상파일</td>
                    <td>
                        <input type="file" class="form-control" name="file" id="inputGroupFile04" aria-describedby="inputGroupFileAddon04" aria-label="Upload">
                    </td>
                </tr>
                </tbody>
            </table>
            <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                <button id="btnList" type="button" class="btn btn-light">목록</button>
                <button id="btnUpload" type="button" class="btn btn-primary">업로드</button>
            </div>
        </form>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>
