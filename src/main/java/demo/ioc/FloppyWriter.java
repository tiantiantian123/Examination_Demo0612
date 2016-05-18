package demo.ioc;

/**
 * Created by Administrator
 * 上午9:25 16-5-18
 */
public class FloppyWriter implements DeviceWriter {
    @Override
    public void saveToDevice() {
//        ...
        System.out.println("saved to floppy.");
    }
}
