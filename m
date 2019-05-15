Return-Path: <SRS0=x/BS=TS=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	FROM_EXCESS_BASE64,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 379D3C04E87
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 18 May 2019 16:51:17 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C77DC20872
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 18 May 2019 16:51:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZmjMgvcO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C77DC20872
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 69c02445;
	Sat, 18 May 2019 16:49:04 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c331d394
 for <wireguard@lists.zx2c4.com>;
 Wed, 15 May 2019 14:49:51 +0000 (UTC)
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com
 [IPv6:2607:f8b0:4864:20::82b])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7e6d4a04
 for <wireguard@lists.zx2c4.com>;
 Wed, 15 May 2019 14:49:51 +0000 (UTC)
Received: by mail-qt1-x82b.google.com with SMTP id a39so1731366qtk.2
 for <wireguard@lists.zx2c4.com>; Wed, 15 May 2019 07:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8x1bjh51WScfkAh6rMJHThnsRx/zYGZuNGdtOrIONwM=;
 b=ZmjMgvcO7lmBNcx6hsMac/kLmR6B60YUvu1nvZKD6S4pA6PSW7rMN0DoioO6IcDTu2
 JteNb7G1e5dZrDLQAhfJn9JAXj5DImRltBIg7V9jyaK3R+LgebG5+6gnMdTMrBC3mn2n
 SH5ayezb1Je4FKMb8s0/qzpmMNPYxY9RusWAn1Ey8lhEMHTC74yWqLwV3qxgi8QR0RaT
 frw5piureRTw1+nfvBIlvLdbzQlrUqNaLaleHXv0MypgDWlnRBWUta1TZu9/UZd5uvrp
 ZXUKNEXWLzrhEEIEJxgKvpTg6Rst88YxDI6KAzAPI4IxPYg9lH/YF1YYEsWsNtz6ZUUS
 GUHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8x1bjh51WScfkAh6rMJHThnsRx/zYGZuNGdtOrIONwM=;
 b=ZRySZdSfg6gLJIBNohNtqoRTG0cxWR/xSnfLkKibgVRsPcvKxgzaW1ec222/AHxpVN
 FmD2F6+kKa3e7DJ/kaArZ/RYYU2fVZy3wvE4SVkXO1zFIbqMucZvm3bUOyTGkCh3SU4v
 ODCANPhcbtqw39fin+ZYlt5ieSPnobNa3dvbsAKMO8iFuE7W2wEvNgy7Lax9H3TlMbn9
 Uu2W0JIGunvo5sSoDQy93VqSnJ5G1q5xAVcrP5K/9zBmeoo0vTsEmY78nCXCffuigzce
 6CDqu0fnnj6RAAqVJ8U4g1rJvz4H8QFH3gWsf5yPRvlzyKjSO6nG4au0qNFpVMZMGW8x
 pIJg==
X-Gm-Message-State: APjAAAVBTS2UcdljdrsfUruDoQTCMOgGso7CiukUcdSK6LqouRLmLUuV
 LpAPAogKVo3ukRDMAJunM+woTEqL42gbAQL3FtA=
X-Google-Smtp-Source: APXvYqyRqRcHE8tTI3F16sjnl1OkIzEvnDPhE9z07RVyM0nQzXCp3u8Vpc5EyJCKM/6ZfxBjG1mC+yfqD3ovfGAksks=
X-Received: by 2002:a0c:d2f2:: with SMTP id x47mr34229217qvh.90.1557931790418; 
 Wed, 15 May 2019 07:49:50 -0700 (PDT)
MIME-Version: 1.0
References: <CAGyAFMV=HvOYDRSB7eRpBDp-47wX2vie8JPgp48in1fH+eXn=A@mail.gmail.com>
In-Reply-To: <CAGyAFMV=HvOYDRSB7eRpBDp-47wX2vie8JPgp48in1fH+eXn=A@mail.gmail.com>
From: =?UTF-8?B?0JjQu9GM0Y8g0KjQuNC/0LjRhtC40L0=?= <chipitsine@gmail.com>
Date: Wed, 15 May 2019 19:49:39 +0500
Message-ID: <CAFHpkQFVpN-+Uoc6QsLmD8hjwEC7Ba1Q2SP4SuS_EMu_PT=3nw@mail.gmail.com>
Subject: Re: [Openvpn-devel] Wintun performance results
To: Lev Stipakov <lstipakov@gmail.com>
X-Mailman-Approved-At: Sat, 18 May 2019 18:49:03 +0200
Cc: openvpn-devel <openvpn-devel@lists.sourceforge.net>,
 wireguard@lists.zx2c4.com
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
Content-Type: multipart/mixed; boundary="===============1108493836826028337=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============1108493836826028337==
Content-Type: multipart/alternative; boundary="000000000000f3c8240588ee428c"

