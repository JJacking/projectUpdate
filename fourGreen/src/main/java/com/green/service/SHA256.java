package com.green.service;


import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class SHA256 {
	public static void main(String[] args) {
		SHA256 sha = new SHA256();
		String text = "2345"+System.currentTimeMillis();
		//03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4
		//38083c7ee9121e17401883566a148aa5c2e2d55dc53bc4a94a026517dbff3c6b
		String encryptStr = "";
		try {
			encryptStr = sha.encrypt(text);
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.err.println(encryptStr);
	}

    public String encrypt(String text) throws NoSuchAlgorithmException {
        MessageDigest md = MessageDigest.getInstance("SHA-256");
        md.update(text.getBytes());
        return bytesToHex(md.digest());
    }

    private String bytesToHex(byte[] bytes) {
        StringBuilder builder = new StringBuilder();
        for (byte b : bytes) {
            builder.append(String.format("%02x", b));
        }
        return builder.toString();
    }

}
