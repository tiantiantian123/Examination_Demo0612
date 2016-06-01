package demo.test;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Created at 221
 * 16-5-27 上午10:49.
 */
public class Log4jTest {
    private static Logger logger = LoggerFactory.getLogger(Log4jTest.class);
    public static void main(String[] args) {
        logger.trace("trace...");
        logger.debug("debug...");
        logger.info("info...");
        logger.warn("warn....");
        logger.error("error...");
    }
}
