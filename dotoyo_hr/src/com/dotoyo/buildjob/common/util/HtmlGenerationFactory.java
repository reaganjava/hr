package com.dotoyo.buildjob.common.util;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.util.Locale;
import java.util.Map;

import org.apache.log4j.Logger;

import freemarker.template.Configuration;
import freemarker.template.Template;

/**
 * 静态页面生成工厂
 *
 * @author wisdy.xiao
 *
 */
public class HtmlGenerationFactory {
	private static Logger logger = Logger
			.getLogger(HtmlGenerationFactory.class);

	private HtmlGenerationFactory() {
	}

	public static HtmlGenerationFactory getInstance() {
		return Helper.getInstance();
	}

	private static class Helper {
		private static HtmlGenerationFactory factory;

		public static HtmlGenerationFactory getInstance() {
			if (factory == null)
				factory = new HtmlGenerationFactory();
			return factory;
		}
	}

	/**
	 * 生成静态页面主方法
	 *
	 * @param context
	 *            ServletContext
	 * @param data
	 *            一个Map的数据结果集
	 * @param templatePath
	 *            ftl模版路径
	 * @param targetHtmlPath
	 *            生成静态页面的路径
	 */
	public synchronized void crateHTML(Map<String, Object> data,
			String templatePath, String htmlPath,String templateRootDir) {
		Configuration freemarkerCfg = new Configuration();
		// 加载模版
		//freemarkerCfg.setServletContextForTemplateLoading(context, "/");

		try {
			//验证模板模板存在
			if(!new File(templateRootDir + File.separator + templatePath).exists()){
				logger.error("File " + templateRootDir + File.separator + templatePath + " has not found");
				return;
			}
			File templateRootFile = new File(templateRootDir);
			freemarkerCfg.setDirectoryForTemplateLoading(templateRootFile);
			freemarkerCfg.setEncoding(Locale.getDefault(), "UTF-8");
			// 指定模版路径
			//freemarkerCfg.setServletContextForTemplateLoading(context,
			//		"template");
			// freemarkerCfg.setClassForTemplateLoading(this.getClass(),
			// "/template");
			Template template = freemarkerCfg
					.getTemplate(templatePath, "UTF-8");
			template.setEncoding("UTF-8");
			File htmlFile = new File(htmlPath);
			Writer out = new BufferedWriter(new OutputStreamWriter(
					new FileOutputStream(htmlFile), "UTF-8"));
			// 处理模版
			template.process(data, out);
			out.flush();
			out.close();
		} catch (Exception e) {
			logger.error(e);
		}
	}


}
