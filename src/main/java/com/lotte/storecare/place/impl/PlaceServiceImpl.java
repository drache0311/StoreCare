package com.lotte.storecare.place.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lotte.storecare.place.PlaceService;
import com.lotte.storecare.place.PlaceVO;

@Service("placeService")
public class PlaceServiceImpl implements PlaceService {
	@Autowired
	private PlaceDAO placeDAO;

	public void insertPlace(PlaceVO vo) {
//		if (vo.getSeq() == 0) {
//			throw new IllegalArgumentException("0�� ���� ����� �� �����ϴ�.");
//		}
//		placeDAO.insertPlace(vo); // 100�� �� ��� ����
		placeDAO.insertPlace(vo); // Exception �߻�
	}

	public void updatePlace(PlaceVO vo) {
		placeDAO.updatePlace(vo);
	}

	public void deletePlace(PlaceVO vo) {
		placeDAO.deletePlace(vo);
	}

	public PlaceVO getPlace(PlaceVO vo) {
		return placeDAO.getPlace(vo);
	}

	public List<PlaceVO> getPlaceList(PlaceVO vo) {
		return placeDAO.getPlaceList(vo);
	}
}