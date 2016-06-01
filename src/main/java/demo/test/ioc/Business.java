package demo.test.ioc;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

/**
 * Created at 221
 * 16-5-23 下午4:41.
 */
@Component
public class Business {

    @Autowired
    @Qualifier("floppyWriter")
    private DeviceWriter deviceWriter;

    public void write() {
        deviceWriter.writeToDevice();
    }
}
