Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C014C46CD3
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 20 Dec 2023 05:55:25 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2d394db6;
	Wed, 20 Dec 2023 04:59:10 +0000 (UTC)
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [81.169.146.166])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id aea6c6a1
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 19 Dec 2023 13:12:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1702991551; cv=none;
 d=strato.com; s=strato-dkim-0002;
 b=iCTZ6Dp7VezGG+TOMAgubbumJBnHCMFoU0LWvjSqXFxI9SBiGvey2vJrzBP/Jo/yZ6
 K1uLZyp+hISaUdwxm7Ui+tU+cpWSJyUu66oU6zgyDs0sPbzBejnvSxIfITPJV+Sjj1+g
 enTo3dW/YWQKP2f6JDJzdhiQT10UKTR/F8LItFLe8Hj8BuaQbRuqAgBvfG9LzlomG8Bx
 jBJzXJMb/n9Rk0m7n6L0z3cLaEHKVJWIZfYY6HVd5vR0mQ2LRMpgihEqL6/U/eRfPrNu
 8WzHxazeHZXHjHbqGq2DxsNX2uAhWPWx2OkAtYtdqD/y1mEJcj0RHESK6b18T2xQ9ASO
 qgPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1702991551;
 s=strato-dkim-0002; d=strato.com;
 h=Subject:To:From:Date:Message-ID:Cc:Date:From:Subject:Sender;
 bh=uYwws1rabzNBHlK/wISA4OtXX3W6i8rssuyiNib5LzU=;
 b=Fxmtx2Hc15aPdwzEfphWXVxmCN55kZuc3C8FnsuePzf5j6EF0ieQjm8bL1loi9lfKq
 LhrHS4fJOs4x1EX+k0L5WLfedwP60b/rgVA9nsQOZ2pP+5ZZY8DqxnaVKSL+NsLm/BZ/
 TNQUqePcJjN7pZ65hcSaWORggoGUfLGZKTGNUOGC+D3SWPDuH/V+3zwLg2Y268O4dtGu
 sJTSwWTcgtcrUX2gQEbRGE1QUM6cEABz2brykYyC9UmIewebvEtgyX5PCrmiBcK12u8Y
 yjygT+C/SBoWM7JpsJFQQMJcJt0hcZD+Tyu+BxXU2oKRw7W8dS/6hT7gUwyj0IGHfviP
 G9eA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1702991551;
 s=strato-dkim-0002; d=schmueller.de;
 h=Subject:To:From:Date:Message-ID:Cc:Date:From:Subject:Sender;
 bh=uYwws1rabzNBHlK/wISA4OtXX3W6i8rssuyiNib5LzU=;
 b=a/khuCJLfI+zUOd9G4W8jQaG9XsVI2SAvZaQTjIZFsDZYqs6Rkfy0UJ5nnuoh9DXkz
 dqa2+c7kszhNXFASKgdfvpMOU0rAAf4RcTc6a7FACEC0x35/q+wu5KDfn/aUnAbuR8/A
 3URiy4mLxX0Nr2fBWd6N4R2of2LdAUfStuGq3L4c6GssuB+ELdLsGMxbvQZU2VysvxV5
 ax6KNsNxm4W1s38e1aDudHk55GOv41o9794Y3XD41jr3babvcEGiD/rieAI64bx4ru6+
 /zDBRVrCmo/7I1rfPEAzN9LJkhY2Jv3vLJSbUKLP9vDvH7pxhRWjfqcy9Xdm4sN+d+4t
 uMyw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1702991551;
 s=strato-dkim-0003; d=schmueller.de;
 h=Subject:To:From:Date:Message-ID:Cc:Date:From:Subject:Sender;
 bh=uYwws1rabzNBHlK/wISA4OtXX3W6i8rssuyiNib5LzU=;
 b=iaVUBtgvz57MIxpxrAnUHWPEalZwwUb4LI8B8llnkS7GwmXKHT6qxPahL23lGBvPoL
 7mc2lkpx3iBWbb9hlFBA==
X-RZG-AUTH: ":ImMWd0W6b99YEB5JAbzzLC6dfVAe8KFUWvIFtD7DbhNBjRVb81nX0Wwnuv0yc5VVeadG2g=="
Received: from mail.schmueller.de by smtp.strato.de (RZmta 49.10.0 DYNA|AUTH)
 with ESMTPSA id Ifed65zBJDCVnH2
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate)
 for <wireguard@lists.zx2c4.com>;
 Tue, 19 Dec 2023 14:12:31 +0100 (CET)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1EAE4E3B83
 for <wireguard@lists.zx2c4.com>; Tue, 19 Dec 2023 14:12:30 +0100 (CET)
Message-ID: <ef2c11a8-5b2a-4e71-99e9-a94d4c2c71aa@schmueller.de>
Date: Tue, 19 Dec 2023 14:12:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: de-DE
From: Norbert Schmidt <norbert@schmueller.de>
To: wireguard@lists.zx2c4.com
Subject: Wireguard not working in conjunction with G Data Firewall
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Approved-At: Wed, 20 Dec 2023 04:58:44 +0000
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.30rc1
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>


Hello,


I've had problems using the Wireguard Client 0.5.3 on a Windows 10 with 
G Data Total Security installed. The connection is working. A ping to a 
remote host is working too, sometimes a SMB connection works but HTTP or 
HTTPS traffic is not coming through.

I wrote to the G Data support an received this answer which I would like 
to share with you (translated):


     "There are fundamental incompatibilities between the G DATA 
Firewall and the use of the WireGuard VPN protocol. We believe this is 
due to the initialization of the WireGuard connection parameters.

     As a workaround, it should be possible to temporarily disable the 
firewall, then establish the VPN connection, and then re-enable the 
firewall."


I then asked for a fix and got the following reply:

"We understand your reaction, but the functionality you are referring to 
is not a frequently requested change and the required modifications 
would be extensive."

I believe this functionality is frequently needed but if G Data is not 
willing to change something, maybe the problem can be fixed on the 
wireguard client side...




Best regards

Norbert Schmidt
