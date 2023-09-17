<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/jsp/include/taglib.jsp"%>
<html>
<head>
    <%@include file="/WEB-INF/jsp/include/head.jsp"%>
    <link href="https://vjs.zencdn.net/8.5.2/video-js.css" rel="stylesheet" />
</head>
<body>
    <video
            id="my-video"
            class="video-js"
            controls
            preload="auto"
            width="960"
            height="540"
            poster="/image/spirng.png"
            data-setup="{}"
    >
      <source src="${video.fileStorePath}" type="video/mp4" />
    </video>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script src="https://vjs.zencdn.net/8.5.2/video.min.js"></script>
</body>
</html>
