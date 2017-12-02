Return-Path: aaronmdjones@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 252856b7
 for <wireguard@lists.zx2c4.com>; Sat, 2 Dec 2017 05:04:14 +0000 (UTC)
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 96932a40
 for <wireguard@lists.zx2c4.com>; Sat, 2 Dec 2017 05:04:14 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id y82so7885264wmg.1
 for <wireguard@lists.zx2c4.com>; Fri, 01 Dec 2017 21:10:34 -0800 (PST)
Return-Path: <aaronmdjones@gmail.com>
Received: from ?IPv6:2001:470:6aa2:a0::35? (saiga.nanhome.exbit.io.
 [2001:470:6aa2:a0::35])
 by smtp.gmail.com with ESMTPSA id m127sm264120wmm.48.2017.12.01.21.10.32
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 01 Dec 2017 21:10:33 -0800 (PST)
Subject: Re: Rolling keys without service interuption
To: wireguard@lists.zx2c4.com
References: <2185653B-D592-4179-96D6-2CFC16F3E0B1@ferrisellis.com>
From: Aaron Jones <aaronmdjones@gmail.com>
Message-ID: <3830a82e-8c9f-2b91-b408-0901bb7c8f8b@gmail.com>
Date: Sat, 2 Dec 2017 05:10:31 +0000
MIME-Version: 1.0
In-Reply-To: <2185653B-D592-4179-96D6-2CFC16F3E0B1@ferrisellis.com>
Content-Type: text/plain; charset=utf-8
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

On 02/12/17 02:45, Ferris Ellis wrote:
> I was wondering if WireGuard supported dynamically updating / 
> rolling keys for connections? In many operations security models 
> credentials are short lived and rotated regularly so that the 
> consequences of any compromise can be minimized. One problem, 
> however, with this is that rolling credentials often causes a 
> service interrupt for the connection being rolling. Does WireGuard 
> have a way to do this currently?
> 
> I wanted to ask the mailing list about this both for my own 
> knowledge and for public documentation. Though, I presume the 
> answer is no as WireGuard uses the keys as identity primitives for 
> connections (which I think is the most honest means of relating 
> identity to authorization) and thus “rolling” them makes no sense.

As far as I understand it, you can dynamically add a new peer to the
interface with wg(8) with the same configuration (including Allowed
IPs and Endpoint) and then remove the old peer. If you are running
reliable protocols on top (e.g. TCP) their retransmit logic will
establish a new session with the 'new' peer for you.

Regards,
Aaron Jones

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQIcBAEBCAAGBQJaIjXEAAoJEIrwc3SIqzAS2yUP/273JhlzYzJREMVzvNyfx2cj
sNImcmTFQhFB8SaSxM7u5yY9FtOSgvEyx+jFBhywVOEQfMFXwCtZL6XIXgLsoaM+
GN2NpY+2I95JYOFO6SF0jm4jy3dj0UAZMRctNuM2nasH31jI+E6VDwPcxGsg2o6g
2Am7ykHXETOZBRG9ZXeQiHiQ9ai3RMbrhP2yiApwzoZg3VsookDN+GEJ/K+ZVxaP
n0r9KbvOOn4rEnQSB+GSADl2uihaJu/ziiSMSlbsbkjS5yoBhI8v3GQvpWGCsdu9
hXOR+pmefDsHmurDpBniPWn9epX4aMnOLxzni7WPc3OlgHQg3ZhmvHjW4FrCjX+n
NDfmcbOxvlcMBhPfoLMk8KJMiWZ2k1yGT4yFYynS99NQ7cFcmQhetAKFochz92OX
AJT/bH7ExqQtxYhK1YR+rhw9HhzyhykQC70B1Kp2F9uVBjdKERHM1saavLxBAjlt
U297jzwqxlVji5h2sWHaflPTSnTyx49jSp3ZCPeJ3N57zHzhOmuuyf76CfoE4do+
/RzUhP96JwWIM6Q4HR/MY7UWHHKvt9GW3M+AwTIRovpL0OFPfuOotXc9fW7F25D2
gdWJSOxza7d31YgU7XnkVdHeY6T+uQrx77yjAnmSTcVPIiQlBzBNXE/jTAFA2uEG
Mj71hyihwWkfWOVREg7M
=naHE
-----END PGP SIGNATURE-----