--000000000000f3c8240588ee428c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

it will most probably get lost in mailing list.
can we add it to https://openvpn.net website ? something like "performance
testing" with full configs provided ?

=D1=81=D1=80, 15 =D0=BC=D0=B0=D1=8F 2019 =D0=B3. =D0=B2 18:49, Lev Stipakov=
 <lstipakov@gmail.com>:

> Hi guys,
>
> I made openvpn3 (required changes will be incorporated into main branch a=
t
> some point) work with wintun and did performance testing in AWS.
>
> Client:    c5.xlarge, Windows Server 2016, patched openvpn3 test client
> and OpenVPN Connect 2.7.1.103 (uses tap-windows6, based on openvpn3).
>
> Server:  c5.xlarge, Ubuntu 18.04, openvpn 2.4.4
>
> Client and server instances are in the same VPC and placement group.
>
> iPerf3 running on server:
>
> > iperf3 -s -B 0.0.0.0 -V
>
> iPerf3 running on client:
>
> > iperf3 -c 10.8.0.1 -V (server VPN address)
> > iperf3 -c 10.0.0.18 -V (server VPC address)
>
> Results:
>
> - no vpn
>
> [ ID] Interval           Transfer     Bandwidth
> [  4]   0.00-10.00  sec  8.67 GBytes  7.45
> Gbits/sec                  sender
> [  4]   0.00-10.00  sec  8.67 GBytes  7.45
> Gbits/sec                  receiver
> CPU Utilization: local/sender 61.4% (5.6%u/55.8%s), remote/receiver 33.9%
> (1.7%u/32.2%s)
>
> - tap-windows6
>
> [ ID] Interval           Transfer     Bandwidth
> [  4]   0.00-10.00  sec   404 MBytes   339
> Mbits/sec                  sender
> [  4]   0.00-10.00  sec   404 MBytes   339
> Mbits/sec                  receiver
> CPU Utilization: local/sender 4.6% (0.3%u/4.3%s), remote/receiver 21.4%
> (2.2%u/19.2%s)
>
> - wintun
>
> [ ID] Interval           Transfer     Bandwidth
> [  4]   0.00-10.00  sec   536 MBytes   449
> Mbits/sec                  sender
> [  4]   0.00-10.00  sec   536 MBytes   449
> Mbits/sec                  receiver
> CPU Utilization: local/sender 2.9% (0.1%u/2.8%s), remote/receiver 10.1%
> (0.7%u/9.3%s)
>
> As you see, wintun performs 30% better comparison to tap-windows6 and
> incurs significantly less CPU usage.
>
> --
> -Lev
> _______________________________________________
> Openvpn-devel mailing list
> Openvpn-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/openvpn-devel
>

--000000000000f3c8240588ee428c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>it will most probably get lost in mailing list.</div>=
<div>can we add it to <a href=3D"https://openvpn.net">https://openvpn.net</=
a> website ? something like &quot;performance testing&quot; with full confi=
gs provided ? <br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">=D1=81=D1=80, 15 =D0=BC=D0=B0=D1=8F 2019 =D0=B3. =
=D0=B2 18:49, Lev Stipakov &lt;<a href=3D"mailto:lstipakov@gmail.com">lstip=
akov@gmail.com</a>&gt;:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex"><div dir=3D"ltr">Hi guys,<div><br></div><div>I made openvpn3 (requi=
red changes will be incorporated into main branch at some point) work with =
wintun and did performance testing in AWS.</div><div><br></div><div><div>Cl=
ient:=C2=A0 =C2=A0 c5.xlarge, Windows Server 2016, patched openvpn3 test cl=
ient and OpenVPN Connect 2.7.1.103 (uses tap-windows6, based on openvpn3).<=
/div><div><br></div><div>Server:=C2=A0 c5.xlarge, Ubuntu 18.04, openvpn 2.4=
.4</div><div><br></div><div>Client and server instances are in the same VPC=
 and placement group.</div><div><br></div><div>iPerf3 running on server:</d=
