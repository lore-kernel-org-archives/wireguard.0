Return-Path: <SRS0=tKTr=RX=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 365ADC43381
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 20 Mar 2019 22:18:34 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 781092175B
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 20 Mar 2019 22:18:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=secureideas-com.20150623.gappssmtp.com header.i=@secureideas-com.20150623.gappssmtp.com header.b="K02+YLHr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 781092175B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=secureideas.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 723fbcb3;
	Wed, 20 Mar 2019 22:18:00 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 49489a7f
 for <wireguard@lists.zx2c4.com>;
 Mon, 11 Mar 2019 13:00:01 +0000 (UTC)
Received: from mail-yw1-xc35.google.com (mail-yw1-xc35.google.com
 [IPv6:2607:f8b0:4864:20::c35])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3c739cf9
 for <wireguard@lists.zx2c4.com>;
 Mon, 11 Mar 2019 13:00:00 +0000 (UTC)
Received: by mail-yw1-xc35.google.com with SMTP id q128so3773478ywg.8
 for <wireguard@lists.zx2c4.com>; Mon, 11 Mar 2019 06:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=secureideas-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:date:message-id:subject:from:to:user-agent;
 bh=ufaetSMzimYjql6HIPN0VjFJ5GzKs03ulGx9aM8rh50=;
 b=K02+YLHr9L8JUZH+zHV6Jq7mdB6238pJMDXTJRE3Rff+yciIxDTsQ38n24kwo4tQBY
 BGHqnGX9R8ulwEm0p6oTf6b7zHTG7lJHuPpUK/49ieyqjhjb1Z0JraAHo5Qg8HoGjqWc
 e+6DUqolCkD85hHWkEUOAUWz/+NS3q5c+iZp5q+aH528A+qFjk6OuteZRqZKb9LNBbfb
 /2QhjbS5Jt2gJ/hZ9dxdUr/X8JCDlyTzQXQP/txPvlTqgUW1IPL8xdfdq5jDvpI9TpWG
 FKuLQsuaTyXaa61uqpgG5pseg1NNsaABjxr3JlP/gU9BkhXRfiKctYnt54oAAvD33PvL
 VIgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:message-id:subject:from:to
 :user-agent;
 bh=ufaetSMzimYjql6HIPN0VjFJ5GzKs03ulGx9aM8rh50=;
 b=VQJ09C9yj4f946xAJR2/sPf4GzGIoue6Em9v4+L7k/L3yc+zbI7po335rn8AKUAGhH
 /AbmVKY8qulw/WcvkPGTz4npGFk0UsDHvvjj+UJSftPbCeRv6cqaelEsJfxcC2rhsgyH
 A98Ji+xfr4QwBSPM48KIBBKy+Xm4lNEfcxuFCWz017f78Eww1Y7peGXO+s5yIPlSvvOO
 tEcLVKScjfs8LCWx0MJN9nnkGMUekmPH8nhoFYe3bjHbl4xL/1d140e0CnnelRoeu1J7
 k7pI1VCUyifOMYRPKn9tGhzq2e4cpJgfMDLcp1vBPIKPzcnwITRNgvr1MO5wLBqwTjBi
 Q9QA==
X-Gm-Message-State: APjAAAVUPMry15gk5Btrg3cOUIrHsjp9uGaNsro99Z4U348w+b+iLHoI
 mg5RjbkK5xP5GMro/UjUwvYVU3dDNakRsw==
X-Google-Smtp-Source: APXvYqxp/ydZQH+yUEp2Ao/3qDy+T2xA+aO0YR9yCB3jl7spJHsxlA9HMhexYi5iIoUZNzUpBW67kA==
X-Received: by 2002:a25:1687:: with SMTP id 129mr27450471ybw.11.1552309866301; 
 Mon, 11 Mar 2019 06:11:06 -0700 (PDT)
