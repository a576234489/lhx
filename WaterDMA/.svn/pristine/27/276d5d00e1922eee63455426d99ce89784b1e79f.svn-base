import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.math.BigInteger;
import java.security.Key;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.SecureRandom;
import java.security.spec.AlgorithmParameterSpec;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.crypto.Cipher;
import javax.tools.Tool;

import org.junit.*;

import com.qysgps.waterdma.util.HttpUtil;
import com.qysgps.waterdma.util.RightsHelper;
import com.qysgps.waterdma.util.Tools;

import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;
public class Test1 {
	@Test
	public void jsqx(){
		String a = new String("1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26");
		String[] b = Tools.str2StrArray(a);
		System.out.println(Arrays.toString(b));
		BigInteger c = RightsHelper.sumRights(b);
		System.out.println(c);
		boolean d = RightsHelper.testRights(c,1);
		boolean e = RightsHelper.testRights(c,25);
		boolean f = RightsHelper.testRights(c,26);
		System.out.println(d);
		System.out.println(e);
		System.out.println(f);
		System.out.println(RightsHelper.testRights("67108832",1));
	}
	@Test
	public void jsqx1(){
		
	}
	@SuppressWarnings("resource")
	@Test
	public void generateKeyPair() throws Exception{
        /** RSA算法要求有一个可信任的随机数源 */
        SecureRandom sr = new SecureRandom();
		/** 为RSA算法创建一个KeyPairGenerator对象 */
        KeyPairGenerator kpg = KeyPairGenerator.getInstance("RSA");
		/** 利用上面的随机数据源初始化这个KeyPairGenerator对象 */
        kpg.initialize(512);
        /** 生成密匙对 */
        KeyPair kp = kpg.generateKeyPair();
        /** 得到公钥 */
        Key publicKey = kp.getPublic();
        /** 得到私钥 */
        Key privateKey = kp.getPrivate();
        String filePath = String.valueOf(Thread.currentThread().getContextClassLoader().getResource("")) + "../../"; // 项目路径
        filePath = filePath.replaceAll("file:/", "");
        File file = new File(filePath+"/miyao");
        file.mkdirs();
        ObjectOutputStream oos1 = new ObjectOutputStream(new FileOutputStream(new File(filePath+"/miyao/publickey.keystore")));
        ObjectOutputStream oos2 = new ObjectOutputStream(new FileOutputStream(new File(filePath+"/miyao/privatekey.keystore")));
        oos1.writeObject(publicKey);
        oos2.writeObject(privateKey);
        oos1.close();
        oos2.close();
    }
	public static String encrypt(String source) throws Exception{

        /** 将文件中的公钥对象读出 */
        ObjectInputStream ois = new ObjectInputStream(new FileInputStream("miyao/publickey.keystore"));
        Key key = (Key) ois.readObject();
        ois.close();
        /** 得到Cipher对象来实现对源数据的RSA加密 */
        Cipher cipher = Cipher.getInstance("RSA");
        cipher.init(Cipher.ENCRYPT_MODE, key);
        byte[] b = source.getBytes();
        /** 执行加密操作 */
        byte[] b1 = cipher.doFinal(b);
        BASE64Encoder encoder = new BASE64Encoder();
        return encoder.encode(b1);
    }
	public static String decrypt(String cryptograph) throws Exception{
        /** 将文件中的私钥对象读出 */
        ObjectInputStream ois = new ObjectInputStream(new FileInputStream("miyao/privatekey.keystore"));
        Key key = (Key) ois.readObject();
        /** 得到Cipher对象对已用公钥加密的数据进行RSA解密 */
        Cipher cipher = Cipher.getInstance("RSA");
        cipher.init(Cipher.DECRYPT_MODE, key);
        BASE64Decoder decoder = new BASE64Decoder();
        byte[] b1 = decoder.decodeBuffer(cryptograph);
        /** 执行解密操作 */
        byte[] b = cipher.doFinal(b1);
        return new String(b);
    }
	public static void main(String[] args) throws Exception {

        String source = "luoxiaohui";//要加密的字符串
        String cryptograph = encrypt(source);//生成的密文
        System.out.println("生成的密文--->"+cryptograph);

        String target = decrypt(cryptograph);//解密密文
        System.out.println("解密密文--->"+target);
    }
	@Test
	public void testReplace(){
		String a= "{\"StartTime\":\"2018-04-13\",\"EndTime\":\"2018-04-20\"}";
		System.out.println(a);
		a = a.replaceAll("\\}", "%7D").replaceAll("\\{", "%7B").replaceAll("\"", "%22").replaceAll(":", "%3A").replaceAll(",", "%2C");
		System.out.println(a);
		
	}
	@Test
	public void testHttp(){
		//String a= "http://www.qysgps.com:1111/PressAnalyze/AnalyzePressDay/GetGridColumnJson";
		String b = "http://www.qysgps.com:1111/Login/CheckLogin";
		//String b= "{\"StartTime\":\"2018-04-19\",\"EndTime\":\"2018-04-26\",\"AreaId\":\"11\"}";
		//String c = "{\"MeterListId\":\"1,11,11-6\"}";
		//System.out.println(b);
		//b = b.replaceAll("\\}", "%7D").replaceAll("\\{", "%7B").replaceAll("\"", "%22").replaceAll(":", "%3A").replaceAll(",", "%2C");
		//System.out.println(b);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("username","System");
		map.put("password","b59c67bf196a4758191e42f76670ceba");
		map.put("autologin","0");
//		String a1 = "https://rl.mail.qq.com/cgi-bin/getinvestigate?sid=9Qx6LI8OOGCBBCZ8";
//		Map<String, Object> map1 = new HashMap<>();
//		map1.put("sid","9Qx6LI8OOGCBBCZ8");
//		map1.put("stat","log_ad_show");
//		map1.put("loc","qqmail_HY_Width");
//		map1.put("err","timeout");
//		map1.put("delayurl","kw=qqmail_HY_Width_total");
		try {
			String f = HttpUtil.doPost(b,map);
//			String f1 = HttpUtil.doPost(a1,map1);
//			System.out.println(f1);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
}