iv><div><br></div><div>&gt; iperf3 -s -B 0.0.0.0 -V</div><div><br></div><di=
v>iPerf3 running on client:</div><div><br></div><div>&gt; iperf3 -c 10.8.0.=
1 -V (server VPN address)</div><div>&gt; iperf3 -c 10.0.0.18 -V (server VPC=
 address)=C2=A0=C2=A0<br></div><div><br></div><div>Results:</div><div><br><=
/div><div>- no vpn</div><div><br></div><div>[ ID] Interval=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Transfer=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0Bandwidth</div><div>[=C2=A0=C2=A04]=C2=A0=C2=A0=C2=A00.00-10=
.00=C2=A0=C2=A0sec=C2=A0=C2=A08.67 GBytes=C2=A0=C2=A07.45 Gbits/sec=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0sender</div><div>[=C2=A0=C2=A04]=C2=A0=C2=A0=C2=
=A00.00-10.00=C2=A0=C2=A0sec=C2=A0=C2=A08.67 GBytes=C2=A0=C2=A07.45 Gbits/s=
ec=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0receiver</div><div>CPU Utilization: loc=
al/sender 61.4% (5.6%u/55.8%s), remote/receiver 33.9% (1.7%u/32.2%s)</div><=
div><br></div><div>- tap-windows6</div><div><br></div><div>[ ID] Interval=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Transfer=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Bandwidth</div><div>[=C2=A0=C2=A04]=C2=A0=C2=
=A0=C2=A00.00-10.00=C2=A0=C2=A0sec=C2=A0=C2=A0=C2=A0404 MBytes=C2=A0=C2=A0=
=C2=A0339 Mbits/sec=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0sender</div><div>[=C2=
=A0=C2=A04]=C2=A0=C2=A0=C2=A00.00-10.00=C2=A0=C2=A0sec=C2=A0=C2=A0=C2=A0404=
 MBytes=C2=A0=C2=A0=C2=A0339 Mbits/sec=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0rec=
eiver</div><div>CPU Utilization: local/sender 4.6% (0.3%u/4.3%s), remote/re=
ceiver 21.4% (2.2%u/19.2%s)</div><div><br></div><div>- wintun</div><div><br=
></div><div>[ ID] Interval=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0Transfer=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Bandwidth</div><div=
>[=C2=A0=C2=A04]=C2=A0=C2=A0=C2=A00.00-10.00=C2=A0=C2=A0sec=C2=A0=C2=A0=C2=
=A0536 MBytes=C2=A0=C2=A0=C2=A0449 Mbits/sec=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0sender</div><div>[=C2=A0=C2=A04]=C2=A0=C2=A0=C2=A00.00-10.00=C2=A0=C2=A0=
sec=C2=A0=C2=A0=C2=A0536 MBytes=C2=A0=C2=A0=C2=A0449 Mbits/sec=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0receiver</div><div>CPU Utilization: local/sender 2.9% =
(0.1%u/2.8%s), remote/receiver 10.1% (0.7%u/9.3%s)</div><div><br></div><div=
>As you see, wintun performs 30% better comparison to tap-windows6 and incu=
rs significantly less CPU usage.</div><div><br></div>-- <br><div dir=3D"ltr=
" class=3D"gmail-m_6674205254209199893gmail_signature">-Lev</div></div></di=
v>
_______________________________________________<br>
Openvpn-devel mailing list<br>
<a href=3D"mailto:Openvpn-devel@lists.sourceforge.net" target=3D"_blank">Op=
envpn-devel@lists.sourceforge.net</a><br>
<a href=3D"https://lists.sourceforge.net/lists/listinfo/openvpn-devel" rel=
=3D"noreferrer" target=3D"_blank">https://lists.sourceforge.net/lists/listi=
nfo/openvpn-devel</a><br>
</blockquote></div>

--000000000000f3c8240588ee428c--

--===============1108493836826028337==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============1108493836826028337==--
