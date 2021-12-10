package model.service.implement;


import model.been.EducationDegree;
import model.reposiory.IEducationDegreeRespository;
import model.reposiory.Implement.EducationDegreeRespositoryImpl;
import model.service.IEducationDegreeService;

import java.util.List;

public class EducationDegreeServiceImpl implements IEducationDegreeService {
    IEducationDegreeRespository iEducationDegreeRespository = new EducationDegreeRespositoryImpl();
    @Override
    public List<EducationDegree> getList() {
        return iEducationDegreeRespository.getList();
    }
}