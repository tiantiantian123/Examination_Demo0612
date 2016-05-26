package demo.util;

import org.jasypt.util.password.StrongPasswordEncryptor;

/**
 * @author mingfei.net@Gmail.com
 *         20:58, 5/26/16.
 */
public class Encryptor {
    private static StrongPasswordEncryptor strongPasswordEncryptor;
    public static StrongPasswordEncryptor getEncryptor() {
        if (strongPasswordEncryptor == null) {
            strongPasswordEncryptor = new StrongPasswordEncryptor();
        }
        return strongPasswordEncryptor;
    }
}
