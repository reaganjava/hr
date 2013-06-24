package com.dotoyo.buildjob.common.util;

import java.util.List;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import com.dotoyo.buildjob.common.dto.AreaDto;
import com.dotoyo.buildjob.common.dto.CityDto;
import com.dotoyo.buildjob.common.dto.HotCityDto;
import com.dotoyo.buildjob.common.dto.ProvinceDto;

/**
 * @author tyler.qu
 * @dateCreated 2010-12-2
 * @description 地区操作工具类
 * 
 */
public class RegionDataUtil {
	private RegionDataUtil() {
	}

	private static SqlMapClientTemplate sqlMapClientTemplate;

	/**
	 * 加载“省”数据
	 * 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public static List<ProvinceDto> queryProvinceList() {
		return sqlMapClientTemplate.queryForList("queryProvinceList");
	}

	/**
	 * 加载省下相关“市”数据
	 * 
	 * @param provinceCode
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public static List<CityDto> queryCityListByProvinceCode(String provinceCode) {
		return sqlMapClientTemplate.queryForList("queryCityListByProvinceCode",
				provinceCode);
	}

	/**
	 * 加载市下相关“区”数据
	 * 
	 * @param cityCode
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public static List<AreaDto> queryAreaListByCityCode(String cityCode) {
		return sqlMapClientTemplate.queryForList("queryAreaListByCityCode",
				cityCode);
	}

	/**
	 * 加载热点城市
	 * 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public static List<HotCityDto> queryHotCityList() {
		return sqlMapClientTemplate.queryForList("queryHotCityList");
	}

	/**
	 * 根据城市编码加载城市数据
	 * 
	 * @param code
	 * @return
	 */
	public static CityDto getCityByCode(String code) {
		return (CityDto) sqlMapClientTemplate.queryForObject("getCityByCode",
				code);
	}

	public static ProvinceDto getProvinceByCode(String code) {
		return (ProvinceDto) sqlMapClientTemplate.queryForObject(
				"getProvinceByCode", code);
	}

	public void setSqlMapClientTemplate(
			SqlMapClientTemplate sqlMapClientTemplate) {
		RegionDataUtil.sqlMapClientTemplate = sqlMapClientTemplate;
	}

	public SqlMapClientTemplate getSqlMapClientTemplate() {
		return sqlMapClientTemplate;
	}

}
