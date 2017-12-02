Return-Path: ferris@ferrisellis.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fabdd5a9
 for <wireguard@lists.zx2c4.com>; Sat, 2 Dec 2017 02:38:46 +0000 (UTC)
Received: from mail-yb0-f180.google.com (mail-yb0-f180.google.com
 [209.85.213.180])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 34730483
 for <wireguard@lists.zx2c4.com>; Sat, 2 Dec 2017 02:38:46 +0000 (UTC)
Received: by mail-yb0-f180.google.com with SMTP id b73so1292216yba.6
 for <wireguard@lists.zx2c4.com>; Fri, 01 Dec 2017 18:45:06 -0800 (PST)
Return-Path: <ferris@ferrisellis.com>
Received: from [192.168.2.238] (c-73-120-111-204.hsd1.tn.comcast.net.
 [73.120.111.204])
 by smtp.gmail.com with ESMTPSA id m63sm3879516ywm.1.2017.12.01.18.45.04
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 01 Dec 2017 18:45:05 -0800 (PST)
From: Ferris Ellis <ferris@ferrisellis.com>
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (1.0)
Date: Fri, 1 Dec 2017 21:45:04 -0500
Subject: Rolling keys without service interuption
Message-Id: <2185653B-D592-4179-96D6-2CFC16F3E0B1@ferrisellis.com>
To: wireguard@lists.zx2c4.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

I was wondering if WireGuard supported dynamically updating / rolling keys f=
or connections? In many operations security models credentials are short liv=
ed and rotated regularly so that the consequences of any compromise can be m=
inimized. One problem, however, with this is that rolling credentials often c=
auses a service interrupt for the connection being rolling. Does WireGuard h=
ave a way to do this currently?

I wanted to ask the mailing list about this both for my own knowledge and fo=
r public documentation. Though, I presume the answer is no as WireGuard uses=
 the keys as identity primitives for connections (which I think is the most h=
onest means of relating identity to authorization) and thus =E2=80=9Crolling=
=E2=80=9D them makes no sense.

Cheers,
Ferris
