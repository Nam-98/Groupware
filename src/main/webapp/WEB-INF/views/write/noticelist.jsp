<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>공지사항</title>
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <!--    스타일시트-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">

    <!--    자바스크립트-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>

    <style>
        * {
            box-sizing: border-box;
        }
        div{
            border: 1px solid black;
        }

        table {
            text-align: center;
        }
    </style>
</head>

<body>
    <div class="container container-figure">
        <table>
            <tr>
                <td>
                    <select id="notice">
                        <option value="search_condition">검색조건</option>
                        <option value="all_view">전체보기</option>
                        <option value="notice_title">제목</option>
                        <option value="notice_contents">내용</option>
                        <option value="notice_writer">작성자</option>
                    </select>
                </td>
            </tr>
        </table>

        <table class="table table-secondary table-striped">
            <thead class="table-light">
                <tr>
                    <th scope="col">No</th>
                    <th scope="col">제목</th>
                    <th scope="col">작성자</th>
                    <th scope="col">등록일</th>
                    <th scope="col">조회수</th>
                </tr>
            </thead>
            <tbody>
            <c:foreach var="i" items="${list }">
                <tr>
                    <th scope="row">${write_seq }</th>
                    <td>${write_title }</td>
                    <td>${write_id }</td>
                    <td>${write_reg_date }</td>
                    <td>${write_readCount }</td>
                </tr>
             </c:foreach>
<!--                 <tr>
                    <th scope="row">2</th>
                    <td>제목</td>
                    <td>작성자</td>
                    <td>등록일</td>
                    <td>조회수</td>
                </tr>
                <tr>
                    <th scope="row">3</th>
                    <td>제목</td>
                    <td>작성자</td>
                    <td>등록일</td>
                    <td>조회수</td>
                </tr> -->
            </tbody>
        </table>
        <div class="navi">${navi }</div>
    </div>
</body>

</html>