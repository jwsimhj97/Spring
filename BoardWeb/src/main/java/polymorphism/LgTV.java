package polymorphism;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

//@Component
@Component("tv")
public class LgTV implements TV{
	@Resource(name="apple")
	private Speaker speaker;  

	
//	byType		byName
//	@Autowired //@Qualifier("apple")
//	private Speaker speaker;
	
	public LgTV() {
		System.out.println("===> LgTV 객체 생성");
	}
	
	public void powerOn() {
		System.out.println("LgTV---전원 켠다.");
	}
	public void powerOff() {
		System.out.println("LgTV---전원 끈다.");
	}
	public void volumeUp() {
		speaker.volumeUp();
//		System.out.println("LgTV---소리 올린다.");
	}
	public void volumeDown() {
		speaker.volumeDown();
//		System.out.println("LgTV---소리 내린다.");
	}
	
		
//	public void turnOn() {
//		System.out.println("LgTV---전원 켠다.");
//	}
//	public void turnOff() {
//		System.out.println("LgTV---전원 끈다.");
//	}
//	public void soundUp() {
//		System.out.println("LgTV---소리 올린다.");
//	}
//	public void soundDown() {
//		System.out.println("LgTV---소리 내린다.");
//	}
	
}
