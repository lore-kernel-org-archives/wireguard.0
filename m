Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1f91ea90
 for <wireguard@lists.zx2c4.com>;
 Sat, 11 Feb 2017 08:38:07 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c3deab33
 for <wireguard@lists.zx2c4.com>;
 Sat, 11 Feb 2017 08:38:07 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e85c4aaf
 for <wireguard@lists.zx2c4.com>;
 Sat, 11 Feb 2017 08:38:07 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 21ef890d
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 11 Feb 2017 08:38:07 +0000 (UTC)
Received: by mail-ot0-f169.google.com with SMTP id 32so43839453oth.3
 for <wireguard@lists.zx2c4.com>; Sat, 11 Feb 2017 00:51:55 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1486772757.2823803.877388296.4A3928CE@webmail.messagingengine.com>
References: <1486772757.2823803.877388296.4A3928CE@webmail.messagingengine.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sat, 11 Feb 2017 09:51:54 +0100
Message-ID: <CAHmME9pSCZ2FdA0OTYt3zW2RBZQUwOevSrSnf2E63mM34O4EAw@mail.gmail.com>
Subject: Re: HKDF for a Java userspace implementation?
To: crasm@wireguard.1.email.vczf.io
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hey Christian,

If you're already using noise-java, then that library should take care
of all the HMAC/HKDF stuff for you. WireGuard builds upon the NoseIK
handshake, and the aspects that WireGuard adds on top of Noise not
require HKDF or HMAC. You should not be implementing the internal
mechanisms of the Noise handshake yourself, if you're using the
noise-java library. Instead you should be able to specify to it, "I
would like to use NoiseIK", and then you'll get functions for
generating and receiving the first handshake message and the second
handshake message. Specifically, the two WireGuard handshake messages
are:

msg1 = handshake_initiation {
    u8 message_type
    u8 reserved_zero[3]
    u32 sender_index
    u8 unencryped_ephemeral[32]
    u8 encrypted_static[AEAD_LEN(32)]
    u8 encrypted_timestamp[AEAD_LEN(12)]
    u8 mac1[16]
    u8 mac2[16]
}

msg2 = handshake_response {
    u8 message_type
    u8 reserved_zero[3]
    u32 sender_index
    u32 receiver_index
    u8 unencrypted_ephemeral[32]
    u8 encrypted_nothing[AEAD_LEN(0)]
    u8 mac1[16]
    u8 mac2[16]
}

In these you use the noise-java library generate the values
{unencryped_ephemeral, encrypted_static, encrypted_timestamp} and
{unencrypted_ephemeral, encrypted_nothing}, likely as one solid
contiguous byte[] blob, where encrypted_timestamp is that handshake
message's payload containing the TAI64N 12 byte timestamp (you pass
the timestamp to the 'generate' function as the 'payload'), and where
encrypted_nothing is that handshake message's payload containing
nothing (but still with the result containing the noise-java generated
auth tag).

The wireguard.io/protocol/ page and the white paper try to describe
the WireGuard protocol from the fundamentals. In the coming days, I
think I'll add some documentation for building a WireGuard protocol
implementation out of an existing Noise implementation.

Feel free to find me on Freenode -- I'm zx2c4 -- and I'm happy to give
you some pointers or walk you through the implementation.

Looking forward to seeing what you come up with!

Regards,
Jason