Received: from [172.16.13.64] (cpe-69-132-115-91.carolina.res.rr.com.
 [69.132.115.91])
 by smtp.gmail.com with ESMTPSA id q7sm2500624ywl.68.2019.03.11.06.11.05
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 11 Mar 2019 06:11:05 -0700 (PDT)
MIME-Version: 1.0
Date: Mon, 11 Mar 2019 09:10:51 -0400
Message-ID: <e8b38c7b-ef4e-4323-ae19-c08629a7ea2e@getmailbird.com>
Subject: Wireguard and vulnerability scanning
From: "Alex Rodriguez" <alex@secureideas.com>
To: "" <wireguard@lists.zx2c4.com>
User-Agent: Mailbird/2.5.34.0
X-Mailbird-ID: e8b38c7b-ef4e-4323-ae19-c08629a7ea2e@getmailbird.com
X-Mailman-Approved-At: Wed, 20 Mar 2019 23:17:58 +0100
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
Content-Type: multipart/mixed; boundary="===============1456570377828910944=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============1456570377828910944==
Content-Type: multipart/alternative;
 boundary="----=_NextPart_24685861.854008357760"

------=_NextPart_24685861.854008357760
Content-Type: text/plain;
 charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi wireguard team and list,

I wanted to reach out and ask a question about using wireguard for vulnerab=
ility scanning through a host onto a network. Similar to this: https://www.=
kali.org/tutorials/wireguard-on-kali/

I am still new to wireguard in general, but I have heard about a lot of goo=
d things about it from a few of my linux podcasts, and I wanted to implemen=
t it to solve a problem that I had attempted to solve before but couldn't r=
eliable do it since the other vpn solutions are so slow and could drop pack=
ets from latency.

I setup wireguard similar to how the offensive security article describes (=
above), and everything appeared to be working. I could ping the hosts on th=
e different network and I could nmap them while getting accurate informatio=
n. Then I went to go use a vulnerability scanning tool (Nessus), and I noti=
ced that it didn't really pick up anything on the other side of tunnel. I w=
as doing some tcpdumps on the interfaces and from what I could tell, all th=
e udp traffic would make it over fine but none of the tcp requests would ge=
t sent to the other side (through the tunnel) properly. =C2=A0The wireguard=
 server side (where I started the scan from), would try to send it but the =
host we were scanning through (client of the vpn) wouldn't ever receive any=
 of the syn packets.=C2=A0

So there were a few things that we thought might be wrong and I wanted to e=
mail you all and see what you thought.

1) nessus isn't sending packets right with whatever they are doing while sc=
anning, and so I am in communication with Tenable (people who own nessus) t=
o see if that is the issue.
2) there were a few tcp option that were missing from the nessus packets th=
at nmap had, and one of the consistent was the timestamp option. We talked =
to them about that, and they have a reason why they don't send it, but woul=
d=C2=A0wireguard=C2=A0discard a packet if it doesn't have a timestamp tcp o=
ption?
3) Lastly I saw a ratelimiter.c and saw there was a packet_per_seconds vari=
able defined. So could that be throttling the connections that Nessus is tr=
ying to send? If so, if I adjust that and recompile will that break things?=
 For this to work Nessus will send lots of packets at a time.

Those were just a few things that I thought could be affecting it, but I co=
uld also be completely wrong. I look forward to the discussion, and let me =
know if there is anything I can do to help. Thank you so much for this proj=
ect it really awesome!!


Sincerely,
Alex Rodriguez

--
Alex Rodriguez

Developer

Secure Ideas, LLC -=C2=A0Professionally Evil =C2=AE
https://www.secureideas.com/ [https://www.secureideas.com/]
Cell: 980-277-2746 / Office: 866-404-7837 x741
------=_NextPart_24685861.854008357760
Content-Type: text/html;
 charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div id=3D"__MailbirdStyleContent" style=3D"font-size: 10pt;font-family: Ar=
ial;color: #000000">Hi wireguard team and list,<div><br></div><div>I wanted=
 to reach out and ask a question about using wireguard for vulnerability sc=
anning through a host onto a network. Similar to this: https://www.kali.org=
/tutorials/wireguard-on-kali/</div><div><br></div><div>I am still new to wi=
reguard in general, but I have heard about a lot of good things about it fr=
om a few of my linux podcasts, and I wanted to implement it to solve a prob=
lem that I had attempted to solve before but couldn't reliable do it since =
the other vpn solutions are so slow and could drop packets from latency.</d=
iv><div><br></div><div>I setup wireguard similar to how the offensive secur=
ity article describes (above), and everything appeared to be working. I cou=
ld ping the hosts on the different network and I could nmap them while gett=
ing accurate information. Then I went to go use a vulnerability scanning to=
ol (Nessus), and I noticed that it didn't really pick up anything on the ot=
her side of tunnel. I was doing some tcpdumps on the interfaces and from wh=
at I could tell, all the udp traffic would make it over fine but none of th=
e tcp requests would get sent to the other side (through the tunnel) proper=
ly. &nbsp;The wireguard server side (where I started the scan from), would =
try to send it but the host we were scanning through (client of the vpn) wo=
uldn't ever receive any of the syn packets.&nbsp;</div><div><br></div><div>=
So there were a few things that we thought might be wrong and I wanted to e=
mail you all and see what you thought.</div><div><br></div><div>1) nessus i=
sn't sending packets right with whatever they are doing while scanning, and=
 so I am in communication with Tenable (people who own nessus) to see if th=
