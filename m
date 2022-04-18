Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76E8DC433FE
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 18 Apr 2022 08:40:12 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id d96abd55;
	Mon, 18 Apr 2022 08:40:10 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 5f5d9cc5
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 18 Apr 2022 08:40:08 +0000 (UTC)
Received: from [192.168.177.41] ([94.31.101.241]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MF39M-1niYmZ2UBc-00FWMy; Mon, 18 Apr 2022 10:40:03 +0200
From: "Hendrik Friedel" <hendrik@friedels.name>
To: "Aaron Jones" <me@aaronmdjones.net>, wireguard@lists.zx2c4.com
Subject: Re[2]: Better Output
Date: Mon, 18 Apr 2022 08:40:02 +0000
Message-Id: <emc5e5b4f5-ac77-4b94-ab65-2b839761543f@envy>
In-Reply-To: <c93e4542-d4d8-8cef-871a-0c3810d3242f@aaronmdjones.net>
References: <em19dde1c0-bcda-4ad2-b3ce-d72fb64993e4@envy>
 <c93e4542-d4d8-8cef-871a-0c3810d3242f@aaronmdjones.net>
User-Agent: eM_Client/8.2.1659.0
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:zEGCIl0JsMf8XgxqjoVFZfp1AIqaRgPHnVJbX8cUvw3slxUmu4m
 BgL8nAfEUlmJmBwKM0iIeRq75qc5ikWOleg9NeqFAZwm65bSIOuAWBHDNrmjkP6kCEIboKx
 ZnZFGMeReQnFGMFsBcmw0enBm4G3Qae17gbX5gSIsRH1+iBC8MS4KACEU+FM2983C9CcicL
 x7m4EQpuaDi0sTRFyVhDw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:c/xGNHE6Jsg=:x5HMzEJEeh4GVE8jChV910
 6foWahk5wO6aXlNCPeo0m4Tcjk1c04gCUjk66trYt830guWmoCXuH8i5kTffwu4Y4z2YjuflO
 Wmw0wLmLP8qREjat2uH+burAmA+KWQLwahh3ww0YDYaE3b0yLyr7Ubgwud9pH1WnvVxKSqyjY
 ZEb1uwhc8oJHWSZy+MfltVmNc1CWsOopw0o9RPDPbz434SZmUK6jzYPQmq4OuTE3c4IrJFhEN
 YEYB4BnqzPHHhRU6HFCVvmAwvIu5VEjzpdx9v/PJgJloHWo08c8XVn08mHWiWcKIA6hutqTY2
 LeJPAs0uD+2L8mifUDwNDWnRXVEU5Mc1pQWY+UrOL2wWOZiUJMg/oYmp63v+ge1XgEdiHZb7i
 Chg7G+07Gwi6HQ9LZmpAPb4KWdnLflvVNoEnS3mA1H4yOW6rbhLqHh1ejAh3yf4+RXput6let
 hiUbSOrc3qAagHvtFedMvlQeJrCWVS85sL1V/SBeeAbti8CUp6ej6mZI4EZAjpme3aZs85Q85
 ydCQiujEE7+tu642eFzMbJ8sGa3M9DZ7HPPNFwp0hSfIidw8ZiGxAsfJT8a3cnFsMPHiCjeby
 k6m8Gz6kahXHoVvfLhHIsP/FWlEpyxb9fzkx2VYBQzheJsDUMkgnxsbFIr1MQHDmE8o8d/XVh
 vODr9JfiBieR9ebKNA+a54dIPy4wa+N7m2fVI6UeyoXQdI9rKtFs/wkrh0ivHqpQ/cwQ=
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
Reply-To: Hendrik Friedel <hendrik@friedels.name>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Hello Aaron,

thanks for your reply.

>This would be technically achievable, but note that WireGuard
>uses UDP, which has no concept of "connections". See also
>below.
That is understood. But one can distinguish between a situation where a=20
(not sure about an alternative word) "connection" was established and=20
where not.

By the way: What does the Green Symbol today in the windows-client tell=20
me? Currently, I find it totally mis-leading. I think today it only=20
shows that:
1) the domain could be resolved to an IP
2) data was sent to it
That seems not very useful.

> > 2) If a wireguard server responds, but the key is not valid
>
>WireGuard does not respond if the keys are not valid. See
>section 5.1 ("Silence is a Virtue") in the WireGuard
>whitepaper [1].
Then, Silence is also a sign of a failed connection, no? --> red symbol.=20
But ok, it cannot show the reason "key invalid".

> > 3) If the connection fails, the Windows Client should show
> >    a RED symbol under status.
>
>This could only be determined by a previously-in-use session
>having had no packets received for greater than the maximum
>rekey interval (2 minutes).
Why? If a connection is established, data is received, in my experience=20
--> green Symbol. If no data is received --> red.
Sorry, but having to check the "bytes received" and ignoring the green=20
symbol is hardly intuitive (a bit geeky, if I may say that). The 99%=20
user does not know the backgrounds and/or the whitepaper.

>However, WireGuard itself will not send any data if it has no
>data to send (same section of the whitepaper), and so if you
>are not using the tunnel for 2 minutes, this would be
>indistinguishable from a failed tunnel.
Well, I was only thinking about the esablishing of a connection, not the=20
situation while a tunnel is up (but not used).
So, I understand that an icon that was turned green once may have to=20
stay green (as one cannot distinguish between no data *intended* to be=20
transmitted and no data transmitted *unintendedly*/failed connection.
Unless:

>An exception is if you enable keepalives; they are 0-length
>data packets.
In that case, the Icon would always be able to reflect the real status.

Now, would that not be something for the ToDo List?

Best regards,
Hendrik

>
>
>[1] https://www.wireguard.com/papers/wireguard.pdf
>
>Regards,
>Aaron Jones
>

