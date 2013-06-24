package com.dotoyo.buildjob.common.util;

import java.io.File;
import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
import java.security.CodeSource;
import java.security.ProtectionDomain;

/**
 * The tools class parsing system deployment path.
 */
public class PathUtil {

	/**
	 * 
	 * @param cls
	 * @return
	 * @throws IOException
	 */
	public static String getPathFromClass(Class cls) throws IOException {
		String path = null;
		if (cls == null) {
			throw new NullPointerException();
		}
		URL url = getClassLocationURL(cls);
		if (url != null) {
			path = url.getPath();
			if ("jar".equalsIgnoreCase(url.getProtocol())) {
				try {
					path = new URL(path).getPath();
				} catch (MalformedURLException e) {
				}
				int location = path.indexOf("!/");
				if (location != -1) {
					path = path.substring(0, location);
				}
			}
			File file = new File(path);
			path = file.getCanonicalPath();
		}
		return path;
	}

	/**
	 * 
	 * @param relatedPath
	 * @param cls
	 * @return
	 * @throws IOException
	 */
	public static String getFullPathRelateClass(String relatedPath, Class cls)
			throws IOException {
		String path = null;
		if (relatedPath == null) {
			throw new NullPointerException();
		}
		String clsPath = getPathFromClass(cls);
		File clsFile = new File(clsPath);
		String tempPath = clsFile.getParent();
		File file = new File(tempPath);
		path = file.getCanonicalPath();
		return path;
	}

	/**
	 * Get deployment path of specified class.
	 * 
	 * @param cls
	 * @return
	 */
	private static URL getClassLocationURL(final Class cls) {
		if (cls == null)
			throw new IllegalArgumentException("null input: cls");
		URL result = null;
		final String clsAsResource = cls.getName().replace('.', '/').concat(
				".class");
		final ProtectionDomain pd = cls.getProtectionDomain();
		/**
		 * java.lang.Class contract does not specify if 'pd' can ever be null;it
		 * is not the case for Sun's implementations, but guard against null
		 * just in case:
		 */
		if (pd != null) {
			final CodeSource cs = pd.getCodeSource();
			/**
			 * 'cs' can be null depending on the classloader behavior:
			 */
			if (cs != null)
				result = cs.getLocation();

			if (result != null) {
				/**
				 * Convert a code source location into a full class file
				 * location for some common cases:
				 */
				if ("file".equals(result.getProtocol())) {
					try {
						if (result.toExternalForm().endsWith(".jar")
								|| result.toExternalForm().endsWith(".zip"))
							result = new URL("jar:".concat(
									result.toExternalForm()).concat("!/")
									.concat(clsAsResource));
						else if (new File(result.getFile()).isDirectory())
							result = new URL(result, clsAsResource);
					} catch (MalformedURLException ignore) {
					}
				}
			}
		}

		if (result == null) {
			/**
			 * Try to find 'cls' definition as a resource; this is not
			 * document．d to be legal, but Sun's implementations seem to allow
			 * this:
			 */
			final ClassLoader clsLoader = cls.getClassLoader();
			result = clsLoader != null ? clsLoader.getResource(clsAsResource)
					: ClassLoader.getSystemResource(clsAsResource);
		}
		return result;
	}

	/**
	 * Testing method.
	 * 
	 * @param args
	 */
	public static void main(String[] args) {
		try {
			System.out.println(getPathFromClass(PathUtil.class));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
