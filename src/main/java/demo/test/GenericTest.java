package demo.test;

/**
 * Created at 221
 * 16-5-24 上午11:43.
 */
public class GenericTest<T> {

    public T method() {
        Object o = new Object();
        return (T)o;
    }
}