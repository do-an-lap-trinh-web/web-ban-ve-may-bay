// file: list_ve_da_dat.js

/**
 * Hàm hiển thị popup xác nhận hủy vé
 */
function OpenXacNhan() {
    // Đảm bảo phần tử tồn tại trước khi thay đổi style
    const contentXacNhan = document.getElementById("box-xac-nhan");
    if (contentXacNhan) {
        contentXacNhan.style.display = "flex"; // Dùng flex để căn giữa
    }
}

function CloseXacNhan() {
    const contentXacNhan = document.getElementById("box-xac-nhan");
    if (contentXacNhan) {
        contentXacNhan.style.display = "none";
    }
}

function HuyThanhCong() {
    alert("bạn huỷ vé than công")
    const contentXacNhan = document.getElementById("box-xac-nhan");
    if (contentXacNhan) {
        contentXacNhan.style.display = "none";
    }
}

