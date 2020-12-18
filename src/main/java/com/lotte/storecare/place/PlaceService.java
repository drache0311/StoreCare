package com.lotte.storecare.place;

import java.util.List;

public interface PlaceService {
	// CRUD 
	void insertPlace(PlaceVO vo);

	// UPDATE
	void updatePlace(PlaceVO vo);

	// DELETE
	void deletePlace(PlaceVO vo);

	// GET
	PlaceVO getPlace(PlaceVO vo);

	// SELECT?
	List<PlaceVO> getPlaceList(PlaceVO vo);
}
