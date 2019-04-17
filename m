Return-Path: <SRS0=zOjE=TG=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NORMAL_HTTP_TO_IP,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6400AC04AAB
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  6 May 2019 20:37:58 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 011A2206BF
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  6 May 2019 20:37:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nro6f0ny"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 011A2206BF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c2bdd560;
	Mon, 6 May 2019 20:31:05 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fbb70da8
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 Apr 2019 04:39:43 +0000 (UTC)
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2dc5b75e
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 Apr 2019 04:39:43 +0000 (UTC)
Received: by mail-pg1-x52c.google.com with SMTP id d31so11389527pgl.7
 for <wireguard@lists.zx2c4.com>; Tue, 16 Apr 2019 21:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=ZmXTW9kcJrN5rcpwZx2qNXywmdeuums/zTL8EOUeHhQ=;
 b=Nro6f0nyIBKs0fvLjwjzgi8VPcanzkAu/qjLvsY2OWnGhUq1g0crJqU+jYJYoVthfV
 7s22a5JMqmsZM15quaGtmODlQQOlnwQ43YX2topWjSWEpkBKO76Ydl6okUwzEG8vf6/z
 9++w/Qm3mNBMXqxeJbDzTUSxwAeiuzEv0HscirXps/89pel/I3iixYUPFAz25A/cvEFI
 e6cIu92UydfWW2mPe6yVPLSQOhUjAy4fP3tP/fsjudJY+uEORRg8nwNn2pSCH4psvu7a
 oq19uDmobEdD2PfiQAoVtqUQhzKtpNbDjKxm7+t+VLaFO07pDkLkHEV3posoScmvajsH
 VSgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=ZmXTW9kcJrN5rcpwZx2qNXywmdeuums/zTL8EOUeHhQ=;
 b=LuHmfQwymtihvVMI/IK6TpTpo4ypdYRWEKIHSPzrEOu8bLgVK6FHpQGbdr2fyrNBV2
 9RnjMho4Gmm5DHNaQDoAfjmz3M7EPTy2LQzwvEqQ56UQaDBjeZMulstAxBzFHaJv1XDx
 Ue4jODmfSr3Y0l3/P2xCzFlUO1qPwkzDuaHI5s7tYCpZUQPbwEwEgDtCzAYsU2i+xm+V
 bQGvXthm1ldUQjsxJxpQCz+OzoXpX/VKSDL+2Qinsh1140UPpACIDzmM8mRAQPT7v76Q
 YG0U/OJkZSBTQ0iwrh+S5+DjedlsN2eDw70rOrIqPN1L+FFMbzF+HT6mU6f/7HonUmq6
 Sngg==
X-Gm-Message-State: APjAAAWjQ3qS3SxsfKKrsnJzwjFbF1ckvG+WNmXp3CHXzTaR+t0/16Qq
 GsfYojGajsu+Ft4zoxF3bQAk9/eXoNeZOlQP22kyOqVD
X-Google-Smtp-Source: APXvYqxR4xvljI1508BqiVEEqEXp59rKMAwoX8/eGDWmrzfs04b2epbt+Vb56r6bvFdD9+6FeVys2J1ezfUSiGXIssc=
X-Received: by 2002:a63:720e:: with SMTP id n14mr79738738pgc.93.1555475982047; 
 Tue, 16 Apr 2019 21:39:42 -0700 (PDT)
MIME-Version: 1.0
From: Ivan Lundwall <ivanlundwall@gmail.com>
Date: Wed, 17 Apr 2019 12:39:26 +0800
Message-ID: <CACGoAOzwjPLnw59jdgCqQJX34j_9iouBMq1e2stQn_hN6Zek9w@mail.gmail.com>
Subject: IOS app no network permission on device sold in Mainland China
To: wireguard@lists.zx2c4.com
X-Mailman-Approved-At: Mon, 06 May 2019 22:31:03 +0200
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============3394890412340586263=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============3394890412340586263==
Content-Type: multipart/alternative; boundary="0000000000005ddd8f0586b27907"

--0000000000005ddd8f0586b27907
Content-Type: text/plain; charset="UTF-8"

Hi,
First thanks on the excellent work on Wireguard.
Before explaining the issue, I want to make a clear introductioon on
the network permission thingy. It's a reinforced permission control issued
by Chinese gov, where an app will have no network access unless a
connection is requested then system will popup a notification to ask for
user to accept or decline the network permission. If it's not triggered,
network access is by default blocked. (the tricky thing is that udp socket
seems unable to trigger this)
So in my case where one endpoint is a domain, it says DNS resolution
failure when I activate the profile. It will connect and then I can access
nothing after I change the domain into an ip address.
There's a similar issue
https://github.com/pwn20wndstuff/Undecimus/issues/136
Here's a solution applying to an app also only transmitting udp
https://github.com/EspressifApp/EsptouchForIOS/issues/8
It's in Chinese, here's the translation for part of the last part

