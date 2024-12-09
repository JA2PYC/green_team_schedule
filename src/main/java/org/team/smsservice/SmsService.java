package org.team.smsservice;

import com.twilio.Twilio;
import com.twilio.rest.api.v2010.account.Message;
import org.springframework.stereotype.Service;

@Service
public class SmsService {
    private static final String ACCOUNT_SID = "TWILIO_ACCOUNT_SID"; // Twilio 계정 SID 보안상 환경변수에서 읽기
    private static final String AUTH_TOKEN = "TWILIO_AUTH_TOKEN";   // Twilio Auth Token 보안상 환경변수에서 읽기
    private static final String TWILIO_PHONE_NUMBER = "TWILIO_PHONE_NUMBER"; // Twilio에서 보안상 발급받은 전화번호 환경변수에서 읽기

    static {
        Twilio.init(ACCOUNT_SID, AUTH_TOKEN);
    }

    public void sendSms(String toPhoneNumber, String messageContent) {
        try {
            Message message = Message.creator(
                    new com.twilio.type.PhoneNumber(toPhoneNumber), // 수신자 번호
                    new com.twilio.type.PhoneNumber(TWILIO_PHONE_NUMBER), // Twilio 번호
                    messageContent // 메시지 내용
            ).create();

            System.out.println("SMS sent successfully: " + message.getSid());
        } catch (Exception e) {
            e.printStackTrace();
            System.err.println("Failed to send SMS.");
        }
    }
}