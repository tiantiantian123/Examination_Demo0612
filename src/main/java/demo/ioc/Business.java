package demo.ioc;

/**
 * Created by Administrator
 * 上午9:28 16-5-18
 */
public class Business {
    private DeviceWriter deviceWriter;

    public void setDeviceWriter(DeviceWriter deviceWriter) {
        this.deviceWriter = deviceWriter;
    }

    public Business(DeviceWriter deviceWriter) {
        this.deviceWriter = deviceWriter;
    }


    public void saveData() {
        deviceWriter.saveToDevice();
    }
}
