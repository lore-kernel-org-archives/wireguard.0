Return-Path: dangf09@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 79262719
 for <wireguard@lists.zx2c4.com>; Sun, 3 Sep 2017 02:27:30 +0000 (UTC)
Received: from mail-qk0-f180.google.com (mail-qk0-f180.google.com
 [209.85.220.180])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c397bb97
 for <wireguard@lists.zx2c4.com>; Sun, 3 Sep 2017 02:27:30 +0000 (UTC)
Received: by mail-qk0-f180.google.com with SMTP id l65so12884205qkc.0
 for <wireguard@lists.zx2c4.com>; Sat, 02 Sep 2017 19:52:33 -0700 (PDT)
Return-Path: <dangf09@gmail.com>
Received: from auth2-smtp.messagingengine.com (auth2-smtp.messagingengine.com.
 [66.111.4.228])
 by smtp.gmail.com with ESMTPSA id v32sm342807qtc.14.2017.09.02.19.52.31
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 02 Sep 2017 19:52:31 -0700 (PDT)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailauth.nyi.internal (Postfix) with ESMTP id E009220D28
 for <wireguard@lists.zx2c4.com>; Sat,  2 Sep 2017 22:52:30 -0400 (EDT)
Message-Id: <1504407150.3783820.1093515456.1E75D390@webmail.messagingengine.com>
From: DANG Fan <dangf09@gmail.com>
To: wireguard@lists.zx2c4.com
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="_----------=_150440715037838202"
Date: Sun, 03 Sep 2017 10:52:30 +0800
Subject: Module verification failed
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

This is a multi-part message in MIME format.

--_----------=_150440715037838202
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"

I built WireGuard from source, and I got "Module verification failed"
message when I tried to run "wg-quick up".
Here is what I found in dmesg:

[   55.700967] wireguard: module verification failed: signature and/or
required key missing - tainting kernel[   55.701390] wireguard: WireGuard 0.0.20170810 loaded. See
www.wireguard.com for information.[   55.701391] wireguard: Copyright (C) 2015-2017 Jason A. Donenfeld
<Jason@zx2c4.com>. All Rights Reserved.
ffs@server:~$ uname -a
Linux server 4.4.0-93-generic #116-Ubuntu SMP Fri Aug 11 21:17:51 UTC
2017 x86_64 x86_64 x86_64 GNU/Linux
Thanks!

--_----------=_150440715037838202
Content-Transfer-Encoding: 7bit
Content-Type: text/html; charset="utf-8"

<!DOCTYPE html>
<html>
<head>
<title></title>
</head>
<body><div>I built WireGuard from source, and I got "Module verification failed" message when I tried to run "wg-quick up".<br></div>
<div><br></div>
<div>Here is what I found in dmesg:<br></div>
<div><br></div>
<div>[&nbsp;&nbsp; 55.700967] wireguard: module verification failed: signature and/or required key missing - tainting kernel<br></div>
<div>[&nbsp;&nbsp; 55.701390] wireguard: WireGuard 0.0.20170810 loaded. See <a href="http://www.wireguard.com">www.wireguard.com</a> for information.<br></div>
<div>[&nbsp;&nbsp; 55.701391] wireguard: Copyright (C) 2015-2017 Jason A. Donenfeld &lt;<a href="mailto:Jason@zx2c4.com">Jason@zx2c4.com</a>&gt;. All Rights Reserved.<br></div>
<div><br></div>
<div>ffs@server:~$ uname -a<br></div>
<div>Linux server 4.4.0-93-generic #116-Ubuntu SMP Fri Aug 11 21:17:51 UTC 2017 x86_64 x86_64 x86_64 GNU/Linux<br></div>
<div><br></div>
<div>Thanks!</div>
</body>
</html>

--_----------=_150440715037838202--
