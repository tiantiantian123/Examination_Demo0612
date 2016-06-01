package demo.test;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Created at 221
 * 16-5-27 下午3:32.
 */
public class LogbackTest {
    private static Logger logger = LoggerFactory.getLogger(LogbackTest.class);

    public static void main(String[] args) {
        logger.trace("logback trace...");
        logger.debug("logback trace...");
        logger.info("logback trace...");
        logger.warn("logback trace...");
        logger.error("logback trace...");
    }
}
