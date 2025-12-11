
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <div>
        <form action="" class="search-flight-bar">
            <input type="text" placeholder="Tìm kiếm theo số hiệu chuyến bay (VD: VJ123)...">
            <button class="search-flight-btn">Tìm kiếm</button>
        </form>

        <table>
            <thead>
                <tr>
                    <th>Số hiệu chuyến bay</th>
                    <th>Cất cánh - Hạ cánh</th>
                    <th>Khỏi hành - Hạ cánh</th>
                    <th>Loại vé</th>
                    <th>Giá</th>
                    <th>Số lượng tồn</th>
                    <th>Hãng Bay</th>
                </tr>
            </thead>

            <tbody>
                <tr>
                    <td>VJ101</td>
                    <td>
                        <div>
                            <span>Hà Nội (HAN)</span>
                            <span>&rarr;</span>
                            <span>TP.HCM (SGN)</span>
                        </div>
                    </td>
                    <td>
                        <div>
                            <span>08:00</span>
                            <span>&rarr;</span>
                            <span>10:00</span>
                            <div>10/12/2025</div>
                        </div>
                    </td>
                    <td>Phổ thông</td>
                    <td>1,200,000đ</td>
                    <td>Còn 20 vé</td>
                    <td>Vietjet Air</td>
                </tr>

                <tr>
                    <td>VN123</td>
                    <td>
                        <div>
                            <span>Đà Lạt (DLI)</span>
                            <span>&rarr;</span>
                            <span>Huế (HUI)</span>
                        </div>
                    </td>
                    <td>
                        <div>
                            <span>14:30</span>
                            <span>&rarr;</span>
                            <span>19:00</span>
                            <div>21/12/2025</div>
                        </div>
                    </td>
                    <td>Thương gia</td>
                    <td>2,100,000đ</td>
                    <td>Còn 25 vé</td>
                    <td>Vietnam Airlines</td>
                </tr>

                <tr>
                    <td>QH987</td>
                    <td>
                        <div>
                            <span>Thanh Hóa (THD)</span>
                            <span>&rarr;</span>
                            <span>Phú Quốc (PQC)</span>
                        </div>
                    </td>
                    <td>
                        <div>
                            <span>23:00</span>
                            <span>&rarr;</span>
                            <span>07:00</span>
                            <div>23/12/2025 &rarr; 24/12/2025</div>
                        </div>
                    </td>
                    <td>Thương gia</td>
                    <td>1,900,000đ</td>
                    <td>Còn 10 vé</td>
                    <td>Bamboo Airways</td>
                </tr>
            </tbody>
        </table>

        <div>
            <a href="#" class="page-link">&laquo;</a>
            <a href="#" class="page-link active">1</a>
            <a href="#" class="page-link">2</a>
            <a href="#" class="page-link">3</a>
            <a href="#" class="page-link">&raquo;</a>
        </div>
    </div>
</body>
</html>