at is the issue.</div><div>2) there were a few tcp option that were missing=
 from the nessus packets that nmap had, and one of the consistent was the t=
imestamp option. We talked to them about that, and they have a reason why t=
hey don't send it, but would&nbsp;<span style=3D"font-size: 13.3333px;line-=
height: 1.5">wireguard</span><span style=3D"font-size: 13.3333px;line-heigh=
t: 1.5">&nbsp;</span><span style=3D"font-size: 10pt;line-height: 1.5">disca=
rd a packet if it doesn't have a timestamp tcp option?</span></div><div>3) =
Lastly I saw a ratelimiter.c and saw there was a packet_per_seconds variabl=
e defined. So could that be throttling the connections that Nessus is tryin=
g to send? If so, if I adjust that and recompile will that break things? Fo=
r this to work Nessus will send lots of packets at a time.</div><div><br></=
div><div><span style=3D"font-size: 10pt;line-height: 1.5">Those were just a=
 few things that I thought could be affecting it, but I could also be compl=
etely wrong. I look forward to the discussion, and let me know if there is =
anything I can do to help. Thank you so much for this project it really awe=
some!!</span></div><div><div><br></div><div class=3D"mb_sig"><div><br></div=
><div><div style=3D"color: rgb(34, 34, 34);font-size: 10pt;font-variant-lig=
atures: normal;orphans: 2;widows: 2"><span style=3D"font-family: arial, hel=
vetica, sans-serif">Sincerely,</span></div><div style=3D"color: rgb(34, 34,=
 34);font-size: 10pt;font-variant-ligatures: normal;orphans: 2;widows: 2"><=
span style=3D"font-family: arial, helvetica, sans-serif">Alex Rodriguez</sp=
an></div><div style=3D"color: rgb(34, 34, 34);font-size: 10pt;font-variant-=
ligatures: normal;orphans: 2;widows: 2"><span style=3D"font-family: calibri=
, sans-serif;"><br></span></div><div style=3D"color: rgb(34, 34, 34);font-s=
ize: 10pt;font-variant-ligatures: normal;orphans: 2;widows: 2"><span style=
=3D"font-family: calibri, sans-serif;">--</span></div><div style=3D"color: =
rgb(34, 34, 34); font-variant-ligatures: normal; orphans: 2; widows: 2;"><s=
pan style=3D"font-size: 8pt"><span style=3D"font-family: calibri, sans-seri=
f;">Alex Rodriguez</span><br></span></div><div dir=3D"ltr" style=3D"color: =
rgb(34, 34, 34); font-variant-ligatures: normal; orphans: 2; widows: 2;"><s=
pan style=3D"font-family: calibri, sans-serif;font-size: 8pt">Developer<br>=
</span><p style=3D"margin: 0in 0in 0.0001pt;"><span style=3D"font-family: c=
alibri, sans-serif;font-size: 8pt">Secure Ideas, LLC -&nbsp;Professionally =
Evil =C2=AE</span></p><span style=3D"font-size: 8pt"></span><p style=3D"mar=
gin: 0in 0in 0.0001pt;"><span style=3D"font-size: 8pt"><a href=3D"https://w=
ww.secureideas.com/" target=3D"_blank">https://www.secureideas.com/</a></sp=
an></p><p style=3D"margin: 0in 0in 0.0001pt;"><span style=3D"font-family: c=
alibri, sans-serif;"><span style=3D"font-size: 8pt">Cell: 980-277-2746 / Of=
fice: 866-404-7837 x741</span></span></p></div></div></div></div></div>
------=_NextPart_24685861.854008357760--

--===============1456570377828910944==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============1456570377828910944==--
