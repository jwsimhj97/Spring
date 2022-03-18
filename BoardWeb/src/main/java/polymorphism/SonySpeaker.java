package polymorphism;

import org.springframework.stereotype.Component;

@Component("sony")	//@Component는 객체선언 => class 위에 작성
public class SonySpeaker implements Speaker{
	public SonySpeaker() {
		System.out.println("===> SonySpeaker 객체 생성");
	}
	public void volumeUp() {
		System.out.println("SonySpeaker---소리 올린다.");
	}
	public void volumeDown() {
		System.out.println("SonySpeaker---소리 내린다.");
	}
}