Previously, after receiving your feedback, our engineers used IOS10.0.2
(directly upgraded from ios 9.3 to ios 10.0.2) for testing, which is
configurable. I thought it was a bug in ios10.0.1.
Recently, we used an iPhone that was upgraded to ios10.0.2 by ios10.0.1
(you can't use Esptouch at the time), still not.
After research, iOS9 directly upgrades to all applications of ios10.0.1 to
disable all network permissions by default. All applications that ios9
directly upgrade to ios10.0.2 open all network permissions by default.
However, our Esptouch uses the underlying Socket function and does not use
the Cocoa Touch framework. Therefore, the network permission has not been
applied to the user. At this time, the UDP broadcast report cannot be sent
or received, and Esptouch cannot be successful.
Now the problem has been solved. The solution is to send a GET request of "
https://8.8.8.8 " when the application is opened, and it will apply for the
Network permission to the user. If you are not allowed to do so, you can
change it as follows:
Settings --> Wireless LAN --> Use wireless LAN and cellular mobile
applications (after all Wi-Fi lists) --> Select the appropriate application
--> Open permissions


Best regards

--0000000000005ddd8f0586b27907
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi,</div><div dir=3D"ltr">First thanks on=
 the excellent work on Wireguard.<br><div>Before explaining the issue, I wa=
nt to make a clear introductioon on the=C2=A0network permission thingy. It&=
#39;s a reinforced permission control issued by Chinese gov, where an app w=
ill have no network access unless a connection is requested then system wil=
l popup a notification to ask for user to accept or decline the network per=
mission. If it&#39;s not triggered, network access is by default blocked. (=
the tricky thing is that udp socket seems unable to trigger this)</div><div=
>So in my case where one endpoint is a domain, it says DNS resolution failu=
re when I activate the profile. It will connect and then I can access nothi=
ng after I change the domain into an ip address.</div><div>There&#39;s a si=
milar issue=C2=A0<a href=3D"https://github.com/pwn20wndstuff/Undecimus/issu=
es/136" target=3D"_blank">https://github.com/pwn20wndstuff/Undecimus/issues=
/136</a></div><div>Here&#39;s a solution applying to an app also only trans=
mitting udp=C2=A0<a href=3D"https://github.com/EspressifApp/EsptouchForIOS/=
issues/8" target=3D"_blank">https://github.com/EspressifApp/EsptouchForIOS/=
issues/8</a></div><div>It&#39;s in Chinese, here&#39;s the translation for =
part of the last part</div><div><div><br></div><div>Previously, after recei=
ving your feedback, our engineers used IOS10.0.2 (directly upgraded from io=
s 9.3 to ios 10.0.2) for testing, which is configurable. I thought it was a=
 bug in ios10.0.1.</div><div>Recently, we used an iPhone that was upgraded =
to ios10.0.2 by ios10.0.1 (you can&#39;t use Esptouch at the time), still n=
ot.=C2=A0</div><div>After research, iOS9 directly upgrades to all applicati=
ons of ios10.0.1 to disable all network permissions by default. All applica=
tions that ios9 directly upgrade to ios10.0.2 open all network permissions =
by default. However, our Esptouch uses the underlying Socket function and d=
oes not use the Cocoa Touch framework. Therefore, the network permission ha=
s not been applied to the user. At this time, the UDP broadcast report cann=
ot be sent or received, and Esptouch cannot be successful.</div><div>Now th=
e problem has been solved. The solution is to send a GET request of &quot;=
=C2=A0<a href=3D"https://8.8.8.8/" target=3D"_blank">https://8.8.8.8</a>=C2=
=A0&quot; when the application is opened, and it will apply for the Network=
 permission to the user. If you are not allowed to do so, you can change it=
 as follows:=C2=A0</div><div>Settings --&gt; Wireless LAN --&gt; Use wirele=
ss LAN and cellular mobile applications (after all Wi-Fi lists) --&gt; Sele=
ct the appropriate application --&gt; Open permissions</div></div><div><br>=
</div><div><br></div><div><span style=3D"color:rgb(36,41,46);font-family:-a=
pple-system,BlinkMacSystemFont,&quot;Segoe UI&quot;,Helvetica,Arial,sans-se=
rif,&quot;Apple Color Emoji&quot;,&quot;Segoe UI Emoji&quot;,&quot;Segoe UI=
 Symbol&quot;;font-size:14px">Best regards</span>=C2=A0</div></div></div>

--0000000000005ddd8f0586b27907--

--===============3394890412340586263==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============3394890412340586263==--
