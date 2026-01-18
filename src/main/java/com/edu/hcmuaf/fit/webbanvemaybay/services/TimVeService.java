package com.edu.hcmuaf.fit.webbanvemaybay.services;

import com.edu.hcmuaf.fit.webbanvemaybay.dao.*;
import com.edu.hcmuaf.fit.webbanvemaybay.dao.HangBayDAO;
import com.edu.hcmuaf.fit.webbanvemaybay.models.*;
import com.edu.hcmuaf.fit.webbanvemaybay.models.DTO.VeDto;

import java.util.ArrayList;
import java.util.List;

public class TimVeService {
    public List<VeDto> getListVeByFilter(String khoiHanh, String haCanh, String hangGhe, String diemDi,
                                         String diemDen, boolean xepVe, String ngayDi) {
//        private String khoiHanh;
//    private String haCanh;
//    private String hangGhe;
//    private String diemDi;
//    private String diemDen;
//    private String gia;//
//    private String thoiGianKhoiHanh;//
//    private String thoiGianHaCanh;//
//    private String HangBay;//
//    private String soHieuChuyenBay;//

        LoaiVeDAO loaiVeDAO = new LoaiVeDAO();
        String idLoaiVe = loaiVeDAO.getIdLoaiVeByName(hangGhe);

        VeDAO veDAO = new VeDAO();
        List<Ve> listVeByHangGhe = veDAO.getListVeByHangGhe(idLoaiVe);

        ChuyenBayDAO chuyenBayDAO = new ChuyenBayDAO();
        List<ChuyenBay> listChuyenBayByNgayDi = chuyenBayDAO.getListChuyenBayByNgayDi(ngayDi);

        SanBayDAO sanBayDAO = new SanBayDAO();
        SanBay sanBayDi = sanBayDAO.getSanBayByTPAndQG(khoiHanh, diemDi);
        SanBay sanBayDen = sanBayDAO.getSanBayByTPAndQG(haCanh, diemDen);


        SoHieuChuyenBayDAO soHieuChuyenBayDAO = new SoHieuChuyenBayDAO();
        List<SoHieuChuyenBay> listSoHieuChuyenbayBySanBayDiAndSanBayDen = soHieuChuyenBayDAO.getListSoHieuChuyenBayBySanBayDiAndSanBayDen(
                sanBayDi.getId(), sanBayDen.getId()
        );

        List<VeDto> listVeDto = new ArrayList<>();
        vong1: for (int i = 0; i < listVeByHangGhe.size(); i++) {
            VeDto veDto = new VeDto();
            boolean isInfor1 = false;
            boolean isInfor2 = false;
            vong2: for (int j = 0; j < listChuyenBayByNgayDi.size(); j++) {
                if (listVeByHangGhe.get(i).getIdChuyenBay() == listChuyenBayByNgayDi.get(j).getId()) {
                    isInfor1 = true;
                    veDto.setGia(String.valueOf(listVeByHangGhe.get(i).getGia()));
                    veDto.setThoiGianKhoiHanh(listChuyenBayByNgayDi.get(j).getThoiGianKhoiHanh());
                    veDto.setThoiGianHaCanh(listChuyenBayByNgayDi.get(j).getThoiGianHaCanh());

                    vong3: for (int k = 0; k < listSoHieuChuyenbayBySanBayDiAndSanBayDen.size(); k++) {
                        if (listChuyenBayByNgayDi.get(j).getIdSoHieuChuyenBay() == listSoHieuChuyenbayBySanBayDiAndSanBayDen.get(k).getId()) {
                            veDto.setSoHieuChuyenBay(listSoHieuChuyenbayBySanBayDiAndSanBayDen.get(k).getMaChuyenBay());

                            int idHangBay = listSoHieuChuyenbayBySanBayDiAndSanBayDen.get(k).getIdHangBay();
                            HangBayDAO hangBayDAO = new HangBayDAO();
                            HangBay hangBay = hangBayDAO.getHangBayById(idHangBay);
                            veDto.setHangBay(hangBay.getTenHangBay());
                            isInfor2 = true;
                            break vong3;
                        }
                    }
                }
            }
            if (isInfor1 &&  isInfor2) {
                veDto.setKhoiHanh(khoiHanh);
                veDto.setHaCanh(haCanh);
                veDto.setHangGhe(hangGhe);
                veDto.setDiemDi(diemDi);
                veDto.setDiemDen(diemDen);
                listVeDto.add(veDto);
            }
        }
        listVeDto.sort((v1, v2) -> {
            double gia1 = Double.parseDouble(v1.getGia());
            double gia2 = Double.parseDouble(v2.getGia());
            return Double.compare(gia1, gia2);
        });
        return listVeDto;
    }
}
