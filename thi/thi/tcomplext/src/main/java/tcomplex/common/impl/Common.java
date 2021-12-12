package tcomplex.common.impl;

import tcomplex.bean.MatBang;
import tcomplex.common.ICommon;
import tcomplex.service.IService;
import tcomplex.service.impl.Service;

import java.util.regex.Pattern;

public class Common implements ICommon {
    @Override
    public boolean checkMatBang(MatBang matBang) {
        String dateOfBirth = matBang.getNgayBatDau();
        String today = matBang.getNgayKetThuc();

        String[] string1 = dateOfBirth.split("-");
        String[] string2 = today.split("-");
        String year1 = string1[0];
        String year2 = string2[0];
        String month1 = string1[1];
        String month2 = string2[1];
        int result1 = Integer.parseInt(year2) - Integer.parseInt(year1);
        int result2 = Integer.parseInt(month2) - Integer.parseInt(month1);
        int ketqua = result1+result2;
        if (matBang.getDienTich() <= 20){
            return false;
        }
        if (matBang.getGiaThue() <= 1000000){
            return false;
        }
        if (!Pattern.matches("^(A-Z)$", matBang.getMaMatBang())){
            return false;
        }
        if (ketqua<6){
            return false;
        }
        return true;
    }
}
