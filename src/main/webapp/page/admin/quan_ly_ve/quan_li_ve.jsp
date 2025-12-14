
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <title>Quản Lí Vé</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/page/admin/quan_ly_ve/quan_li_ve.css">
</head>
<body>
    <div class="container">
        <div class="search-flight-bar">
            <div class="search-form">
                <form action="" class="search-by-flight-code">
                    <input type="text" placeholder="Tìm kiếm theo số hiệu chuyến bay (VD: VJ123)...">
                    <button class="btn-search-from-quan-li-ve">Tìm kiếm</button>
                </form>
            </div>

            <div class="btn-add-ticket-from-quan-li-ve">
                <button class="btn-add-ticket">
                    <span class="btn-add-ticket-icon">+</span>Thêm vé
                </button>
            </div>
        </div>

        <table class="example-flights">
            <thead>
                <tr>
                    <th>Số hiệu chuyến bay</th>
                    <th>Cất cánh - Hạ cánh</th>
                    <th>Khỏi hành - Hạ cánh</th>
                    <th>Loại vé</th>
                    <th>Giá</th>
                    <th>Số lượng tồn</th>
                    <th>Hãng bay</th>
                    <th class="action-from-quan-li-ve">Thao Tác</th>
                </tr>
            </thead>

            <tbody>
                <tr>
                    <td class="flight-code">VJ101</td>
                    <td>
                        <div class="route-info">
                            <span class="location">Hà Nội (HAN)</span>
                            <span class="icon-arrow">&rarr;</span>
                            <span class="location">TP.HCM (SGN)</span>
                        </div>
                    </td>
                    <td>
                        <div class="time-info">
                            <div class="flight-time-row">
                                <span class="time">08:00</span>
                                <span class="icon-arrow">&rarr;</span>
                                <span class="time">10:00</span>
                            </div>
                            <div class="flight-date">10/12/2025</div>
                        </div>
                    </td>
                    <td class="ticket-type">Phổ thông</td>
                    <td class="flight-price">1,200,000đ</td>
                    <td class="left-ticket available">Còn 20 vé</td>
                    <td class="flight-airline-name">Vietjet Air</td>
                    <td>
                        <div class="act-btns">
                            <button class="btn-act-edit-del btn-edit">Sửa</button>
                            <button class="btn-act-edit-del btn-delete">Xóa</button>
                        </div>
                    </td>
                </tr>

                <tr>
                    <td class="flight-code">VN123</td>
                    <td>
                        <div class="route-info">
                            <span class="location">Đà Lạt (DLI)</span>
                            <span class="icon-arrow">&rarr;</span>
                            <span class="location">Huế (HUI)</span>
                        </div>
                    </td>
                    <td>
                        <div class="time-info">
                            <div class="flight-time-row">
                                <span class="time">14:30</span>
                                <span class="icon-arrow">&rarr;</span>
                                <span class="time">19:00</span>
                            </div>
                            <div class="flight-date">21/12/2025</div>
                        </div>
                    </td>
                    <td class="ticket-type">Thương gia</td>
                    <td class="flight-price">2,100,000đ</td>
                    <td class="left-ticket available">Còn 25 vé</td>
                    <td class="flight-airline-name">Vietnam Airlines</td>
                    <td>
                        <div class="act-btns">
                            <button class="btn-act-edit-del btn-edit">Sửa</button>
                            <button class="btn-act-edit-del btn-delete">Xóa</button>
                        </div>
                    </td>
                </tr>

                <tr>
                    <td class="flight-code">QH987</td>
                    <td>
                        <div class="route-info">
                            <span class="location">Thanh Hóa (THD)</span>
                            <span class="icon-arrow">&rarr;</span>
                            <span class="location">Phú Quốc (PQC)</span>
                        </div>
                    </td>
                    <td>
                        <div class="time-info">
                            <div class="flight-time-row">
                                <span class="time">23:00</span>
                                <span class="icon-arrow">&rarr;</span>
                                <span class="time">07:00</span>
                            </div>
                            <div class="flight-date">23/12/2025 &rarr; 24/12/2025</div>
                        </div>
                    </td>
                    <td class="ticket-type">Thương gia</td>
                    <td class="flight-price">1,900,000đ</td>
                    <td class="left-ticket low-stock">Còn 10 vé</td>
                    <td class="flight-airline-name">Bamboo Airways</td>
                    <td>
                        <div class="act-btns">
                            <button class="btn-act-edit-del btn-edit">Sửa</button>
                            <button class="btn-act-edit-del btn-delete">Xóa</button>
                        </div>
                    </td>
                </tr>
            </tbody>
        </table>

        <div class="page-moving">
            <a href="#" class="page-link">&laquo;</a>
            <a href="#" class="page-link active">1</a>
            <a href="#" class="page-link">2</a>
            <a href="#" class="page-link">3</a>
            <a href="#" class="page-link">&raquo;</a>
        </div>
    </div>
</body>
</html>
