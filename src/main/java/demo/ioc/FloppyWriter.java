package demo.ioc;

import org.springframework.stereotype.Component;

/**
 * Created at 221
 * 16-5-23 下午4:40.
 */
@Component
public class FloppyWriter implements DeviceWriter {
    @Override
    public void writeToDevice() {
        System.out.println("write to floppy...");
    }
}
